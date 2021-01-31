CREATE TABLE [dbo].[SQLSatEvent] (
    [sqlSatEventID] INT           IDENTITY (1, 1) NOT NULL,
    [eventName]     VARCHAR (100) NOT NULL,
    [countryID]     SMALLINT      NOT NULL,
    [EventDate]     DATE          NOT NULL,
    [place]         VARCHAR (100) NOT NULL,
    [organizer]     VARCHAR (150) NOT NULL,
    [email]         VARCHAR (60)  NOT NULL,
    [website]       VARCHAR (75)  NOT NULL,
    CONSTRAINT [PK_SQLSatEvent_sqlSatEventID] PRIMARY KEY CLUSTERED ([sqlSatEventID] ASC),
    CONSTRAINT [FK_SQLSatEvent_Country] FOREIGN KEY ([countryID]) REFERENCES [dbo].[Country] ([countryId])
);

