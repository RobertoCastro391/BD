--CREATE VIEW STAND_ViewStands AS
--SELECT * FROM STAND

--CREATE VIEW STAND_ViewClientes AS
--SELECT STAND_Cliente.NIF AS NIF, STAND_Entidade.nome AS Nome, STAND_Entidade.telefone AS Telefone, STAND_Entidade.endereco AS Endereço, STAND_Entidade.email As Email 
--FROM STAND_Cliente 
--INNER JOIN STAND_Entidade ON STAND_Cliente.NIF = STAND_Entidade.NIF

--CREATE VIEW STAND_ViewFuncionarios AS
--SELECT STAND_Funcionario.NIF AS NIF, STAND_Entidade.nome AS Nome_Funcionário, STAND.Nome AS Nome_Stand, STAND_FuncaoStand.Funcao AS Função, STAND_Entidade.telefone AS Telefone, STAND_Entidade.endereco AS Endereço, STAND_Entidade.email AS Email 
--FROM STAND_Funcionario INNER JOIN STAND_Entidade ON STAND_Funcionario.NIF = STAND_Entidade.NIF
--INNER JOIN STAND ON STAND.id = STAND_Funcionario.id_stand
--INNER JOIN STAND_FuncaoStand ON STAND_FuncaoStand.id = STAND_Funcionario.id_funcao

--CREATE VIEW STAND_ViewFornecedores AS
--SELECT STAND_Fornecedor.NIF, STAND_Entidade.nome, STAND_Entidade.telefone, STAND_Entidade.endereco, STAND_Entidade.email
--FROM STAND_Fornecedor
--INNER JOIN STAND_Entidade ON STAND_Fornecedor.NIF = STAND_Entidade.NIF

--CREATE VIEW STAND_ViewTodosVeiculos AS
--SELECT STAND_Veiculos.Matricula, STAND_MarcasCarros.Marca, STAND_Veiculos.Modelo, STAND_CorVeiculo.Cor , STAND_Veiculos.Cilindrada, STAND_Veiculos.Ano, STAND_Veiculos.Quilometros, STAND_Combustiveis.Combustivel, STAND_CategoriaVeiculos.Categoria, STAND_Veiculos.Preco_Anunciado,STAND.Nome, STAND_Veiculos.Observações
--FROM STAND_Veiculos
--INNER JOIN STAND_MarcasCarros ON STAND_MarcasCarros.id = STAND_Veiculos.id_Marca
--INNER JOIN STAND ON STAND.id = STAND_Veiculos.id_Stand
--INNER JOIN STAND_CategoriaVeiculos ON STAND_CategoriaVeiculos.id = STAND_Veiculos.id_Categoria
--INNER JOIN STAND_CorVeiculo ON STAND_CorVeiculo.id = STAND_Veiculos.id_Cor
--INNER JOIN STAND_Combustiveis ON STAND_Combustiveis.id = STAND_Veiculos.id_Combustivel

--CREATE VIEW STAND_ViewEmStockVeiculos AS 
--SELECT STAND_Veiculos.Matricula, STAND_MarcasCarros.Marca, STAND_Veiculos.Modelo, STAND_CorVeiculo.Cor, STAND_Veiculos.Cilindrada, STAND_Veiculos.Ano, STAND_Veiculos.Quilometros, STAND_Combustiveis.Combustivel, STAND_CategoriaVeiculos.Categoria, STAND_Veiculos.Preco_Anunciado, STAND.Nome, STAND_Veiculos.Observações
--FROM STAND_Veiculos
--INNER JOIN STAND_MarcasCarros ON STAND_MarcasCarros.id = STAND_Veiculos.id_Marca
--INNER JOIN STAND ON STAND.id = STAND_Veiculos.id_Stand
--INNER JOIN STAND_CategoriaVeiculos ON STAND_CategoriaVeiculos.id = STAND_Veiculos.id_Categoria
--INNER JOIN STAND_CorVeiculo ON STAND_CorVeiculo.id = STAND_Veiculos.id_Cor
--INNER JOIN STAND_Combustiveis ON STAND_Combustiveis.id = STAND_Veiculos.id_Combustivel
--	WHERE NOT EXISTS ( SELECT 1 FROM STAND_VendaVeiculo WHERE STAND_VendaVeiculo.Matricula_Veiculo = STAND_Veiculos.Matricula );

--CREATE VIEW STAND_ViewVeiculosComprados AS 
--SELECT STAND_CompraVeiculo.NIF_Fornecedor, STAND_Entidade.nome AS Nome_Fornecedor, STAND_CompraVeiculo.Data_movimento, STAND_CompraVeiculo.Matricula_Veiculo AS Matricula, STAND_MarcasCarros.Marca, STAND_Veiculos.Modelo, STAND_CorVeiculo.Cor , STAND_Veiculos.Cilindrada, STAND_Veiculos.Ano, STAND_Veiculos.Quilometros, STAND_Combustiveis.Combustivel, STAND_CategoriaVeiculos.Categoria, STAND_Veiculos.Preco_Anunciado,STAND.Nome AS Nome_Stand, STAND_Veiculos.Observações
--FROM STAND_CompraVeiculo
--INNER JOIN STAND_Veiculos ON STAND_Veiculos.Matricula = STAND_CompraVeiculo.Matricula_Veiculo
--INNER JOIN STAND_Entidade ON STAND_Entidade.NIF = STAND_CompraVeiculo.NIF_Fornecedor
--INNER JOIN STAND_MarcasCarros ON STAND_MarcasCarros.id = STAND_Veiculos.id_Marca
--INNER JOIN STAND ON STAND.id = STAND_Veiculos.id_Stand
--INNER JOIN STAND_CategoriaVeiculos ON STAND_CategoriaVeiculos.id = STAND_Veiculos.id_Categoria
--INNER JOIN STAND_CorVeiculo ON STAND_CorVeiculo.id = STAND_Veiculos.id_Cor
--INNER JOIN STAND_Combustiveis ON STAND_Combustiveis.id = STAND_Veiculos.id_Combustivel

--CREATE VIEW STAND_ViewVeiculosVendidos AS
--SELECT STAND_VendaVeiculo.NIF_Vendedor, STAND_Entidade.nome AS Nome_Vendedor, STAND_VendaVeiculo.Data_movimento, STAND_VendaVeiculo.Matricula_Veiculo AS Matricula, STAND_MarcasCarros.Marca, STAND_Veiculos.Modelo, STAND_CorVeiculo.Cor , STAND_Veiculos.Cilindrada, STAND_Veiculos.Ano, STAND_Veiculos.Quilometros, STAND_Combustiveis.Combustivel, STAND_CategoriaVeiculos.Categoria, STAND_Veiculos.Preco_Anunciado,STAND.Nome AS Nome_Stand, STAND_Veiculos.Observações
--FROM STAND_VendaVeiculo
--INNER JOIN STAND_Veiculos ON STAND_Veiculos.Matricula = STAND_VendaVeiculo.Matricula_Veiculo
--INNER JOIN STAND_Entidade ON STAND_Entidade.NIF = STAND_VendaVeiculo.NIF_Vendedor
--INNER JOIN STAND_MarcasCarros ON STAND_MarcasCarros.id = STAND_Veiculos.id_Marca
--INNER JOIN STAND ON STAND.id = STAND_Veiculos.id_Stand
--INNER JOIN STAND_CategoriaVeiculos ON STAND_CategoriaVeiculos.id = STAND_Veiculos.id_Categoria
--INNER JOIN STAND_CorVeiculo ON STAND_CorVeiculo.id = STAND_Veiculos.id_Cor
--INNER JOIN STAND_Combustiveis ON STAND_Combustiveis.id = STAND_Veiculos.id_Combustivel

--CREATE VIEW STAND_ViewCategoriaVeiculos AS
--SELECT * FROM STAND_CategoriaVeiculos

--CREATE VIEW STAND_ViewCorVeiculos AS
--SELECT * FROM STAND_CorVeiculo

--CREATE VIEW [dbo].[STAND_ViewVeiculosRetomados] AS
--SELECT c.*
--FROM STAND_ViewVeiculosComprados c
--LEFT JOIN STAND_Fornecedor f ON c.NIF_Fornecedor = f.NIF
--LEFT JOIN STAND_ViewVeiculosVendidos v ON c.Matricula = v.Matricula
--WHERE f.nif IS NULL AND v.Matricula IS NULL;
--GO

--CREATE VIEW [dbo].[STAND_ViewCombustiveis] AS
--SELECT * FROM STAND_Combustiveis
--GO