????? CTReplication ???????
1? ??ZIPSourceName ??F:\CTUpload\iceDB_KHP.zip
2? ????? ExecuteProcess_Unzip_Source_Data
	expression -> Arguments 
	?????? "e" +  " "+  @[User::ZIPPath] + @[User::ZIPSourceName] + " -aoa"
	??@[User::ZIPPath]
	??? @[User::ZIPSourceName]
	??? "e" +  " "+  @[User::ZIPSourceName] + " -aoa"




 

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