-- ==============================================
-- Create Table: [dbo].[Customers]
-- ==============================================

USE [OrderDB]
GO

CREATE TABLE [dbo].[Customers]
(
	[CustomerID] [uniqueidentifier] NOT NULL PRIMARY KEY,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Class] [char](10) NOT NULL,
	[Room] [int] NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[City] [nvarchar](100) NULL,
	[Country] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[InsertedDate] [date] NOT NULL DEFAULT (getdate()),
	[UpdatedDate] [date] NULL 
)
GO


-- ==============================================
-- Create Table: [dbo].[Orders]
-- ==============================================
USE [OrderDB]
GO

CREATE TABLE [dbo].[Orders]
(
	[OrderID] [uniqueidentifier] NOT NULL PRIMARY KEY,
	[CustomerID] [uniqueidentifier] NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[Paid] [char](10)  DEFAULT 'No',
	[PaymentDate] [date] NULL,
	[InsertedDate] [date] NOT NULL DEFAULT (getdate()),
	[UpdatedDate] [date] NULL, 
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	CONSTRAINT check_paid_yesno   CHECK ([Paid] = 'Yes' OR [Paid] = 'No')
)
GO


-- ==============================================
-- Inserting Script for Table: [dbo].[Customers]
-- ==============================================
USE [OrderDB]
GO

SET QUOTED_IDENTIFIER OFF
Print "Inserting Script for Table: [dbo].[Customers]"
SET QUOTED_IDENTIFIER ON
INSERT INTO [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Class],[Room],[Address],[City],[Country],[Email],[InsertedDate],[UpdatedDate]) VALUES (CAST('463d3ae9-ed17-b451-0fcc-26266d2143dd' AS UNIQUEIDENTIFIER),N'Lawrence',N'Johnson',N'FXHDSP',47874,N'53 Main Street South',N'Phoenix',N'U.S.A.',N'uybcv.ezgrwnn@fdc.org',N'3/21/2019',N'9/23/2019')
INSERT INTO [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Class],[Room],[Address],[City],[Country],[Email],[InsertedDate],[UpdatedDate]) VALUES (CAST('597cfd15-0ffa-8050-f635-c096e1a5dbda' AS UNIQUEIDENTIFIER),N'Salvador',N'Brown',N'MFAZWMVT',661999,N'39 Main Street',N'New York',N'China ',N'kxgcdg.lncoymd@knhpy.com',N'2/25/2019',NULL)
INSERT INTO [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Class],[Room],[Address],[City],[Country],[Email],[InsertedDate],[UpdatedDate]) VALUES (CAST('6cbcc141-31de-4b50-dd9d-5a07542873d7' AS UNIQUEIDENTIFIER),N'Gilbert',N'Smith',N'CGIG',258769,N'191 Church Street',N'Houston',N'Indonesia',N'ksuhw.muotvwx@hplth.org',N'5/17/2019',NULL)
INSERT INTO [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Class],[Room],[Address],[City],[Country],[Email],[InsertedDate],[UpdatedDate]) VALUES (CAST('80fc846c-52c1-174f-c406-f478c8ac0ad3' AS UNIQUEIDENTIFIER),N'Jorge',N'Jones',N'JW',899767,N'1 Main Street North',N'Los Angeles',N'Brazil ',N'qlpbrv.bqpye@mgw.co',N'3/3/2019',NULL)
INSERT INTO [dbo].[Customers]([CustomerID],[FirstName],[LastName],[Class],[Room],[Address],[City],[Country],[Email],[InsertedDate],[UpdatedDate]) VALUES (CAST('933b4798-74a4-e24f-ac6e-8de93c2fa2d0' AS UNIQUEIDENTIFIER),N'Ernest',N'Williams',N'VBCUGDL',44763,N'214 High Street',N'Chicago',N'India',N'xabdetunu.kagitk@sydsi.org',N'2/19/2019',N'11/8/2019')
GO
-- TRANSACTION HANDLING
IF @@ERROR<>0 OR @@TRANCOUNT=0 BEGIN IF @@TRANCOUNT>0 ROLLBACK SET NOEXEC ON END
GO
IF @@TRANCOUNT>0
	COMMIT

SET NOEXEC OFF
GO

-- =======================================================
-- Inserting script for Table: [dbo].[Orders]
-- =======================================================
USE [OrderDB]
GO

SET QUOTED_IDENTIFIER OFF
Print "Inserting Script for Table: [dbo].[Orders]"
SET QUOTED_IDENTIFIER ON
INSERT INTO [dbo].[Orders]([OrderID],[CustomerID],[OrderNumber],[OrderDate],[Paid],[PaymentDate],[InsertedDate],[UpdatedDate]) VALUES (CAST('f3ec87ea-b31e-c328-6dcf-d4d3490de54d' AS UNIQUEIDENTIFIER),CAST('463d3ae9-ed17-b451-0fcc-26266d2143dd' AS UNIQUEIDENTIFIER),383847,N'6/6/1977',N'No',N'12/17/2019',N'8/1/2019',N'11/22/2019')
INSERT INTO [dbo].[Orders]([OrderID],[CustomerID],[OrderNumber],[OrderDate],[Paid],[PaymentDate],[InsertedDate],[UpdatedDate]) VALUES (CAST('062c4a16-d501-8f27-5438-6e43bc907d49' AS UNIQUEIDENTIFIER),CAST('6cbcc141-31de-4b50-dd9d-5a07542873d7' AS UNIQUEIDENTIFIER),79380,N'10/31/1806',N'No',N'3/20/2019',N'8/30/2019',N'10/29/2019')
INSERT INTO [dbo].[Orders]([OrderID],[CustomerID],[OrderNumber],[OrderDate],[Paid],[PaymentDate],[InsertedDate],[UpdatedDate]) VALUES (CAST('196b0d41-f7e4-5a27-3ba0-08b430141546' AS UNIQUEIDENTIFIER),CAST('933b4798-74a4-e24f-ac6e-8de93c2fa2d0' AS UNIQUEIDENTIFIER),313263,N'2/27/1912',N'Yes',N'10/27/2019',N'8/14/2019',NULL)
INSERT INTO [dbo].[Orders]([OrderID],[CustomerID],[OrderNumber],[OrderDate],[Paid],[PaymentDate],[InsertedDate],[UpdatedDate]) VALUES (CAST('2dabd06d-19c8-2626-2308-a125a497ac42' AS UNIQUEIDENTIFIER),CAST('597cfd15-0ffa-8050-f635-c096e1a5dbda' AS UNIQUEIDENTIFIER),934570,N'10/18/1881',N'Yes',N'7/17/2019',N'6/30/2019',N'10/24/2019')
INSERT INTO [dbo].[Orders]([OrderID],[CustomerID],[OrderNumber],[OrderDate],[Paid],[PaymentDate],[InsertedDate],[UpdatedDate]) VALUES (CAST('40eb9498-3aab-f125-0a71-3b96181b443f' AS UNIQUEIDENTIFIER),CAST('80fc846c-52c1-174f-c406-f478c8ac0ad3' AS UNIQUEIDENTIFIER),77078,N'9/17/1799',N'No',N'12/12/2019',N'4/30/2019',N'11/27/2019')
GO


-- ==============================================
-- Create Trigger For Update: [dbo].[Customers]
-- ==============================================
USE [OrderDB]
GO

CREATE TRIGGER dbo.updCustomersData   
ON [dbo].[Customers]   
AFTER UPDATE AS  
	 IF COLUMNS_UPDATED()> 0 
	 BEGIN  
		UPDATE [dbo].[Customers]
        SET [UpdatedDate] = GETDATE()
		FROM [dbo].[Customers]   inner join inserted on [dbo].[Customers].[CustomerID] = [inserted].[CustomerID]
	 END; 


----audit-----

USE [OrderDB]
GO
SELECT * 
FROM  [dbo].[Customers] 
GO 

USE [OrderDB]
GO
UPDATE [dbo].[Customers]   
   SET [FirstName] = 'Gilbert', LastName = 'Brown' 
   WHERE [FirstName] = 'Jorge'                                                                                            
GO  

USE [OrderDB]
GO
SELECT * 
FROM  [dbo].[Customers] 
GO 


-- ==============================================
-- Create Viev For [dbo].[Customers]
-- ==============================================
USE [OrderDB]
GO

CREATE VIEW [dbo].[vCustomers]    
AS
SELECT [FirstName]
		, [LastName]
		, [City]
		, [Country]
FROM [dbo].[Customers]
WHERE [UpdatedDate] = CONVERT(date, getdate())
GO 

----audit-----
USE [OrderDB]
GO
SELECT * FROM [dbo].[vCustomers]
GO 

-- ==============================================
-- Create Viev For [dbo].[Orders]
-- ==============================================
USE [OrderDB]
GO

CREATE VIEW [dbo].[vOrders]   
AS
SELECT COUNT([OrderNumber]) as CountOrder
	  ,[OrderDate]
FROM [dbo].[Orders]
WHERE [Paid] = 'No'
GROUP BY [OrderDate]
GO 

----audit-----
USE [OrderDB]
GO
SELECT * FROM [dbo].[vOrders] 
ORDER BY [vOrders].[CountOrder]
GO 

-- ==============================================
-- Create Viev For [dbo].[Customers] WITH CHECK OPTION
-- ==============================================

USE [OrderDB]
GO

--CREATE OR 
ALTER VIEW [dbo].[vCustomersUpdate]    
AS
SELECT [CustomerID]
		, [FirstName]
		, [LastName]
		, [Class]
		, [Room]
		, [Address]
		, [City]
		, [Country]
		, [Email]
		, [InsertedDate]
		, [UpdatedDate]
FROM [dbo].[Customers]
WHERE [UpdatedDate] = CONVERT(date, getdate())
WITH CHECK OPTION
GO 

----audit-----
INSERT INTO [dbo].[vCustomersUpdate] ([CustomerID],[FirstName],[LastName],[Class],[Room],[Address],[City],[Country],[Email],[InsertedDate],[UpdatedDate]) VALUES (NEWID(),N'Salvador',N'Brown',N'MFAZWMVT',661999,N'39 Main Street',N'New York',N'China ',N'kxgcdg.lncoymd@knhpy.com',N'2/25/2019',NULL)


USE [OrderDB]
GO
SELECT * FROM [dbo].[vCustomersUpdate]
GO 