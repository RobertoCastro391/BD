USE p8g4
GO


CREATE TABLE RentACar_Veiculo(
	[Matricula] [varchar] (16) NOT NULL PRIMARY KEY,
	[Marca] [varchar] (256) NOT NULL,
	[Ano] [int] NOT NULL,
	[TipoVeiculo_Codigo] [int] REFERENCES RentACar_TipoVeiculo ([Codigo]) 
) 
GO

CREATE TABLE RentACar_Similaridade(
	[Codigo1] [int] NOT NULL REFERENCES RentACar_TipoVeiculo ([Codigo]),
	[Codigo2] [int] NOT NULL REFERENCES RentACar_TipoVeiculo ([Codigo]),
	PRIMARY KEY ([Codigo1],[Codigo2])
)
GO

CREATE TABLE RentACar_Ligeiro(
	[Codigo] [int] NOT NULL PRIMARY KEY REFERENCES RentACar_TipoVeiculo ([Codigo]),
	[Combustivel] [varchar] (32) NOT NULL, 
	[Lugares] [int] NOT NULL, 
	[Portas] [int] NOT NULL
)
GO

CREATE TABLE RentACar_Pesado(
	[Codigo] [int] NOT NULL PRIMARY KEY REFERENCES RentACar_TipoVeiculo ([Codigo]),
	[Peso] [int] NOT NULL, 
	[Pasageiros] [int] NOT NULL
)
GO

CREATE TABLE RentACar_Aluguer(
	[Numero] [int] NOT NULL PRIMARY KEY,
	[Duracao] [int] NOT NULL,
	[Data] [datetime] NOT NULL,
	[Matricula] [varchar] (16) REFERENCES RentACar_Veiculo ([Matricula]),
	[NIF_Cliente] [int] NOT NULL REFERENCES RentACar_Client ([NIF]),
	[Num_Balcao] [int] NOT NULL REFERENCES RentACar_Balcao ([Numero])
)
GO

CREATE TABLE RentACar_Balcao (
    [Numero] [int] NOT NULL PRIMARY KEY,
    [Nome] [varchar] (256) NOT NULL,
    [Endereco] [varchar] (1024) NOT NULL
)
GO

CREATE TABLE RentACar_Client(
    [NIF] [int] NOT NULL PRIMARY KEY,
    [Nome] [varchar] (256) NOT NULL,
    [Endereco] [varchar] (1024) NOT NULL,
    [num_carta] [varchar] (32) NOT NULL
)
GO

CREATE TABLE RentACar_TipoVeiculo(
    [Codigo] [int] NOT NULL IDENTITY PRIMARY KEY,
    [Designacao] [varchar] (128) NOT NULL,
    [ArCondicionado] [bit] Not NULL
)
GO