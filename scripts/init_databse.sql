-- Switch to master database
USE master;
GO

-- Drop database if it exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN 
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the database
CREATE DATABASE DataWarehouse;
GO

-- Wait for database creation
WAITFOR DELAY '00:00:02';

-- Switch to the newly created database
USE DataWarehouse;
GO

-- Creating the schema
CREATE SCHEMA bronze;
GO 

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
