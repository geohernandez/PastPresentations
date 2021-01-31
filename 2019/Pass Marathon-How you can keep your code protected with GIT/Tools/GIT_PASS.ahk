
::l1::
Send /C/PASS_Marathon/Demos/GIT/Pass
return

::r1::
Send https://DataWithGeo@dev.azure.com/DataWithGeo/PASS_Marathon/_git/SQLSaturdayDB
return


::a1::
Send cd /C/PASS_Marathon/Demos/GIT
return


::a2::
Send git init Pass
return


::a3::
Send cd /C/PASS_Marathon/Demos/GIT/Pass
return

::a4::
Send git diff
return


::a5::
   MsgBox  Ready to copy your SSDT Project :-) ...... and we can start to talk about GIT WORKFLOW
Return


::a6::
Send git status -u
return


::a7::
Send git add yourfilename/.
return


::a8::
Send git commit -m "My first commit - Remember to use a descriptive message"
return

::a81::
Send git commit -m "SSC-001 My first commit in a feature branch"
return

::a9::
Send git remote add origin/your_specifiedName https://DataWithGeo@dev.azure.com/DataWithGeo/PASS_Marathon/_git/SQLSaturdayDB
return

::a10::
Send git status
return

::a11::
Send git push -u origin --all
return

::a12::
 MsgBox NOW WE SHOULD CHECK THE FILES IN THE AZURE REPOSITORY
return

::b1::
Send git checkout -b develop
return

;Pending to verify if we can do a push without necesity of using -u origin

::b2::
Send git push -u origin --all
return

::b3::
Send git checkout master
return

::b4::
Send git checkout -b feature/SSC-0001 WriteHereYourDesiredSourceBranch
return

::b5::
MsgBox *****  IT IS TIME TO PLAY WITH OUR SSDT PROJECT  *******
return

::b6::
Send git add .
return

::b7::
Send git commit -m "SSC-001 My first commit in a feature branch"
return

::b8::
Send git status
return

::b9::
Send git push -u origin --all
return

::sp1::
Clipboard = 
(
     
	CREATE PROCEDURE usp_GetErrorInfo  
	AS  
	SELECT  
		ERROR_NUMBER() AS ErrorNumber  
		,ERROR_SEVERITY() AS ErrorSeverity  
		,ERROR_STATE() AS ErrorState  
		,ERROR_PROCEDURE() AS ErrorProcedure  
		,ERROR_LINE() AS ErrorLine  
		,ERROR_MESSAGE() AS ErrorMessage;  
	
)
send ^v
return

::sp2::
Clipboard = 
(

      
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

)
send ^v
return