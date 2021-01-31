CREATE TABLE [dbo].[Session] (
    [sessionID]       INT             IDENTITY (1, 1) NOT NULL,
    [title]           NVARCHAR (100)  NOT NULL,
    [abstract]        NVARCHAR (4000) NOT NULL,
    [speakerID]       INT             NOT NULL,
    [dateSession]     DATE            NOT NULL,
    [scheduleSession] DATETIME        NOT NULL,
    [duration]        SMALLINT        NOT NULL,
    [levelID]         TINYINT         NOT NULL,
    [trackID]         TINYINT         NOT NULL,
    [observation]     VARCHAR (200)   NULL,
    [sqlSatEventId]   INT             NULL,
    CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED ([sessionID] ASC),
    CONSTRAINT [FK_Session_Level] FOREIGN KEY ([levelID]) REFERENCES [dbo].[Level] ([levelID]),
    CONSTRAINT [Fk_Session_Speaker] FOREIGN KEY ([speakerID]) REFERENCES [dbo].[Speaker] ([speakerID]),
    CONSTRAINT [Fk_Session_SQLSatEvent] FOREIGN KEY ([sqlSatEventId]) REFERENCES [dbo].[SQLSatEvent] ([sqlSatEventID]),
    CONSTRAINT [FK_Session_Track] FOREIGN KEY ([trackID]) REFERENCES [dbo].[Track] ([trackID]),
    CONSTRAINT [Unq_Session_speakerID] UNIQUE NONCLUSTERED ([speakerID] ASC)
);

