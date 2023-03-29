USE p8g4
GO

CREATE TABLE Voo_Airport(
	[Airport_code] [varchar](8) NOT NULL PRIMARY KEY,
	[City] [varchar](64) NOT NULL,
	[State] [varchar](64) NOT NULL,
	[Name] [varchar](64) NOT NULL
)
GO

CREATE TABLE Voo_AirplaneType(
	[TypeName] [varchar](8) NOT NULL PRIMARY KEY,
	[Company] [varchar](64) NOT NULL,
	[Max_No_Seats] [int] NOT NULL
)
GO

CREATE TABLE Voo_Airplane(
	[AirplaneID] [varchar](8) NOT NULL PRIMARY KEY,
	[Total_No_Seats] [int] NOT NULL,
	[AirplaneType_TypeName] [varchar](8) NOT NULL,
	FOREIGN KEY ([AirplaneType_TypeName]) REFERENCES Voo_AirplaneType([TypeName])
)
GO

CREATE TABLE Voo_CanLand(
	[AirplaneType_TypeName] [varchar](8) NOT NULL,
	[Airport_AirportCode] [varchar](8) NOT NULL,
	PRIMARY KEY ([AirplaneType_TypeName], [Airport_AirportCode]),
	FOREIGN KEY ([AirplaneType_TypeName]) REFERENCES Voo_AirplaneType([TypeName]),
	FOREIGN KEY ([Airport_AirportCode]) REFERENCES Voo_Airport([Airport_code])
)
GO


CREATE TABLE Voo_Flight(
	[Number] [varchar](8) NOT NULL PRIMARY KEY,
	[Airline] [varchar](64) NOT NULL,
	[Weekdays] [varchar](32) NOT NULL
)
GO

CREATE TABLE Voo_Fare(
	[Flight_Number] [varchar](8) NOT NULL,
	[Airport_code] [varchar](8) NOT NULL,
	[Amount] [int] NOT NULL,
	[Restrictions] [varchar](64) NOT NULL,
	PRIMARY KEY ([Flight_Number], [Airport_code]),
	FOREIGN KEY ([Flight_Number]) REFERENCES Voo_Flight([Number]),
	FOREIGN KEY ([Airport_code]) REFERENCES Voo_Airport([Airport_code])
)
GO

CREATE TABLE Voo_FlightLeg(
	[Airport_Dep_code] [varchar](8) NOT NULL,
	[Airport_Arr_code] [varchar](8) NOT NULL,
	[Flight_Number] [varchar](8) NOT NULL,
	[leg_no] [int] NOT NULL,
	[Scheduled_Dep_Time] [time] NOT NULL,
	[Scheduled_Arr_Time] [time] NOT NULL,
	PRIMARY KEY ([Airport_Dep_code], [Airport_Arr_code], [Flight_Number], [leg_no]),
	FOREIGN KEY ([Airport_Dep_code]) REFERENCES Voo_Airport([Airport_code]),
	FOREIGN KEY ([Airport_Arr_code]) REFERENCES Voo_Airport([Airport_code]),
	FOREIGN KEY ([Flight_Number]) REFERENCES Voo_Flight([Number])
)
GO

CREATE TABLE Voo_LegInstance(
    [FlightLeg_Airport_Dep_code] [varchar](8) NOT NULL,
    [FlightLeg_Airport_Arr_code] [varchar](8) NOT NULL,
    [FlightLeg_FlightNumber] [varchar](8) NOT NULL,
    [FlightLeg_LegNo] [int] NOT NULL,
    [Airplane_AirplaneID] [varchar](8) NOT NULL,
	[Date] [datetime] NOT NULL,
    [Dep_Time] [time] NOT NULL,
    [Arr_Time] [time] NOT NULL,
    [No_Avail_Seats] [int] NOT NULL,
    PRIMARY KEY ([FlightLeg_Airport_Dep_code], [FlightLeg_Airport_Arr_code], [FlightLeg_FlightNumber], [FlightLeg_LegNo], [Airplane_AirplaneID], [Date]),
    FOREIGN KEY ([FlightLeg_Airport_Dep_code], [FlightLeg_Airport_Arr_code], [FlightLeg_FlightNumber], [FlightLeg_LegNo]) REFERENCES Voo_FlightLeg([Airport_Dep_code], [Airport_Arr_code], [Flight_Number], [leg_no]),
	FOREIGN KEY ([Airplane_AirplaneID]) REFERENCES Voo_Airplane([AirplaneID])
)
GO

CREATE TABLE Voo_Seat(
	[LegInstance_FlightLeg_Airport_Dep_code] [varchar](8) NOT NULL,
	[LegInstance_FlightLeg_Airport_Arr_code] [varchar](8) NOT NULL,
	[LegInstance_FlightLeg_FlightNumber] [varchar](8) NOT NULL,
	[LegInstance_FlightLeg_LegNo] [int] NOT NULL,
    [LegInstance_Airplane_AirplaneID] [varchar](8) NOT NULL,
	[LegInstance_Date] [datetime] NOT NULL,
    [Seat_Number] [int] NOT NULL,
    [Customer_Name] [varchar](64) NOT NULL,
    [Customer_Phone] [int] NOT NULL,
    PRIMARY KEY ([LegInstance_FlightLeg_Airport_Dep_code], [LegInstance_FlightLeg_Airport_Arr_code], [LegInstance_FlightLeg_FlightNumber], [LegInstance_FlightLeg_LegNo], [LegInstance_Airplane_AirplaneID], [LegInstance_Date], [Seat_Number]),
    FOREIGN KEY ([LegInstance_FlightLeg_Airport_Dep_code], [LegInstance_FlightLeg_Airport_Arr_code], [LegInstance_FlightLeg_FlightNumber], [LegInstance_FlightLeg_LegNo], [LegInstance_Airplane_AirplaneID], [LegInstance_Date]) REFERENCES Voo_LegInstance([FlightLeg_Airport_Dep_code], [FlightLeg_Airport_Arr_code], [FlightLeg_FlightNumber], [FlightLeg_LegNo], [Airplane_AirplaneID], [Date])
)
GO
