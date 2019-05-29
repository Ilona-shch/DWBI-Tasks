-- ==============================================
-- Insert Data With NULL Value for column [Class]
-- ==============================================
USE [OrderDB]
GO

INSERT INTO [dbo].[Customers] ([CustomerID],[FirstName],[LastName],[Class],[Room],[Address],[City],[Country],[Email],[InsertedDate],[UpdatedDate])
VALUES (NEWID(),N'Salvador',N'Brown',NULL,661999,N'39 Main Street',N'New York',N'China ',N'kxgcdg.lncoymd@knhpy.com',N'2/25/2019',NULL)

-- ==============================================
-- Insert Defauld data for column [InsertedDate]
-- ==============================================

USE [OrderDB]
GO

INSERT INTO [dbo].[Customers] ([CustomerID],[FirstName],[LastName],[Class],[Room],[Address],[City],[Country],[Email],[UpdatedDate])
VALUES (NEWID(),N'Salvador',N'Brown',N'VBCUGDL',661999,N'39 Main Street',N'New York',N'China ',N'kxgcdg.lncoymd@knhpy.com',NULL)

----audit-----
USE [OrderDB]
GO
SELECT * FROM [dbo].[Customers]


-- ==============================================
-- Insert data to [dbo].[Orders].[Paid] (CONSTRAINT check_paid_yesno   CHECK ([Paid] = 'Yes' OR [Paid] = 'No')
-- ============================================== 

USE [OrderDB]
GO

INSERT INTO [dbo].[Orders]([OrderID],[CustomerID],[OrderNumber],[OrderDate],[Paid],[PaymentDate],[InsertedDate],[UpdatedDate]) 
VALUES (NEWID(),CAST('463d3ae9-ed17-b451-0fcc-26266d2143dd' AS UNIQUEIDENTIFIER),383847,N'6/6/1977',N'Not',N'12/17/2019',N'8/1/2019',N'11/22/2000')

-- ==============================================
-- Insert to [dbo].[Orders] (FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID))
-- ==============================================

USE [OrderDB]
GO

INSERT INTO [dbo].[Orders]([OrderID],[CustomerID],[OrderNumber],[OrderDate],[Paid],[PaymentDate],[InsertedDate],[UpdatedDate]) 
VALUES (NEWID(),'463d3ae9-ed17-b451-0fcc-26266d2143dd1122',383847,N'6/6/1977',N'No',N'12/17/2019',N'8/1/2019',N'11/22/2000')

----audit-----
USE [OrderDB]
GO
SELECT o.[CustomerID], c.[CustomerID]
FROM [dbo].[Orders] o full join [dbo].[Customers] c
ON o.CustomerID=c.CustomerID



-- ==============================================
-- Create Schema
-- ==============================================
USE [OrderDB]
GO

CREATE SCHEMA Education;
GO

-- ==============================================
-- Create Table: [Education].[Product]
-- ==============================================

USE [OrderDB]
GO

CREATE TABLE [Education].[Product]
(
    [ProductID] INT NOT NULL,
    [ProductName] VARCHAR(255) NOT NULL,
    [Brand] VARCHAR(255) NOT NULL,
    [CategoryID] INT NOT NULL,
    [ModelYear] SMALLINT NOT NULL,
    [ListPrice] DEC(10,2) NOT NULL,
	[City] [nvarchar](100) NULL,
	[Country] [nvarchar](100) NULL,
	[Class] VARCHAR(255) NOT NULL   
);

-- ==============================================
-- Create Table: [Education].[ProductAudit]
-- ==============================================

USE [OrderDB]
GO

CREATE TABLE [Education].[ProductAudit]
(
    [ProductID] INT NOT NULL,
    [ProductName] VARCHAR(255) NOT NULL,
    [Brand] VARCHAR(255) NOT NULL,
    [CategoryID] INT NOT NULL,
    [ModelYear] SMALLINT NOT NULL,
    [ListPrice] DEC(10,2) NOT NULL,
	[City] [nvarchar](100) NULL,
	[Country] [nvarchar](100) NULL,
	[Class] VARCHAR(255) NOT NULL,
	[DateOperation] DATETIME NOT NULL,
    [TypeOperation] CHAR(3) NOT NULL
	CHECK([TypeOperation] = 'INS' or [TypeOperation]='DEL')   
);

-- ==============================================
-- Create Trigger For [Education].[Product]
-- ==============================================
USE [OrderDB]
GO

CREATE TRIGGER [Education].[trg_ProductAudit]
ON [Education].[Product]
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO [Education].[ProductAudit]
	(
       [ProductID]
      ,[ProductName]
      ,[Brand]
      ,[CategoryID]
      ,[ModelYear]
      ,[ListPrice]
      ,[City]
      ,[Country]
      ,[Class]
      ,[DateOperation]
      ,[TypeOperation]
    )
    SELECT
       i.[ProductID]
      ,[ProductName]
      ,[Brand]
      ,[CategoryID]
      ,[ModelYear]
      ,[ListPrice]
      ,[City]
      ,[Country]
      ,[Class]
      ,  GETDATE()
      , 'INS'
    FROM
        inserted i
    UNION ALL
    SELECT
       d.[ProductID]
      ,[ProductName]
      ,[Brand]
      ,[CategoryID]
      ,[ModelYear]
      ,[ListPrice]
      ,[City]
      ,[Country]
      ,[Class]
      ,  GETDATE()
      , 'DEL'
    FROM
        deleted d;
END
GO

-----Testing the trigger
USE [OrderDB]
GO

INSERT INTO [Education].[Product]
(
       [ProductID]
      ,[ProductName]
      ,[Brand]
      ,[CategoryID]
      ,[ModelYear]
      ,[ListPrice]
      ,[City]
      ,[Country]
      ,[Class]
     
)
VALUES 
(
    001
    , 'PC'
    , 'WWWE'
	, 002
	, 001
	, 120.33
	, 'Rome'
	, 'Italy'
	, 'lux'
);
GO

-----
SELECT * 
FROM [Education].[ProductAudit]

-----
DELETE FROM 
    [Education].[Product]
WHERE 
    ProductID = 1;

-----
SELECT * 
FROM [Education].[ProductAudit]

-- ==============================================
-- Create Synonyms
-- ==============================================

USE [OrderDB]
GO
CREATE SYNONYM [dbo].[syn_Product] FOR [Education].[Product]
GO


USE [OrderDB]
GO
CREATE SYNONYM [dbo].[syn_vCustomers] FOR [dbo].[vCustomers]
GO

----Testing 
SELECT name, base_object_name 
FROM sys.synonyms
GO

SELECT * 
FROM [dbo].[syn_Product]
GO


SELECT * 
FROM [dbo].[syn_vCustomers]
GO

