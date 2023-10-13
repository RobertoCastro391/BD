# BD: Guião 6

## Problema 6.1

### *a)* Todos os tuplos da tabela autores (authors);

```
SELECT *
    FROM authors
```

### *b)* O primeiro nome, o último nome e o telefone dos autores;

```
SELECT au_fname, au_lname, phone 
   FROM authors
```

### *c)* Consulta definida em b) mas ordenada pelo primeiro nome (ascendente) e depois o último nome (ascendente); 

```
SELECT au_fname, au_lname, phone 
      FROM authors
      ORDER BY au_fname,au_lname ASC
```

### *d)* Consulta definida em c) mas renomeando os atributos para (first_name, last_name, telephone); 

```
SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone
      FROM authors
      ORDER BY au_fname,au_lname ASC
```

### *e)* Consulta definida em d) mas só os autores da Califórnia (CA) cujo último nome é diferente de ‘Ringer’; 

```
SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone
    FROM authors
    WHERE state='CA' and au_lname!='Ringer'
    ORDER BY au_fname,au_lname ASC
```

### *f)* Todas as editoras (publishers) que tenham ‘Bo’ em qualquer parte do nome; 

```
SELECT *
    FROM publishers 
    WHERE pub_name LIKE '%Bo%'
```

### *g)* Nome das editoras que têm pelo menos uma publicação do tipo ‘Business’; 

```
SELECT DISTINCT pub_name
    FROM publishers, titles
    WHERE type='Business' and publishers.pub_id=titles.pub_id
```

### *h)* Número total de vendas de cada editora; 

```
   SELECT publishers.pub_name, SUM(sales.qty) AS TotalVendas
      FROM sales
         INNER JOIN titles ON sales.title_id = titles.title_id
         INNER JOIN publishers ON titles.pub_id = publishers.pub_id
      GROUP BY publishers.pub_name
```

### *i)* Número total de vendas de cada editora agrupado por título;

```
SELECT publishers.pub_name, titles.title, SUM(sales.qty) AS TotalVendas
      FROM sales
         INNER JOIN titles ON sales.title_id = titles.title_id
         INNER JOIN publishers ON titles.pub_id = publishers.pub_id
      GROUP BY publishers.pub_name, titles.title
      ORDER BY publishers.pub_name, titles.title
```

### *j)* Nome dos títulos vendidos pela loja ‘Bookbeat’; 

```
SELECT title
      FROM titles
         INNER JOIN sales ON titles.title_id=sales.title_id
         INNER JOIN stores ON sales.stor_id=stores.stor_id
         WHERE stor_name = 'Bookbeat';
```

### *k)* Nome de autores que tenham publicações de tipos diferentes; 

```
 SELECT au_fname,au_lname
    FROM ((authors JOIN titleauthor ON authors.au_id=titleauthor.au_id) JOIN titles ON titles.title_id=titleauthor.title_id)
    GROUP BY au_fname,au_lname
    HAVING COUNT(DISTINCT type)>1
```

### *l)* Para os títulos, obter o preço médio e o número total de vendas agrupado por tipo (type) e editora (pub_id);

```
SELECT titles.type, publishers.pub_id, AVG(titles.price) as precoMedio, SUM(sales.qty) as NumTotalVendas
      FROM ((sales JOIN titles ON titles.title_id=sales.title_id) JOIN publishers ON publishers.pub_id=titles.pub_id)
      GROUP BY titles.type, publishers.pub_id
      ORDER BY titles.type, publishers.pub_id
```

### *m)* Obter o(s) tipo(s) de título(s) para o(s) qual(is) o máximo de dinheiro “à cabeça” (advance) é uma vez e meia superior à média do grupo (tipo);

```
SELECT type
      FROM titles
      GROUP BY type
      HAVING MAX(advance)>1.5*AVG(advance)
```

### *n)* Obter, para cada título, nome dos autores e valor arrecadado por estes com a sua venda;

```
SELECT titles.title, authors.au_fname + ' ' + authors.au_lname AS name, titles.price * titles.royalty * titleauthor.royaltyper * titles.ytd_sales / 100 / 100 AS profit
      FROM ((authors JOIN titleauthor ON titleauthor.au_id=authors.au_id) JOIN titles ON titles.title_id=titleauthor.title_id)
```

### *o)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, a faturação total, o valor da faturação relativa aos autores e o valor da faturação relativa à editora;

```
SELECT titles.title, titles.ytd_sales, titles.ytd_sales*titles.price AS FaturacaoTotal, 
      titles.ytd_sales*titles.price * titles.royalty/100 AS FaturacaoAutores,
      titles.ytd_sales*titles.price-titles.price*titles.ytd_sales*titles.royalty/100 AS FaturacaoEditora
      FROM titles
      ORDER BY titles.title
```

### *p)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, o nome de cada autor, o valor da faturação de cada autor e o valor da faturação relativa à editora;

```
SELECT titles.title, titles.ytd_sales, authors.au_fname + ' ' + authors.au_lname as author,
      titles.ytd_sales*titles.price * titles.royalty*titleauthor.royaltyper/100/100 AS auth_revenue,
      titles.ytd_sales*titles.price-titles.price*titles.ytd_sales*titles.royalty/100 AS publisher_revenue
      FROM ((titles JOIN titleauthor ON titleauthor.title_id=titles.title_id) JOIN authors ON authors.au_id=titleauthor.au_id)
      ORDER BY titles.title
```

### *q)* Lista de lojas que venderam pelo menos um exemplar de todos os livros;

```
SELECT stores.stor_name
      FROM ((stores JOIN sales ON sales.stor_id=stores.stor_id) JOIN titles ON titles.title_id=sales.title_id)
      GROUP BY stores.stor_name
      HAVING COUNT(titles.title)=(SELECT COUNT(titles.id) FROM titles)
```

### *r)* Lista de lojas que venderam mais livros do que a média de todas as lojas;

```
SELECT stores.stor_name, SUM(sales.qty)
      FROM ((stores JOIN sales ON sales.stor_id=stores.stor_id) JOIN titles ON titles.title_id=sales.title_id)
      GROUP BY stores.stor_name
      HAVING SUM(sales.qty)>(SELECT SUM(sales.qty)/COUNT(stor_id) FROM sales);
```

### *s)* Nome dos títulos que nunca foram vendidos na loja “Bookbeat”;

```
SELECT titles.title
      FROM titles
      WHERE titles.title_id NOT IN (SELECT title_id FROM (sales JOIN stores ON stores.stor_id=sales.stor_id) WHERE stores.stor_name!='Bookbeat')
```

### *t)* Para cada editora, a lista de todas as lojas que nunca venderam títulos dessa editora; 

```
(SELECT pub_name, stor_name
      FROM publishers, stores
      GROUP BY pub_name, stor_name)
   EXCEPT
   (SELECT pub_name, stor_name
      FROM (((publishers	JOIN titles ON publishers.pub_id=titles.pub_id) JOIN sales  ON titles.title_id=sales.title_id) JOIN stores ON sales.stor_id=stores.stor_id)
      GROUP BY pub_name, stor_name)
```

## Problema 6.2

### ​5.1

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_1_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_1_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
SELECT Pname, Pnumber, Fname,Lname,Ssn
    FROM project
    INNER JOIN works_on ON Pno=Pnumber
    INNER JOIN employee ON Essn=Ssn
```

##### *b)* 

```
SELECT E.Fname, E.Minit, E.Lname
    FROM employee as E 
    INNER JOIN employee as S ON E.Super_ssn=S.Ssn
    WHERE S.Fname='Carlos' AND S.Minit='D' AND S.Lname='Gomes';
```

##### *c)* 

```
SELECT Pnumber, Pname, total_worked 
    FROM project
    INNER JOIN (SELECT Pno, SUM(Hours) AS total_worked FROM works_on GROUP BY Pno) AS Worked_Table ON Pnumber=Pno
```

##### *d)* 

```
SELECT Fname,Minit,Lname
    FROM project
    INNER JOIN works_on ON Pno=Pnumber
    INNER JOIN department ON Dnum=Dnumber
    INNER JOIN employee ON Ssn=Essn
    WHERE Dnumber=3 AND Hours>20 AND Pname='Aveiro Digital'
```

##### *e)* 

```
SELECT Fname,Minit,Lname
    FROM project
    INNER JOIN works_on ON Pno=Pnumber
    RIGHT JOIN employee ON Ssn=Essn
    WHERE Pnumber IS NULL
```

##### *f)* 

```
SELECT Dname, AVG(Salary) AS Avg_Salary
    FROM department
    INNER JOIN employee ON Dno=Dnumber
    WHERE Sex='F'
    GROUP BY Dname
```

##### *g)* 

```
SELECT Fname,Minit,Lname
    FROM employee
    INNER JOIN (SELECT Essn, COUNT(Essn) AS numero FROM dependent GROUP BY Essn) AS dois ON Ssn=Essn
    WHERE numero>2
```

##### *h)* 

```
SELECT Fname, Minit, Lname 
    FROM department
    INNER JOIN (SELECT Fname, Minit, Lname, Ssn FROM employee AS E LEFT JOIN dependent ON Ssn=Essn WHERE Essn IS NULL) AS NODEP_EMP ON Mgr_ssn=Ssn
```

##### *i)* 

```
SELECT Fname, Minit, Lname, Address
    FROM project
    INNER JOIN dept_location ON Dnum=Dnumber
    INNER JOIN works_on ON Pno=Pnumber
    INNER JOIN employee On Ssn=Essn
    WHERE Dlocation!='Aveiro' AND Plocation='Aveiro'
```

### 5.2

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_2_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_2_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
SELECT nome 
	FROM encomenda
	FULL OUTER JOIN fornecedor ON fornecedor.nif=encomenda.fornecedor
	WHERE encomenda.fornecedor is null
```

##### *b)* 

```
SELECT produto.nome, AVG(item.unidades) as NumMedio
	FROM item JOIN produto ON produto.codigo=item.codProd
	GROUP BY produto.nome
```


##### *c)* 

```
SELECT AVG(numUnidadeEnc) AS numMedio 
	FROM (SELECT item.numEnc, COUNT(produto.codigo) AS numUnidadeEnc 
				FROM item JOIN produto ON produto.codigo=item.codProd 
				GROUP BY item.numEnc) as P
```


##### *d)* 

```
SELECT fornecedor.nome, produto.nome, SUM(item.unidades) AS Quantidade
	FROM item JOIN encomenda ON encomenda.numero=item.numEnc JOIN produto ON produto.codigo=item.codProd JOIN fornecedor ON fornecedor.nif=encomenda.fornecedor
	GROUP BY fornecedor.nome,produto.nome
	ORDER BY fornecedor.nome,produto.nome
```

### 5.3

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_3_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_3_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
SELECT paciente.numUtente,paciente.nome
    FROM paciente
EXCEPT
SELECT paciente.numUtente,paciente.nome
    FROM paciente
	    JOIN prescricao ON prescricao.numUtente=paciente.numUtente
```

##### *b)* 

```
SELECT medico.especialidade, COUNT(medico.especialidade) as NumPresc 
	FROM prescricao
		INNER JOIN medico ON medico.numSNS=prescricao.numMedico
GROUP BY medico.especialidade
```


##### *c)* 

```
SELECT farmacia.nome, COUNT(farmacia.nome) AS numPresc
	FROM prescricao
		INNER JOIN farmacia ON farmacia.nome=prescricao.farmacia
	GROUP BY farmacia.nome
```


##### *d)* 

```
SELECT farmaceutica.numReg, farmaceutica.nome, farmaco.nome
	FROM farmaco
		INNER JOIN farmaceutica ON farmaceutica.numReg=farmaco.numRegFarm
	WHERE farmaceutica.numReg = 906
EXCEPT
SELECT presc_farmaco.numRegFarm, farmaceutica.nome, presc_farmaco.nomeFarmaco
	FROM presc_farmaco
		INNER JOIN prescricao ON prescricao.numPresc=presc_farmaco.numPresc
		INNER JOIN farmaceutica ON farmaceutica.numReg=presc_farmaco.numRegFarm
	WHERE presc_farmaco.numRegFarm = 906
```

##### *e)* 

```
SELECT prescricao.farmacia, farmaceutica.nome, COUNT(presc_farmaco.nomeFarmaco) AS numFarmacos
	FROM presc_farmaco
		INNER JOIN farmaco ON farmaco.nome=presc_farmaco.nomeFarmaco
		INNER JOIN prescricao ON prescricao.numPresc=presc_farmaco.numPresc
		INNER JOIN farmaceutica ON farmaceutica.numReg=presc_farmaco.numRegFarm
	GROUP BY prescricao.farmacia, farmaceutica.nome
	HAVING prescricao.farmacia is not null
```

##### *f)* 

```
SELECT numUtente, nome
	FROM (SELECT paciente.numUtente, paciente.nome, COUNT(prescricao.numMedico) AS TOTAL
					FROM prescricao
						INNER JOIN paciente ON paciente.numUtente=prescricao.numUtente
					GROUP BY paciente.numUtente, paciente.nome
				) as p
	GROUP BY numUtente, nome, TOTAL
	HAVING TOTAL>1
```
