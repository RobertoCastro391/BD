USE p8g4
GO

CREATE TABLE Encomendas_Armazem(
    [Codigo] [int] NOT NULL PRIMARY KEY,
    [Endereco] [varchar] (1024) NOT NULL
)
GO

CREATE TABLE Encomendas_TipoFornecedor(
    [Codigo] [int] NOT NULL PRIMARY KEY,
    [Nome] [varchar] (256) NOT NULL
)
GO

CREATE TABLE Encomendas_CondicoesPagamento(
    [Codigo] [int] NOT NULL PRIMARY KEY,
    [Nome] [varchar] (256) NOT NULL,
      [Prazo] [datetime] NOT NULL
)
GO


CREATE TABLE Encomendas_Produto(
    [Codigo] [int] NOT NULL PRIMARY KEY,
    [Nome] [varchar] (256) NOT NULL,
    [Preço] [int] NOT NULL,
    [CodigoArmazem] [int] NOT NULL REFERENCES Encomendas_Armazem ([Codigo])
)
GO

CREATE TABLE Encomendas_Fornecedor(
    [Codigo] [int] NOT NULL PRIMARY KEY,
    [Nome] [varchar] (256) NOT NULL,
    [FAX] [int] NOT NULL,
    [NIF] [int] NOT NULL,
    [Morada] [varchar] (1024) NOT NULL,
    [CodicoesPagamento] [int] NOT NULL REFERENCES Encomendas_CondicoesPagamento ([Codigo]),
    [TipoFornecedor] [int] NOT NULL REFERENCES Encomendas_TipoFornecedor ([Codigo])
)
GO

CREATE TABLE Encomendas_Encomenda(
    [Numero] [int] NOT NULL IDENTITY PRIMARY KEY,
    [Quantidade] [int] NOT NULL,
    [Data] [datetime] NOT NULL,
    [CodigoProduto] [int] NOT NULL REFERENCES Encomendas_Produto ([Codigo]),
    [CodigoFornecedor] [int] NOT NULL REFERENCES Encomendas_Fornecedor ([Codigo])
)
GO