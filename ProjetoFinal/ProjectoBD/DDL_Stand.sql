USE p8g4
GO
--CREATE TABLE STAND (
--  id				int				identity(1,1)		PRIMARY KEY,
--  Nome			varchar(256)	NOT NULL,
--  Endereco		varchar(255)	NOT NULL  ,
--  Telefone		varchar(100)	NOT NULL,
--  Email			varchar(255)	NOT NULL
--) 



--CREATE TABLE STAND_MarcasCarros (
--	id int identity(1,1) PRIMARY KEY,
--	Marca varchar(50) NOT NULL  
--) 



-- CREATE TABLE STAND_FuncaoStand (
--     id          int             identity(1,1)   PRIMARY KEY,
--     Funcao      VARCHAR(50)
-- );



-- CREATE TABLE STAND_CorVeiculo (
--     id          int             identity(1,1)   PRIMARY KEY,
--     Cor      VARCHAR(50)
-- );


 --CREATE TABLE STAND_CategoriaVeiculos (
 --    id          int             identity(1,1)   PRIMARY KEY,
 --    Categoria      VARCHAR(50)
 --);


--CREATE TABLE STAND_Combustiveis (
--     id          int             identity(1,1)   PRIMARY KEY,
--     Combustivel VARCHAR(30)
-- );


--CREATE TABLE STAND_Veiculos (
--    Matricula VARCHAR(10) PRIMARY KEY,
--    id_Marca INT FOREIGN KEY REFERENCES STAND_MarcasCarros(id),
--    id_Stand INT FOREIGN KEY REFERENCES STAND(id),
--    Modelo VARCHAR(50),
--    id_Categoria INT FOREIGN KEY REFERENCES STAND_CategoriaVeiculos(id),
--    Ano INT,
--    Cilindrada INT,
--    id_Cor INT FOREIGN KEY REFERENCES STAND_CorVeiculo(id),
--    Quilometros INT,
--    id_Combustivel INT FOREIGN KEY REFERENCES STAND_Combustiveis(id),
--    Preco_Anunciado DECIMAL(10,2),
--    Observações VARCHAR(255)
--);

--CREATE TABLE STAND_Entidade (
--  NIF INT PRIMARY KEY,
--  nome VARCHAR(255),
--  telefone VARCHAR(20),
--  email VARCHAR(255),
--  endereco VARCHAR(255)
--);



--CREATE TABLE STAND_Funcionario (
--  NIF INT PRIMARY KEY,
--  id_funcao INT,
--  id_stand INT,
--  FOREIGN KEY (NIF) REFERENCES STAND_Entidade(NIF),
--  FOREIGN KEY (id_funcao) REFERENCES STAND_FuncaoStand(id),
--  FOREIGN KEY (id_stand) REFERENCES STAND(id)
--);


--CREATE TABLE STAND_Cliente (
--  NIF INT PRIMARY KEY,
--  FOREIGN KEY (NIF) REFERENCES STAND_Entidade(NIF)
--);

--CREATE TABLE STAND_Fornecedor (
--  NIF INT PRIMARY KEY,
--  FOREIGN KEY (NIF) REFERENCES STAND_Entidade(NIF)
--);


 --CREATE TABLE STAND_CompraVeiculo (
 --    id          int             identity(1,1),
 --    NIF_Fornecedor INT FOREIGN KEY REFERENCES STAND_Entidade(NIF),
 --    id_Stand INT FOREIGN KEY REFERENCES STAND(id),
 --    Matricula_Veiculo VARCHAR(10) FOREIGN KEY REFERENCES STAND_Veiculos(Matricula),
 --    Data_movimento DATE NOT NULL,
 --    Preco int NOT NULL,
 --    PRIMARY KEY (id, NIF_Fornecedor,id_Stand, Matricula_Veiculo)

 --);


 --CREATE TABLE STAND_VendaVeiculo (
 --    id          int             identity(1,1),
 --    NIF_Cliente INT FOREIGN KEY REFERENCES STAND_Cliente(NIF),
	-- NIF_Vendedor INT FOREIGN KEY REFERENCES STAND_Funcionario(NIF),
 --    id_Stand INT FOREIGN KEY REFERENCES STAND(id),
 --    Matricula_Veiculo VARCHAR(10) FOREIGN KEY REFERENCES STAND_Veiculos(Matricula),
 --    Data_movimento DATE NOT NULL,
 --    Preco int NOT NULL,
 --    PRIMARY KEY (id, NIF_Cliente,NIF_Vendedor,id_Stand, Matricula_Veiculo)
 --);

