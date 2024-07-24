--create_database.sql File
--Bilikis Lawal, Kajal, Leiziane Trevisan Dardin




IF EXISTS 
(SELECT name 
FROM master.dbo.sysdatabases
WHERE name = N'Coworking App')
BEGIN
	ALTER DATABASE [Coworking App] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [Coworking App] SET ONLINE;
	DROP DATABASE [Coworking App];
END

GO

CREATE DATABASE [Coworking App];
GO

USE [Coworking App];
GO
CREATE TABLE [dbo].[Role] 
(
	[RoleID] INT IDENTITY(1,1) PRIMARY KEY,
	[RoleName] VARCHAR(50) NOT NULL UNIQUE
);

GO
CREATE TABLE [dbo].[User] 
(
	[UserID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[FirstName] VARCHAR(100) NOT NULL,
	[LastName] VARCHAR(100) NOT NULL,
	[Phone] VARCHAR(20) NOT NULL,
	[Email] VARCHAR (100) NOT NULL UNIQUE,
	[RoleID] INT NOT NULL	
);

GO
CREATE TABLE [dbo].[Property] 
(
	[PropertyID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[OwnerID] INT NOT NULL,
	[Address] VARCHAR(400) NOT NULL,
	[City] VARCHAR(50) NOT NULL,
	[Province] VARCHAR(50) NOT NULL,
	[PostalCode] VARCHAR(20) NOT NULL,
	[Neighbourhood] VARCHAR(120) NOT NULL,
	[Area (In Square Meters)] INT NOT NULL CHECK([Area (In Square Meters)] > 0),
	[Parking] BIT NOT NULL,
	[PublicTransport] BIT NOT NULL
				
);
GO
CREATE TABLE [dbo].[Workspace]
(
	[WorkspaceID] INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	[PropertyID] INT NOT NULL,
	[TypeID] INT NOT NULL,
	[Seats] INT NOT NULL CHECK(Seats > 0),
	[AvailableDate] DATE NOT NULL,
	[LeaseID] INT NOT NULL,
	[Price] NUMERIC(10,2) NOT NULL
);
GO
CREATE TABLE [dbo].[WorkspaceType] 
(
	[TypeID] INT IDENTITY(1,1) PRIMARY KEY,
	[TypeName] VARCHAR(50) NOT NULL UNIQUE
);

GO
CREATE TABLE [dbo].[LeaseTerms] 
(
	[LeaseID] INT IDENTITY(1,1) PRIMARY KEY,
	[LeaseName] VARCHAR(50) NOT NULL UNIQUE
);

ALTER TABLE [dbo].[User] ADD CONSTRAINT [FK_UserRoleID]
	FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Role] ([RoleID]) 
	ON DELETE NO ACTION ON UPDATE NO ACTION
;
GO
CREATE INDEX [IFK_UserRoleID] ON [dbo].[User] ([RoleID]);
GO

ALTER TABLE [dbo].[Property] ADD CONSTRAINT [FK_UserPropertyID]
	FOREIGN KEY ([OwnerID]) REFERENCES [dbo].[User] ([UserID]) 
	ON DELETE NO ACTION ON UPDATE NO ACTION
;
GO
CREATE INDEX [IFK_UserPropertyID] ON [dbo].[User] ([UserID]);
GO

ALTER TABLE [dbo].[Workspace] ADD CONSTRAINT [FK_WorkspacePropertyID]
	FOREIGN KEY ([PropertyID]) REFERENCES [dbo].[Property] ([PropertyID]) 
	ON DELETE NO ACTION ON UPDATE NO ACTION
;
GO
CREATE INDEX [IFK_WorkspacePropertyID] ON [dbo].[Property] ([PropertyID]);
GO

ALTER TABLE [dbo].[Workspace] ADD CONSTRAINT [FK_WorkspaceTypeID]
	FOREIGN KEY ([TypeID]) REFERENCES [dbo].[WorkspaceType] ([TypeID]) 
	ON DELETE NO ACTION ON UPDATE NO ACTION
;
GO
CREATE INDEX [IFK_WorkspaceTypeID] ON [dbo].[WorkspaceType] ([TypeID]);
GO

ALTER TABLE [dbo].[Workspace] ADD CONSTRAINT [FK_WorkspaceLeaseID]
	FOREIGN KEY ([LeaseID]) REFERENCES [dbo].[LeaseTerms] ([LeaseID]) 
	ON DELETE NO ACTION ON UPDATE NO ACTION
;
GO
CREATE INDEX [IFK_WorkspaceLeaseID] ON [dbo].[LeaseTerms] ([LeaseID]);
GO
