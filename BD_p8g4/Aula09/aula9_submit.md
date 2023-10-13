# BD: Guião 9


## ​9.1
 
### *a)*

```
CREATE PROCEDURE [dbo].[SP_remove_employee]
        @ssn INT,
        @Status varchar(16) output,
        @Message varchar(255) output
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRAN
            DELETE FROM Company.[Dependent] WHERE Essn=@ssn;
            DELETE FROM Company.Works_on WHERE Essn=@ssn;
            UPDATE Company.Department SET Mgr_ssn=NULL WHERE Mgr_ssn=@ssn;
            UPDATE Company.Employee set Super_ssn=NULL WHERE Super_ssn=@ssn;
            DELETE FROM Company.Employee WHERE Ssn=@ssn;
        COMMIT TRAN
        SET @Status = 'Sucess';
        SET @Message= 'Registo apagado com sucesso'

    END TRY
    BEGIN CATCH
        IF(@@TRANCOUNT >0)
            ROLLBACK TRAN;
        SET @Status = 'Fail';
        SET @Message= 'Erro a apagar o Registo. ('+ ERROR_MESSAGE() + ')'; 
    END CATCH
END
```

### *b)* 

```
CREATE PROCEDURE [dbo].[SP_dept_managers]

AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @T TABLE (
    ssnId int,
    worksYears int
    )
            INSERT INTO @T (ssnId, worksYears)
                SELECT Employee.Ssn, DATEDIFF(Year, Company.Department.Mgr_Start_Date, GetDate()) FROM Company.Employee 
                    INNER JOIN Company.Department ON Company.Employee.Ssn=Company.Department.Mgr_ssn
                    ORDER BY Company.Department.Mgr_Start_Date

    SELECT ssnId FROM @T
    SELECT *FROM @T WHERE worksYears = (SELECT MAX(worksYears) FROM @T);

END
GO
```

### *c)* 

```
CREATE TRIGGER trg_PreventMultipleManagers
ON Department
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT Mgr_ssn
        FROM inserted
        GROUP BY Mgr_ssn
        HAVING COUNT(*) > 1
    )
    BEGIN
        RAISERROR('Um funcionário não pode ser gestor de mais de um departamento.', 16, 1)
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO
```

### *d)* 

```
CREATE TRIGGER trg_PreventHigherSalary
ON Company.Employee
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE E
    SET Salary = Mgr.Salary - 1
    FROM Employee AS E
    INNER JOIN inserted AS I ON E.Ssn = I.Ssn
    INNER JOIN Department AS D ON E.Dno = D.Dnumber
    INNER JOIN Employee AS Mgr ON D.Mgr_Ssn = Mgr.Ssn
    WHERE E.Salary > Mgr.Salary;
END;
```

### *e)* 

```
CREATE FUNCTION GetEmployeeProjects (@ssn INT)
RETURNS TABLE
AS
RETURN
(
    SELECT Project.Pname AS ProjectName, Project.Plocation AS ProjectLocation
    FROM Company.Employee
    INNER JOIN Company.Works_on ON Employee.Ssn = Company.Works_on.Essn
    INNER JOIN Company.Project ON Works_on.Pno = Company.Project.Pnumber
    WHERE Employee.Ssn = @ssn
);
```

### *f)* 

```
CREATE FUNCTION GetSalaryHigherAverage (@dno INT)
RETURNS TABLE
AS
RETURN
(
    SELECT Employee.Fname + ' ' + Employee.Minit + ' ' + Employee.Lname AS EmployeeName, Employee.Salary AS EmployeeSalary
    FROM Company.Employee
    INNER JOIN Company.Department ON Employee.Dno = Department.Dnumber
    WHERE Department.Dnumber = @dno AND Employee.Salary > (SELECT AVG(Salary) FROM Company.Employee WHERE Employee.Dno = @dno)
);
```

### *g)* 

```
CREATE FUNCTION dbo.employeeDeptHighAverage (@Dno INT) 
RETURNS TABLE 
AS 
RETURN
(
    SELECT proj.Pname, proj.Pnumber, proj.Plocation, proj.Dnum, emp.Salary / 40 AS Budget, SUM(emp.Salary / 40) OVER () AS TotalBudget 
    FROM Company.Project proj INNER JOIN Company.Works_on work ON proj.Pnumber = work.Pno INNER JOIN Company.Employee emp ON work.Essn = emp.Ssn WHERE proj.Dnum = @Dno
)
```

### *h)* 

```
CREATE TRIGGER trg_DeleteDepartment_After
ON Department
AFTER DELETE
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'department_deleted')
    BEGIN
        CREATE TABLE department_deleted (
            Dnumber INT,
            Dname VARCHAR(100),
            Mgr_ssn INT,
            Mgr_Start_Date DATE
        );
    END;

    INSERT INTO department_deleted (Dnumber, Dname, Mgr_ssn, Mgr_Start_Date)
    SELECT Dnumber, Dname, Mgr_ssn, Mgr_Start_Date
    FROM deleted;
END;

CREATE TRIGGER trg_DeleteDepartment_InsteadOf
ON Company.Department
INSTEAD OF DELETE
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'department_deleted')
    BEGIN
        CREATE TABLE department_deleted (
            Dnumber INT,
            Dname VARCHAR(100),
            Mgr_ssn INT,
            Mgr_Start_Date DATE
        );
    END;

    INSERT INTO department_deleted (Dnumber, Dname, Mgr_ssn, Mgr_Start_Date)
    SELECT Dnumber, Dname, Mgr_ssn, Mgr_Start_Date
    FROM deleted;
    DELETE FROM Department
    WHERE Dnumber IN (SELECT Dnumber FROM deleted);
END;

-- Discussão sobre vantagens e desvantagens de cada implementação
Os triggers after são executados após a ação principal ter sido concluída. Uma desvantagem dos triggers do tipo after é não podem alterar ou parar a ação principal.
Já os triggers instead off permitem substituir a ação principal. Uma desvantagem dos triggers instead off exigem código mais extenso e complexo.


```

### *i)* 

```
Começando pelas diferenças: Uma UDF tem sempre que retornar um valor enquanto que uma Stored Procedure (SP) não.
Numa Stored Procedure (SP) é apenas compilada uma vez podendo ser reutilizada, uma vez que fica guardada na memória.  Por outro lado, a UDF é compilada sempre que é utilizada.
Numa Stored Procedure (SP) é possível fazer exception-handling o que não acontece numa UDF.
Numa Stored Procedure (SP) podemos usar variáveis temporárias e tabelas, enquanto a UDF não permite tabelas temporárias.
Uma Stored Procedure (SP) pode ter parâmetros de input e output, numa UDF apenas são permitimos de input.
Para terminar, ambas as ferramentas permitem simplificar, limpar e otimizar o código SQL.
```