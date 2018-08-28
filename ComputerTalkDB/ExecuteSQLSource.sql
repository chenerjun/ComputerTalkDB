declare @tblname sysname='z_agent'

declare @dir varchar(500)='c:\\ComputerTALKDB\\RAW'

declare @file_name varchar(500)='Agent.dat'

declare @SQLstring  varchar(2000)


set @SQLstring='BCP ComputerTALKDB.dbo.'+@tblname+'  IN  '+@dir+'\\'+@file_name+  ' -e ' + 'c:\\ComputerTALKDB\\processed\\' +  @tblname + '_' + convert(varchar, getdate(), 112) +'.err'  + ' -c  -T  -C OEM '
select @SQLstring
exec xp_cmdshell @SQLstring