CREATE TABLE [dbo].[Speaker] (
    [speakerID]   INT            IDENTITY (1, 1) NOT NULL,
    [firstName]   NVARCHAR (100) NOT NULL,
    [lastName]    NVARCHAR (100) NOT NULL,
    [biography]   VARCHAR (250)  NULL,
    [email]       VARCHAR (100)  NULL,
    [website]     VARCHAR (120)  NULL,
    [linkedin]    VARCHAR (100)  NULL,
    [twitter]     VARCHAR (120)  NULL,
    [observation] VARCHAR (200)  NULL,
    CONSTRAINT [PK_Speaker] PRIMARY KEY CLUSTERED ([speakerID] ASC)
);

