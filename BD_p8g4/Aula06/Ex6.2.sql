USE p8g4;
GO

--Ex 6.2

-- Queries do Ex5.1

--a)
-- SELECT Pname, Pnumber, Fname,Lname,Ssn
--     FROM project
--     INNER JOIN works_on ON Pno=Pnumber
--     INNER JOIN employee ON Essn=Ssn

--b)
-- SELECT E.Fname, E.Minit, E.Lname
--     FROM employee as E 
--     INNER JOIN employee as S ON E.Super_ssn=S.Ssn
--     WHERE S.Fname='Carlos' AND S.Minit='D' AND S.Lname='Gomes';

--c)
-- SELECT Pnumber, Pname, total_worked 
--     FROM project
--     INNER JOIN (SELECT Pno, SUM(Hours) AS total_worked FROM works_on GROUP BY Pno) AS Worked_Table ON Pnumber=Pno

--d)
-- SELECT Fname,Minit,Lname
--     FROM project
--     INNER JOIN works_on ON Pno=Pnumber
--     INNER JOIN department ON Dnum=Dnumber
--     INNER JOIN employee ON Ssn=Essn
--     WHERE Dnumber=3 AND Hours>20 AND Pname='Aveiro Digital'

--e)
-- SELECT Fname,Minit,Lname
--     FROM project
--     INNER JOIN works_on ON Pno=Pnumber
--     RIGHT JOIN employee ON Ssn=Essn
--     WHERE Pnumber IS NULL

--f)
-- SELECT Dname, AVG(Salary) AS Avg_Salary
--     FROM department
--     INNER JOIN employee ON Dno=Dnumber
--     WHERE Sex='F'
--     GROUP BY Dname
--g)
-- SELECT Fname,Minit,Lname
--     FROM employee
--     INNER JOIN (SELECT Essn, COUNT(Essn) AS numero FROM dependent GROUP BY Essn) AS dois ON Ssn=Essn
--     WHERE numero>2

--h)
-- SELECT Fname, Minit, Lname 
--     FROM department
--     INNER JOIN (SELECT Fname, Minit, Lname, Ssn FROM employee AS E LEFT JOIN dependent ON Ssn=Essn WHERE Essn IS NULL) AS NODEP_EMP ON Mgr_ssn=Ssn

--i)
-- SELECT Fname, Minit, Lname, Address
--     FROM project
--     INNER JOIN dept_location ON Dnum=Dnumber
--     INNER JOIN works_on ON Pno=Pnumber
--     INNER JOIN employee On Ssn=Essn
--     WHERE Dlocation!='Aveiro' AND Plocation='Aveiro'


-- Queries do Ex5.2 

--a)
    -- SELECT nome 
    -- 	FROM encomenda
    -- 	FULL OUTER JOIN fornecedor ON fornecedor.nif=encomenda.fornecedor
    -- 	WHERE encomenda.fornecedor is null

--b)
    -- SELECT produto.nome, AVG(item.unidades) as NumMedio
    -- 	FROM item JOIN produto ON produto.codigo=item.codProd
    -- 	GROUP BY produto.nome

--c)
    -- SELECT AVG(numUnid adeEnc) AS numMedio 
	-- FROM (SELECT item.numEnc, COUNT(produto.codigo) AS numUnidadeEnc 
	-- 			FROM item JOIN produto ON produto.codigo=item.codProd 
	-- 			GROUP BY item.numEnc) as P

--d)
    -- SELECT fornecedor.nome, produto.nome, SUM(item.unidades) AS Quantidade
	-- FROM item JOIN encomenda ON encomenda.numero=item.numEnc JOIN produto ON produto.codigo=item.codProd JOIN fornecedor ON fornecedor.nif=encomenda.fornecedor
	-- GROUP BY fornecedor.nome,produto.nome
	-- ORDER BY fornecedor.nome,produto.nome

-- Queries do Ex5.3

--a)
    -- SELECT paciente.numUtente,paciente.nome
	--     FROM paciente
    -- EXCEPT
    -- SELECT paciente.numUtente,paciente.nome
	--     FROM paciente
	-- 	    JOIN prescricao ON prescricao.numUtente=paciente.numUtente

--b)
    -- SELECT medico.especialidade, COUNT(medico.especialidade) as NumPresc 
	-- FROM prescricao
	-- 	INNER JOIN medico ON medico.numSNS=prescricao.numMedico
    -- GROUP BY medico.especialidade

--c)
    -- SELECT farmacia.nome, COUNT(farmacia.nome) AS numPresc
    --     FROM prescricao
    --         INNER JOIN farmacia ON farmacia.nome=prescricao.farmacia
    --     GROUP BY farmacia.nome

--d)
    -- SELECT farmaceutica.numReg, farmaceutica.nome, farmaco.nome
	-- FROM farmaco
	-- 	INNER JOIN farmaceutica ON farmaceutica.numReg=farmaco.numRegFarm
	-- WHERE farmaceutica.numReg = 906
    -- EXCEPT
    -- SELECT presc_farmaco.numRegFarm, farmaceutica.nome, presc_farmaco.nomeFarmaco
    --     FROM presc_farmaco
    --         INNER JOIN prescricao ON prescricao.numPresc=presc_farmaco.numPresc
    --         INNER JOIN farmaceutica ON farmaceutica.numReg=presc_farmaco.numRegFarm
	--     WHERE presc_farmaco.numRegFarm = 906

--e)
    -- SELECT prescricao.farmacia, farmaceutica.nome, COUNT(presc_farmaco.nomeFarmaco) AS numFarmacos
    -- 	FROM presc_farmaco
    -- 		INNER JOIN farmaco ON farmaco.nome=presc_farmaco.nomeFarmaco
    -- 		INNER JOIN prescricao ON prescricao.numPresc=presc_farmaco.numPresc
    -- 		INNER JOIN farmaceutica ON farmaceutica.numReg=presc_farmaco.numRegFarm
    -- 	GROUP BY prescricao.farmacia, farmaceutica.nome
    -- 	HAVING prescricao.farmacia is not null

--f)
    -- SELECT numUtente, nome
    -- 	FROM (SELECT paciente.numUtente, paciente.nome, COUNT(prescricao.numMedico) AS TOTAL
    -- 					FROM prescricao
    -- 						INNER JOIN paciente ON paciente.numUtente=prescricao.numUtente
    -- 					GROUP BY paciente.numUtente, paciente.nome
    -- 				) as p
    -- 	GROUP BY numUtente, nome, TOTAL
    -- 	HAVING TOTAL>1