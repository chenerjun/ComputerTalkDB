declare @tbl varchar(50) = 'z_agent'
declare @path varchar(500) = 'c:\computerTALKDB\RAW'
declare @fileName varchar(50) = 'agent.dat'
declare @sql varchar(2000)
set @sql = 'BCP ComputerTALKDB.dbo.' + @tbl + ' IN ' + @path + '\' + @fileName + ' -e ' + 'c:\ComputerTALKDB\Processed\agent.err' + ' -c -T -C OEM'
select @sql
exec master..xp_cmdshell @sql
go
