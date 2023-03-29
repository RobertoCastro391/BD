USE p8g4
GO

--CREATE TABLE Conferencia_Pessoa(
--	[Codigo] [int] NOT NULL PRIMARY KEY,
--	[Nome] [varchar](128) NOT NULL,
--	[Email] [varchar](128) NOT NULL
--)
--GO

CREATE TABLE Conferencia_Participante(
	[Codigo] [int] NOT NULL PRIMARY KEY,
	[Data_inscricao] [datetime] NOT NULL,
	[Morada] [varchar](128) NOT NULL,
	[Tipo_Participante] [varchar](128) NOT NULL,
	[Instituicao_Nome] [varchar](128) NOT NULL REFERENCES Conferencia_Instituicao([Nome]),
	[Pessoa_Codigo] [int] NOT NULL REFERENCES Conferencia_Pessoa([Codigo])
)
GO

--CREATE TABLE Conferencia_Instituicao(
--	[Nome] [varchar](128) NOT NULL PRIMARY KEY,
--	[Morada] [varchar](128) NOT NULL,
--)
--GO

CREATE TABLE Conferencia_Autor(
	[Codigo] [int] NOT NULL PRIMARY KEY,
	[Pessoa_Codigo] [int] NOT NULL REFERENCES Conferencia_Pessoa([Codigo]),
	[Instituicao_Nome] [varchar](128) NOT NULL REFERENCES Conferencia_Instituicao([Nome])
)
GO

CREATE TABLE Conferencia_ArtigoCientifico(
	[Numero_Registo] [int] NOT NULL PRIMARY KEY,
	[Titulo] [varchar](128) NOT NULL,
	[Autor_Codigo] [int] NOT NULL REFERENCES Conferencia_Autor([Codigo])
)
GO

CREATE TABLE Conferencia_Estudante(
	[Participante_Codigo] [int] NOT NULL,
	[Participante_TipoEstudante] [varchar](128),
	[Compr_Emi_Instituicao_Ensino] [varchar](128) NOT NULL,
	PRIMARY KEY ([Participante_Codigo], [Participante_TipoEstudante]),
	FOREIGN KEY ([Participante_Codigo]) REFERENCES Conferencia_Participante([Codigo])
)
GO

CREATE TABLE Conferencia_NaoEstudante(
	[Participante_Codigo] [int] NOT NULL,
	[Participante_TipoNaoEstudante] [varchar](128),
	[Referencia_Transacao_Bancaria] [varchar](128) NOT NULL,
	PRIMARY KEY ([Participante_Codigo], [Participante_TipoNaoEstudante]),
	FOREIGN KEY ([Participante_Codigo]) REFERENCES Conferencia_Participante([Codigo])
)
GO

