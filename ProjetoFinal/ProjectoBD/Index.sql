USE [p8g4]
GO


CREATE INDEX idx_Stand_id ON STAND (id)
GO

CREATE INDEX idx_Entidade_NIF ON STAND_Entidade (NIF)
GO

CREATE INDEX idx_Veiculos_Matricula ON STAND_Veiculos (Matricula)
GO
