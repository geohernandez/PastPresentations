﻿CREATE TABLE [dbo].[Track] (
    [trackID]     TINYINT       IDENTITY (1, 1) NOT NULL,
    [description] VARCHAR (150) NOT NULL,
    CONSTRAINT [PK_Track] PRIMARY KEY CLUSTERED ([trackID] ASC)
);

