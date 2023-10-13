USE [p8g4]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_check_insert_on_STAND]
ON [dbo].[STAND]
AFTER INSERT
AS
BEGIN
  BEGIN TRANSACTION;
  IF EXISTS (SELECT 1 FROM inserted WHERE Nome = '')
  BEGIN
    RAISERROR ('O Nome não pode estar vazio.', 16, 1);
    ROLLBACK TRANSACTION;
    RETURN;
  END
  IF EXISTS (SELECT 1 FROM inserted WHERE Endereco = '')
  BEGIN
    RAISERROR ('O Endereço não pode estar vazio.', 16, 1);
    ROLLBACK TRANSACTION;
    RETURN;
  END
  IF EXISTS (SELECT 1 FROM inserted WHERE LEN(Telefone) <> 9)
  BEGIN
    RAISERROR ('O Telefone deve ter 9 dígitos.', 16, 1);
    ROLLBACK TRANSACTION;
    RETURN;
  END
  IF EXISTS (SELECT 1 FROM inserted WHERE Email NOT LIKE '%_@_%._%')
  BEGIN
    RAISERROR ('O Email deve ter um formato válido.', 16, 1);
    ROLLBACK TRANSACTION;
    RETURN;
  END
  COMMIT TRANSACTION;
END
GO

ALTER TABLE [dbo].[STAND] ENABLE TRIGGER [trg_check_insert_on_STAND]
GO

USE [p8g4]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_check_nif_exists]
ON [dbo].[STAND_Cliente]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        LEFT JOIN [dbo].[STAND_Entidade] e ON i.NIF = e.NIF
        WHERE e.NIF IS NULL
    )
    BEGIN
        RAISERROR ('O NIF introduzido não existe na tabela STAND_Entidade.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
GO

ALTER TABLE [dbo].[STAND_Cliente] ENABLE TRIGGER [trg_check_nif_exists]
GO

USE [p8g4]
GO

/****** Object:  Trigger [dbo].[trg_check_entidade]    Script Date: 06/06/2023 00:48:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_check_entidade]
ON [dbo].[STAND_Entidade]
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE LEN(CONVERT(VARCHAR(50), NIF)) <> 9 OR NIF NOT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
    )
    BEGIN
        RAISERROR ('O NIF deve conter exatamente 9 números.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE LEN(Nome) <= 4
    )
    BEGIN
        RAISERROR ('O nome deve ser valido.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

	IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE LEN(Telefone) <> 9 OR NIF NOT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
    )
    BEGIN
        RAISERROR ('O telefone deve conter apenas números e 9 dígitos.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE Email NOT LIKE '%_@__%.__%'
    )
    BEGIN
        RAISERROR ('O email não é um endereço de email válido.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE Endereco NOT LIKE '%[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9]%'
    )
    BEGIN
        RAISERROR ('O endereço deve conter um código postal.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
GO

ALTER TABLE [dbo].[STAND_Entidade] ENABLE TRIGGER [trg_check_entidade]
GO


