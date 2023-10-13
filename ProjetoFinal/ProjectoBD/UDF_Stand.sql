USE p8g4
GO

--CREATE FUNCTION STAND_checkIfClienteExists (@NIF INT) RETURNS INT
--AS
--	BEGIN
--		DECLARE @counter INT
--		SELECT @counter=COUNT(1) FROM STAND_Cliente WHERE NIF=@NIF
--		RETURN @counter
--	END
--GO

--Alter FUNCTION STAND_checkIfFornecedorExists (@NIF INT) RETURNS INT
--AS
--	BEGIN
--		DECLARE @counter INT
--		SELECT @counter=COUNT(1) FROM STAND_Entidade WHERE NIF=@NIF
--		RETURN @counter
--	END
--GO

--CREATE FUNCTION STAND_checkIfFuncionarioExists (@NIF INT) RETURNS INT
--AS
--	BEGIN
--		DECLARE @counter INT
--		SELECT @counter=COUNT(1) FROM STAND_Funcionario WHERE NIF=@NIF
--		RETURN @counter
--	END
--GO


--CREATE FUNCTION STAND_getIDFuncaoFROMNome(@funcao VARCHAR(255)) RETURNS INT
--AS
--	BEGIN
--		DECLARE @id INT
--		SELECT @id = id FROM STAND_FuncaoSTAND WHERE Funcao = @funcao
--		RETURN @id
--	END
--GO

--CREATE FUNCTION STAND_getIDStandFROMNome(@stand VARCHAR(255)) RETURNS INT
--AS
--	BEGIN
--		DECLARE @id INT
--		SELECT @id = id FROM STAND WHERE Nome = @stand
--		RETURN @id
--	END
--GO


--CREATE FUNCTION STAND_getIDMarcaFROMNome(@marca VARCHAR(255)) RETURNS INT
--AS
--	BEGIN
--		DECLARE @id INT
--		SELECT @id = id FROM STAND_MarcasCarros WHERE Marca = @marca
--		RETURN @id
--	END
--GO

--CREATE FUNCTION STAND_getIDCorFROMNome(@cor VARCHAR(255)) RETURNS INT
--AS
--	BEGIN
--		DECLARE @id INT
--		SELECT @id = id FROM STAND_CorVeiculo WHERE Cor = @cor
--		RETURN @id
--	END
--GO

--CREATE FUNCTION STAND_getIDCategoriaFROMNome(@categoria VARCHAR(255)) RETURNS INT
--AS
--	BEGIN
--		DECLARE @id INT
--		SELECT @id = id FROM STAND_CategoriaVeiculos WHERE Categoria = @categoria
--		RETURN @id
--	END
--GO

--CREATE FUNCTION STAND_getIDCombustivelFROMNome(@combustivel VARCHAR(255)) RETURNS INT
--AS
--	BEGIN
--		DECLARE @id INT
--		SELECT @id = id FROM STAND_Combustiveis WHERE Combustivel = @combustivel
--		RETURN @id
--	END
--GO

--CREATE FUNCTION STAND_checkIfMatriculaExists (@Matricula VARCHAR(10)) RETURNS INT
--AS
--	BEGIN
--		DECLARE @counter INT
--		SELECT @counter=COUNT(1) FROM STAND_Veiculos WHERE Matricula=@Matricula
--		RETURN @counter
--	END
--GO

--CREATE FUNCTION STAND_checkIfStandExists (@Nome VARCHAR(255)) RETURNS INT
--AS
--	BEGIN
--		DECLARE @counter INT
--		SELECT @counter=COUNT(1) FROM STAND WHERE Nome=@Nome
--		RETURN @counter
--	END
--GO

--CREATE FUNCTION STAND_checkIfCarroExists (@Matricula VARCHAR(10)) RETURNS INT
--AS
--	BEGIN
--		DECLARE @counter INT
--		SELECT @counter=COUNT(1) FROM STAND_VendaVeiculo WHERE Matricula_Veiculo=@Matricula
--		RETURN @counter
--	END
--GO