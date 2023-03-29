USE p8g4
GO

CREATE TABLE PrescricaoMedica_Medico(
    [numSNS] [int] NOT NULL PRIMARY KEY,
    [Nome] [varchar] (256) NOT NULL,
    [Especialidade] [varchar] (56) NOT NULL,
)
GO

CREATE TABLE PrescricaoMedica_Paciente(
    [numUtente] [int] NOT NULL PRIMARY KEY,
    [Nome] [varchar] (256) NOT NULL,
    [Endereco] [varchar] (1024) NOT NULL,
	[Medico] [int] NOT NULL REFERENCES PrescricaoMedica_Medico([numSNS]),
)
GO

CREATE TABLE PrescricaoMedica_VendaFarmacos(
    [farmaciaNIF] [int] NOT NULL,
    [Formula] [varchar] (1024) NOT NULL,
	PRIMARY KEY ([farmaciaNIF], [Formula])
)
GO

CREATE TABLE PrescricaoMedica_ProducaoFarmacos(
    [farmaceuticaNNR] [int] NOT NULL,
    [Formula] [varchar] (1024) NOT NULL,
	PRIMARY KEY ([farmaceuticaNNR], [Formula])
)
GO

CREATE TABLE PrescricaoMedica_Farmacia(
    [farmaciaNIF] [int] NOT NULL PRIMARY KEY,
	[Formula] [varchar] (1024) NOT NULL,
    [Nome] [varchar] (256) NOT NULL,
	[Endereco] [varchar] (1024) NOT NULL,
	[Telefone] [int] NOT NULL,
	FOREIGN KEY ([farmaciaNIF], [Formula]) REFERENCES PrescricaoMedica_VendaFarmacos([farmaciaNIF], [Formula])
)
GO

CREATE TABLE PrescricaoMedica_Faramaceutica(
    [farmaceuticaNNR] [int] NOT NULL PRIMARY KEY,
	[Formula] [varchar] (1024) NOT NULL,
    [Nome] [varchar] (256) NOT NULL,
	[Endereco] [varchar] (1024) NOT NULL,
	[Telefone] [int] NOT NULL,
	FOREIGN KEY ([farmaceuticaNNR], [Formula]) REFERENCES PrescricaoMedica_ProducaoFarmacos([farmaceuticaNNR], [Formula]),
)
GO

CREATE TABLE PrescricaoMedica_Prescricao(
    [Numero] [int] NOT NULL IDENTITY PRIMARY KEY,
    [Data] [datetime] NOT NULL,
	[Medico] [int] NOT NULL REFERENCES PrescricaoMedica_Medico([numSNS]),
	[Paciente] [int] NOT NULL REFERENCES PrescricaoMedica_Paciente([numUtente])
)
GO

CREATE TABLE PrescricaoMedica_Farmacos(
	[farmaciaNIF] [int] NOT NULL,
    [farmaceuticaNNR] [int] NOT NULL,
	[Formula1] [varchar] (1024) NOT NULL,
	[Formula2] [varchar] (1024) NOT NULL,
	[nomeComercial] [varchar] (256) NOT NULL,
	[numPrescricaoMedica] [int] NOT NULL REFERENCES PrescricaoMedica_Prescricao ([Numero]),
	PRIMARY KEY ([Formula1],[Formula2]),
	FOREIGN KEY ([farmaciaNIF],[Formula1]) REFERENCES PrescricaoMedica_VendaFarmacos ([farmaciaNIF],[Formula]),
	FOREIGN KEY ([farmaceuticaNNR],[Formula2]) REFERENCES PrescricaoMedica_ProducaoFarmacos ([farmaceuticaNNR],[Formula])
)
GO