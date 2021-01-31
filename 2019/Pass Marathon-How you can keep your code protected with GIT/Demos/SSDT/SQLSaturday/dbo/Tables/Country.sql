CREATE TABLE [dbo].[Country] (
    [countryId]   SMALLINT      IDENTITY (1, 1) NOT NULL,
    [countryCode] VARCHAR (2)   DEFAULT ('') NOT NULL,
    [countryName] VARCHAR (100) DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_Country_countryID] PRIMARY KEY CLUSTERED ([countryId] ASC)
);

