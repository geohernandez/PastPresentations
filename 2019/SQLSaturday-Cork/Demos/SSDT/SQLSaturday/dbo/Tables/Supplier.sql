CREATE TABLE [dbo].[Supplier] (
    [SupplierID] INT            NOT NULL,
    [Name]       NVARCHAR (200) NOT NULL,
    [Phone]      NVARCHAR (25)  NOT NULL,
    [Email]      VARCHAR (50)   NULL,
    [Address]    NVARCHAR (250) NOT NULL,
    CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED ([SupplierID] ASC)
);

