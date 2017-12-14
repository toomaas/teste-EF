
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/12/2017 19:48:36
-- Generated from EDMX file: C:\Users\joaquimtomas\source\repos\EF_5_ModelFirst\EF_5_ModelFirst\AccountingSystemModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [AccountingSystem];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_InvoiceHeaderInvoiceDetail]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InvoiceDetailSet] DROP CONSTRAINT [FK_InvoiceHeaderInvoiceDetail];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[InvoiceHeaders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InvoiceHeaders];
GO
IF OBJECT_ID(N'[dbo].[InvoiceDetailSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InvoiceDetailSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'InvoiceHeaders'
CREATE TABLE [dbo].[InvoiceHeaders] (
    [InvoiceHeader_Id] int IDENTITY(1,1) NOT NULL,
    [Total] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'InvoiceDetailSet'
CREATE TABLE [dbo].[InvoiceDetailSet] (
    [InvoiceDetail_Id] int IDENTITY(1,1) NOT NULL,
    [ItemDescription] nvarchar(max)  NOT NULL,
    [Quantity] int  NOT NULL,
    [Price] decimal(18,0)  NOT NULL,
    [InvoiceHeaderInvoiceHeader_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [InvoiceHeader_Id] in table 'InvoiceHeaders'
ALTER TABLE [dbo].[InvoiceHeaders]
ADD CONSTRAINT [PK_InvoiceHeaders]
    PRIMARY KEY CLUSTERED ([InvoiceHeader_Id] ASC);
GO

-- Creating primary key on [InvoiceDetail_Id] in table 'InvoiceDetailSet'
ALTER TABLE [dbo].[InvoiceDetailSet]
ADD CONSTRAINT [PK_InvoiceDetailSet]
    PRIMARY KEY CLUSTERED ([InvoiceDetail_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [InvoiceHeaderInvoiceHeader_Id] in table 'InvoiceDetailSet'
ALTER TABLE [dbo].[InvoiceDetailSet]
ADD CONSTRAINT [FK_InvoiceHeaderInvoiceDetail]
    FOREIGN KEY ([InvoiceHeaderInvoiceHeader_Id])
    REFERENCES [dbo].[InvoiceHeaders]
        ([InvoiceHeader_Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InvoiceHeaderInvoiceDetail'
CREATE INDEX [IX_FK_InvoiceHeaderInvoiceDetail]
ON [dbo].[InvoiceDetailSet]
    ([InvoiceHeaderInvoiceHeader_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------