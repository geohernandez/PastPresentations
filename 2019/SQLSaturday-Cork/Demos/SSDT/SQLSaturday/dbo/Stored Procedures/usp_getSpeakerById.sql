

      CREATE PROCEDURE dbo.usp_getSpeakerById
          @speakerId INT
      AS
      BEGIN TRY

        SELECT speakerID
               ,firstName + ' ' + lastName as name
               ,email
               ,website,
               observation
        FROM Speaker
        WHERE speakerID = @speakerId;

        END TRY

        BEGIN CATCH
          -- Execute error retrieval routine.
          EXECUTE usp_GetErrorInfo;
        END CATCH
