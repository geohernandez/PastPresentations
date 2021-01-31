CREATE TABLE [dbo].[Customer] (
    [CustomerID] INT            NOT NULL,
    [Name]       NVARCHAR (200) NOT NULL,
    [Phone]      NVARCHAR (25)  NOT NULL,
    [Email]      VARCHAR (50)   NULL,
    [Address]    NVARCHAR (250) NOT NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);

