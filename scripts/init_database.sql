/*
====================================================
Ceate Database and Schemas
====================================================
Script Purpose:
	This script creates a new database name 'DataWarehouse' after checking if it already exists.
	If the database exists,it is dropped and recreated. Additionally, the script sets up three schemas
	within the database: 'bronze','silver','gold'.

WARNING:
	Running this script will drop the entire 'Datawarehouse' database if it exists.
	All data in the database wwill be permanently deleted.Proceed with caution.
	and ensusre you have proper backups before running the script.
*/

USE master;
GO

--Drop and recrete the 'Datawarehouse' database
IF EXISTS(SELECT 1 FROM sys.databases WHERE name='DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

--Create the 'DataWarehouse' Data
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

--Create schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
