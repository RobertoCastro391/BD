USE p8g4
GO

----CREATE PROCEDURE STAND_AdicionarPessoa ( @NIF INT, @nome VARCHAR(255), @email VARCHAR(255),@telefone VARCHAR(9), @endereco VARCHAR(255))
----AS
----	BEGIN
----		INSERT INTO STAND_Entidade(NIF, nome, telefone, email, endereco) VALUES (@NIF, @nome, @telefone, @email, @endereco);
----	END
----GO

--ALTER PROCEDURE STAND_AdicionarCliente ( @NIF INT, @nome VARCHAR(255), @email VARCHAR(255),@telefone VARCHAR(9), @endereco VARCHAR(255))
--AS
--	BEGIN
--		DECLARE @count INT;
--		DECLARE @erro VARCHAR(100);
--		SET @count = (SELECT dbo.STAND_checkIfClienteExists(@NIF))
--		IF(@count>=1)
--			RAISERROR ('O NIF introduzido já existe, não é possível adicionar o Cliente', 16,1);
--		ELSE
--			BEGIN
--				BEGIN TRY
--					BEGIN TRAN
--								INSERT INTO STAND_Entidade(NIF, nome, telefone, email, endereco) VALUES (@NIF, @nome, @telefone, @email, @endereco);
--								INSERT INTO STAND_Cliente (NIF) VALUES (@NIF)
--					COMMIT TRAN
--				END TRY
--				BEGIN CATCH
--					Rollback TRAN
--					SELECT @erro = ERROR_MESSAGE(); 
--					SET @erro =  'O Cliente não foi inserido, algum valor inserido incorretamente'
--					RAISERROR (@erro, 16,1);
--				END CATCH
--			END
--	End
--GO



--ALTER PROCEDURE STAND_AdicionarFuncionario ( @NIF INT, @nome VARCHAR(255), @email VARCHAR(255),@telefone VARCHAR(9), @endereco VARCHAR(255), @funcao VARCHAR(255), @stand VARCHAR(255))
--AS
--BEGIN
--		DECLARE @count INT;
--		DECLARE @erro VARCHAR(100);
--		DECLARE @id_funcao INT;
--		DECLARE @id_stand INT;
--		BEGIN TRY
--			BEGIN TRAN
--				SET @id_funcao = (SELECT dbo.STAND_getIDFuncaoFROMNome(@funcao))
--				SET @id_stand = (SELECT dbo.STAND_getIDStandFROMNome(@stand))
--				INSERT INTO STAND_Entidade(NIF, nome, telefone, email, endereco) VALUES (@NIF, @nome, @telefone, @email, @endereco);
--				INSERT INTO STAND_Funcionario(NIF , id_funcao, id_stand) VALUES (@NIF, @id_funcao, @id_stand)
--			COMMIT tran
--		END TRY
--		BEGIN CATCH
--		Rollback TRAN
--			SELECT @erro = ERROR_MESSAGE(); 
--			SET @erro =  'Ocorreu qualquer erro a adicionar o Funcionário'
--			RAISERROR (@erro, 16,1);

--		END CATCH

--END
--GO

--ALTER PROCEDURE STAND_AdicionarFornecedor ( @NIF INT, @nome VARCHAR(255), @email VARCHAR(255),@telefone VARCHAR(9), @endereco VARCHAR(255))
--AS
--	BEGIN
--		DECLARE @count INT;
--		DECLARE @erro VARCHAR(100);
--		SET @count = (SELECT dbo.STAND_checkIfFornecedorExists(@NIF))
--		IF(@count>=1)
--			RAISERROR ('O NIF introduzido já existe, não é possível adicionar o Fornecedor', 16,1);
--		ELSE
--			BEGIN
--				BEGIN TRY
--					BEGIN TRAN
--								INSERT INTO STAND_Entidade(NIF, nome, telefone, email, endereco) VALUES (@NIF, @nome, @telefone, @email, @endereco);
--								INSERT INTO STAND_Fornecedor (NIF) VALUES (@NIF)
--					COMMIT TRAN
--				END TRY
--				BEGIN CATCH
--					Rollback TRAN
--					SELECT @erro = ERROR_MESSAGE(); 
--					SET @erro =  'O Fornecedor não foi inserido, algum valor inserido incorretamente'
--					RAISERROR (@erro, 16,1);
--				END CATCH
--			END
--	End
--GO

--ALTER PROCEDURE STAND_AdicionarCarro ( @matricula VARCHAR(10), @marca VARCHAR(255), @stand VARCHAR(255), @modelo VARCHAR(50), @categoria VARCHAR(255), @ano INT, @cilindrada INT, @cor VARCHAR(255), @km INT, @combustivel VARCHAR(255), @preco_anunciado DECIMAL(10,2), @observações VARCHAR(255), @NIF_fornecedor INT, @data DATE, @preco_compra DECIMAL(10,2) )
--AS
--	BEGIN
--		DECLARE @count INT;
--		DECLARE @count2 INT;
--		DECLARE @erro VARCHAR(100);
--		DECLARE @id_stand INT;
--		DECLARE @id_marca INT;
--		DECLARE @id_cor INT;
--		DECLARE @id_categoria INT;
--		DECLARE @id_combustivel INT;

--		SET @count = (SELECT dbo.STAND_checkIfFornecedorExists(@NIF_fornecedor))
--		SET @count2 += (SELECT dbo.STAND_checkIfMatriculaExists(@matricula))

--		IF(@count<1)
--			RAISERROR ('NIF introduzido não Existe', 16,1);
--			IF(@count>=1)
--				RAISERROR ('Matrícula introduzida já Existe', 16,1);
--		ELSE
--			BEGIN
--				BEGIN TRY
--					BEGIN TRAN
								
--								SET @id_stand = (SELECT dbo.STAND_getIDStandFROMNome(@stand))
--								SET @id_marca = (SELECT dbo.STAND_getIDMarcaFROMNome(@marca))
--								SET @id_cor = (SELECT dbo.STAND_getIDCorFROMNome(@cor))
--								SET @id_categoria = (SELECT dbo.STAND_getIDCategoriaFROMNome(@categoria))
--								SET @id_combustivel = (SELECT dbo.STAND_getIDCombustivelFROMNome(@combustivel))
--								INSERT INTO STAND_Veiculos(Matricula, id_Marca, id_Stand, Modelo, id_Categoria, Ano, Cilindrada, id_Cor, Quilometros, id_Combustivel, Preco_Anunciado, Observações) VALUES (@matricula, @id_marca, @id_stand, @modelo, @id_categoria, @ano, @cilindrada, @id_cor, @km,@id_combustivel, @preco_anunciado, @observações);
--								INSERT INTO STAND_CompraVeiculo(NIF_Fornecedor,id_Stand, Matricula_Veiculo, Data_movimento, Preco ) VALUES (@NIF_fornecedor,@id_stand,@matricula,@data,@preco_compra)

--					COMMIT TRAN
--				END TRY
--				BEGIN CATCH
--					Rollback TRAN
--					SELECT @erro = ERROR_MESSAGE(); 
--					SET @erro =  'O Carro não foi inserido, algum valor inserido incorretamente'
--					RAISERROR (@erro, 16,1);
--				END CATCH
--			END
--	End
--GO

--ALTER PROCEDURE STAND_AdicionarStand ( @nome VARCHAR(255), @email VARCHAR(255),@telefone VARCHAR(9), @endereco VARCHAR(255))
--AS
--	BEGIN
--		DECLARE @count INT;
--		DECLARE @erro VARCHAR(100);
--		SET @count = (SELECT dbo.STAND_checkIfStandExists(@nome))
--		IF(@count>=1)
--			RAISERROR ('O Stand introuduzido, já existe', 16,1);
--		ELSE
--			BEGIN
--				BEGIN TRY
--					INSERT INTO STAND(Nome, Endereco, Telefone, EMAIL) VALUES ( @nome, @endereco, @telefone, @email);	
					
--				END TRY
--				BEGIN CATCH
--					SELECT @erro = ERROR_MESSAGE(); 
--					SET @erro =  'O Stand não foi inserido, algum valor inserido incorretamente'
--					RAISERROR (@erro, 16,1);
--				END CATCH
--			END
--	End
--GO

--ALTER PROCEDURE STAND_ResgistrarVenda ( @matricula VARCHAR(10), @stand VARCHAR(255), @data VARCHAR(11), @preco_venda DECIMAL(10,2),@NIF_vendedor INT, @NIF_comprador INT )
--AS
--	BEGIN
--		DECLARE @count INT;
--		DECLARE @erro VARCHAR(100);
--		DECLARE @id_stand INT;

--		SET @count = (SELECT dbo.STAND_checkIfFuncionarioExists(@NIF_vendedor))
		
--		IF(@count<1)
--			RAISERROR ('Vendedor introduzido não Existe', 16,1);

--		SET @count += (SELECT dbo.STAND_checkIfClienteExists(@NIF_comprador))

--		IF(@count<2)
--			RAISERROR ('Cliente introduzido não Existe', 16,1);
		
--		SET @count += (SELECT dbo.STAND_checkIfCarroExists(@matricula))

--		IF(@count<2)
--				RAISERROR ('Carro já vendido', 16,1);

--		SET @count += (SELECT dbo.STAND_checkIfStandExists(@stand))
		
--		IF(@count<3)
--				RAISERROR ('Stand introduzido não Existe', 16,1);

--		SET @count += (SELECT dbo.STAND_checkIfMatriculaExists(@matricula))

--		IF(@count<4)
--				RAISERROR ('Matrícula introduzida não Existe', 16,1);
--		ELSE
--			BEGIN
--				BEGIN TRY
								
--								SET @id_stand = (SELECT dbo.STAND_getIDStandFROMNome(@stand))

--								INSERT INTO STAND_VendaVeiculo(NIF_Cliente, NIF_Vendedor, id_Stand,Matricula_Veiculo,Data_movimento,Preco  ) VALUES (@NIF_comprador, @NIF_vendedor, @id_stand,@matricula,@data, @preco_venda );
								

--				END TRY
--				BEGIN CATCH

--					SELECT @erro = ERROR_MESSAGE(); 
--					SET @erro =  'A venda não foi processada, algum valor inserido incorretamente'
--					RAISERROR (@erro, 16,1);
--				END CATCH
--			END
--	End
--GO




--ALTER PROCEDURE STAND_AdicionarMarca ( @marca VARCHAR(255))
--AS
--	BEGIN
--		DECLARE @erro VARCHAR(100);
--		BEGIN TRY
--				INSERT INTO STAND_MarcasCarros(Marca) VALUES (@marca);
		
--		END TRY
--		BEGIN CATCH
--			SELECT @erro = ERROR_MESSAGE(); 
--			SET @erro =  'Ocorreu qualquer erro a adicionar a Marca'
--			RAISERROR (@erro, 16,1);

--		END CATCH

--END
--GO

--ALTER PROCEDURE STAND_AdicionarFuncaoStand ( @funcao VARCHAR(255))
--AS
--	BEGIN
--		DECLARE @erro VARCHAR(100);
--		BEGIN TRY
--				INSERT INTO STAND_FuncaoStand(Funcao ) VALUES (@funcao);
			
--		END TRY
--		BEGIN CATCH
--			SELECT @erro = ERROR_MESSAGE(); 
--			SET @erro =  'Ocorreu qualquer erro a adicionar a Função'
--			RAISERROR (@erro, 16,1);

--		END CATCH

--END
--GO

--ALTER PROCEDURE STAND_AdicionarCorVeiculo ( @cor VARCHAR(255))
--AS
--	BEGIN
--		DECLARE @erro VARCHAR(100);
--		BEGIN TRY
--				INSERT INTO STAND_CorVeiculo(Cor ) VALUES (@cor);
		
--		END TRY
--		BEGIN CATCH
--			SELECT @erro = ERROR_MESSAGE(); 
--			SET @erro =  'Ocorreu qualquer erro a adicionar a Cor'
--			RAISERROR (@erro, 16,1);

--		END CATCH

--END
--GO


--ALTER PROCEDURE STAND_AdicionarCategoriarVeiculo ( @categoria VARCHAR(255))
--AS
--	BEGIN
--		DECLARE @erro VARCHAR(100);
--		BEGIN TRY
--				INSERT INTO STAND_CategoriaVeiculos(Categoria ) VALUES (@categoria);
			
--		END TRY
--		BEGIN CATCH
--			SELECT @erro = ERROR_MESSAGE(); 
--			SET @erro =  'Ocorreu qualquer erro a adicionar a Categoria'
--			RAISERROR (@erro, 16,1);

--		END CATCH

--END
--GO

 

--ALTER PROCEDURE STAND_EliminarFuncionário ( @nif INT)
--AS
--	BEGIN
--		DECLARE @erro VARCHAR(100);
--		BEGIN TRY
--			BEGIN TRAN
--				DELETE FROM STAND_Funcionario WHERE NIF=@nif

--			COMMIT tran
--		END TRY
--		BEGIN CATCH
--		Rollback TRAN
--			SELECT @erro = ERROR_MESSAGE(); 
--			SET @erro =  'Ocorreu qualquer erro a eliminar o Funcionário'
--			RAISERROR (@erro, 16,1);

--		END CATCH

--	END
--GO


--ALTER PROCEDURE STAND_EliminarFornecedor ( @nif INT)
--AS
--	BEGIN
--		DECLARE @erro VARCHAR(100);
--		BEGIN TRY
--			BEGIN TRAN
--				DELETE FROM STAND_Fornecedor WHERE NIF=@nif

--			COMMIT tran
--		END TRY
--		BEGIN CATCH
--		Rollback TRAN
--			SELECT @erro = ERROR_MESSAGE(); 
--			SET @erro =  'Ocorreu qualquer erro a eliminar o Fornecedor'
--			RAISERROR (@erro, 16,1);

--		END CATCH

--	END
--GO

--ALTER PROCEDURE STAND_EliminarCliente ( @nif INT)
--AS
--	BEGIN
--		DECLARE @erro VARCHAR(100);
--		BEGIN TRY
--			BEGIN TRAN
--				DELETE FROM STAND_Cliente WHERE NIF=@nif

--			COMMIT tran
--		END TRY
--		BEGIN CATCH
--		Rollback TRAN
--			SELECT @erro = ERROR_MESSAGE(); 
--			SET @erro =  'Ocorreu qualquer erro a eliminar o Cliente'
--			RAISERROR (@erro, 16,1);

--		END CATCH

--	END
--GO


--ALTER PROCEDURE STAND_AlterarCliente ( @NIF INT, @nome VARCHAR(255), @email VARCHAR(255),@telefone VARCHAR(9), @endereco VARCHAR(255))
--AS
--	BEGIN
--		DECLARE @count INT;
--		DECLARE @erro VARCHAR(100);
--		SET @count = (SELECT dbo.STAND_checkIfClienteExists(@NIF))
--		IF(@count<1)
--			RAISERROR ('O NIF introduzido não existe, ou não pertence a um cliente', 16,1);
--		ELSE

--			BEGIN
--				BEGIN TRY
--					BEGIN TRAN	
															
--								UPDATE STAND_Entidade
--								SET nome=@nome, telefone=@telefone, email=@email, endereco=@endereco
--								WHERE NIF=@NIF;

--					COMMIT TRAN
--				END TRY
--				BEGIN CATCH
--					Rollback TRAN
--					SELECT @erro = ERROR_MESSAGE(); 
--					SET @erro =  'A alteração não foi processada, algum valor inserido incorretamente'
--					RAISERROR (@erro, 16,1);
--				END CATCH
--		END
--	End
--GO

--ALTER PROCEDURE STAND_AlterarFuncionario ( @NIF INT, @nome VARCHAR(255), @email VARCHAR(255),@telefone VARCHAR(9), @endereco VARCHAR(255), @funcao VARCHAR(255), @stand VARCHAR(255))
--AS
--	BEGIN
--		DECLARE @count INT;
--		DECLARE @erro VARCHAR(100);
--		SET @count = (SELECT dbo.STAND_checkIfFuncionarioExists(@NIF))
--		IF(@count<1)
--			RAISERROR ('O NIF introduzido não existe, ou não pertence a um funcionário', 16,1);
--		ELSE

--			BEGIN
--				DECLARE @id_funcao INT;
--				DECLARE @id_stand INT;
--				BEGIN TRY
--					BEGIN TRAN	
															
--								SET @id_funcao = (SELECT dbo.STAND_getIDFuncaoFROMNome(@funcao))
--								SET @id_stand = (SELECT dbo.STAND_getIDStandFROMNome(@stand))

--								UPDATE STAND_Entidade
--								SET nome=@nome, telefone=@telefone, email=@email, endereco=@endereco
--								WHERE NIF=@NIF;

--								UPDATE STAND_Funcionario
--								SET id_funcao= @id_funcao, id_stand=@id_stand
--								WHERE NIF=@NIF;

--					COMMIT TRAN
--				END TRY
--				BEGIN CATCH
--					Rollback TRAN
--					SELECT @erro = ERROR_MESSAGE(); 
--					SET @erro =  'A alteração não foi processada, algum valor inserido incorretamente'
--					RAISERROR (@erro, 16,1);
--				END CATCH
--		END
--	End

--GO


--Create PROCEDURE STAND_AlterarFornecedor ( @NIF INT, @nome VARCHAR(255), @email VARCHAR(255),@telefone VARCHAR(9), @endereco VARCHAR(255))
--AS
--	BEGIN
--		DECLARE @count INT;
--		DECLARE @erro VARCHAR(100);
--		SET @count = (SELECT dbo.STAND_checkIfFornecedorExists(@NIF))
--		IF(@count<1)
--			RAISERROR ('O NIF introduzido não existe, ou não pertence a um fornecedor', 16,1);
--		ELSE

--			BEGIN
--				BEGIN TRY
--					BEGIN TRAN	
															
--								UPDATE STAND_Entidade
--								SET nome=@nome, telefone=@telefone, email=@email, endereco=@endereco
--								WHERE NIF=@NIF;

--					COMMIT TRAN
--				END TRY
--				BEGIN CATCH
--					Rollback TRAN
--					SELECT @erro = ERROR_MESSAGE(); 
--					SET @erro =  'A alteração não foi processada, algum valor inserido incorretamente'
--					RAISERROR (@erro, 16,1);
--				END CATCH
--		END
--	End
--GO

--ALTER PROCEDURE STAND_AlterarCarro ( @matricula VARCHAR(10), @marca VARCHAR(255), @stand VARCHAR(255), @modelo VARCHAR(50), @categoria VARCHAR(255), @ano INT, @cilindrada INT, @cor VARCHAR(255), @km INT, @combustivel VARCHAR(255), @preco_anunciado DECIMAL(10,2), @observações VARCHAR(255))
--AS
--	BEGIN
--		DECLARE @count INT;
--		DECLARE @erro VARCHAR(100);
--		DECLARE @id_stand INT;
--		DECLARE @id_marca INT;
--		DECLARE @id_cor INT;
--		DECLARE @id_categoria INT;
--		DECLARE @id_combustivel INT;

--		SET @count += (SELECT dbo.STAND_checkIfCarroExists(@matricula))

--		IF(@count<1)
--			RAISERROR ('O respetivo carro encontra-se vendido, não é possível efetuar as alterações propostas', 16,1);
--		ELSE
--			BEGIN
--				BEGIN TRY
--					BEGIN TRAN
								
--								SET @id_stand = (SELECT dbo.STAND_getIDStandFROMNome(@stand))
--								SET @id_marca = (SELECT dbo.STAND_getIDMarcaFROMNome(@marca))
--								SET @id_cor = (SELECT dbo.STAND_getIDCorFROMNome(@cor))
--								SET @id_categoria = (SELECT dbo.STAND_getIDCategoriaFROMNome(@categoria))
--								SET @id_combustivel = (SELECT dbo.STAND_getIDCombustivelFROMNome(@combustivel))

--								UPDATE STAND_Veiculos
--								SET id_Marca=@id_marca,id_Stand=@id_stand, Modelo=@modelo, id_Categoria=@id_categoria, Ano=@ano, Cilindrada=@cilindrada,id_Cor=@id_cor,Quilometros=@km,id_Combustivel=@id_combustivel,Preco_Anunciado=@preco_anunciado,Observações=@observações
--								WHERE Matricula=@matricula;

--					COMMIT TRAN
--				END TRY
--				BEGIN CATCH
--					Rollback TRAN
--					SELECT @erro = ERROR_MESSAGE(); 
--					SET @erro =  'A alteração não foi processada, algum valor inserido incorretamente'
--					RAISERROR (@erro, 16,1);
--				END CATCH
--			END
--	End
--GO

--CREATE PROCEDURE STAND_AlterarStand ( @nome VARCHAR(255), @email VARCHAR(255),@telefone VARCHAR(9), @endereco VARCHAR(255))
--AS
--	BEGIN
--		DECLARE @count INT;
--		DECLARE @id_stand INT;
--		DECLARE @erro VARCHAR(100);
--		SET @count = (SELECT dbo.STAND_checkIfStandExists(@nome))
--		IF(@count<1)
--			RAISERROR ('O Stand não existe', 16,1);
--		ELSE
--			BEGIN
--				BEGIN TRY
--					BEGIN TRAN
--								SET @id_stand = (SELECT dbo.STAND_getIDStandFROMNome(@nome))
--								UPDATE STAND
--								SET Nome=@nome, Endereco=@endereco,Telefone=@endereco, EMAIL=@email
--								WHERE id=@id_stand;
								
--					COMMIT TRAN
--				END TRY
--				BEGIN CATCH
--					Rollback TRAN
--					SELECT @erro = ERROR_MESSAGE(); 
--					SET @erro =  'A alteração não foi processada, algum valor inserido incorretamente'
--					RAISERROR (@erro, 16,1);
--				END CATCH
--			END
--	End


