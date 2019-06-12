????? CTReplication ???????
1? ??ZIPSourceName ??F:\CTUpload\iceDB_KHP.zip
2? ????? ExecuteProcess_Unzip_Source_Data
	expression -> Arguments 
	?????? "e" +  " "+  @[User::ZIPPath] + @[User::ZIPSourceName] + " -aoa"
	??@[User::ZIPPath]
	??? @[User::ZIPSourceName]
	??? "e" +  " "+  @[User::ZIPSourceName] + " -aoa"


(A) DataReplication.dtst does NOT encrypt. it runs on T530 for testing
(B) CTReplication.dtst encrypt. it runs on production server
(C) For testing on T530, put original data at C:\ComputerTALKDB\, named iceDB_KHP.zip
    processed data would be saved C:\ComputerTALKDB\Processed, named err_20190611.7z and Processed_20190611.7z 
	if the date of testing is 2019-06-11

	if you process many orginial data at the same date, you MUST change 
	(i) always name original data as "iceDB_KHP.zip";
	(ii) always change processed data under directory C:\ComputerTALKDB\Processed to what it should be.
	    Example June 12, 2019, we are going to processing c, May 30, 2019, June 1, 2019 and June 12, 2019.
		the process should be :
		(a) changing original data iceDB_KHP_20190530.zip to iceDB_KHP.zip, and put on C:\ComputerTALKDB
		    read: C:\ComputerTALKDB\iceDB_KHP.zip
		(b) after processed the original data May 30, 2019; both err_20190612.7z and processed_20190612.7z will be grenreated 
		     under directory C:\ComputerTALKDB\Processed
			 read: C:\ComputerTALKDB\Processed\err_20190612.7z
			       C:\ComputerTALKDB\Processed\c
	     (c) changing err_20190612.7z to err_20190530.7z
		     changing processed-20190612.7z to processed_20190530.7z

			 if we forget to change err_20190612.7z and err_20190612.7z; the next processed data will overwrite the on the same datestamp

	     (d) moving to next original data on June 1,2019  -- repeat from (a) -- (c)
		 (e) moving to next original data on June 12, 2019  -- repeat from (a) -- (c)

(D) for production server, put original data at F:\CTUpload, named iceDB_KHP.zip. 
     processed data would be saved C:\ComputerTALKDB\Processed, named err_20190611.7z and Proc essed_20190611.7z 
	if the date of testing is 2019-06-11
	
	Example for process many original data on the production server:
	assuming on June 12, 2019, we are going to processing c, May 30, 2019, June 1, 2019 and June 12, 2019.
		the process should be :  
		(a) changing original data iceDB_KHP_20190530.zip to iceDB_KHP.zip, and put on F:\CTUpload
		    read: F:\CTUpload\iceDB_KHP.zip
		(b) after processed the original data May 30, 2019; both err_20190612.7z and processed_20190612.7z will be grenreated 
		     under directory C:\ComputerTALKDB\Processed
			 read: C:\ComputerTALKDB\Processed\err_20190612.7z
			       C:\ComputerTALKDB\Processed\c
	    (c) changing err_20190612.7z to err_20190530.7z
		     changing processed-20190612.7z to processed_20190530.7z

	 if we forget to change err_20190612.7z and err_20190612.7z; the next processed data will overwrite the on the same datestamp

	     (d) moving to next original data on June 1,2019  -- repeat from (a) -- (c)
		 (e) moving to next original data on June 12, 2019  -- repeat from (a) -- (c)



 

(1) Enable the xp_cmdshell procedure:

-- To allow advanced options to be changed.
EXEC sp_configure 'show advanced options', 1
RECONFIGURE
GO

-- Enable the xp_cmdshell procedure
EXEC sp_configure 'xp_cmdshell', 1
RECONFIGURE
GO
(2) Create a login 'Domain\TestUser' (windows user) for the non-sysadmin user that has public access to the master database

(3) Grant EXEC permission on the xp_cmdshell stored procedure:

GRANT EXECUTE ON xp_cmdshell TO [Domain\TestUser]
(4) Create a proxy account that xp_cmdshell will be run under using sp_xp_cmdshell_proxy_account

EXEC sp_xp_cmdshell_proxy_account 'Domain\TestUser', 'pwd'
-- Note: pwd means windows password for [Domain\TestUser] account id on the box.
--       Don't include square brackets around Domain\TestUser.
(5) Grant control server permission to user

USE master;
GRANT CONTROL SERVER TO [Domain\TestUser]
GO