USE p8g4
GO

CREATE TABLE ATL_Professor(
	[Numero_Funcionario] [int] NOT NULL PRIMARY KEY,
	[Numero_CartaoCidadao] [int] NOT NULL,
	[Nome] [varchar](64),
	[Morada] [varchar](128) NOT NULL,
	[Data_Nascimento] [datetime] NOT NULL
)
GO

CREATE TABLE ATL_Turma(
	[Identificador] [int] NOT NULL PRIMARY KEY,
	[Designacao] [varchar](128) NOT NULL,
	[Ano_Letivo] [int] NOT NULL,
	[Professor_NumeroFuncionario] [int] NOT NULL REFERENCES ATL_Professor([Numero_Funcionario])
)
GO

CREATE TABLE ATL_Atividade(
	[Identificador] [int] NOT NULL PRIMARY KEY,
	[Custo] [int] NOT NULL,
	[Ano_Letivo] [int] NOT NULL,
)
GO

CREATE TABLE ATL_ProcessamentoAtividade(
	[Turma_Identificador] [int] NOT NULL,
	[Atividade_Identificador] [int] NOT NULL,
	PRIMARY KEY ([Turma_Identificador], [Atividade_Identificador]),
	FOREIGN KEY ([Turma_Identificador]) REFERENCES ATL_Turma([Identificador]),
	FOREIGN KEY ([Atividade_Identificador]) REFERENCES ATL_Atividade([Identificador])
)
GO

CREATE TABLE ATL_Tipo_EncEducacao(
	[Tipo_Nome] [varchar](32) NOT NULL PRIMARY KEY
)
GO

CREATE TABLE ATL_Tipo_PessoaAutorizada(
	[Tipo_Nome] [varchar](32) NOT NULL PRIMARY KEY
)
GO

CREATE TABLE ATL_EncEducacao(
	[Numero_CartaoCidadao] [int] NOT NULL PRIMARY KEY,
	[Nome] [varchar](64),
	[Morada] [varchar](128) NOT NULL,
	[Data_Nascimento] [datetime] NOT NULL,
	[Email] [varchar](128) NOT NULL,
	[Telefone] [int] NOT NULL,
	[Tipo_EncEducacao] [varchar](32) NOT NULL REFERENCES ATL_Tipo_EncEducacao([Tipo_Nome])
)
GO



CREATE TABLE ATL_Aluno(
	[Numero_CartaoCidadao] [int] NOT NULL PRIMARY KEY,
	[Nome] [varchar](64),
	[Morada] [varchar](128) NOT NULL,
	[Data_Nascimento] [datetime] NOT NULL,
	[Turma_Identificador] [int] NOT NULL REFERENCES ATL_Turma([Identificador]),
	[EncEducacao_NumeroCartaoCidadao] [int] NOT NULL REFERENCES ATL_EncEducacao([Numero_CartaoCidadao]),
)
GO

CREATE TABLE ATL_PessoaAutorizada(
	[Numero_CartaoCidadao] [int] NOT NULL PRIMARY KEY,
	[Nome] [varchar](64),
	[Morada] [varchar](128) NOT NULL,
	[Data_Nascimento] [datetime] NOT NULL,
	[Email] [varchar](128) NOT NULL,
	[Telefone] [int] NOT NULL,
	[Aluno_Numero_CartaoCidadao] [int] NOT NULL REFERENCES ATL_Aluno([Numero_CartaoCidadao]),
	[Tipo_PessoaAutorizada] [varchar](32) NOT NULL REFERENCES ATL_Tipo_PessoaAutorizada([Tipo_Nome])
)
GO