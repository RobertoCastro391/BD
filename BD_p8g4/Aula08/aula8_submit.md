# BD: Guião 8


## ​8.1. Complete a seguinte tabela.
Complete the following table.

| # | Query | Rows | Cost | Pag. Reads | Time (ms) | Index used | Index Op. | Discussion |
| :--- | :--------------------------------------------------------------------------------------------------------- | :---- | :----   | :--------- | :-------- | :---------               | :------------------- | :--------- |
| 1    | SELECT * from Production.WorkOrder | 72591 | 0.474 | 552 | 29 | PK_WorkOrder_WorkOrderID |   Clustered Index Scan |            |
| 2    | SELECT * from Production.WorkOrder where WorkOrderID=1234                                                  | 1     | 0.00328 | 26 | 0 | PK_WorkOrder_WorkOrderID | Clustered Index Seek |            |
| 3.1  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 10000 and 10010  | 11 | 0.00330|216 | 1  | PK_WorkOrder_WorkOrderID | Clustered Index Seek |                      |            |
| 3.2  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 1 and 72591 |72591 |0.4735 | 746 | 30 | PK_WorkOrder_WorkOrderID | Clustered Index Seek |            |
| 4    |SELECT * FROM Production.WorkOrder WHERE StartDate = '2012-05-14' | 55 | 0.4735 | 1915 | 14 | PK_WorkOrder_WorkOrderID | Clustered Index Scan |  |
| 5    | SELECT * FROM Production.WorkOrder WHERE ProductID = 757 | 9 | 0.034 | 240 | 4 | PK_WorkOrder_WorkOrderID | Key LockUp |  |
| 6.1  | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 757 | 9 | 0.00329 | 220 | 0 | IX_WorkOrder_ProductID | Index Seek |  |
| 6.2  | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 | 1105 | 0.00603 | 224 | 0 | IX_WorkOrder_ProductID | Index Seek |  |
| 6.3  | SELECT WorkOrderID FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2011-12-04' | 1 | 0.00603 | 226 | 0 | IX_WorkOrder_ProductID | Index Seek |  |
| 7    | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2011-12-04' | 2 | 0.00603 | 235 | 0 | IX_WorkOrder_ProductID | Index Seek |  |
| 8    | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2011-12-04' | 1 | 0.00328 | 28 | 0 | IX_WorkOrder_ProductID | Index Seek |  |

## ​8.2.

### a)

```
CREATE UNIQUE CLUSTERED INDEX rid_index ON mytemp(rid)
```

### b)

```
... Write here your answer ...
```

### c)


| fillfactor | Tempo de inserção (ms) |
|:--------- | :--------- |
| 65 | 39405 |
| 80 | 39643 |
| 90 | 39985 |
### d)

```
Valores com o atributo rid do tipo identity.
```

| fillfactor | Tempo de inserção (ms) |
|:--------- | :--------- |
| 65 | 40154 |
| 80 | 40583 |
| 90 | 40738 |


### e)

```
Criando um índice para cada atributo da tabela mytemp, pode-se concluir que a inserção dos índices é mais lenta.
```

## ​8.3.

```
i) CREATE UNIQUE CLUSTERED INDEX SSNEmployee_Ix ON Company.Employee(Ssn);

ii) CREATE CLUSTERED INDEX NameEmployeeName_Ix ON Company.Employee(Fname, Lname);

iii) CREATE UNIQUE CLUSTERED INDEX NumberDepartment_Ix ON Company.Department(Dnumber);
     CREATE NONCLUSTERED INDEX EmployeeDepartment_Ix ON Company.Employee(Dno)

iv) CREATE UNIQUE CLUSTERED INDEX SSNEmployee_Ix ON Company.Employee(Ssn);
    CREATE UNIQUE CLUSTERED INDEX ProjectNumber_Ix ON Company.Project(Pnumber);
    CREATE NONCLUSTERED INDEX EmployeeWorkOnProject_Ix ON Company.Works_On(Essn, Pno);

v) CREATE UNIQUE CLUSTERED INDEX SSNEmployee_I ON Company.Employee(Ssn);
    CREATE UNIQUE CLUSTERED INDEX EmployeeDependet_Ix ON Company.Dependent(Essn);

vi) CREATE UNIQUE CLUSTERED INDEX NumberDepartment_Ix ON Company.Department(Dnumber);
    CREATE NONCLUSTERED INDEX DepartmentProject_Ix ON Company.Project(Dnum)
```
