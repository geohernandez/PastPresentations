CREATE TABLE [dbo].[Level] (
    [levelID]     TINYINT       IDENTITY (1, 1) NOT NULL,
    [description] VARCHAR (120) NOT NULL,
    CONSTRAINT [PK_Level] PRIMARY KEY CLUSTERED ([levelID] ASC)
);

