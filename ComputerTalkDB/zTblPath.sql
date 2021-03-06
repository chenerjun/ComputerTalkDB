-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		William Chen
-- Create date: 2018-08-27
-- Description:	Create working table zTblPath
-- The table zTblTable has 5 columens 
--  [zTblPath](
-- 	[Table_name] [nvarchar](50) NULL,      storing working table name , likes "z_ACDQueue", that match actual table in ComputerTALKDB ACDQUEUE.
-- 	[File_path] [nvarchar](500) NULL,      storing unzip RAW data file path,  likes "c:\\ComputerTALKDB\\RAW"
-- 	[File_name] [nvarchar](50) NULL,       storing RAW data file name, like "ACDQueue.dat"
-- 	[sql_string] [varchar](max) NULL,      storing Merge stetment to updaing , insert, delete attual table. likes 
--                MERGE [dbo].[AgentAssignment] AS tar
--                USING [dbo].[z_AgentAssignment] AS src
--                ON tar.SwitchID = src.SwitchID and tar.AgentID = src.AgentID AND tar.QueueID = src.QueueID
--                WHEN MATCHED THEN
--                   UPDATE SET
--                   tar.SwitchID  =  src.SwitchID
--                ,tar.QueueID  =  src.QueueID
--                ,tar.AgentID  =  src.AgentID
--                ,tar.HuntgroupOrder  =  src.HuntgroupOrder
--                WHEN NOT MATCHED THEN
--                   INSERT
--                   (
--                   SwitchID
--                , QueueID
--                , AgentID
--                , HuntgroupOrder
--                   )
--                   VALUES
--                   (
--                   src.SwitchID
--                , src.QueueID
--                , src.AgentID
--                , src.HuntgroupOrder
--
--
--
-- Notes: WfSubApplication.dat has bad data format, I comment it zTblPath working table, that means, SSIS package will not process this data in ETL process.
--        at arround Row 8086
--  
-- =============================================
CREATE PROCEDURE EzTblPath 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Drop table zTblPath
	IF OBJECT_ID('dbo.zTblPath', 'U') IS NOT NULL 
	DROP TABLE [dbo].[zTblPath];

	-- Create table zTblPath
	CREATE TABLE [dbo].[zTblPath](
	[Table_name] [nvarchar](50) NULL,
	[File_path] [nvarchar](500) NULL,
	[File_name] [nvarchar](50) NULL,
	[sql_string] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


 
 -- insert data 
 

INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_ACDQueue', N'c:\\ComputerTALKDB\\RAW', N'ACDQueue.dat', N'MERGE [dbo].[ACDQueue] AS tar
USING [dbo].[z_ACDQueue] AS src
ON tar.SwitchID = src.SwitchID and tar.QueueID = src.QueueID
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.QueueID  =  src.QueueID
, tar.QueueName  =  src.QueueName
, tar.QueueShortName  =  src.QueueShortName
, tar.BusyQueueThreshold  =  src.BusyQueueThreshold
, tar.PriorityWeight  =  src.PriorityWeight
, tar.QueuedTimeWeight  =  src.QueuedTimeWeight
, tar.SkillScoreWeight  =  src.SkillScoreWeight
, tar.IgnoreDSkillThreshold  =  src.IgnoreDSkillThreshold
, tar.IgnoreMSkillThreshold  =  src.IgnoreMSkillThreshold
, tar.TargetASA  =  src.TargetASA
, tar.AutoWrapTime  =  src.AutoWrapTime
, tar.NoAnswerTime  =  src.NoAnswerTime
, tar.ClassOfService  =  src.ClassOfService
, tar.TargetASA2  =  src.TargetASA2
, tar.AgentIdleTimeWeight  =  src.AgentIdleTimeWeight
, tar.OnEmailTime  =  src.OnEmailTime
, tar.GOSShortAbandonedThreshold  =  src.GOSShortAbandonedThreshold
, tar.DynamicSkillDowngradeThreshold  =  src.DynamicSkillDowngradeThreshold
, tar.MaxAgentsParallelAlerting  =  src.MaxAgentsParallelAlerting     
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
SwitchID
, QueueID
, QueueName
, QueueShortName
, BusyQueueThreshold
, PriorityWeight
, QueuedTimeWeight
, SkillScoreWeight
, IgnoreDSkillThreshold
, IgnoreMSkillThreshold
, TargetASA
, AutoWrapTime
, NoAnswerTime
, ClassOfService
, TargetASA2
, AgentIdleTimeWeight
, OnEmailTime
, GOSShortAbandonedThreshold
, DynamicSkillDowngradeThreshold
, MaxAgentsParallelAlerting
   )
   VALUES
   (
src.SwitchID
, src.QueueID
, src.QueueName
, src.QueueShortName
, src.BusyQueueThreshold
, src.PriorityWeight
, src.QueuedTimeWeight
, src.SkillScoreWeight
, src.IgnoreDSkillThreshold
, src.IgnoreMSkillThreshold
, src.TargetASA
, src.AutoWrapTime
, src.NoAnswerTime
, src.ClassOfService
, src.TargetASA2
, src.AgentIdleTimeWeight
, src.OnEmailTime
, src.GOSShortAbandonedThreshold
, src.DynamicSkillDowngradeThreshold
, src.MaxAgentsParallelAlerting
   )
   WHEN NOT MATCHED by SOURCE THEN
   DELETE
   ;'); 


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Agent', N'c:\\ComputerTALKDB\\RAW', N'Agent.dat', N'MERGE [dbo].[Agent] AS tar
USING [dbo].[z_Agent] AS src
ON tar.SwitchID = src.SwitchID and tar.AgentID = src.AgentID
WHEN MATCHED THEN
   UPDATE SET
     tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.AgentName  =  src.AgentName
, tar.AgentType  =  src.AgentType
, tar.ClassOfService  =  src.ClassOfService
, tar.Password  =  src.Password
, tar.AutoLogonAddress  =  src.AutoLogonAddress
, tar.AutoLogonQueue  =  src.AutoLogonQueue
, tar.PAQOverflowThreshold  =  src.PAQOverflowThreshold
, tar.NoAnswerThreshold  =  src.NoAnswerThreshold
, tar.CfacDn  =  src.CfacDn
, tar.CfnaDn  =  src.CfnaDn
, tar.CfpoDn  =  src.CfpoDn
, tar.CfnlDn  =  src.CfnlDn
, tar.CfState  =  src.CfState
, tar.EmailAddress  =  src.EmailAddress
, tar.RemoteDn  =  src.RemoteDn
, tar.VoiceMailDN  =  src.VoiceMailDN
, tar.NumVoiceMailCalls  =  src.NumVoiceMailCalls
, tar.CallerNumPBX  =  src.CallerNumPBX
, tar.CallerNumPSTN  =  src.CallerNumPSTN
, tar.AgentAlias  =  src.AgentAlias
, tar.ImageURL  =  src.ImageURL
, tar.OutboundWorkflowDN  =  src.OutboundWorkflowDN
, tar.OutboundWorkflowMode  =  src.OutboundWorkflowMode
, tar.HotlineDN  =  src.HotlineDN
, tar.CallerName  =  src.CallerName
, tar.PlacedCallAutoWrapTimer  =  src.PlacedCallAutoWrapTimer
, tar.UpdateCount  =  src.UpdateCount
, tar.LogonToNotReadyReason  =  src.LogonToNotReadyReason
, tar.IMAddress  =  src.IMAddress
, tar.PasswordDTMF  =  src.PasswordDTMF
, tar.PasswordCOS  =  src.PasswordCOS
, tar.PasswordLastChanged  =  src.PasswordLastChanged
, tar.PasswordAbsoluteLockedOutDate  =  src.PasswordAbsoluteLockedOutDate
, tar.PasswordLockedOutExpireDateTime  =  src.PasswordLockedOutExpireDateTime
, tar.ClassOfService2  =  src.ClassOfService2
, tar.ADFQDN  =  src.ADFQDN
, tar.ADGUID  =  src.ADGUID
, tar.LanguageCode  =  src.LanguageCode
WHEN NOT MATCHED THEN
   INSERT
   (
 SwitchID
, AgentID
, AgentName
, AgentType
, ClassOfService
, Password
, AutoLogonAddress
, AutoLogonQueue
, PAQOverflowThreshold
, NoAnswerThreshold
, CfacDn
, CfnaDn
, CfpoDn
, CfnlDn
, CfState
, EmailAddress
, RemoteDn
, VoiceMailDN
, NumVoiceMailCalls
, CallerNumPBX
, CallerNumPSTN
, AgentAlias
, ImageURL
, OutboundWorkflowDN
, OutboundWorkflowMode
, HotlineDN
, CallerName
, PlacedCallAutoWrapTimer
, UpdateCount
, LogonToNotReadyReason
, IMAddress
, PasswordDTMF
, PasswordCOS
, PasswordLastChanged
, PasswordAbsoluteLockedOutDate
, PasswordLockedOutExpireDateTime
, ClassOfService2
, ADFQDN
, ADGUID
, LanguageCode
   )
   VALUES
   (
 src.SwitchID
, src.AgentID
, src.AgentName
, src.AgentType
, src.ClassOfService
, src.Password
, src.AutoLogonAddress
, src.AutoLogonQueue
, src.PAQOverflowThreshold
, src.NoAnswerThreshold
, src.CfacDn
, src.CfnaDn
, src.CfpoDn
, src.CfnlDn
, src.CfState
, src.EmailAddress
, src.RemoteDn
, src.VoiceMailDN
, src.NumVoiceMailCalls
, src.CallerNumPBX
, src.CallerNumPSTN
, src.AgentAlias
, src.ImageURL
, src.OutboundWorkflowDN
, src.OutboundWorkflowMode
, src.HotlineDN
, src.CallerName
, src.PlacedCallAutoWrapTimer
, src.UpdateCount
, src.LogonToNotReadyReason
, src.IMAddress
, src.PasswordDTMF
, src.PasswordCOS
, src.PasswordLastChanged
, src.PasswordAbsoluteLockedOutDate
, src.PasswordLockedOutExpireDateTime
, src.ClassOfService2
, src.ADFQDN
, src.ADGUID
, src.LanguageCode
   )
   WHEN NOT MATCHED BY SOURCE THEN DELETE;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_AgentAssignment', N'c:\\ComputerTALKDB\\RAW', N'AgentAssignment.dat', N'MERGE [dbo].[AgentAssignment] AS tar
USING [dbo].[z_AgentAssignment] AS src
ON tar.SwitchID = src.SwitchID and tar.AgentID = src.AgentID AND tar.QueueID = src.QueueID
WHEN MATCHED THEN
   UPDATE SET
   tar.SwitchID  =  src.SwitchID
,tar.QueueID  =  src.QueueID
,tar.AgentID  =  src.AgentID
,tar.HuntgroupOrder  =  src.HuntgroupOrder
WHEN NOT MATCHED THEN
   INSERT
   (
   SwitchID
, QueueID
, AgentID
, HuntgroupOrder
   )
   VALUES
   (
   src.SwitchID
, src.QueueID
, src.AgentID
, src.HuntgroupOrder
   )
   WHEN NOT MATCHED BY SOURCE THEN DELETE;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_AgentSkill', N'c:\\ComputerTALKDB\\RAW', N'AgentSkill.dat', N'MERGE [dbo].[AgentSkill] AS tar
USING [dbo].[z_AgentSkill] AS src
ON tar.SwitchID = src.SwitchID and tar.AgentID = src.AgentID AND tar.SkillID = src.SkillID
WHEN MATCHED THEN
   UPDATE SET
   tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.SkillID  =  src.SkillID
, tar.SkillLevel  =  src.SkillLevel

WHEN NOT MATCHED THEN
   INSERT
   (
   SwitchID
, AgentID
, SkillID
, SkillLevel
   )
   VALUES
   (
src.SwitchID
, src.AgentID
, src.SkillID
, src.SkillLevel
   )
WHEN NOT MATCHED BY SOURCE THEN DELETE;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_AreaCodes', N'c:\\ComputerTALKDB\\RAW', N'AreaCodes.dat', N'MERGE [dbo].[AreaCodes] AS tar
USING [dbo].[z_AreaCodes] AS src
ON tar.NPA = src.NPA and tar.NXX = src.NXX AND tar.OCN = src.OCN
WHEN MATCHED THEN
   UPDATE SET
   tar.NPA  =  src.NPA
, tar.NXX  =  src.NXX
, tar.OCN  =  src.OCN
, tar.Company  =  src.Company
, tar.Status  =  src.Status
, tar.RateCenter  =  src.RateCenter
, tar.Remarks  =  src.Remarks
, tar.Province  =  src.Province
, tar.Cell  =  src.Cell
, tar.Prefix  =  src.Prefix
WHEN NOT MATCHED THEN
   INSERT
   (
   NPA
, NXX
, OCN
, Company
, Status
, RateCenter
, Remarks
, Province
, Cell
, Prefix
   )
   VALUES
   (
   src.NPA
, src.NXX
, src.OCN
, src.Company
, src.Status
, src.RateCenter
, src.Remarks
, src.Province
, src.Cell
, src.Prefix
   )
WHEN NOT MATCHED BY SOURCE THEN DELETE;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_AudioMessage', N'c:\\ComputerTALKDB\\RAW', N'AudioMessage.dat', N'MERGE [dbo].[AudioMessage] AS tar
USING [dbo].[z_AudioMessage] AS src
ON tar.SwitchID = src.SwitchID and tar.MessageName = src.MessageName AND tar.BaseSubdir = src.BaseSubdir AND tar.SubAppID = src.SubAppID
WHEN MATCHED THEN
   UPDATE SET
   tar.SwitchID  =  src.SwitchID
, tar.MessageName  =  src.MessageName
, tar.Description  =  src.Description
, tar.MessageType  =  src.MessageType
, tar.Language  =  src.Language
, tar.Script  =  src.Script
, tar.BaseSubdir  =  src.BaseSubdir
, tar.VoiceModelName  =  src.VoiceModelName
, tar.ScriptStatus  =  src.ScriptStatus
, tar.Comment  =  src.Comment
, tar.SubAppID  =  src.SubAppID
WHEN NOT MATCHED THEN
   INSERT
   (
   SwitchID
, MessageName
, Description
, MessageType
, Language
, Script
, BaseSubdir
, VoiceModelName
, ScriptStatus
, Comment
, SubAppID
   )
   VALUES
   (
   src.SwitchID
, src.MessageName
, src.Description
, src.MessageType
, src.Language
, src.Script
, src.BaseSubdir
, src.VoiceModelName
, src.ScriptStatus
, src.Comment
, src.SubAppID
   )
WHEN NOT MATCHED BY SOURCE THEN DELETE;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Backlog_I', N'c:\\ComputerTALKDB\\RAW', N'Backlog_I.dat', N'MERGE [dbo].[Backlog_I] AS tar
USING [dbo].[z_Backlog_I] AS src
ON tar.SwitchID = src.SwitchID and tar.QueueID = src.QueueID AND tar.IntervalID = src.IntervalID  
WHEN MATCHED THEN
   UPDATE SET
 tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.QueueID  =  src.QueueID
, tar.IntervalID  =  src.IntervalID
, tar.AbandonedLessThanTargetASA  =  src.AbandonedLessThanTargetASA
, tar.Backlog  =  src.Backlog

WHEN NOT MATCHED THEN
   INSERT
   (
 StartDateTime
, SwitchID
, QueueID
, IntervalID
, AbandonedLessThanTargetASA
, Backlog

   )
   VALUES
   (
 src.StartDateTime
, src.SwitchID
, src.QueueID
, src.IntervalID
, src.AbandonedLessThanTargetASA
, src.Backlog

   )
WHEN NOT MATCHED BY SOURCE THEN DELETE;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_CallHistory', N'c:\\ComputerTALKDB\\RAW', N'CallHistory.dat', N'MERGE [dbo].[CallHistory] AS tar
USING [dbo].[z_CallHistory] AS src
ON tar.ID = src.ID
WHEN MATCHED THEN
   UPDATE SET
 tar.Prospect_ID  =  src.Prospect_ID
, tar.Campaign_ID  =  src.Campaign_ID
, tar.Agent_ID  =  src.Agent_ID
, tar.Session_Start_Timestamp  =  src.Session_Start_Timestamp
, tar.Session_Duration  =  src.Session_Duration
, tar.Call_Status  =  src.Call_Status
, tar.Session_Result  =  src.Session_Result
, tar.Comments  =  src.Comments
, tar.Talk_Time  =  src.Talk_Time
, tar.Session_Start_Time  =  src.Session_Start_Time
, tar.New_Campaign_ID  =  src.New_Campaign_ID
, tar.Dial_Outcome  =  src.Dial_Outcome

WHEN NOT MATCHED THEN
   INSERT
   (
 Prospect_ID
, Campaign_ID
, Agent_ID
, Session_Start_Timestamp
, Session_Duration
, Call_Status
, Session_Result
, Comments
, Talk_Time
, Session_Start_Time
, New_Campaign_ID
, Dial_Outcome
   )
   VALUES
   (
 src.Prospect_ID
, src.Campaign_ID
, src.Agent_ID
, src.Session_Start_Timestamp
, src.Session_Duration
, src.Call_Status
, src.Session_Result
, src.Comments
, src.Talk_Time
, src.Session_Start_Time
, src.New_Campaign_ID
, src.Dial_Outcome 
   )
WHEN NOT MATCHED BY SOURCE THEN DELETE;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_CallTimeRules', N'c:\\ComputerTALKDB\\RAW', N'CallTimeRules.dat', N'MERGE [dbo].[CallTimeRules] AS tar
USING [dbo].[z_CallTimeRules] AS src
ON tar.ID = src.ID
WHEN MATCHED THEN
   UPDATE SET
 
 tar.LocationID  =  src.LocationID
, tar.DayID  =  src.DayID
, tar.StartTime  =  src.StartTime
, tar.EndTime  =  src.EndTime
WHEN NOT MATCHED THEN
   INSERT
   (
 
 LocationID
, DayID
, StartTime
, EndTime
   )
   VALUES
   (
 
 src.LocationID
, src.DayID
, src.StartTime
, src.EndTime
   )
WHEN NOT MATCHED BY SOURCE THEN DELETE;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_CampaignCallTimeRuleMap', N'c:\\ComputerTALKDB\\RAW', N'CampaignCallTimeRuleMap.dat', N'MERGE [dbo].[CampaignCallTimeRuleMap] AS tar
USING [dbo].[z_CampaignCallTimeRuleMap] AS src
ON tar.ID = src.ID
WHEN MATCHED THEN
   UPDATE SET
   tar.RuleID  =  src.RuleID
, tar.CampaignID  =  src.CampaignID
WHEN NOT MATCHED THEN
   INSERT
   (
RuleID
, CampaignID
   )
   VALUES
   (
src.RuleID
, src.CampaignID
   )
WHEN NOT MATCHED BY SOURCE THEN DELETE;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_CampaignList', N'c:\\ComputerTALKDB\\RAW', N'CampaignList.dat', N'MERGE [dbo].[CampaignList] AS tar
USING [dbo].[z_CampaignList] AS src
ON tar.ID = src.ID
WHEN MATCHED THEN
   UPDATE SET
 tar.[Name]  =  src.[Name]
, tar.Form  =  src.Form
, tar.Busy_Retry_Time  =  src.Busy_Retry_Time
, tar.NoAnswer_Retry_Time  =  src.NoAnswer_Retry_Time
, tar.QueueID  =  src.QueueID
, tar.TargetGOS  =  src.TargetGOS
, tar.Initial_CallAttempts  =  src.Initial_CallAttempts
, tar.Initial_ConnectRate  =  src.Initial_ConnectRate
, tar.Mode  =  src.Mode
, tar.RouteDN  =  src.RouteDN
, tar.MessageName  =  src.MessageName
, tar.BaseSubdir  =  src.BaseSubdir
, tar.[Enable]  =  src.[Enable]
, tar.NoAnswerTimeout  =  src.NoAnswerTimeout
, tar.[Filter]  =  src.[Filter]
, tar.MaxDialRetries  =  src.MaxDialRetries
, tar.MaxDialRate  =  src.MaxDialRate
, tar.ApplyCallRules  =  src.ApplyCallRules
WHEN NOT MATCHED THEN
   INSERT
   (
[Name]
, [Form]
, Busy_Retry_Time
, NoAnswer_Retry_Time
, QueueID
, TargetGOS
, Initial_CallAttempts
, Initial_ConnectRate
, Mode
, RouteDN
, MessageName
, BaseSubdir
, [Enable]
, NoAnswerTimeout
, [Filter]
, MaxDialRetries
, MaxDialRate
, ApplyCallRules
   )
   VALUES
   (
src.[Name]
, src.[Form]
, src.Busy_Retry_Time
, src.NoAnswer_Retry_Time
, src.QueueID
, src.TargetGOS
, src.Initial_CallAttempts
, src.Initial_ConnectRate
, src.Mode
, src.RouteDN
, src.MessageName
, src.BaseSubdir
, src.[Enable]
, src.NoAnswerTimeout
, src.[Filter]
, src.MaxDialRetries
, src.MaxDialRate
, src.ApplyCallRules
   )
WHEN NOT MATCHED BY SOURCE THEN DELETE;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_CampaignLookup', N'c:\\ComputerTALKDB\\RAW', N'CampaignLookup.dat', N'MERGE [dbo].[CampaignLookup] AS tar
USING [dbo].[z_CampaignLookup] AS src
ON tar.ID = src.ID
WHEN MATCHED THEN
   UPDATE SET
tar.Campaign_ID  =  src.Campaign_ID
,tar.[Lookup]  =  src.[Lookup]

WHEN NOT MATCHED THEN
   INSERT
   (
 Campaign_ID
,[Lookup]
   )
   VALUES
   (
src.Campaign_ID
,src.[Lookup]
   )
WHEN NOT MATCHED BY SOURCE THEN DELETE;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_ClientVersionCompatibility', N'c:\\ComputerTALKDB\\RAW', N'ClientVersionCompatibility.dat', N'MERGE [dbo].[ClientVersionCompatibility] AS tar
USING [dbo].[z_ClientVersionCompatibility] AS src
ON tar.SwitchID = src.SwitchID  AND tar.ApplicationName = src.ApplicationName  AND tar.[Version] = src.[Version]
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.ApplicationName  =  src.ApplicationName
, tar.[Version]  =  src.[Version]

WHEN NOT MATCHED THEN
   INSERT
   (
SwitchID
, ApplicationName
, [Version]
   )
   VALUES
   (
src.SwitchID
, src.ApplicationName
, src.[Version]
   )
WHEN NOT MATCHED BY SOURCE THEN DELETE;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_ConfigCategory', N'c:\\ComputerTALKDB\\RAW', N'ConfigCategory.dat', N'MERGE [dbo].[ConfigCategory] AS tar
USING [dbo].[z_ConfigCategory] AS src
ON tar.SwitchID = src.SwitchID  AND tar.CategoryID = src.CategoryID  
WHEN MATCHED THEN
   UPDATE SET
 tar.SwitchID  =  src.SwitchID
, tar.CategoryID  =  src.CategoryID
, tar.CategoryName  =  src.CategoryName
WHEN NOT MATCHED THEN
   INSERT
   (
 SwitchID
, CategoryID
, CategoryName
   )
   VALUES
   (
 src.SwitchID
, src.CategoryID
, src.CategoryName
   )
WHEN NOT MATCHED BY SOURCE THEN DELETE;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_ConfigKey', N'c:\\ComputerTALKDB\\RAW', N'ConfigKey.dat', N'MERGE [dbo].[ConfigKey] AS tar
USING [dbo].[z_ConfigKey] AS src
ON tar.SwitchID = src.SwitchID  AND tar.CategoryID = src.CategoryID  AND  tar.KeyID = src.keyID
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.CategoryID  =  src.CategoryID
, tar.KeyID  =  src.KeyID
, tar.KeyName  =  src.KeyName
WHEN NOT MATCHED THEN
   INSERT
   (
SwitchID
, CategoryID
, KeyID
, KeyName
   )
   VALUES
   (
src.SwitchID
, src.CategoryID
, src.KeyID
, src.KeyName
   )
WHEN NOT MATCHED BY SOURCE THEN DELETE;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_ConfigLanguageStrings', N'c:\\ComputerTALKDB\\RAW', N'ConfigLanguageStrings.dat', N'MERGE [dbo].[ConfigLanguageStrings] AS tar
USING [dbo].[z_ConfigLanguageStrings] AS src
ON tar.LanguageCode = src.LanguageCode  AND tar.StringKey = src.StringKey 
WHEN MATCHED THEN
   UPDATE SET
tar.LanguageCode  =  src.LanguageCode
, tar.StringKey  =  src.StringKey
, tar.StringValue  =  src.StringValue
WHEN NOT MATCHED THEN
   INSERT
   (
LanguageCode
, StringKey
, StringValue
   )
   VALUES
   (
src.LanguageCode
, src.StringKey
, src.StringValue
   )
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_ConfigValue', N'c:\\ComputerTALKDB\\RAW', N'ConfigValue.dat', N'MERGE [dbo].[ConfigValue] AS tar
USING [dbo].[z_ConfigValue] AS src
ON tar.SwitchID = src.SwitchID  AND tar.CategoryID = src.CategoryID  AND  tar.KeyID = src.keyID AND tar.FieldID = src.FieldID
WHEN MATCHED THEN
   UPDATE SET
   tar.SwitchID  =  src.SwitchID
, tar.CategoryID  =  src.CategoryID
, tar.KeyID  =  src.KeyID
, tar.FieldID  =  src.FieldID
, tar.FieldName  =  src.FieldName
, tar.[Value]  =  src.[Value]
WHEN NOT MATCHED THEN
   INSERT
   (
   SwitchID
, CategoryID
, KeyID
, FieldID
, FieldName
, [Value]
   )
   VALUES
   (
   src.SwitchID
, src.CategoryID
, src.KeyID
, src.FieldID
, src.FieldName
, src.[Value]
   )
WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_ContactRemarks', N'c:\\ComputerTALKDB\\RAW', N'ContactRemarks.dat', N'MERGE [dbo].[ContactRemarks] AS tar
USING [dbo].[z_ContactRemarks] AS src
ON tar.ID = src.ID  AND tar.ContactID = src.ContactID  AND  tar.AgentID = src.AgentID AND tar.SwitchID = src.SwitchID
WHEN MATCHED THEN
   UPDATE SET
   tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.ContactID  =  src.ContactID
, tar.Note  =  src.Note
, tar.[Timestamp]  =  src.[Timestamp]
WHEN NOT MATCHED THEN
   INSERT
   (
   SwitchID
, [AgentID]
, [ContactID]
, [Note]
, [Timestamp]
   )
   VALUES
   (
   src.SwitchID
, src.AgentID
, src.ContactID
, src.Note
, src.[Timestamp]
   )
WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_DatastoreActions', N'c:\\ComputerTALKDB\\RAW', N'DatastoreActions.dat', N'MERGE [dbo].[DatastoreActions] AS tar
USING [dbo].[z_DatastoreActions] AS src
ON tar.ID = src.ID  
WHEN MATCHED THEN
   UPDATE SET
 tar.ReferenceActionId  =  src.ReferenceActionId
, tar.InitiatorId  =  src.InitiatorId
, tar.FileId  =  src.FileId
, tar.DatastoreId  =  src.DatastoreId
, tar.ToDatastore  =  src.ToDatastore
, tar.[Action]  =  src.[Action]
, tar.RequestedAtTime  =  src.RequestedAtTime
, tar.StartTime  =  src.StartTime
, tar.RetryCount  =  src.RetryCount
WHEN NOT MATCHED THEN
   INSERT
   (
 ReferenceActionId
, InitiatorId
, FileId
, DatastoreId
, ToDatastore
, [Action]
, RequestedAtTime
, StartTime
, RetryCount
   )
   VALUES
   (
 src.ReferenceActionId
, src.InitiatorId
, src.FileId
, src.DatastoreId
, src.ToDatastore
, src.[Action]
, src.RequestedAtTime
, src.StartTime
, src.RetryCount
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_DatastoreArchiveRules', N'c:\\ComputerTALKDB\\RAW', N'DatastoreArchiveRules.dat', N'MERGE [dbo].[DatastoreArchiveRules] AS tar
USING [dbo].[z_DatastoreArchiveRules] AS src
ON tar.Id = src.Id 
WHEN MATCHED THEN
   UPDATE SET
tar.[Name]  =  src.[Name]
, tar.FromStore  =  src.FromStore
, tar.ToStore  =  src.ToStore
, tar.Type  =  src.Type
, tar.Age  =  src.Age
, tar.Enabled  =  src.Enabled
WHEN NOT MATCHED THEN
   INSERT
   (
[Name]
, FromStore
, ToStore
, Type
, Age
, Enabled
   )
   VALUES
   (
src.Name
, src.FromStore
, src.ToStore
, src.Type
, src.Age
, src.Enabled
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');

INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_DatastoreDetails', N'c:\\ComputerTALKDB\\RAW', N'DatastoreDetails.dat', N'MERGE [dbo].[DatastoreDetails] AS tar
USING [dbo].[z_DatastoreDetails] AS src
ON tar.ID = src.ID  
WHEN MATCHED THEN
   UPDATE SET
tar.DatastoreId  =  src.DatastoreId
, tar.DetailId  =  src.DetailId
, tar.[Value]  =  src.[Value]

WHEN NOT MATCHED THEN
   INSERT
   (
DatastoreId
, DetailId
, [Value]

   )
   VALUES
   (
src.DatastoreId
, src.DetailId
, src.[Value]

   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_DatastoreFile', N'c:\\ComputerTALKDB\\RAW', N'DatastoreFile.dat', N'MERGE [dbo].[DatastoreFile] AS tar
USING [dbo].[z_DatastoreFile] AS src
ON tar.ID = src.ID  
WHEN MATCHED THEN
   UPDATE SET
tar.[Type]  =  src.[Type]
, tar.Size  =  src.Size
, tar.CreationDatetime  =  src.CreationDatetime
, tar.[FileName]  =  src.[FileName]
, tar.IsDeletePending  =  src.IsDeletePending
WHEN NOT MATCHED THEN
   INSERT
   (
[Type]
, Size
, CreationDatetime
, [FileName]
, IsDeletePending
   )
   VALUES
   (
src.[Type]
, src.Size
, src.CreationDatetime
, src.[FileName]
, src.IsDeletePending
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_DatastoreFileDetails', N'c:\\ComputerTALKDB\\RAW', N'DatastoreFileDetails.dat', N'MERGE [dbo].[DatastoreFileDetails] AS tar
USING [dbo].[z_DatastoreFileDetails] AS src
ON tar.FileId = src.FileId  AND tar.StoreId = src.StoreId
WHEN MATCHED THEN
   UPDATE SET
tar.FileId  =  src.FileId
, tar.StoreId  =  src.StoreId
, tar.[Data]  =  src.[Data]
, tar.TempCreateTime  =  src.TempCreateTime
, tar.isComplete  =  src.isComplete
, tar.IsDeletePending  =  src.IsDeletePending
WHEN NOT MATCHED THEN
   INSERT
   (
FileId
, StoreId
, [Data]
, TempCreateTime
, isComplete
, IsDeletePending
   )
   VALUES
   (
src.FileId
, src.StoreId
, src.[Data]
, src.TempCreateTime
, src.isComplete
, src.IsDeletePending
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_DatastorePurgeRules', N'c:\\ComputerTALKDB\\RAW', N'DatastorePurgeRules.dat', N'MERGE [dbo].[DatastorePurgeRules] AS tar
USING [dbo].[z_DatastorePurgeRules] AS src
ON tar.Id = src.Id 
WHEN MATCHED THEN
   UPDATE SET
tar.PurgingEnabled  =  src.PurgingEnabled
, tar.OnlyPurgeAudioRecordingsWithNoFile  =  src.OnlyPurgeAudioRecordingsWithNoFile
, tar.PurgeAudioRecordingsOlderThan  =  src.PurgeAudioRecordingsOlderThan
, tar.PurgeIMRecordingsOlderThan  =  src.PurgeIMRecordingsOlderThan
, tar.PurgeEvaluationsOlderThan  =  src.PurgeEvaluationsOlderThan
, tar.PurgeLegacyAfterConversion  =  src.PurgeLegacyAfterConversion
, tar.PurgeLegacyWaitDaysBeforePurging  =  src.PurgeLegacyWaitDaysBeforePurging
, tar.OnlyPurgeScreenRecordingsWithNoFile  =  src.OnlyPurgeScreenRecordingsWithNoFile
, tar.PurgeScreenRecordingsOlderThan  =  src.PurgeScreenRecordingsOlderThan
WHEN NOT MATCHED THEN
   INSERT
   (
PurgingEnabled
, OnlyPurgeAudioRecordingsWithNoFile
, PurgeAudioRecordingsOlderThan
, PurgeIMRecordingsOlderThan
, PurgeEvaluationsOlderThan
, PurgeLegacyAfterConversion
, PurgeLegacyWaitDaysBeforePurging
, OnlyPurgeScreenRecordingsWithNoFile
, PurgeScreenRecordingsOlderThan
   )
   VALUES
   (
src.PurgingEnabled
, src.OnlyPurgeAudioRecordingsWithNoFile
, src.PurgeAudioRecordingsOlderThan
, src.PurgeIMRecordingsOlderThan
, src.PurgeEvaluationsOlderThan
, src.PurgeLegacyAfterConversion
, src.PurgeLegacyWaitDaysBeforePurging
, src.OnlyPurgeScreenRecordingsWithNoFile
, src.PurgeScreenRecordingsOlderThan
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Datastores', N'c:\\ComputerTALKDB\\RAW', N'Datastores.dat', N'MERGE [dbo].[Datastores] AS tar
USING [dbo].[z_Datastores] AS src
ON tar.Id = src.Id 
WHEN MATCHED THEN
   UPDATE SET
tar.[Name]  =  src.[Name]
, tar.[Type]  =  src.[Type]
, tar.IsOnline  =  src.IsOnline
, tar.IsDeletePending  =  src.IsDeletePending
WHEN NOT MATCHED THEN
   INSERT
   (
   [Name]
, [Type]
, IsOnline
, IsDeletePending
   )
   VALUES
   (
   src.[Name]
, src.[Type]
, src.IsOnline
, src.IsDeletePending
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_DispositionNames', N'c:\\ComputerTALKDB\\RAW', N'DispositionNames.dat', N'MERGE [dbo].[DispositionNames] AS tar
USING [dbo].[z_DispositionNames] AS src
ON tar.DispositionCode = src.DispositionCode  AND tar.CampaignID = src.CampaignID
WHEN MATCHED THEN
   UPDATE SET
tar.DispositionCode  =  src.DispositionCode
, tar.DispositionName  =  src.DispositionName
, tar.CampaignID  =  src.CampaignID
, tar.DispositionAction  =  src.DispositionAction
WHEN NOT MATCHED THEN
   INSERT
   (
DispositionCode
, DispositionName
, CampaignID
, DispositionAction
   )
   VALUES
   (
src.DispositionCode
, src.DispositionName
, src.CampaignID
, src.DispositionAction
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Dnis', N'c:\\ComputerTALKDB\\RAW', N'Dnis.dat', N'MERGE [dbo].[Dnis] AS tar
USING [dbo].[z_Dnis] AS src
ON tar.SwitchID = src.SwitchID  AND tar.Dnis = src.Dnis
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.Dnis  =  src.Dnis
, tar.DnisName  =  src.DnisName
, tar.DnisGroupID  =  src.DnisGroupID
, tar.MinChannels  =  src.MinChannels
, tar.MaxChannels  =  src.MaxChannels
, tar.ContactGroupID  =  src.ContactGroupID
WHEN NOT MATCHED THEN
   INSERT
   (
SwitchID
, Dnis
, DnisName
, DnisGroupID
, MinChannels
, MaxChannels
, ContactGroupID
   )
   VALUES
   (
src.SwitchID
, src.Dnis
, src.DnisName
, src.DnisGroupID
, src.MinChannels
, src.MaxChannels
, src.ContactGroupID
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_DnisGroup', N'c:\\ComputerTALKDB\\RAW', N'DnisGroup.dat', N'MERGE [dbo].[DnisGroup] AS tar
USING [dbo].[z_DnisGroup] AS src
ON tar.SwitchID = src.SwitchID  AND tar.DnisGroupID = src.DnisGroupID
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.DnisGroupID  =  src.DnisGroupID
, tar.DnisGroupName  =  src.DnisGroupName
, tar.MinChannels  =  src.MinChannels
, tar.MaxChannels  =  src.MaxChannels
WHEN NOT MATCHED THEN
   INSERT
   (
SwitchID
, DnisGroupID
, DnisGroupName
, MinChannels
, MaxChannels
   )
   VALUES
   (
src.SwitchID
, src.DnisGroupID
, src.DnisGroupName
, src.MinChannels
, src.MaxChannels
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Email', N'c:\\ComputerTALKDB\\RAW', N'Email.dat', N'MERGE [dbo].[Email] AS tar
USING [dbo].[z_Email] AS src
ON tar.SwitchID = src.SwitchID  AND tar.EmailAddress = src.EmailAddress
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.EmailAddress  =  src.EmailAddress
, tar.EmailGroupID  =  src.EmailGroupID
, tar.LanguageCode  =  src.LanguageCode
WHEN NOT MATCHED THEN
   INSERT
   (
SwitchID
, EmailAddress
, EmailGroupID
, LanguageCode
   )
   VALUES
   (
src.SwitchID
, src.EmailAddress
, src.EmailGroupID
, src.LanguageCode
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_EmailGroup', N'c:\\ComputerTALKDB\\RAW', N'EmailGroup.dat', N'MERGE [dbo].[EmailGroup] AS tar
USING [dbo].[z_EmailGroup] AS src
ON tar.SwitchID = src.SwitchID  AND tar.EmailGroupID = src.EmailGroupID
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.EmailGroupID  =  src.EmailGroupID
, tar.EmailGroupName  =  src.EmailGroupName
, tar.UnroutedEmailAddress  =  src.UnroutedEmailAddress
, tar.NumThreads  =  src.NumThreads
, tar.StartingWfID  =  src.StartingWfID
, tar.StartingPageID  =  src.StartingPageID
, tar.StartingActionID  =  src.StartingActionID
WHEN NOT MATCHED THEN
   INSERT
   (
SwitchID
, EmailGroupID
, EmailGroupName
, UnroutedEmailAddress
, NumThreads
, StartingWfID
, StartingPageID
, StartingActionID
   )
   VALUES
   (
src.SwitchID
, src.EmailGroupID
, src.EmailGroupName
, src.UnroutedEmailAddress
, src.NumThreads
, src.StartingWfID
, src.StartingPageID
, src.StartingActionID
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Eval_Contact', N'c:\\ComputerTALKDB\\RAW', N'Eval_Contact.dat', N'MERGE [dbo].[Eval_Contact] AS tar
USING [dbo].[z_Eval_Contact] AS src
ON tar.ContactId = src.ContactId  AND tar.EvalId = src.EvalId
WHEN MATCHED THEN
   UPDATE SET
tar.ContactId  =  src.ContactId
, tar.EvalId  =  src.EvalId
, tar.EvaluatorId  =  src.EvaluatorId
WHEN NOT MATCHED THEN
   INSERT
   (
ContactId
, EvalId
, EvaluatorId
   )
   VALUES
   (
src.ContactId
, src.EvalId
, src.EvaluatorId
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_EvalCategory', N'c:\\ComputerTALKDB\\RAW', N'EvalCategory.dat', N'MERGE [dbo].[EvalCategory] AS tar
USING [dbo].[z_EvalCategory] AS src
ON tar.Id = src.Id  
WHEN MATCHED THEN
   UPDATE SET
tar.FormId  =  src.FormId
, tar.NameStringId  =  src.NameStringId
, tar.[Order]  =  src.[Order]
WHEN NOT MATCHED THEN
   INSERT
   (
FormId
, NameStringId
, [Order]
   )
   VALUES
   (
src.FormId
, src.NameStringId
, src.[Order]
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_EvalCriteria', N'c:\\ComputerTALKDB\\RAW', N'EvalCriteria.dat', N'MERGE [dbo].[EvalCriteria] AS tar
USING [dbo].[z_EvalCriteria] AS src
ON tar.Id = src.Id  
WHEN MATCHED THEN
   UPDATE SET
tar.CategoryId  =  src.CategoryId
, tar.NameStringId  =  src.NameStringId
, tar.isOptional  =  src.isOptional
, tar.MinScore  =  src.MinScore
, tar.MaxScore  =  src.MaxScore
, tar.NumScoreIncrements  =  src.NumScoreIncrements
, tar.[Type]  =  src.[Type]
, tar.[Order]  =  src.[Order]
WHEN NOT MATCHED THEN
   INSERT
   (
CategoryId
, NameStringId
, isOptional
, MinScore
, MaxScore
, NumScoreIncrements
, [Type]
, [Order]
   )
   VALUES
   (
src.CategoryId
, src.NameStringId
, src.isOptional
, src.MinScore
, src.MaxScore
, src.NumScoreIncrements
, src.[Type]
, src.[Order]
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_EvalCriteriaValue', N'c:\\ComputerTALKDB\\RAW', N'EvalCriteriaValue.dat', N'MERGE [dbo].[EvalCriteriaValue] AS tar
USING [dbo].[z_EvalCriteriaValue] AS src
ON tar.Id = src.Id  
WHEN MATCHED THEN
   UPDATE SET
tar.CriteriaId  =  src.CriteriaId
, tar.[Value]  =  src.[Value]
, tar.NameStringId  =  src.NameStringId
WHEN NOT MATCHED THEN
   INSERT
   (
CriteriaId
, [Value]
, NameStringId

   )
   VALUES
   (
src.CriteriaId
, src.[Value]
, src.NameStringId
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_EvalEvaluation', N'c:\\ComputerTALKDB\\RAW', N'EvalEvaluation.dat', N'MERGE [dbo].[EvalEvaluation] AS tar
USING [dbo].[z_EvalEvaluation] AS src
ON tar.Id = src.Id  
WHEN MATCHED THEN
   UPDATE SET
tar.FormId  =  src.FormId
, tar.EvaluationsStartDateTime  =  src.EvaluationsStartDateTime
, tar.EvaluationsEndDateTime  =  src.EvaluationsEndDateTime
, tar.[Status]  =  src.[Status]
WHEN NOT MATCHED THEN
   INSERT
   (
FormId
, EvaluationsStartDateTime
, EvaluationsEndDateTime
, [Status]

   )
   VALUES
   (
src.FormId
, src.EvaluationsStartDateTime
, src.EvaluationsEndDateTime
, src.[Status]
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_EvalForm', N'c:\\ComputerTALKDB\\RAW', N'EvalForm.dat', N'MERGE [dbo].[EvalForm] AS tar
USING [dbo].[z_EvalForm] AS src
ON tar.Id = src.Id  
WHEN MATCHED THEN
   UPDATE SET
tar.NameStringId  =  src.NameStringId
, tar.CreationTime  =  src.CreationTime
, tar.DeactivationTime  =  src.DeactivationTime
, tar.AncestorFormId  =  src.AncestorFormId
, tar.LastUpdatedTime  =  src.LastUpdatedTime
WHEN NOT MATCHED THEN
   INSERT
   (
NameStringId
, CreationTime
, DeactivationTime
, AncestorFormId
, LastUpdatedTime
   )
   VALUES
   (
src.NameStringId
, src.CreationTime
, src.DeactivationTime
, src.AncestorFormId
, src.LastUpdatedTime
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_EvalLangString', N'c:\\ComputerTALKDB\\RAW', N'EvalLangString.dat', N'MERGE [dbo].[EvalLangString] AS tar
USING [dbo].[z_EvalLangString] AS src
ON tar.Id = src.Id  AND tar.lang = src.lang
WHEN MATCHED THEN
   UPDATE SET
tar.Id  =  src.Id
, tar.lang  =  src.lang
, tar.[value]  =  src.[value]
WHEN NOT MATCHED THEN
   INSERT
   (
Id
, [lang]
, [value]
   )
   VALUES
   (
src.Id
, src.[lang]
, src.[value]
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_EvalLangStringIds', N'c:\\ComputerTALKDB\\RAW', N'EvalLangStringIds.dat', N'');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_EvalScore', N'c:\\ComputerTALKDB\\RAW', N'EvalScore.dat', N'MERGE [dbo].[EvalScore] AS tar
USING [dbo].[z_EvalScore] AS src
ON tar.Id = src.Id  
WHEN MATCHED THEN
   UPDATE SET
tar.EvalId  =  src.EvalId
, tar.CategoryId  =  src.CategoryId
, tar.CriteriaId  =  src.CriteriaId
, tar.Score  =  src.Score
, tar.MaxScore  =  src.MaxScore
, tar.Comment  =  src.Comment
WHEN NOT MATCHED THEN
   INSERT
   (
EvalId
, CategoryId
, CriteriaId
, Score
, MaxScore
, Comment
   )
   VALUES
   (
src.EvalId
, src.CategoryId
, src.CriteriaId
, src.Score
, src.MaxScore
, src.Comment
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Fields', N'c:\\ComputerTALKDB\\RAW', N'Fields.dat', N'MERGE [dbo].[Fields] AS tar
USING [dbo].[z_Fields] AS src
ON tar.Id = src.Id  
WHEN MATCHED THEN
   UPDATE SET
tar.ID  =  src.ID
, tar.[Name]  =  src.[Name]

WHEN NOT MATCHED THEN
   INSERT
   (
ID
, [Name]

   )
   VALUES
   (
src.ID
,src.[Name]

   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Holiday', N'c:\\ComputerTALKDB\\RAW', N'Holiday.dat', N'MERGE [dbo].[Holiday] AS tar
USING [dbo].[z_Holiday] AS src
ON tar.SwitchID = src.SwitchID  AND  tar.[Month] = src.[Month]  AND  tar.[Day] = src.[Day]
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.[Month]  =  src.[Month]
, tar.[Day]  =  src.[Day]
WHEN NOT MATCHED THEN
   INSERT
   (
SwitchID
, [Month]
, [Day]
   )
   VALUES
   (
src.SwitchID
, src.[Month]
, src.[Day]
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_HolidayLocationMap', N'c:\\ComputerTALKDB\\RAW', N'HolidayLocationMap.dat', N'MERGE [dbo].[HolidayLocationMap] AS tar
USING [dbo].[z_HolidayLocationMap] AS src
ON tar.ID = src.ID   
WHEN MATCHED THEN
   UPDATE SET
tar.HolidayID  =  src.HolidayID
, tar.LocationID  =  src.LocationID
, tar.Observed  =  src.Observed
WHEN NOT MATCHED THEN
   INSERT
   (
HolidayID
, LocationID
, Observed
   )
   VALUES
   (
src.HolidayID
, src.LocationID
, src.Observed
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Holidays', N'c:\\ComputerTALKDB\\RAW', N'Holidays.dat', N'MERGE [dbo].[Holidays] AS tar
USING [dbo].[z_Holidays] AS src
ON tar.ID = src.ID   
WHEN MATCHED THEN
   UPDATE SET
tar.[Name]  =  src.[Name]
, tar.[Date]  =  src.[Date]
WHEN NOT MATCHED THEN
   INSERT
   (
[Name]
, [Date]
   )
   VALUES
   (
src.[Name]
, src.[Date]
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_iceWebSettings_AlertHistory', N'c:\\ComputerTALKDB\\RAW', N'iceWebSettings_AlertHistory.dat', N'MERGE [dbo].[iceWebSettings_AlertHistory] AS tar
USING [dbo].[z_iceWebSettings_AlertHistory] AS src
ON tar.ID = src.ID   
WHEN MATCHED THEN
   UPDATE SET
tar.switchID  =  src.switchID
, tar.agentID  =  src.agentID
, tar.message  =  src.message
, tar.targetID  =  src.targetID
, tar.alertTime  =  src.alertTime
, tar.alertID  =  src.alertID
WHEN NOT MATCHED THEN
   INSERT
   (
switchID
, agentID
, message
, targetID
, alertTime
, alertID
   )
   VALUES
   (
src.switchID
, src.agentID
, src.message
, src.targetID
, src.alertTime
, src.alertID
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_iceWebSettings_Alerts', N'c:\\ComputerTALKDB\\RAW', N'iceWebSettings_Alerts.dat', N'MERGE [dbo].[iceWebSettings_Alerts] AS tar
USING [dbo].[z_iceWebSettings_Alerts] AS src
ON tar.alertID = src.alertID   
WHEN MATCHED THEN
   UPDATE SET
tar.switchID  =  src.switchID
, tar.agentID  =  src.agentID
, tar.lastFireTime  =  src.lastFireTime
, tar.minimumAlertTimeInSeconds  =  src.minimumAlertTimeInSeconds
, tar.alertXML  =  src.alertXML
WHEN NOT MATCHED THEN
   INSERT
   (
switchID
, agentID
, lastFireTime
, minimumAlertTimeInSeconds
, alertXML
   )
   VALUES
   (
src.switchID
, src.agentID
, src.lastFireTime
, src.minimumAlertTimeInSeconds
, src.alertXML
   )
--WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_iceWebSettings_HiddenItems', N'c:\\ComputerTALKDB\\RAW', N'iceWebSettings_HiddenItems.dat', N'MERGE [dbo].[iceWebSettings_HiddenItems] AS tar
USING [dbo].[z_iceWebSettings_HiddenItems] AS src
ON tar.recordID = src.recordID 
WHEN MATCHED THEN
   UPDATE SET
tar.switchID  =  src.switchID
, tar.agentID  =  src.agentID
, tar.itemType  =  src.itemType
, tar.itemID  =  src.itemID

WHEN NOT MATCHED THEN
   INSERT
   (
switchID
, agentID
, itemType
, itemID
   )
   VALUES
   (
src.switchID
, src.agentID
, src.itemType
, src.itemID
   )
WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_iceWebSettings_NameValuePairs', N'c:\\ComputerTALKDB\\RAW', N'iceWebSettings_NameValuePairs.dat', N'MERGE [dbo].[iceWebSettings_NameValuePairs] AS tar
USING [dbo].[z_iceWebSettings_NameValuePairs] AS src
ON tar.recordID = src.recordID 
WHEN MATCHED THEN
   UPDATE SET
   tar.switchID  =  src.switchID
, tar.agentID  =  src.agentID
, tar.[name]  =  src.[name]
, tar.[value]  =  src.[value]
WHEN NOT MATCHED THEN
   INSERT
   (
   switchID
, agentID
, [name]
, [value]

   )
   VALUES
   (
   src.switchID
, src.agentID
, src.[name]
, src.[value]
   )
WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_iceWebSettings_StatFormats', N'c:\\ComputerTALKDB\\RAW', N'iceWebSettings_StatFormats.dat', N'MERGE [dbo].[iceWebSettings_StatFormats] AS tar
USING [dbo].[z_iceWebSettings_StatFormats] AS src
ON tar.formatID = src.formatID 
WHEN MATCHED THEN
   UPDATE SET
tar.switchID  =  src.switchID
, tar.agentID  =  src.agentID
, tar.statType  =  src.statType
, tar.statName  =  src.statName
, tar.formatXML  =  src.formatXML
WHEN NOT MATCHED THEN
   INSERT
   (
switchID
, agentID
, statType
, statName
, formatXML
   )
   VALUES
   (
src.switchID
, src.agentID
, src.statType
, src.statName
, src.formatXML
   )
WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_IMAddress', N'c:\\ComputerTALKDB\\RAW', N'IMAddress.dat', N'MERGE [dbo].[IMAddress] AS tar
USING [dbo].[z_IMAddress] AS src
ON tar.SwitchID = src.SwitchID   AND  tar.IMAddress = src.IMAddress
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.IMAddress  =  src.IMAddress
, tar.IMGroupID  =  src.IMGroupID
WHEN NOT MATCHED THEN
   INSERT
   (
SwitchID
, IMAddress
, IMGroupID

   )
   VALUES
   (
src.SwitchID
, src.IMAddress
, src.IMGroupID
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_IMGroup', N'c:\\ComputerTALKDB\\RAW', N'IMGroup.dat', N'MERGE [dbo].[IMGroup] AS tar
USING [dbo].[z_IMGroup] AS src
ON tar.SwitchID = src.SwitchID   AND  tar.IMGroupID = src.IMGroupID
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.IMGroupID  =  src.IMGroupID
, tar.IMGroupName  =  src.IMGroupName
, tar.IMServerType  =  src.IMServerType
, tar.IMServerAddress  =  src.IMServerAddress
, tar.StartingWfID  =  src.StartingWfID
, tar.StartingPageID  =  src.StartingPageID
, tar.StartingActionID  =  src.StartingActionID
WHEN NOT MATCHED THEN
   INSERT
   (
SwitchID
, IMGroupID
, IMGroupName
, IMServerType
, IMServerAddress
, StartingWfID
, StartingPageID
, StartingActionID
   )
   VALUES
   (
src.SwitchID
, src.IMGroupID
, src.IMGroupName
, src.IMServerType
, src.IMServerAddress
, src.StartingWfID
, src.StartingPageID
, src.StartingActionID
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_IMRecording', N'c:\\ComputerTALKDB\\RAW', N'IMRecording.dat', N'MERGE [dbo].[IMRecording] AS tar
USING [dbo].[z_IMRecording] AS src
ON tar.ContactID = src.ContactID  AND  tar.[TimeStamp]  = src.[TimeStamp]  AND tar.[Sequence]  =  src.[Sequence] 
WHEN MATCHED THEN
   UPDATE SET
   tar.ContactID  =  src.ContactID
, tar.Sender  =  src.Sender
, tar.DisplayName  =  src.DisplayName
, tar.[TimeStamp]  =  src.[TimeStamp]
, tar.[Sequence]  =  src.[Sequence]
, tar.[Message]  =  src.[Message]
, tar.IsHTML  =  src.IsHTML
, tar.MessageType  =  src.MessageType
WHEN NOT MATCHED THEN
   INSERT
   (
ContactID
, Sender
, DisplayName
, [TimeStamp]
, [Sequence]
, [Message]
, IsHTML
, MessageType
   )
   VALUES
   (
   src.ContactID
,src.Sender
, src.DisplayName
, src.[TimeStamp]
, src.[Sequence]
, src.[Message]
, src.IsHTML
, src.MessageType
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Languages', N'c:\\ComputerTALKDB\\RAW', N'Languages.dat', N'MERGE [dbo].[Languages] AS tar
USING [dbo].[z_Languages] AS src
ON tar.Code = src.Code  
WHEN MATCHED THEN
   UPDATE SET
tar.Code  =  src.Code
,tar.[Order]  =  src.[Order]
WHEN NOT MATCHED THEN
   INSERT
   (
   Code
,[Order]

   )
   VALUES
   (
src.Code
,src.[Order]
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_LOBName', N'c:\\ComputerTALKDB\\RAW', N'LOBName.dat', N'MERGE [dbo].[LOBName] AS tar
USING [dbo].[z_LOBName] AS src
ON tar.SwitchID = src.SwitchID  AND tar.LOBCode  =  src.LOBCode
WHEN MATCHED THEN
   UPDATE SET
   tar.SwitchID  =  src.SwitchID
, tar.LOBCode  =  src.LOBCode
, tar.LOBName  =  src.LOBName
WHEN NOT MATCHED THEN
   INSERT
   (
SwitchID
, LOBCode
, LOBName
   )
   VALUES
   (
   src.SwitchID
, src.LOBCode
, src.LOBName
   )
 WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Locations', N'c:\\ComputerTALKDB\\RAW', N'Locations.dat', N'MERGE [dbo].[Locations] AS tar
USING [dbo].[z_Locations] AS src
ON tar.ID = src.ID    
WHEN MATCHED THEN
   UPDATE SET
tar.Province  =  src.Province
, tar.Country  =  src.Country

WHEN NOT MATCHED THEN
   INSERT
   (
Province
, Country

   )
   VALUES
   (
src.Province
, src.Country

   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Lock', N'c:\\ComputerTALKDB\\RAW', N'Lock.dat', N'MERGE [dbo].[Lock] AS tar
USING [dbo].[z_Lock] AS src
ON tar.SwitchID = src.SwitchID    AND  tar.AgentID =src.AgentID
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.AgentName  =  src.AgentName
, tar.DateTime  =  src.DateTime
, tar.LockKey  =  src.LockKey
, tar.LockType  =  src.LockType
WHEN NOT MATCHED THEN
   INSERT
   (
SwitchID
, AgentID
, AgentName
, DateTime
, LockKey
, LockType
   )
   VALUES
   (
src.SwitchID
, src.AgentID
, src.AgentName
, src.DateTime
, src.LockKey
, src.LockType
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_MergeRecordings', N'c:\\ComputerTALKDB\\RAW', N'MergeRecordings.dat', N'MERGE [dbo].[MergeRecordings] AS tar
USING [dbo].[z_MergeRecordings] AS src
ON tar.SessionID = src.SessionID   
WHEN MATCHED THEN
   UPDATE SET
tar.SessionID  =  src.SessionID
, tar.NumOfRecordings  =  src.NumOfRecordings
, tar.CreateTime  =  src.CreateTime
, tar.MergePending  =  src.MergePending
, tar.MergeStartTime  =  src.MergeStartTime
, tar.ContactID  =  src.ContactID
, tar.AddressID  =  src.AddressID
, tar.AgentID  =  src.AgentID
, tar.QueueID  =  src.QueueID
, tar.InitiatorID  =  src.InitiatorID
, tar.DialedNumber  =  src.DialedNumber
, tar.CallerNumber  =  src.CallerNumber
, tar.CallerName  =  src.CallerName
, tar.RecordingTrigger  =  src.RecordingTrigger
, tar.RecordingStatus  =  src.RecordingStatus
, tar.ErrorCode  =  src.ErrorCode
, tar.UserData  =  src.UserData
, tar.ProxyHostWorkStationID  =  src.ProxyHostWorkStationID
, tar.ProxyHostName  =  src.ProxyHostName
, tar.ProxyHostLoggedOnUser  =  src.ProxyHostLoggedOnUser

WHEN NOT MATCHED THEN
   INSERT
   (
SessionID
, NumOfRecordings
, CreateTime
, MergePending
, MergeStartTime
, ContactID
, AddressID
, AgentID
, QueueID
, InitiatorID
, DialedNumber
, CallerNumber
, CallerName
, RecordingTrigger
, RecordingStatus
, ErrorCode
, UserData
, ProxyHostWorkStationID
, ProxyHostName
, ProxyHostLoggedOnUser
   )
   VALUES
   (
src.SessionID
, src.NumOfRecordings
, src.CreateTime
, src.MergePending
, src.MergeStartTime
, src.ContactID
, src.AddressID
, src.AgentID
, src.QueueID
, src.InitiatorID
, src.DialedNumber
, src.CallerNumber
, src.CallerName
, src.RecordingTrigger
, src.RecordingStatus
, src.ErrorCode
, src.UserData
, src.ProxyHostWorkStationID
, src.ProxyHostName
, src.ProxyHostLoggedOnUser
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_MergeRecordingsFileInfo', N'c:\\ComputerTALKDB\\RAW', N'MergeRecordingsFileInfo.dat', N'MERGE [dbo].[MergeRecordingsFileInfo] AS tar
USING [dbo].[z_MergeRecordingsFileInfo] AS src
ON tar.PKCol = src.PKCol 
WHEN MATCHED THEN
   UPDATE SET
tar.PKCol  =  src.PKCol
, tar.CreateTime  =  src.CreateTime
, tar.RecordingType  =  src.RecordingType
, tar.FileName  =  src.FileName
, tar.StartDateTime  =  src.StartDateTime
, tar.Duration  =  src.Duration
, tar.SessionID  =  src.SessionID
WHEN NOT MATCHED THEN
   INSERT
   (
PKCol
, CreateTime
, RecordingType
, FileName
, StartDateTime
, Duration
, SessionID
   )
   VALUES
   (
src.PKCol
, src.CreateTime
, src.RecordingType
, src.FileName
, src.StartDateTime
, src.Duration
, src.SessionID
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Node', N'c:\\ComputerTALKDB\\RAW', N'Node.dat', N'MERGE [dbo].[Node] AS tar
USING [dbo].[z_Node] AS src
ON tar.SiteID = src.SiteID   AND tar.NodeID = src.NodeID
WHEN MATCHED THEN
   UPDATE SET
tar.SiteID  =  src.SiteID
, tar.NodeID  =  src.NodeID
, tar.NodeName  =  src.NodeName
, tar.ServerName  =  src.ServerName
WHEN NOT MATCHED THEN
   INSERT
   (
SiteID
, NodeID
, NodeName
, ServerName
   )
   VALUES
   (
src.SiteID
, src.NodeID
, src.NodeName
, src.ServerName
   )
 WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_NotReadyReasonName', N'c:\\ComputerTALKDB\\RAW', N'NotReadyReasonName.dat', N'MERGE [dbo].[NotReadyReasonName] AS tar
USING [dbo].[z_NotReadyReasonName] AS src
ON tar.SwitchID = src.SwitchID   AND tar.NotReadyReasonCode = src.NotReadyReasonCode
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.NotReadyReasonCode  =  src.NotReadyReasonCode
, tar.NotReadyReasonName  =  src.NotReadyReasonName

WHEN NOT MATCHED THEN
   INSERT
   (
SwitchID
, NotReadyReasonCode
, NotReadyReasonName

   )
   VALUES
   (
src.SwitchID
, src.NotReadyReasonCode
, src.NotReadyReasonName

   )
 WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_OperatingDates', N'c:\\ComputerTALKDB\\RAW', N'OperatingDates.dat', N'MERGE [dbo].[OperatingDates] AS tar
USING [dbo].[z_OperatingDates] AS src
ON tar.SwitchID = src.SwitchID   AND tar.[Type] = src.[Type]  AND tar.ID   =  src.ID   AND  tar.[DayOfWeek]   = src.[DayOfWeek]
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.[Type]  =  src.[Type]
, tar.ID  =  src.ID
, tar.[DayOfWeek]  =  src.[DayOfWeek]
, tar.StartTime  =  src.StartTime
, tar.EndTime  =  src.EndTime
WHEN NOT MATCHED THEN
   INSERT
   (
SwitchID
, [Type]
, ID
, [DayOfWeek]
, StartTime
, EndTime
   )
   VALUES
   (
src.SwitchID
, src.[Type]
, src.ID
, src.[DayOfWeek]
, src.StartTime
, src.EndTime
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_ProspectList', N'c:\\ComputerTALKDB\\RAW', N'ProspectList.dat', N'MERGE [dbo].[ProspectList] AS tar
USING [dbo].[z_ProspectList] AS src
ON tar.ID = src.ID    
WHEN MATCHED THEN
   UPDATE SET
tar.First_Name  =  src.First_Name
, tar.Last_Name  =  src.Last_Name
, tar.Telephone_Number  =  src.Telephone_Number
, tar.Salutation  =  src.Salutation
, tar.Address  =  src.Address
, tar.Field1  =  src.Field1
, tar.Field2  =  src.Field2
, tar.Field3  =  src.Field3
, tar.Field4  =  src.Field4
, tar.Field5  =  src.Field5
, tar.Field6  =  src.Field6
, tar.Field7  =  src.Field7
, tar.Field8  =  src.Field8
, tar.Field9  =  src.Field9
, tar.Field10  =  src.Field10
, tar.Field11  =  src.Field11
, tar.Field12  =  src.Field12
, tar.Field13  =  src.Field13
, tar.Field14  =  src.Field14
, tar.Field15  =  src.Field15
, tar.Field16  =  src.Field16
, tar.Field17  =  src.Field17
, tar.Field18  =  src.Field18
, tar.Field19  =  src.Field19
, tar.Field20  =  src.Field20
, tar.Telephone_Numeric  =  src.Telephone_Numeric
, tar.Province  =  src.Province
, tar.Country  =  src.Country
WHEN NOT MATCHED THEN
   INSERT
   (
First_Name
, Last_Name
, Telephone_Number
, Salutation
, Address
, Field1
, Field2
, Field3
, Field4
, Field5
, Field6
, Field7
, Field8
, Field9
, Field10
, Field11
, Field12
, Field13
, Field14
, Field15
, Field16
, Field17
, Field18
, Field19
, Field20
, Telephone_Numeric
, Province
, Country
   )
   VALUES
   (
src.First_Name
, src.Last_Name
, src.Telephone_Number
, src.Salutation
, src.Address
, src.Field1
, src.Field2
, src.Field3
, src.Field4
, src.Field5
, src.Field6
, src.Field7
, src.Field8
, src.Field9
, src.Field10
, src.Field11
, src.Field12
, src.Field13
, src.Field14
, src.Field15
, src.Field16
, src.Field17
, src.Field18
, src.Field19
, src.Field20
, src.Telephone_Numeric
, src.Province
, src.Country
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_PVars_Purging', N'c:\\ComputerTALKDB\\RAW', N'PVars_Purging.dat', N'MERGE [dbo].[PVars_Purging] AS tar
USING [dbo].[z_PVars_Purging] AS src
ON tar.refTime = src.refTime 
WHEN MATCHED THEN
   UPDATE SET
   tar.refTime  =  src.refTime

WHEN NOT MATCHED THEN
   INSERT
   (
   refTime

   )
   VALUES
   (
   src.refTime

   )
 WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_QueueIDLookup', N'c:\\ComputerTALKDB\\RAW', N'QueueIDLookup.dat', N'MERGE [dbo].[QueueIDLookup] AS tar
USING [dbo].[z_QueueIDLookup] AS src
ON tar.QueueID = src.QueueID   AND tar.SwitchID  = src.SwitchID 
WHEN MATCHED THEN
   UPDATE SET
tar.QueueID  =  src.QueueID
, tar.QueueName  =  src.QueueName
, tar.SwitchID  =  src.SwitchID
WHEN NOT MATCHED THEN
   INSERT
   (
QueueID
, QueueName
, SwitchID
   )
   VALUES
   (
src.QueueID
, src.QueueName
, src.SwitchID
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_RecordingOptions', N'c:\\ComputerTALKDB\\RAW', N'RecordingOptions.dat', N'MERGE [dbo].[RecordingOptions] AS tar
USING [dbo].[z_RecordingOptions] AS src
ON tar.Id = src.Id 
WHEN MATCHED THEN
   UPDATE SET
tar.DefaultDatastoreId  =  src.DefaultDatastoreId
, tar.MaxRecordingTime  =  src.MaxRecordingTime
, tar.MaxRandomRecordingPerUser  =  src.MaxRandomRecordingPerUser
, tar.LookbackEnabled  =  src.LookbackEnabled
, tar.ExcludeInternalCalls  =  src.ExcludeInternalCalls
, tar.LimitViewToSelfInitiated  =  src.LimitViewToSelfInitiated
, tar.PermitReevaluation  =  src.PermitReevaluation
, tar.AudioRecordingEnabled  =  src.AudioRecordingEnabled
, tar.TrunkInboundRecEnabled  =  src.TrunkInboundRecEnabled
, tar.TrunkOutboundRecEnabled  =  src.TrunkOutboundRecEnabled
, tar.AllStationRecEnabled  =  src.AllStationRecEnabled
, tar.ScheduledRecEnabled  =  src.ScheduledRecEnabled
, tar.UserInitRecEnabled  =  src.UserInitRecEnabled
, tar.SupervisorInitRecEnabled  =  src.SupervisorInitRecEnabled
, tar.RandomRecEnabled  =  src.RandomRecEnabled
, tar.RecordUsersInWorkflow  =  src.RecordUsersInWorkflow
, tar.IMRecordingEnabled  =  src.IMRecordingEnabled
, tar.FailConversionsInQueueAfter  =  src.FailConversionsInQueueAfter
, tar.FailConversionsInProgressAfter  =  src.FailConversionsInProgressAfter
, tar.ScreenRecordingEnabled  =  src.ScreenRecordingEnabled

WHEN NOT MATCHED THEN
   INSERT
   (
DefaultDatastoreId
, MaxRecordingTime
, MaxRandomRecordingPerUser
, LookbackEnabled
, ExcludeInternalCalls
, LimitViewToSelfInitiated
, PermitReevaluation
, AudioRecordingEnabled
, TrunkInboundRecEnabled
, TrunkOutboundRecEnabled
, AllStationRecEnabled
, ScheduledRecEnabled
, UserInitRecEnabled
, SupervisorInitRecEnabled
, RandomRecEnabled
, RecordUsersInWorkflow
, IMRecordingEnabled
, FailConversionsInQueueAfter
, FailConversionsInProgressAfter
, ScreenRecordingEnabled
   )
   VALUES
   (
src.DefaultDatastoreId
, src.MaxRecordingTime
, src.MaxRandomRecordingPerUser
, src.LookbackEnabled
, src.ExcludeInternalCalls
, src.LimitViewToSelfInitiated
, src.PermitReevaluation
, src.AudioRecordingEnabled
, src.TrunkInboundRecEnabled
, src.TrunkOutboundRecEnabled
, src.AllStationRecEnabled
, src.ScheduledRecEnabled
, src.UserInitRecEnabled
, src.SupervisorInitRecEnabled
, src.RandomRecEnabled
, src.RecordUsersInWorkflow
, src.IMRecordingEnabled
, src.FailConversionsInQueueAfter
, src.FailConversionsInProgressAfter
, src.ScreenRecordingEnabled
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Recordings', N'c:\\ComputerTALKDB\\RAW', N'Recordings.dat', N'MERGE [dbo].[Recordings] AS tar
USING [dbo].[z_Recordings] AS src
ON tar.Id = src.Id 
WHEN MATCHED THEN
   UPDATE SET
tar.DatastoreFileId  =  src.DatastoreFileId
, tar.ContactId  =  src.ContactId
, tar.AddressId  =  src.AddressId
, tar.AgentId  =  src.AgentId
, tar.QueueId  =  src.QueueId
, tar.InitiatorId  =  src.InitiatorId
, tar.StartDateTime  =  src.StartDateTime
, tar.Duration  =  src.Duration
, tar.DialedNumber  =  src.DialedNumber
, tar.CallerNumber  =  src.CallerNumber
, tar.CallerName  =  src.CallerName
, tar.[Trigger]  =  src.[Trigger]
, tar.[Status]  =  src.[Status]
, tar.ErrorCode  =  src.ErrorCode
, tar.UserData  =  src.UserData
, tar.Incoming  =  src.Incoming
, tar.MediaType  =  src.MediaType
, tar.LegacyDatastoreFileId  =  src.LegacyDatastoreFileId
, tar.LegacyFileRecordingRate  =  src.LegacyFileRecordingRate
, tar.TranscodingStatus  =  src.TranscodingStatus
, tar.LastTranscodingStatusChange  =  src.LastTranscodingStatusChange
WHEN NOT MATCHED THEN
   INSERT
   (
   DatastoreFileId
, ContactId
, AddressId
, AgentId
, QueueId
, InitiatorId
, StartDateTime
, Duration
, DialedNumber
, CallerNumber
, CallerName
, [Trigger]
, [Status]
, ErrorCode
, UserData
, Incoming
, MediaType
, LegacyDatastoreFileId
, LegacyFileRecordingRate
, TranscodingStatus
, LastTranscodingStatusChange
   )
   VALUES
   (
   src.DatastoreFileId
, src.ContactId
, src.AddressId
, src.AgentId
, src.QueueId
, src.InitiatorId
, src.StartDateTime
, src.Duration
, src.DialedNumber
, src.CallerNumber
, src.CallerName
, src.[Trigger]
, src.[Status]
, src.ErrorCode
, src.UserData
, src.Incoming
, src.MediaType
, src.LegacyDatastoreFileId
, src.LegacyFileRecordingRate
, src.TranscodingStatus
, src.LastTranscodingStatusChange
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_RecordingSchedules', N'c:\\ComputerTALKDB\\RAW', N'RecordingSchedules.dat', N'MERGE [dbo].[RecordingSchedules] AS tar
USING [dbo].[z_RecordingSchedules] AS src
ON tar.Id = src.Id 
WHEN MATCHED THEN
   UPDATE SET
   tar.AgentId  =  src.AgentId
, tar.QueueId  =  src.QueueId
, tar.ANI  =  src.ANI
, tar.DNIS  =  src.DNIS
, tar.Duration  =  src.Duration
, tar.isScheduled  =  src.isScheduled
, tar.StartDateTime  =  src.StartDateTime
, tar.EndDateTime  =  src.EndDateTime
, tar.ScreenRecording  =  src.ScreenRecording
, tar.AudioRecording  =  src.AudioRecording
WHEN NOT MATCHED THEN
   INSERT
   (
   AgentId
, QueueId
, ANI
, DNIS
, Duration
, isScheduled
, StartDateTime
, EndDateTime
, ScreenRecording
, AudioRecording
   )
   VALUES
   (
   src.AgentId
, src.QueueId
, src.ANI
, src.DNIS
, src.Duration
, src.isScheduled
, src.StartDateTime
, src.EndDateTime
, src.ScreenRecording
, src.AudioRecording
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_RecordingsFaultedFiles', N'c:\\ComputerTALKDB\\RAW', N'RecordingsFaultedFiles.dat', N'MERGE [dbo].[RecordingsFaultedFiles] AS tar
USING [dbo].[z_RecordingsFaultedFiles] AS src
ON tar.RecordingId = src.RecordingId   AND tar.DatastoreFileId  = src.DatastoreFileId
WHEN MATCHED THEN
   UPDATE SET
   tar.RecordingId  =  src.RecordingId
, tar.DatastoreFileId  =  src.DatastoreFileId
WHEN NOT MATCHED THEN
   INSERT
   (
   RecordingId
, DatastoreFileId
   )
   VALUES
   (
   src.RecordingId
, src.DatastoreFileId
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_RequiredSkill', N'c:\\ComputerTALKDB\\RAW', N'RequiredSkill.dat', N'MERGE [dbo].[RequiredSkill] AS tar
USING [dbo].[z_RequiredSkill] AS src
ON tar.SwitchID = src.SwitchID   AND tar.QueueID  = src.QueueID  AND tar.SkillID = src.SkillID
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.QueueID  =  src.QueueID
, tar.SkillID  =  src.SkillID
, tar.SkillType  =  src.SkillType
, tar.SkillLevel  =  src.SkillLevel
, tar.SkillPriority  =  src.SkillPriority

WHEN NOT MATCHED THEN
   INSERT
   (
SwitchID
, QueueID
, SkillID
, SkillType
, SkillLevel
, SkillPriority
   )
   VALUES
   (
src.SwitchID
, src.QueueID
, src.SkillID
, src.SkillType
, src.SkillLevel
, src.SkillPriority
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_RoutingRule', N'c:\\ComputerTALKDB\\RAW', N'RoutingRule.dat', N'MERGE [dbo].[RoutingRule] AS tar
USING [dbo].[z_RoutingRule] AS src
ON tar.SwitchID = src.SwitchID   AND tar.RoutingRuleID  = src.RoutingRuleID
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.RoutingRuleID  =  src.RoutingRuleID
, tar.RegEx  =  src.RegEx
, tar.OutputString  =  src.OutputString
, tar.ContactGroupID  =  src.ContactGroupID
, tar.RoutingData  =  src.RoutingData
, tar.[Description]  =  src.[Description]
, tar.RoutingRuleName  =  src.RoutingRuleName
WHEN NOT MATCHED THEN
   INSERT
   (
   SwitchID
, RoutingRuleID
, RegEx
, OutputString
, ContactGroupID
, RoutingData
, [Description]
, RoutingRuleName
   )
   VALUES
   (
   src.SwitchID
, src.RoutingRuleID
, src.RegEx
, src.OutputString
, src.ContactGroupID
, src.RoutingData
, src.[Description]
, src.RoutingRuleName
   )
 WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_ScreenRecordingParameters', N'c:\\ComputerTALKDB\\RAW', N'ScreenRecordingParameters.dat', N'MERGE [dbo].[ScreenRecordingParameters] AS tar
USING [dbo].[z_ScreenRecordingParameters] AS src
ON tar.ParametersSettingID = src.ParametersSettingID
WHEN MATCHED THEN
   UPDATE SET
tar.ParametersSettingID  =  src.ParametersSettingID
, tar.Caption  =  src.Caption
, tar.Foreground  =  src.Foreground
, tar.Background  =  src.Background
, tar.OriginalVideoCodec  =  src.OriginalVideoCodec
, tar.ImageCompressQuality  =  src.ImageCompressQuality
, tar.PollingFrequency  =  src.PollingFrequency
, tar.PollingFrenquencyForeground  =  src.PollingFrenquencyForeground
, tar.PollingFrenquencyBackground  =  src.PollingFrenquencyBackground
, tar.Bandwidth  =  src.Bandwidth
, tar.EncoderMode  =  src.EncoderMode
, tar.FrameWidth  =  src.FrameWidth
, tar.FrameHeight  =  src.FrameHeight
, tar.ScreenCaptureQuality  =  src.ScreenCaptureQuality
, tar.PeakBitRate  =  src.PeakBitRate
, tar.TimePerFrame  =  src.TimePerFrame
, tar.KeyFrameDistance  =  src.KeyFrameDistance
, tar.TranscodedContainerFormat  =  src.TranscodedContainerFormat
, tar.TranscodedVideoCodec  =  src.TranscodedVideoCodec
, tar.TranscodedAudioCodec  =  src.TranscodedAudioCodec
, tar.TranscodedBitRate  =  src.TranscodedBitRate
, tar.TranscodedAspectRatio  =  src.TranscodedAspectRatio
, tar.TranscodedFrameSize  =  src.TranscodedFrameSize
, tar.IntData1  =  src.IntData1
, tar.IntData2  =  src.IntData2
, tar.IntData3  =  src.IntData3
, tar.StrData1  =  src.StrData1
, tar.StrData2  =  src.StrData2
, tar.StrData3  =  src.StrData3

WHEN NOT MATCHED THEN
   INSERT
   (
ParametersSettingID
, Caption
, Foreground
, Background
, OriginalVideoCodec
, ImageCompressQuality
, PollingFrequency
, PollingFrenquencyForeground
, PollingFrenquencyBackground
, Bandwidth
, EncoderMode
, FrameWidth
, FrameHeight
, ScreenCaptureQuality
, PeakBitRate
, TimePerFrame
, KeyFrameDistance
, TranscodedContainerFormat
, TranscodedVideoCodec
, TranscodedAudioCodec
, TranscodedBitRate
, TranscodedAspectRatio
, TranscodedFrameSize
, IntData1
, IntData2
, IntData3
, StrData1
, StrData2
, StrData3
   )
   VALUES
   (
src.ParametersSettingID
, src.Caption
, src.Foreground
, src.Background
, src.OriginalVideoCodec
, src.ImageCompressQuality
, src.PollingFrequency
, src.PollingFrenquencyForeground
, src.PollingFrenquencyBackground
, src.Bandwidth
, src.EncoderMode
, src.FrameWidth
, src.FrameHeight
, src.ScreenCaptureQuality
, src.PeakBitRate
, src.TimePerFrame
, src.KeyFrameDistance
, src.TranscodedContainerFormat
, src.TranscodedVideoCodec
, src.TranscodedAudioCodec
, src.TranscodedBitRate
, src.TranscodedAspectRatio
, src.TranscodedFrameSize
, src.IntData1
, src.IntData2
, src.IntData3
, src.StrData1
, src.StrData2
, src.StrData3
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_ScreenRecordingServerConfig', N'c:\\ComputerTALKDB\\RAW', N'ScreenRecordingServerConfig.dat', N'MERGE [dbo].[ScreenRecordingServerConfig] AS tar
USING [dbo].[z_ScreenRecordingServerConfig] AS src
ON tar.ServerId = src.ServerId
WHEN MATCHED THEN
   UPDATE SET
tar.ServerId  =  src.ServerId
, tar.ServerName  =  src.ServerName
, tar.ServerPort  =  src.ServerPort
, tar.RootDir  =  src.RootDir
, tar.AliasRootDir  =  src.AliasRootDir
, tar.UserName  =  src.UserName
, tar.[Password]  =  src.[Password]
, tar.ExpiryDate  =  src.ExpiryDate
, tar.[Enabled]  =  src.[Enabled]
, tar.VendorsSettingID  =  src.VendorsSettingID
, tar.ParametersSettingID  =  src.ParametersSettingID
WHEN NOT MATCHED THEN
   INSERT
   (
ServerId
, ServerName
, ServerPort
, RootDir
, AliasRootDir
, UserName
, [Password]
, ExpiryDate
, [Enabled]
, VendorsSettingID
, ParametersSettingID
   )
   VALUES
   (
   src.ServerId
, src.ServerName
, src.ServerPort
, src.RootDir
, src.AliasRootDir
, src.UserName
, src.[Password]
, src.ExpiryDate
, src.[Enabled]
, src.VendorsSettingID
, src.ParametersSettingID
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_ScreenRecordingVendorInfo', N'c:\\ComputerTALKDB\\RAW', N'ScreenRecordingVendorInfo.dat', N'MERGE [dbo].[ScreenRecordingVendorInfo] AS tar
USING [dbo].[z_ScreenRecordingVendorInfo] AS src
ON tar.VendorsSettingID = src.VendorsSettingID
WHEN MATCHED THEN
   UPDATE SET
tar.VendorsSettingID  =  src.VendorsSettingID
, tar.VendorName  =  src.VendorName
, tar.ProductName  =  src.ProductName
, tar.ProductInfo  =  src.ProductInfo
, tar.CurVersion  =  src.CurVersion
, tar.MinVersion  =  src.MinVersion
WHEN NOT MATCHED THEN
   INSERT
   (
VendorsSettingID
, VendorName
, ProductName
, ProductInfo
, CurVersion
, MinVersion
   )
   VALUES
   (
src.VendorsSettingID
, src.VendorName
, src.ProductName
, src.ProductInfo
, src.CurVersion
, src.MinVersion
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_SIPGroup', N'c:\\ComputerTALKDB\\RAW', N'SIPGroup.dat', N'MERGE [dbo].[SIPGroup] AS tar
USING [dbo].[z_SIPGroup] AS src
ON tar.SwitchID = src.SwitchID  AND tar.SIPGroupID = src.SIPGroupID
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.SIPGroupID  =  src.SIPGroupID
, tar.SIPGroupName  =  src.SIPGroupName
, tar.SIPGroupType  =  src.SIPGroupType
, tar.AccessCode  =  src.AccessCode
, tar.Prefix  =  src.Prefix
, tar.StartingWfID  =  src.StartingWfID
, tar.StartingPageID  =  src.StartingPageID
, tar.StartingActionID  =  src.StartingActionID
, tar.OutboundHuntOrder  =  src.OutboundHuntOrder
, tar.DefaultFromURI  =  src.DefaultFromURI
, tar.FromPopulationMode  =  src.FromPopulationMode
, tar.InboundMatchingRules  =  src.InboundMatchingRules
, tar.InboundAuthSetting  =  src.InboundAuthSetting
, tar.OutboundProxyURI  =  src.OutboundProxyURI
, tar.SIPServerURI  =  src.SIPServerURI
, tar.PortRegistrationURI  =  src.PortRegistrationURI
, tar.RegistrationTime  =  src.RegistrationTime
, tar.RegistrationRetryInterval  =  src.RegistrationRetryInterval
, tar.SessionTimerInterval  =  src.SessionTimerInterval
, tar.SessionTimerSetting  =  src.SessionTimerSetting
, tar.SubscriptionTime  =  src.SubscriptionTime
, tar.RPortSetting  =  src.RPortSetting
, tar.DialogMatchingSetting  =  src.DialogMatchingSetting
, tar.SendUserAgentSetting  =  src.SendUserAgentSetting
, tar.CustomUserAgentName  =  src.CustomUserAgentName
, tar.RedirectionSetting  =  src.RedirectionSetting
, tar.ReferSetting  =  src.ReferSetting
, tar.InboundRedirectOnAllBusyURI  =  src.InboundRedirectOnAllBusyURI
, tar.DTMFTransportMethodSetting  =  src.DTMFTransportMethodSetting
, tar.SIPOverrideURI  =  src.SIPOverrideURI
, tar.RTPOverrideHost  =  src.RTPOverrideHost
, tar.RTPOverridePortFixed  =  src.RTPOverridePortFixed
, tar.RTPOverridePortOffset  =  src.RTPOverridePortOffset
, tar.RTPOutTelephonyEventPayloadID  =  src.RTPOutTelephonyEventPayloadID
, tar.RTPPreferLocalCodecSetting  =  src.RTPPreferLocalCodecSetting
, tar.RTPTOS  =  src.RTPTOS
, tar.RTPRTCPSupportSetting  =  src.RTPRTCPSupportSetting
, tar.RTPEchoCancellationSetting  =  src.RTPEchoCancellationSetting
, tar.RTPEchoSuppressionSetting  =  src.RTPEchoSuppressionSetting
, tar.RTPEchoFilterTapsAdaptationSetting  =  src.RTPEchoFilterTapsAdaptationSetting
, tar.RTPComfortNoiseGenerationSetting  =  src.RTPComfortNoiseGenerationSetting
, tar.RTPEchoCancellationGain  =  src.RTPEchoCancellationGain
, tar.RTPInvokeHoldMethodSetting  =  src.RTPInvokeHoldMethodSetting
, tar.RTPSwitchingSetting  =  src.RTPSwitchingSetting
, tar.VoicemailNotifySetting  =  src.VoicemailNotifySetting
, tar.PhoneDisplayUpdateSetting  =  src.PhoneDisplayUpdateSetting
, tar.ClassOfService  =  src.ClassOfService
WHEN NOT MATCHED THEN
   INSERT
   (
   SwitchID
, SIPGroupID
, SIPGroupName
, SIPGroupType
, AccessCode
, Prefix
, StartingWfID
, StartingPageID
, StartingActionID
, OutboundHuntOrder
, DefaultFromURI
, FromPopulationMode
, InboundMatchingRules
, InboundAuthSetting
, OutboundProxyURI
, SIPServerURI
, PortRegistrationURI
, RegistrationTime
, RegistrationRetryInterval
, SessionTimerInterval
, SessionTimerSetting
, SubscriptionTime
, RPortSetting
, DialogMatchingSetting
, SendUserAgentSetting
, CustomUserAgentName
, RedirectionSetting
, ReferSetting
, InboundRedirectOnAllBusyURI
, DTMFTransportMethodSetting
, SIPOverrideURI
, RTPOverrideHost
, RTPOverridePortFixed
, RTPOverridePortOffset
, RTPOutTelephonyEventPayloadID
, RTPPreferLocalCodecSetting
, RTPTOS
, RTPRTCPSupportSetting
, RTPEchoCancellationSetting
, RTPEchoSuppressionSetting
, RTPEchoFilterTapsAdaptationSetting
, RTPComfortNoiseGenerationSetting
, RTPEchoCancellationGain
, RTPInvokeHoldMethodSetting
, RTPSwitchingSetting
, VoicemailNotifySetting
, PhoneDisplayUpdateSetting
, ClassOfService
   )
   VALUES
   (
   src.SwitchID
, src.SIPGroupID
, src.SIPGroupName
, src.SIPGroupType
, src.AccessCode
, src.Prefix
, src.StartingWfID
, src.StartingPageID
, src.StartingActionID
, src.OutboundHuntOrder
, src.DefaultFromURI
, src.FromPopulationMode
, src.InboundMatchingRules
, src.InboundAuthSetting
, src.OutboundProxyURI
, src.SIPServerURI
, src.PortRegistrationURI
, src.RegistrationTime
, src.RegistrationRetryInterval
, src.SessionTimerInterval
, src.SessionTimerSetting
, src.SubscriptionTime
, src.RPortSetting
, src.DialogMatchingSetting
, src.SendUserAgentSetting
, src.CustomUserAgentName
, src.RedirectionSetting
, src.ReferSetting
, src.InboundRedirectOnAllBusyURI
, src.DTMFTransportMethodSetting
, src.SIPOverrideURI
, src.RTPOverrideHost
, src.RTPOverridePortFixed
, src.RTPOverridePortOffset
, src.RTPOutTelephonyEventPayloadID
, src.RTPPreferLocalCodecSetting
, src.RTPTOS
, src.RTPRTCPSupportSetting
, src.RTPEchoCancellationSetting
, src.RTPEchoSuppressionSetting
, src.RTPEchoFilterTapsAdaptationSetting
, src.RTPComfortNoiseGenerationSetting
, src.RTPEchoCancellationGain
, src.RTPInvokeHoldMethodSetting
, src.RTPSwitchingSetting
, src.VoicemailNotifySetting
, src.PhoneDisplayUpdateSetting
, src.ClassOfService
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_SIPGroupCodec', N'c:\\ComputerTALKDB\\RAW', N'SIPGroupCodec.dat', N'MERGE [dbo].[SIPGroupCodec] AS tar
USING [dbo].[z_SIPGroupCodec] AS src
ON tar.SwitchID = src.SwitchID   AND tar.SIPGroupID  = src.SIPGroupID  AND tar.Codec = src.Codec
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.SIPGroupID  =  src.SIPGroupID
, tar.Codec  =  src.Codec
, tar.Priority  =  src.Priority
, tar.PayloadID  =  src.PayloadID
, tar.Bandwidth  =  src.Bandwidth
, tar.Rate  =  src.Rate
, tar.FrameQuota  =  src.FrameQuota
, tar.SilenceCompressionSetting  =  src.SilenceCompressionSetting
, tar.JitterDepth  =  src.JitterDepth
, tar.JitterAdaptSetting  =  src.JitterAdaptSetting
, tar.EncoderGain  =  src.EncoderGain
, tar.DecoderGain  =  src.DecoderGain

WHEN NOT MATCHED THEN
   INSERT
   (
SwitchID
, SIPGroupID
, Codec
, Priority
, PayloadID
, Bandwidth
, Rate
, FrameQuota
, SilenceCompressionSetting
, JitterDepth
, JitterAdaptSetting
, EncoderGain
, DecoderGain
   )
   VALUES
   (
src.SwitchID
, src.SIPGroupID
, src.Codec
, src.Priority
, src.PayloadID
, src.Bandwidth
, src.Rate
, src.FrameQuota
, src.SilenceCompressionSetting
, src.JitterDepth
, src.JitterAdaptSetting
, src.EncoderGain
, src.DecoderGain

   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_SIPGroupIdentity', N'c:\\ComputerTALKDB\\RAW', N'SIPGroupIdentity.dat', N'MERGE [dbo].[SIPGroupIdentity] AS tar
USING [dbo].[z_SIPGroupIdentity] AS src
ON tar.SwitchID = src.SwitchID   AND tar.SIPGroupID  = src.SIPGroupID  AND tar.AOR = src.AOR
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.SIPGroupID  =  src.SIPGroupID
, tar.AOR  =  src.AOR
, tar.ClassOfService  =  src.ClassOfService
, tar.AuthUserName  =  src.AuthUserName
, tar.AuthPassword  =  src.AuthPassword
, tar.AuthRealm  =  src.AuthRealm

WHEN NOT MATCHED THEN
   INSERT
   (
SwitchID
, SIPGroupID
, AOR
, ClassOfService
, AuthUserName
, AuthPassword
, AuthRealm

   )
   VALUES
   (
src.SwitchID
, src.SIPGroupID
, src.AOR
, src.ClassOfService
, src.AuthUserName
, src.AuthPassword
, src.AuthRealm
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_SIPGroupTrustedDomain', N'c:\\ComputerTALKDB\\RAW', N'SIPGroupTrustedDomain.dat', N'MERGE [dbo].[SIPGroupTrustedDomain] AS tar
USING [dbo].[z_SIPGroupTrustedDomain] AS src
ON tar.SwitchID = src.SwitchID   AND tar.SIPGroupID  = src.SIPGroupID  AND tar.Domain = src.Domain
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.SIPGroupID  =  src.SIPGroupID
, tar.Domain  =  src.Domain
, tar.ClassOfService  =  src.ClassOfService
WHEN NOT MATCHED THEN
   INSERT
   (
SwitchID
, SIPGroupID
, Domain
, ClassOfService
   )
   VALUES
   (
src.SwitchID
, src.SIPGroupID
, src.Domain
, src.ClassOfService
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_SIPPort', N'c:\\ComputerTALKDB\\RAW', N'SIPPort.dat', N'MERGE [dbo].[SIPPort] AS tar
USING [dbo].[z_SIPPort] AS src
ON tar.SwitchID = src.SwitchID   AND tar.SIPPortID  = src.SIPPortID
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.SIPPortID  =  src.SIPPortID
, tar.SIPGroupID  =  src.SIPGroupID
WHEN NOT MATCHED THEN
   INSERT
   (
SwitchID
, SIPPortID
, SIPGroupID

   )
   VALUES
   (
src.SwitchID
, src.SIPPortID
, src.SIPGroupID

   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Site', N'c:\\ComputerTALKDB\\RAW', N'Site.dat', N'MERGE [dbo].[Site] AS tar
USING [dbo].[z_Site] AS src
ON tar.SiteID = src.SiteID 
WHEN MATCHED THEN
   UPDATE SET
tar.SiteID  =  src.SiteID
,tar.SiteName  =  src.SiteName
WHEN NOT MATCHED THEN
   INSERT
   (
   SiteID
,SiteName
   )
   VALUES
   (
   src.SiteID
,src.SiteName
   )
 WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Skill', N'c:\\ComputerTALKDB\\RAW', N'Skill.dat', N'MERGE [dbo].[Skill] AS tar
USING [dbo].[z_Skill] AS src
ON tar.SwitchID = src.SwitchID   AND tar.SkillID = src.SkillID
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.SkillID  =  src.SkillID
, tar.SkillName  =  src.SkillName
WHEN NOT MATCHED THEN
   INSERT
   (
SwitchID
, SkillID
, SkillName
   )
   VALUES
   (
src.SwitchID
, src.SkillID
, src.SkillName
   )
 WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_StartOfDayProspectCounts', N'c:\\ComputerTALKDB\\RAW', N'StartOfDayProspectCounts.dat', N'MERGE [dbo].[StartOfDayProspectCounts] AS tar
USING [dbo].[z_StartOfDayProspectCounts] AS src
ON tar.LoggedTime = src.LoggedTime   AND tar.CampaignID  = src.CampaignID
WHEN MATCHED THEN
   UPDATE SET
tar.LoggedTime  =  src.LoggedTime
, tar.CampaignID  =  src.CampaignID
, tar.CampaignName  =  src.CampaignName
, tar.NumProspects  =  src.NumProspects
WHEN NOT MATCHED THEN
   INSERT
   (
LoggedTime
, CampaignID
, CampaignName
, NumProspects
   )
   VALUES
   (
src.LoggedTime
, src.CampaignID
, src.CampaignName
, src.NumProspects
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_ADR', N'c:\\ComputerTALKDB\\RAW', N'Stat_ADR.dat', N'MERGE [dbo].[Stat_ADR] AS tar
USING [dbo].[z_Stat_ADR] AS src
ON tar.PrimaryKey = src.PrimaryKey 
WHEN MATCHED THEN
   UPDATE SET
tar.PrimaryKey  =  src.PrimaryKey
, tar.EventTime  =  src.EventTime
, tar.DSTStatus  =  src.DSTStatus
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.EventType  =  src.EventType
, tar.EventID  =  src.EventID
, tar.CurrentState  =  src.CurrentState
, tar.LastState  =  src.LastState
, tar.LastStateDuration  =  src.LastStateDuration
, tar.QueueID  =  src.QueueID
, tar.ContactID  =  src.ContactID
, tar.ContactType  =  src.ContactType
, tar.RouteType  =  src.RouteType
, tar.TargetID  =  src.TargetID
, tar.Reason  =  src.Reason
, tar.DialledNumber  =  src.DialledNumber
, tar.AssociatedQueueID  =  src.AssociatedQueueID
, tar.AgentCallType  =  src.AgentCallType
, tar.EventSequence  =  src.EventSequence

WHEN NOT MATCHED THEN
   INSERT
   (
PrimaryKey
, EventTime
, DSTStatus
, SwitchID
, AgentID
, EventType
, EventID
, CurrentState
, LastState
, LastStateDuration
, QueueID
, ContactID
, ContactType
, RouteType
, TargetID
, Reason
, DialledNumber
, AssociatedQueueID
, AgentCallType
, EventSequence
   )
   VALUES
   (
src.PrimaryKey
, src.EventTime
, src.DSTStatus
, src.SwitchID
, src.AgentID
, src.EventType
, src.EventID
, src.CurrentState
, src.LastState
, src.LastStateDuration
, src.QueueID
, src.ContactID
, src.ContactType
, src.RouteType
, src.TargetID
, src.Reason
, src.DialledNumber
, src.AssociatedQueueID
, src.AgentCallType
, src.EventSequence

   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentActivity_D', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentActivity_D.dat', N'MERGE [dbo].[Stat_AgentActivity_D] AS tar
USING [dbo].[z_Stat_AgentActivity_D] AS src
ON tar.StartDateTime = src.StartDateTime  AND tar.SwitchID  = src.SwitchID   AND tar.AgentID  =  src.AgentID
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.QueueCallsReceived  =  src.QueueCallsReceived
, tar.DirectCallsReceived  =  src.DirectCallsReceived
, tar.OutboundCallsMade  =  src.OutboundCallsMade
, tar.InternalCallsMade  =  src.InternalCallsMade
, tar.TransferredQueueCallsReceived  =  src.TransferredQueueCallsReceived
, tar.TransferredOtherCallsReceived  =  src.TransferredOtherCallsReceived
, tar.ConsultationQueueCallsPlaced  =  src.ConsultationQueueCallsPlaced
, tar.ConsultationOtherCallsPlaced  =  src.ConsultationOtherCallsPlaced
, tar.ConsultXferQueueCallsCompleted  =  src.ConsultXferQueueCallsCompleted
, tar.ConsultXferOtherCallsCompleted  =  src.ConsultXferOtherCallsCompleted
, tar.BlindXferQueueCallsPlaced  =  src.BlindXferQueueCallsPlaced
, tar.BlindXferOtherCallsPlaced  =  src.BlindXferOtherCallsPlaced
, tar.ConferenceQueueCallsInitiated  =  src.ConferenceQueueCallsInitiated
, tar.ConferenceOtherCallsInitiated  =  src.ConferenceOtherCallsInitiated
, tar.QueueCallsUnAnswered  =  src.QueueCallsUnAnswered
, tar.OtherCallsUnAnswered  =  src.OtherCallsUnAnswered
, tar.QueuedEmailsReceived  =  src.QueuedEmailsReceived
, tar.OtherEmailsReceived  =  src.OtherEmailsReceived
, tar.QueuedWebChatsReceived  =  src.QueuedWebChatsReceived
, tar.OtherWebChatsReceived  =  src.OtherWebChatsReceived
, tar.LogonDuration  =  src.LogonDuration
, tar.TotalQueueCallTime  =  src.TotalQueueCallTime
, tar.TotalDirectCallTime  =  src.TotalDirectCallTime
, tar.TotalOutboundCallTime  =  src.TotalOutboundCallTime
, tar.TotalInternalCallTime  =  src.TotalInternalCallTime
, tar.TotalHoldingTimeQueueCalls  =  src.TotalHoldingTimeQueueCalls
, tar.TotalHoldingTimeOtherCalls  =  src.TotalHoldingTimeOtherCalls
, tar.TotalConsultationTimeQueueCalls  =  src.TotalConsultationTimeQueueCalls
, tar.TotalConsultationTimeOtherCalls  =  src.TotalConsultationTimeOtherCalls
, tar.TotalConferenceTimeQueueCalls  =  src.TotalConferenceTimeQueueCalls
, tar.TotalConferenceTimeOtherCalls  =  src.TotalConferenceTimeOtherCalls
, tar.TotalQueueCallAlertingTime  =  src.TotalQueueCallAlertingTime
, tar.TotalDirectCallAlertingTime  =  src.TotalDirectCallAlertingTime
, tar.TotalQueueEmailTime  =  src.TotalQueueEmailTime
, tar.TotalOtherEmailTime  =  src.TotalOtherEmailTime
, tar.TotalQueueWebChatTime  =  src.TotalQueueWebChatTime
, tar.TotalOtherWebChatTime  =  src.TotalOtherWebChatTime
, tar.TotalWrapUpTime  =  src.TotalWrapUpTime
, tar.TotalReadyTime  =  src.TotalReadyTime
, tar.TotalNotReadyTime  =  src.TotalNotReadyTime
, tar.TotalMonitoringTime  =  src.TotalMonitoringTime
, tar.TotalCallSetupTime  =  src.TotalCallSetupTime
, tar.TransferredQueueEmailsReceived  =  src.TransferredQueueEmailsReceived
, tar.TransferredOtherEmailsReceived  =  src.TransferredOtherEmailsReceived
, tar.QueueEmailsTransferred  =  src.QueueEmailsTransferred
, tar.OtherEmailsTransferred  =  src.OtherEmailsTransferred
, tar.TotalQueueIMAlertingTime  =  src.TotalQueueIMAlertingTime
, tar.TotalDirectIMAlertingTime  =  src.TotalDirectIMAlertingTime
, tar.TotalQueueEmailAlertingTime  =  src.TotalQueueEmailAlertingTime
, tar.TotalDirectEmailAlertingTime  =  src.TotalDirectEmailAlertingTime
, tar.TotalIMWrapUpTime  =  src.TotalIMWrapUpTime
, tar.QueueCallsStoppedAlerting  =  src.QueueCallsStoppedAlerting
, tar.OtherCallsStoppedAlerting  =  src.OtherCallsStoppedAlerting
, tar.QueueImsStoppedAlerting  =  src.QueueImsStoppedAlerting
, tar.OtherImsStoppedAlerting  =  src.OtherImsStoppedAlerting
, tar.QueueEmailsStoppedAlerting  =  src.QueueEmailsStoppedAlerting
, tar.OtherEmailsStoppedAlerting  =  src.OtherEmailsStoppedAlerting
, tar.QueueImsUnAnswered  =  src.QueueImsUnAnswered
, tar.OtherImsUnAnswered  =  src.OtherImsUnAnswered
, tar.QueueEmailsUnAnswered  =  src.QueueEmailsUnAnswered
, tar.OtherEmailsUnAnswered  =  src.OtherEmailsUnAnswered
, tar.OutboundIMsMade  =  src.OutboundIMsMade
, tar.InternalIMsMade  =  src.InternalIMsMade
, tar.TotalOutboundIMTime  =  src.TotalOutboundIMTime
, tar.TotalInternalIMTime  =  src.TotalInternalIMTime
, tar.TransferredQueueIMReceived  =  src.TransferredQueueIMReceived
, tar.TransferredOtherIMReceived  =  src.TransferredOtherIMReceived
, tar.ConsultationQueueIMPlaced  =  src.ConsultationQueueIMPlaced
, tar.ConsultationOtherIMPlaced  =  src.ConsultationOtherIMPlaced
, tar.ConsultXferQueueIMCompleted  =  src.ConsultXferQueueIMCompleted
, tar.ConsultXferOtherIMCompleted  =  src.ConsultXferOtherIMCompleted
, tar.BlindXferQueueIMPlaced  =  src.BlindXferQueueIMPlaced
, tar.BlindXferOtherIMPlaced  =  src.BlindXferOtherIMPlaced
, tar.ConferenceQueueIMInitiated  =  src.ConferenceQueueIMInitiated
, tar.ConferenceOtherIMInitiated  =  src.ConferenceOtherIMInitiated
, tar.TotalHoldingTimeQueueIM  =  src.TotalHoldingTimeQueueIM
, tar.TotalHoldingTimeOtherIM  =  src.TotalHoldingTimeOtherIM
, tar.TotalConsultationTimeQueueIM  =  src.TotalConsultationTimeQueueIM
, tar.TotalConsultationTimeOtherIM  =  src.TotalConsultationTimeOtherIM
, tar.TotalConferenceTimeQueueIM  =  src.TotalConferenceTimeQueueIM
, tar.TotalConferenceTimeOtherIM  =  src.TotalConferenceTimeOtherIM
, tar.TotalIMSetupTime  =  src.TotalIMSetupTime
, tar.OutboundEmailsMade  =  src.OutboundEmailsMade
, tar.InternalEmailsMade  =  src.InternalEmailsMade
, tar.TotalOutboundEmailTime  =  src.TotalOutboundEmailTime
, tar.TotalInternalEmailTime  =  src.TotalInternalEmailTime
WHEN NOT MATCHED THEN
   INSERT
   (
StartDateTime
, SwitchID
, AgentID
, QueueCallsReceived
, DirectCallsReceived
, OutboundCallsMade
, InternalCallsMade
, TransferredQueueCallsReceived
, TransferredOtherCallsReceived
, ConsultationQueueCallsPlaced
, ConsultationOtherCallsPlaced
, ConsultXferQueueCallsCompleted
, ConsultXferOtherCallsCompleted
, BlindXferQueueCallsPlaced
, BlindXferOtherCallsPlaced
, ConferenceQueueCallsInitiated
, ConferenceOtherCallsInitiated
, QueueCallsUnAnswered
, OtherCallsUnAnswered
, QueuedEmailsReceived
, OtherEmailsReceived
, QueuedWebChatsReceived
, OtherWebChatsReceived
, LogonDuration
, TotalQueueCallTime
, TotalDirectCallTime
, TotalOutboundCallTime
, TotalInternalCallTime
, TotalHoldingTimeQueueCalls
, TotalHoldingTimeOtherCalls
, TotalConsultationTimeQueueCalls
, TotalConsultationTimeOtherCalls
, TotalConferenceTimeQueueCalls
, TotalConferenceTimeOtherCalls
, TotalQueueCallAlertingTime
, TotalDirectCallAlertingTime
, TotalQueueEmailTime
, TotalOtherEmailTime
, TotalQueueWebChatTime
, TotalOtherWebChatTime
, TotalWrapUpTime
, TotalReadyTime
, TotalNotReadyTime
, TotalMonitoringTime
, TotalCallSetupTime
, TransferredQueueEmailsReceived
, TransferredOtherEmailsReceived
, QueueEmailsTransferred
, OtherEmailsTransferred
, TotalQueueIMAlertingTime
, TotalDirectIMAlertingTime
, TotalQueueEmailAlertingTime
, TotalDirectEmailAlertingTime
, TotalIMWrapUpTime
, QueueCallsStoppedAlerting
, OtherCallsStoppedAlerting
, QueueImsStoppedAlerting
, OtherImsStoppedAlerting
, QueueEmailsStoppedAlerting
, OtherEmailsStoppedAlerting
, QueueImsUnAnswered
, OtherImsUnAnswered
, QueueEmailsUnAnswered
, OtherEmailsUnAnswered
, OutboundIMsMade
, InternalIMsMade
, TotalOutboundIMTime
, TotalInternalIMTime
, TransferredQueueIMReceived
, TransferredOtherIMReceived
, ConsultationQueueIMPlaced
, ConsultationOtherIMPlaced
, ConsultXferQueueIMCompleted
, ConsultXferOtherIMCompleted
, BlindXferQueueIMPlaced
, BlindXferOtherIMPlaced
, ConferenceQueueIMInitiated
, ConferenceOtherIMInitiated
, TotalHoldingTimeQueueIM
, TotalHoldingTimeOtherIM
, TotalConsultationTimeQueueIM
, TotalConsultationTimeOtherIM
, TotalConferenceTimeQueueIM
, TotalConferenceTimeOtherIM
, TotalIMSetupTime
, OutboundEmailsMade
, InternalEmailsMade
, TotalOutboundEmailTime
, TotalInternalEmailTime
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.AgentID
, src.QueueCallsReceived
, src.DirectCallsReceived
, src.OutboundCallsMade
, src.InternalCallsMade
, src.TransferredQueueCallsReceived
, src.TransferredOtherCallsReceived
, src.ConsultationQueueCallsPlaced
, src.ConsultationOtherCallsPlaced
, src.ConsultXferQueueCallsCompleted
, src.ConsultXferOtherCallsCompleted
, src.BlindXferQueueCallsPlaced
, src.BlindXferOtherCallsPlaced
, src.ConferenceQueueCallsInitiated
, src.ConferenceOtherCallsInitiated
, src.QueueCallsUnAnswered
, src.OtherCallsUnAnswered
, src.QueuedEmailsReceived
, src.OtherEmailsReceived
, src.QueuedWebChatsReceived
, src.OtherWebChatsReceived
, src.LogonDuration
, src.TotalQueueCallTime
, src.TotalDirectCallTime
, src.TotalOutboundCallTime
, src.TotalInternalCallTime
, src.TotalHoldingTimeQueueCalls
, src.TotalHoldingTimeOtherCalls
, src.TotalConsultationTimeQueueCalls
, src.TotalConsultationTimeOtherCalls
, src.TotalConferenceTimeQueueCalls
, src.TotalConferenceTimeOtherCalls
, src.TotalQueueCallAlertingTime
, src.TotalDirectCallAlertingTime
, src.TotalQueueEmailTime
, src.TotalOtherEmailTime
, src.TotalQueueWebChatTime
, src.TotalOtherWebChatTime
, src.TotalWrapUpTime
, src.TotalReadyTime
, src.TotalNotReadyTime
, src.TotalMonitoringTime
, src.TotalCallSetupTime
, src.TransferredQueueEmailsReceived
, src.TransferredOtherEmailsReceived
, src.QueueEmailsTransferred
, src.OtherEmailsTransferred
, src.TotalQueueIMAlertingTime
, src.TotalDirectIMAlertingTime
, src.TotalQueueEmailAlertingTime
, src.TotalDirectEmailAlertingTime
, src.TotalIMWrapUpTime
, src.QueueCallsStoppedAlerting
, src.OtherCallsStoppedAlerting
, src.QueueImsStoppedAlerting
, src.OtherImsStoppedAlerting
, src.QueueEmailsStoppedAlerting
, src.OtherEmailsStoppedAlerting
, src.QueueImsUnAnswered
, src.OtherImsUnAnswered
, src.QueueEmailsUnAnswered
, src.OtherEmailsUnAnswered
, src.OutboundIMsMade
, src.InternalIMsMade
, src.TotalOutboundIMTime
, src.TotalInternalIMTime
, src.TransferredQueueIMReceived
, src.TransferredOtherIMReceived
, src.ConsultationQueueIMPlaced
, src.ConsultationOtherIMPlaced
, src.ConsultXferQueueIMCompleted
, src.ConsultXferOtherIMCompleted
, src.BlindXferQueueIMPlaced
, src.BlindXferOtherIMPlaced
, src.ConferenceQueueIMInitiated
, src.ConferenceOtherIMInitiated
, src.TotalHoldingTimeQueueIM
, src.TotalHoldingTimeOtherIM
, src.TotalConsultationTimeQueueIM
, src.TotalConsultationTimeOtherIM
, src.TotalConferenceTimeQueueIM
, src.TotalConferenceTimeOtherIM
, src.TotalIMSetupTime
, src.OutboundEmailsMade
, src.InternalEmailsMade
, src.TotalOutboundEmailTime
, src.TotalInternalEmailTime
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentActivity_I', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentActivity_I.dat', N'MERGE [dbo].[Stat_AgentActivity_I] AS tar
USING [dbo].[z_Stat_AgentActivity_I] AS src
ON tar.StartDateTime = src.StartDateTime  AND tar.DSTStatus  = src.DSTStatus   AND tar.AgentID  =  src.AgentID  AND tar.SwitchID = src.SwitchID
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.DSTStatus  =  src.DSTStatus
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.IntervalDuration  =  src.IntervalDuration
, tar.IntervalID  =  src.IntervalID
, tar.QueueCallsReceived  =  src.QueueCallsReceived
, tar.DirectCallsReceived  =  src.DirectCallsReceived
, tar.OutboundCallsMade  =  src.OutboundCallsMade
, tar.InternalCallsMade  =  src.InternalCallsMade
, tar.TransferredQueueCallsReceived  =  src.TransferredQueueCallsReceived
, tar.TransferredOtherCallsReceived  =  src.TransferredOtherCallsReceived
, tar.ConsultationQueueCallsPlaced  =  src.ConsultationQueueCallsPlaced
, tar.ConsultationOtherCallsPlaced  =  src.ConsultationOtherCallsPlaced
, tar.ConsultXferQueueCallsCompleted  =  src.ConsultXferQueueCallsCompleted
, tar.ConsultXferOtherCallsCompleted  =  src.ConsultXferOtherCallsCompleted
, tar.BlindXferQueueCallsPlaced  =  src.BlindXferQueueCallsPlaced
, tar.BlindXferOtherCallsPlaced  =  src.BlindXferOtherCallsPlaced
, tar.ConferenceQueueCallsInitiated  =  src.ConferenceQueueCallsInitiated
, tar.ConferenceOtherCallsInitiated  =  src.ConferenceOtherCallsInitiated
, tar.QueueCallsUnAnswered  =  src.QueueCallsUnAnswered
, tar.OtherCallsUnAnswered  =  src.OtherCallsUnAnswered
, tar.QueuedEmailsReceived  =  src.QueuedEmailsReceived
, tar.OtherEmailsReceived  =  src.OtherEmailsReceived
, tar.QueuedWebChatsReceived  =  src.QueuedWebChatsReceived
, tar.OtherWebChatsReceived  =  src.OtherWebChatsReceived
, tar.LogonDuration  =  src.LogonDuration
, tar.TotalQueueCallTime  =  src.TotalQueueCallTime
, tar.TotalDirectCallTime  =  src.TotalDirectCallTime
, tar.TotalOutboundCallTime  =  src.TotalOutboundCallTime
, tar.TotalInternalCallTime  =  src.TotalInternalCallTime
, tar.TotalHoldingTimeQueueCalls  =  src.TotalHoldingTimeQueueCalls
, tar.TotalHoldingTimeOtherCalls  =  src.TotalHoldingTimeOtherCalls
, tar.TotalConsultationTimeQueueCalls  =  src.TotalConsultationTimeQueueCalls
, tar.TotalConsultationTimeOtherCalls  =  src.TotalConsultationTimeOtherCalls
, tar.TotalConferenceTimeQueueCalls  =  src.TotalConferenceTimeQueueCalls
, tar.TotalConferenceTimeOtherCalls  =  src.TotalConferenceTimeOtherCalls
, tar.TotalQueueCallAlertingTime  =  src.TotalQueueCallAlertingTime
, tar.TotalDirectCallAlertingTime  =  src.TotalDirectCallAlertingTime
, tar.TotalQueueEmailTime  =  src.TotalQueueEmailTime
, tar.TotalOtherEmailTime  =  src.TotalOtherEmailTime
, tar.TotalQueueWebChatTime  =  src.TotalQueueWebChatTime
, tar.TotalOtherWebChatTime  =  src.TotalOtherWebChatTime
, tar.TotalWrapUpTime  =  src.TotalWrapUpTime
, tar.TotalReadyTime  =  src.TotalReadyTime
, tar.TotalNotReadyTime  =  src.TotalNotReadyTime
, tar.TotalMonitoringTime  =  src.TotalMonitoringTime
, tar.RolledUp  =  src.RolledUp
, tar.TotalCallSetupTime  =  src.TotalCallSetupTime
, tar.TransferredQueueEmailsReceived  =  src.TransferredQueueEmailsReceived
, tar.TransferredOtherEmailsReceived  =  src.TransferredOtherEmailsReceived
, tar.QueueEmailsTransferred  =  src.QueueEmailsTransferred
, tar.OtherEmailsTransferred  =  src.OtherEmailsTransferred
, tar.TotalQueueIMAlertingTime  =  src.TotalQueueIMAlertingTime
, tar.TotalDirectIMAlertingTime  =  src.TotalDirectIMAlertingTime
, tar.TotalQueueEmailAlertingTime  =  src.TotalQueueEmailAlertingTime
, tar.TotalDirectEmailAlertingTime  =  src.TotalDirectEmailAlertingTime
, tar.TotalIMWrapUpTime  =  src.TotalIMWrapUpTime
, tar.QueueCallsStoppedAlerting  =  src.QueueCallsStoppedAlerting
, tar.OtherCallsStoppedAlerting  =  src.OtherCallsStoppedAlerting
, tar.QueueImsStoppedAlerting  =  src.QueueImsStoppedAlerting
, tar.OtherImsStoppedAlerting  =  src.OtherImsStoppedAlerting
, tar.QueueEmailsStoppedAlerting  =  src.QueueEmailsStoppedAlerting
, tar.OtherEmailsStoppedAlerting  =  src.OtherEmailsStoppedAlerting
, tar.QueueImsUnAnswered  =  src.QueueImsUnAnswered
, tar.OtherImsUnAnswered  =  src.OtherImsUnAnswered
, tar.QueueEmailsUnAnswered  =  src.QueueEmailsUnAnswered
, tar.OtherEmailsUnAnswered  =  src.OtherEmailsUnAnswered
, tar.OutboundIMsMade  =  src.OutboundIMsMade
, tar.InternalIMsMade  =  src.InternalIMsMade
, tar.TotalOutboundIMTime  =  src.TotalOutboundIMTime
, tar.TotalInternalIMTime  =  src.TotalInternalIMTime
, tar.TransferredQueueIMReceived  =  src.TransferredQueueIMReceived
, tar.TransferredOtherIMReceived  =  src.TransferredOtherIMReceived
, tar.ConsultationQueueIMPlaced  =  src.ConsultationQueueIMPlaced
, tar.ConsultationOtherIMPlaced  =  src.ConsultationOtherIMPlaced
, tar.ConsultXferQueueIMCompleted  =  src.ConsultXferQueueIMCompleted
, tar.ConsultXferOtherIMCompleted  =  src.ConsultXferOtherIMCompleted
, tar.BlindXferQueueIMPlaced  =  src.BlindXferQueueIMPlaced
, tar.BlindXferOtherIMPlaced  =  src.BlindXferOtherIMPlaced
, tar.ConferenceQueueIMInitiated  =  src.ConferenceQueueIMInitiated
, tar.ConferenceOtherIMInitiated  =  src.ConferenceOtherIMInitiated
, tar.TotalHoldingTimeQueueIM  =  src.TotalHoldingTimeQueueIM
, tar.TotalHoldingTimeOtherIM  =  src.TotalHoldingTimeOtherIM
, tar.TotalConsultationTimeQueueIM  =  src.TotalConsultationTimeQueueIM
, tar.TotalConsultationTimeOtherIM  =  src.TotalConsultationTimeOtherIM
, tar.TotalConferenceTimeQueueIM  =  src.TotalConferenceTimeQueueIM
, tar.TotalConferenceTimeOtherIM  =  src.TotalConferenceTimeOtherIM
, tar.TotalIMSetupTime  =  src.TotalIMSetupTime
, tar.OutboundEmailsMade  =  src.OutboundEmailsMade
, tar.InternalEmailsMade  =  src.InternalEmailsMade
, tar.TotalOutboundEmailTime  =  src.TotalOutboundEmailTime
, tar.TotalInternalEmailTime  =  src.TotalInternalEmailTime

WHEN NOT MATCHED THEN
   INSERT
   (
StartDateTime
, DSTStatus
, SwitchID
, AgentID
, IntervalDuration
, IntervalID
, QueueCallsReceived
, DirectCallsReceived
, OutboundCallsMade
, InternalCallsMade
, TransferredQueueCallsReceived
, TransferredOtherCallsReceived
, ConsultationQueueCallsPlaced
, ConsultationOtherCallsPlaced
, ConsultXferQueueCallsCompleted
, ConsultXferOtherCallsCompleted
, BlindXferQueueCallsPlaced
, BlindXferOtherCallsPlaced
, ConferenceQueueCallsInitiated
, ConferenceOtherCallsInitiated
, QueueCallsUnAnswered
, OtherCallsUnAnswered
, QueuedEmailsReceived
, OtherEmailsReceived
, QueuedWebChatsReceived
, OtherWebChatsReceived
, LogonDuration
, TotalQueueCallTime
, TotalDirectCallTime
, TotalOutboundCallTime
, TotalInternalCallTime
, TotalHoldingTimeQueueCalls
, TotalHoldingTimeOtherCalls
, TotalConsultationTimeQueueCalls
, TotalConsultationTimeOtherCalls
, TotalConferenceTimeQueueCalls
, TotalConferenceTimeOtherCalls
, TotalQueueCallAlertingTime
, TotalDirectCallAlertingTime
, TotalQueueEmailTime
, TotalOtherEmailTime
, TotalQueueWebChatTime
, TotalOtherWebChatTime
, TotalWrapUpTime
, TotalReadyTime
, TotalNotReadyTime
, TotalMonitoringTime
, RolledUp
, TotalCallSetupTime
, TransferredQueueEmailsReceived
, TransferredOtherEmailsReceived
, QueueEmailsTransferred
, OtherEmailsTransferred
, TotalQueueIMAlertingTime
, TotalDirectIMAlertingTime
, TotalQueueEmailAlertingTime
, TotalDirectEmailAlertingTime
, TotalIMWrapUpTime
, QueueCallsStoppedAlerting
, OtherCallsStoppedAlerting
, QueueImsStoppedAlerting
, OtherImsStoppedAlerting
, QueueEmailsStoppedAlerting
, OtherEmailsStoppedAlerting
, QueueImsUnAnswered
, OtherImsUnAnswered
, QueueEmailsUnAnswered
, OtherEmailsUnAnswered
, OutboundIMsMade
, InternalIMsMade
, TotalOutboundIMTime
, TotalInternalIMTime
, TransferredQueueIMReceived
, TransferredOtherIMReceived
, ConsultationQueueIMPlaced
, ConsultationOtherIMPlaced
, ConsultXferQueueIMCompleted
, ConsultXferOtherIMCompleted
, BlindXferQueueIMPlaced
, BlindXferOtherIMPlaced
, ConferenceQueueIMInitiated
, ConferenceOtherIMInitiated
, TotalHoldingTimeQueueIM
, TotalHoldingTimeOtherIM
, TotalConsultationTimeQueueIM
, TotalConsultationTimeOtherIM
, TotalConferenceTimeQueueIM
, TotalConferenceTimeOtherIM
, TotalIMSetupTime
, OutboundEmailsMade
, InternalEmailsMade
, TotalOutboundEmailTime
, TotalInternalEmailTime
   )
   VALUES
   (
src.StartDateTime
, src.DSTStatus
, src.SwitchID
, src.AgentID
, src.IntervalDuration
, src.IntervalID
, src.QueueCallsReceived
, src.DirectCallsReceived
, src.OutboundCallsMade
, src.InternalCallsMade
, src.TransferredQueueCallsReceived
, src.TransferredOtherCallsReceived
, src.ConsultationQueueCallsPlaced
, src.ConsultationOtherCallsPlaced
, src.ConsultXferQueueCallsCompleted
, src.ConsultXferOtherCallsCompleted
, src.BlindXferQueueCallsPlaced
, src.BlindXferOtherCallsPlaced
, src.ConferenceQueueCallsInitiated
, src.ConferenceOtherCallsInitiated
, src.QueueCallsUnAnswered
, src.OtherCallsUnAnswered
, src.QueuedEmailsReceived
, src.OtherEmailsReceived
, src.QueuedWebChatsReceived
, src.OtherWebChatsReceived
, src.LogonDuration
, src.TotalQueueCallTime
, src.TotalDirectCallTime
, src.TotalOutboundCallTime
, src.TotalInternalCallTime
, src.TotalHoldingTimeQueueCalls
, src.TotalHoldingTimeOtherCalls
, src.TotalConsultationTimeQueueCalls
, src.TotalConsultationTimeOtherCalls
, src.TotalConferenceTimeQueueCalls
, src.TotalConferenceTimeOtherCalls
, src.TotalQueueCallAlertingTime
, src.TotalDirectCallAlertingTime
, src.TotalQueueEmailTime
, src.TotalOtherEmailTime
, src.TotalQueueWebChatTime
, src.TotalOtherWebChatTime
, src.TotalWrapUpTime
, src.TotalReadyTime
, src.TotalNotReadyTime
, src.TotalMonitoringTime
, src.RolledUp
, src.TotalCallSetupTime
, src.TransferredQueueEmailsReceived
, src.TransferredOtherEmailsReceived
, src.QueueEmailsTransferred
, src.OtherEmailsTransferred
, src.TotalQueueIMAlertingTime
, src.TotalDirectIMAlertingTime
, src.TotalQueueEmailAlertingTime
, src.TotalDirectEmailAlertingTime
, src.TotalIMWrapUpTime
, src.QueueCallsStoppedAlerting
, src.OtherCallsStoppedAlerting
, src.QueueImsStoppedAlerting
, src.OtherImsStoppedAlerting
, src.QueueEmailsStoppedAlerting
, src.OtherEmailsStoppedAlerting
, src.QueueImsUnAnswered
, src.OtherImsUnAnswered
, src.QueueEmailsUnAnswered
, src.OtherEmailsUnAnswered
, src.OutboundIMsMade
, src.InternalIMsMade
, src.TotalOutboundIMTime
, src.TotalInternalIMTime
, src.TransferredQueueIMReceived
, src.TransferredOtherIMReceived
, src.ConsultationQueueIMPlaced
, src.ConsultationOtherIMPlaced
, src.ConsultXferQueueIMCompleted
, src.ConsultXferOtherIMCompleted
, src.BlindXferQueueIMPlaced
, src.BlindXferOtherIMPlaced
, src.ConferenceQueueIMInitiated
, src.ConferenceOtherIMInitiated
, src.TotalHoldingTimeQueueIM
, src.TotalHoldingTimeOtherIM
, src.TotalConsultationTimeQueueIM
, src.TotalConsultationTimeOtherIM
, src.TotalConferenceTimeQueueIM
, src.TotalConferenceTimeOtherIM
, src.TotalIMSetupTime
, src.OutboundEmailsMade
, src.InternalEmailsMade
, src.TotalOutboundEmailTime
, src.TotalInternalEmailTime
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentActivity_M', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentActivity_M.dat', N'MERGE [dbo].[Stat_AgentActivity_M] AS tar
USING [dbo].[z_Stat_AgentActivity_M] AS src
ON tar.StartDateTime = src.StartDateTime   AND tar.AgentID  =  src.AgentID  AND tar.SwitchID = src.SwitchID
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.QueueCallsReceived  =  src.QueueCallsReceived
, tar.DirectCallsReceived  =  src.DirectCallsReceived
, tar.OutboundCallsMade  =  src.OutboundCallsMade
, tar.InternalCallsMade  =  src.InternalCallsMade
, tar.TransferredQueueCallsReceived  =  src.TransferredQueueCallsReceived
, tar.TransferredOtherCallsReceived  =  src.TransferredOtherCallsReceived
, tar.ConsultationQueueCallsPlaced  =  src.ConsultationQueueCallsPlaced
, tar.ConsultationOtherCallsPlaced  =  src.ConsultationOtherCallsPlaced
, tar.ConsultXferQueueCallsCompleted  =  src.ConsultXferQueueCallsCompleted
, tar.ConsultXferOtherCallsCompleted  =  src.ConsultXferOtherCallsCompleted
, tar.BlindXferQueueCallsPlaced  =  src.BlindXferQueueCallsPlaced
, tar.BlindXferOtherCallsPlaced  =  src.BlindXferOtherCallsPlaced
, tar.ConferenceQueueCallsInitiated  =  src.ConferenceQueueCallsInitiated
, tar.ConferenceOtherCallsInitiated  =  src.ConferenceOtherCallsInitiated
, tar.QueueCallsUnAnswered  =  src.QueueCallsUnAnswered
, tar.OtherCallsUnAnswered  =  src.OtherCallsUnAnswered
, tar.QueuedEmailsReceived  =  src.QueuedEmailsReceived
, tar.OtherEmailsReceived  =  src.OtherEmailsReceived
, tar.QueuedWebChatsReceived  =  src.QueuedWebChatsReceived
, tar.OtherWebChatsReceived  =  src.OtherWebChatsReceived
, tar.LogonDuration  =  src.LogonDuration
, tar.TotalQueueCallTime  =  src.TotalQueueCallTime
, tar.TotalDirectCallTime  =  src.TotalDirectCallTime
, tar.TotalOutboundCallTime  =  src.TotalOutboundCallTime
, tar.TotalInternalCallTime  =  src.TotalInternalCallTime
, tar.TotalHoldingTimeQueueCalls  =  src.TotalHoldingTimeQueueCalls
, tar.TotalHoldingTimeOtherCalls  =  src.TotalHoldingTimeOtherCalls
, tar.TotalConsultationTimeQueueCalls  =  src.TotalConsultationTimeQueueCalls
, tar.TotalConsultationTimeOtherCalls  =  src.TotalConsultationTimeOtherCalls
, tar.TotalConferenceTimeQueueCalls  =  src.TotalConferenceTimeQueueCalls
, tar.TotalConferenceTimeOtherCalls  =  src.TotalConferenceTimeOtherCalls
, tar.TotalQueueCallAlertingTime  =  src.TotalQueueCallAlertingTime
, tar.TotalDirectCallAlertingTime  =  src.TotalDirectCallAlertingTime
, tar.TotalQueueEmailTime  =  src.TotalQueueEmailTime
, tar.TotalOtherEmailTime  =  src.TotalOtherEmailTime
, tar.TotalQueueWebChatTime  =  src.TotalQueueWebChatTime
, tar.TotalOtherWebChatTime  =  src.TotalOtherWebChatTime
, tar.TotalWrapUpTime  =  src.TotalWrapUpTime
, tar.TotalReadyTime  =  src.TotalReadyTime
, tar.TotalNotReadyTime  =  src.TotalNotReadyTime
, tar.TotalMonitoringTime  =  src.TotalMonitoringTime
, tar.TotalCallSetupTime  =  src.TotalCallSetupTime
, tar.TransferredQueueEmailsReceived  =  src.TransferredQueueEmailsReceived
, tar.TransferredOtherEmailsReceived  =  src.TransferredOtherEmailsReceived
, tar.QueueEmailsTransferred  =  src.QueueEmailsTransferred
, tar.OtherEmailsTransferred  =  src.OtherEmailsTransferred
, tar.TotalQueueIMAlertingTime  =  src.TotalQueueIMAlertingTime
, tar.TotalDirectIMAlertingTime  =  src.TotalDirectIMAlertingTime
, tar.TotalQueueEmailAlertingTime  =  src.TotalQueueEmailAlertingTime
, tar.TotalDirectEmailAlertingTime  =  src.TotalDirectEmailAlertingTime
, tar.TotalIMWrapUpTime  =  src.TotalIMWrapUpTime
, tar.QueueCallsStoppedAlerting  =  src.QueueCallsStoppedAlerting
, tar.OtherCallsStoppedAlerting  =  src.OtherCallsStoppedAlerting
, tar.QueueImsStoppedAlerting  =  src.QueueImsStoppedAlerting
, tar.OtherImsStoppedAlerting  =  src.OtherImsStoppedAlerting
, tar.QueueEmailsStoppedAlerting  =  src.QueueEmailsStoppedAlerting
, tar.OtherEmailsStoppedAlerting  =  src.OtherEmailsStoppedAlerting
, tar.QueueImsUnAnswered  =  src.QueueImsUnAnswered
, tar.OtherImsUnAnswered  =  src.OtherImsUnAnswered
, tar.QueueEmailsUnAnswered  =  src.QueueEmailsUnAnswered
, tar.OtherEmailsUnAnswered  =  src.OtherEmailsUnAnswered
, tar.OutboundIMsMade  =  src.OutboundIMsMade
, tar.InternalIMsMade  =  src.InternalIMsMade
, tar.TotalOutboundIMTime  =  src.TotalOutboundIMTime
, tar.TotalInternalIMTime  =  src.TotalInternalIMTime
, tar.TransferredQueueIMReceived  =  src.TransferredQueueIMReceived
, tar.TransferredOtherIMReceived  =  src.TransferredOtherIMReceived
, tar.ConsultationQueueIMPlaced  =  src.ConsultationQueueIMPlaced
, tar.ConsultationOtherIMPlaced  =  src.ConsultationOtherIMPlaced
, tar.ConsultXferQueueIMCompleted  =  src.ConsultXferQueueIMCompleted
, tar.ConsultXferOtherIMCompleted  =  src.ConsultXferOtherIMCompleted
, tar.BlindXferQueueIMPlaced  =  src.BlindXferQueueIMPlaced
, tar.BlindXferOtherIMPlaced  =  src.BlindXferOtherIMPlaced
, tar.ConferenceQueueIMInitiated  =  src.ConferenceQueueIMInitiated
, tar.ConferenceOtherIMInitiated  =  src.ConferenceOtherIMInitiated
, tar.TotalHoldingTimeQueueIM  =  src.TotalHoldingTimeQueueIM
, tar.TotalHoldingTimeOtherIM  =  src.TotalHoldingTimeOtherIM
, tar.TotalConsultationTimeQueueIM  =  src.TotalConsultationTimeQueueIM
, tar.TotalConsultationTimeOtherIM  =  src.TotalConsultationTimeOtherIM
, tar.TotalConferenceTimeQueueIM  =  src.TotalConferenceTimeQueueIM
, tar.TotalConferenceTimeOtherIM  =  src.TotalConferenceTimeOtherIM
, tar.TotalIMSetupTime  =  src.TotalIMSetupTime
, tar.OutboundEmailsMade  =  src.OutboundEmailsMade
, tar.InternalEmailsMade  =  src.InternalEmailsMade
, tar.TotalOutboundEmailTime  =  src.TotalOutboundEmailTime
, tar.TotalInternalEmailTime  =  src.TotalInternalEmailTime
WHEN NOT MATCHED THEN
   INSERT
   (
StartDateTime
, SwitchID
, AgentID
, QueueCallsReceived
, DirectCallsReceived
, OutboundCallsMade
, InternalCallsMade
, TransferredQueueCallsReceived
, TransferredOtherCallsReceived
, ConsultationQueueCallsPlaced
, ConsultationOtherCallsPlaced
, ConsultXferQueueCallsCompleted
, ConsultXferOtherCallsCompleted
, BlindXferQueueCallsPlaced
, BlindXferOtherCallsPlaced
, ConferenceQueueCallsInitiated
, ConferenceOtherCallsInitiated
, QueueCallsUnAnswered
, OtherCallsUnAnswered
, QueuedEmailsReceived
, OtherEmailsReceived
, QueuedWebChatsReceived
, OtherWebChatsReceived
, LogonDuration
, TotalQueueCallTime
, TotalDirectCallTime
, TotalOutboundCallTime
, TotalInternalCallTime
, TotalHoldingTimeQueueCalls
, TotalHoldingTimeOtherCalls
, TotalConsultationTimeQueueCalls
, TotalConsultationTimeOtherCalls
, TotalConferenceTimeQueueCalls
, TotalConferenceTimeOtherCalls
, TotalQueueCallAlertingTime
, TotalDirectCallAlertingTime
, TotalQueueEmailTime
, TotalOtherEmailTime
, TotalQueueWebChatTime
, TotalOtherWebChatTime
, TotalWrapUpTime
, TotalReadyTime
, TotalNotReadyTime
, TotalMonitoringTime
, TotalCallSetupTime
, TransferredQueueEmailsReceived
, TransferredOtherEmailsReceived
, QueueEmailsTransferred
, OtherEmailsTransferred
, TotalQueueIMAlertingTime
, TotalDirectIMAlertingTime
, TotalQueueEmailAlertingTime
, TotalDirectEmailAlertingTime
, TotalIMWrapUpTime
, QueueCallsStoppedAlerting
, OtherCallsStoppedAlerting
, QueueImsStoppedAlerting
, OtherImsStoppedAlerting
, QueueEmailsStoppedAlerting
, OtherEmailsStoppedAlerting
, QueueImsUnAnswered
, OtherImsUnAnswered
, QueueEmailsUnAnswered
, OtherEmailsUnAnswered
, OutboundIMsMade
, InternalIMsMade
, TotalOutboundIMTime
, TotalInternalIMTime
, TransferredQueueIMReceived
, TransferredOtherIMReceived
, ConsultationQueueIMPlaced
, ConsultationOtherIMPlaced
, ConsultXferQueueIMCompleted
, ConsultXferOtherIMCompleted
, BlindXferQueueIMPlaced
, BlindXferOtherIMPlaced
, ConferenceQueueIMInitiated
, ConferenceOtherIMInitiated
, TotalHoldingTimeQueueIM
, TotalHoldingTimeOtherIM
, TotalConsultationTimeQueueIM
, TotalConsultationTimeOtherIM
, TotalConferenceTimeQueueIM
, TotalConferenceTimeOtherIM
, TotalIMSetupTime
, OutboundEmailsMade
, InternalEmailsMade
, TotalOutboundEmailTime
, TotalInternalEmailTime
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.AgentID
, src.QueueCallsReceived
, src.DirectCallsReceived
, src.OutboundCallsMade
, src.InternalCallsMade
, src.TransferredQueueCallsReceived
, src.TransferredOtherCallsReceived
, src.ConsultationQueueCallsPlaced
, src.ConsultationOtherCallsPlaced
, src.ConsultXferQueueCallsCompleted
, src.ConsultXferOtherCallsCompleted
, src.BlindXferQueueCallsPlaced
, src.BlindXferOtherCallsPlaced
, src.ConferenceQueueCallsInitiated
, src.ConferenceOtherCallsInitiated
, src.QueueCallsUnAnswered
, src.OtherCallsUnAnswered
, src.QueuedEmailsReceived
, src.OtherEmailsReceived
, src.QueuedWebChatsReceived
, src.OtherWebChatsReceived
, src.LogonDuration
, src.TotalQueueCallTime
, src.TotalDirectCallTime
, src.TotalOutboundCallTime
, src.TotalInternalCallTime
, src.TotalHoldingTimeQueueCalls
, src.TotalHoldingTimeOtherCalls
, src.TotalConsultationTimeQueueCalls
, src.TotalConsultationTimeOtherCalls
, src.TotalConferenceTimeQueueCalls
, src.TotalConferenceTimeOtherCalls
, src.TotalQueueCallAlertingTime
, src.TotalDirectCallAlertingTime
, src.TotalQueueEmailTime
, src.TotalOtherEmailTime
, src.TotalQueueWebChatTime
, src.TotalOtherWebChatTime
, src.TotalWrapUpTime
, src.TotalReadyTime
, src.TotalNotReadyTime
, src.TotalMonitoringTime
, src.TotalCallSetupTime
, src.TransferredQueueEmailsReceived
, src.TransferredOtherEmailsReceived
, src.QueueEmailsTransferred
, src.OtherEmailsTransferred
, src.TotalQueueIMAlertingTime
, src.TotalDirectIMAlertingTime
, src.TotalQueueEmailAlertingTime
, src.TotalDirectEmailAlertingTime
, src.TotalIMWrapUpTime
, src.QueueCallsStoppedAlerting
, src.OtherCallsStoppedAlerting
, src.QueueImsStoppedAlerting
, src.OtherImsStoppedAlerting
, src.QueueEmailsStoppedAlerting
, src.OtherEmailsStoppedAlerting
, src.QueueImsUnAnswered
, src.OtherImsUnAnswered
, src.QueueEmailsUnAnswered
, src.OtherEmailsUnAnswered
, src.OutboundIMsMade
, src.InternalIMsMade
, src.TotalOutboundIMTime
, src.TotalInternalIMTime
, src.TransferredQueueIMReceived
, src.TransferredOtherIMReceived
, src.ConsultationQueueIMPlaced
, src.ConsultationOtherIMPlaced
, src.ConsultXferQueueIMCompleted
, src.ConsultXferOtherIMCompleted
, src.BlindXferQueueIMPlaced
, src.BlindXferOtherIMPlaced
, src.ConferenceQueueIMInitiated
, src.ConferenceOtherIMInitiated
, src.TotalHoldingTimeQueueIM
, src.TotalHoldingTimeOtherIM
, src.TotalConsultationTimeQueueIM
, src.TotalConsultationTimeOtherIM
, src.TotalConferenceTimeQueueIM
, src.TotalConferenceTimeOtherIM
, src.TotalIMSetupTime
, src.OutboundEmailsMade
, src.InternalEmailsMade
, src.TotalOutboundEmailTime
, src.TotalInternalEmailTime
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentActivity_W', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentActivity_W.dat', N'MERGE [dbo].[Stat_AgentActivity_W] AS tar
USING [dbo].[z_Stat_AgentActivity_W] AS src
ON tar.StartDateTime = src.StartDateTime   AND tar.AgentID  =  src.AgentID  AND tar.SwitchID = src.SwitchID
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.QueueCallsReceived  =  src.QueueCallsReceived
, tar.DirectCallsReceived  =  src.DirectCallsReceived
, tar.OutboundCallsMade  =  src.OutboundCallsMade
, tar.InternalCallsMade  =  src.InternalCallsMade
, tar.TransferredQueueCallsReceived  =  src.TransferredQueueCallsReceived
, tar.TransferredOtherCallsReceived  =  src.TransferredOtherCallsReceived
, tar.ConsultationQueueCallsPlaced  =  src.ConsultationQueueCallsPlaced
, tar.ConsultationOtherCallsPlaced  =  src.ConsultationOtherCallsPlaced
, tar.ConsultXferQueueCallsCompleted  =  src.ConsultXferQueueCallsCompleted
, tar.ConsultXferOtherCallsCompleted  =  src.ConsultXferOtherCallsCompleted
, tar.BlindXferQueueCallsPlaced  =  src.BlindXferQueueCallsPlaced
, tar.BlindXferOtherCallsPlaced  =  src.BlindXferOtherCallsPlaced
, tar.ConferenceQueueCallsInitiated  =  src.ConferenceQueueCallsInitiated
, tar.ConferenceOtherCallsInitiated  =  src.ConferenceOtherCallsInitiated
, tar.QueueCallsUnAnswered  =  src.QueueCallsUnAnswered
, tar.OtherCallsUnAnswered  =  src.OtherCallsUnAnswered
, tar.QueuedEmailsReceived  =  src.QueuedEmailsReceived
, tar.OtherEmailsReceived  =  src.OtherEmailsReceived
, tar.QueuedWebChatsReceived  =  src.QueuedWebChatsReceived
, tar.OtherWebChatsReceived  =  src.OtherWebChatsReceived
, tar.LogonDuration  =  src.LogonDuration
, tar.TotalQueueCallTime  =  src.TotalQueueCallTime
, tar.TotalDirectCallTime  =  src.TotalDirectCallTime
, tar.TotalOutboundCallTime  =  src.TotalOutboundCallTime
, tar.TotalInternalCallTime  =  src.TotalInternalCallTime
, tar.TotalHoldingTimeQueueCalls  =  src.TotalHoldingTimeQueueCalls
, tar.TotalHoldingTimeOtherCalls  =  src.TotalHoldingTimeOtherCalls
, tar.TotalConsultationTimeQueueCalls  =  src.TotalConsultationTimeQueueCalls
, tar.TotalConsultationTimeOtherCalls  =  src.TotalConsultationTimeOtherCalls
, tar.TotalConferenceTimeQueueCalls  =  src.TotalConferenceTimeQueueCalls
, tar.TotalConferenceTimeOtherCalls  =  src.TotalConferenceTimeOtherCalls
, tar.TotalQueueCallAlertingTime  =  src.TotalQueueCallAlertingTime
, tar.TotalDirectCallAlertingTime  =  src.TotalDirectCallAlertingTime
, tar.TotalQueueEmailTime  =  src.TotalQueueEmailTime
, tar.TotalOtherEmailTime  =  src.TotalOtherEmailTime
, tar.TotalQueueWebChatTime  =  src.TotalQueueWebChatTime
, tar.TotalOtherWebChatTime  =  src.TotalOtherWebChatTime
, tar.TotalWrapUpTime  =  src.TotalWrapUpTime
, tar.TotalReadyTime  =  src.TotalReadyTime
, tar.TotalNotReadyTime  =  src.TotalNotReadyTime
, tar.TotalMonitoringTime  =  src.TotalMonitoringTime
, tar.TotalCallSetupTime  =  src.TotalCallSetupTime
, tar.TransferredQueueEmailsReceived  =  src.TransferredQueueEmailsReceived
, tar.TransferredOtherEmailsReceived  =  src.TransferredOtherEmailsReceived
, tar.QueueEmailsTransferred  =  src.QueueEmailsTransferred
, tar.OtherEmailsTransferred  =  src.OtherEmailsTransferred
, tar.TotalQueueIMAlertingTime  =  src.TotalQueueIMAlertingTime
, tar.TotalDirectIMAlertingTime  =  src.TotalDirectIMAlertingTime
, tar.TotalQueueEmailAlertingTime  =  src.TotalQueueEmailAlertingTime
, tar.TotalDirectEmailAlertingTime  =  src.TotalDirectEmailAlertingTime
, tar.TotalIMWrapUpTime  =  src.TotalIMWrapUpTime
, tar.QueueCallsStoppedAlerting  =  src.QueueCallsStoppedAlerting
, tar.OtherCallsStoppedAlerting  =  src.OtherCallsStoppedAlerting
, tar.QueueImsStoppedAlerting  =  src.QueueImsStoppedAlerting
, tar.OtherImsStoppedAlerting  =  src.OtherImsStoppedAlerting
, tar.QueueEmailsStoppedAlerting  =  src.QueueEmailsStoppedAlerting
, tar.OtherEmailsStoppedAlerting  =  src.OtherEmailsStoppedAlerting
, tar.QueueImsUnAnswered  =  src.QueueImsUnAnswered
, tar.OtherImsUnAnswered  =  src.OtherImsUnAnswered
, tar.QueueEmailsUnAnswered  =  src.QueueEmailsUnAnswered
, tar.OtherEmailsUnAnswered  =  src.OtherEmailsUnAnswered
, tar.OutboundIMsMade  =  src.OutboundIMsMade
, tar.InternalIMsMade  =  src.InternalIMsMade
, tar.TotalOutboundIMTime  =  src.TotalOutboundIMTime
, tar.TotalInternalIMTime  =  src.TotalInternalIMTime
, tar.TransferredQueueIMReceived  =  src.TransferredQueueIMReceived
, tar.TransferredOtherIMReceived  =  src.TransferredOtherIMReceived
, tar.ConsultationQueueIMPlaced  =  src.ConsultationQueueIMPlaced
, tar.ConsultationOtherIMPlaced  =  src.ConsultationOtherIMPlaced
, tar.ConsultXferQueueIMCompleted  =  src.ConsultXferQueueIMCompleted
, tar.ConsultXferOtherIMCompleted  =  src.ConsultXferOtherIMCompleted
, tar.BlindXferQueueIMPlaced  =  src.BlindXferQueueIMPlaced
, tar.BlindXferOtherIMPlaced  =  src.BlindXferOtherIMPlaced
, tar.ConferenceQueueIMInitiated  =  src.ConferenceQueueIMInitiated
, tar.ConferenceOtherIMInitiated  =  src.ConferenceOtherIMInitiated
, tar.TotalHoldingTimeQueueIM  =  src.TotalHoldingTimeQueueIM
, tar.TotalHoldingTimeOtherIM  =  src.TotalHoldingTimeOtherIM
, tar.TotalConsultationTimeQueueIM  =  src.TotalConsultationTimeQueueIM
, tar.TotalConsultationTimeOtherIM  =  src.TotalConsultationTimeOtherIM
, tar.TotalConferenceTimeQueueIM  =  src.TotalConferenceTimeQueueIM
, tar.TotalConferenceTimeOtherIM  =  src.TotalConferenceTimeOtherIM
, tar.TotalIMSetupTime  =  src.TotalIMSetupTime
, tar.OutboundEmailsMade  =  src.OutboundEmailsMade
, tar.InternalEmailsMade  =  src.InternalEmailsMade
, tar.TotalOutboundEmailTime  =  src.TotalOutboundEmailTime
, tar.TotalInternalEmailTime  =  src.TotalInternalEmailTime
WHEN NOT MATCHED THEN
   INSERT
   (
StartDateTime
, SwitchID
, AgentID
, QueueCallsReceived
, DirectCallsReceived
, OutboundCallsMade
, InternalCallsMade
, TransferredQueueCallsReceived
, TransferredOtherCallsReceived
, ConsultationQueueCallsPlaced
, ConsultationOtherCallsPlaced
, ConsultXferQueueCallsCompleted
, ConsultXferOtherCallsCompleted
, BlindXferQueueCallsPlaced
, BlindXferOtherCallsPlaced
, ConferenceQueueCallsInitiated
, ConferenceOtherCallsInitiated
, QueueCallsUnAnswered
, OtherCallsUnAnswered
, QueuedEmailsReceived
, OtherEmailsReceived
, QueuedWebChatsReceived
, OtherWebChatsReceived
, LogonDuration
, TotalQueueCallTime
, TotalDirectCallTime
, TotalOutboundCallTime
, TotalInternalCallTime
, TotalHoldingTimeQueueCalls
, TotalHoldingTimeOtherCalls
, TotalConsultationTimeQueueCalls
, TotalConsultationTimeOtherCalls
, TotalConferenceTimeQueueCalls
, TotalConferenceTimeOtherCalls
, TotalQueueCallAlertingTime
, TotalDirectCallAlertingTime
, TotalQueueEmailTime
, TotalOtherEmailTime
, TotalQueueWebChatTime
, TotalOtherWebChatTime
, TotalWrapUpTime
, TotalReadyTime
, TotalNotReadyTime
, TotalMonitoringTime
, TotalCallSetupTime
, TransferredQueueEmailsReceived
, TransferredOtherEmailsReceived
, QueueEmailsTransferred
, OtherEmailsTransferred
, TotalQueueIMAlertingTime
, TotalDirectIMAlertingTime
, TotalQueueEmailAlertingTime
, TotalDirectEmailAlertingTime
, TotalIMWrapUpTime
, QueueCallsStoppedAlerting
, OtherCallsStoppedAlerting
, QueueImsStoppedAlerting
, OtherImsStoppedAlerting
, QueueEmailsStoppedAlerting
, OtherEmailsStoppedAlerting
, QueueImsUnAnswered
, OtherImsUnAnswered
, QueueEmailsUnAnswered
, OtherEmailsUnAnswered
, OutboundIMsMade
, InternalIMsMade
, TotalOutboundIMTime
, TotalInternalIMTime
, TransferredQueueIMReceived
, TransferredOtherIMReceived
, ConsultationQueueIMPlaced
, ConsultationOtherIMPlaced
, ConsultXferQueueIMCompleted
, ConsultXferOtherIMCompleted
, BlindXferQueueIMPlaced
, BlindXferOtherIMPlaced
, ConferenceQueueIMInitiated
, ConferenceOtherIMInitiated
, TotalHoldingTimeQueueIM
, TotalHoldingTimeOtherIM
, TotalConsultationTimeQueueIM
, TotalConsultationTimeOtherIM
, TotalConferenceTimeQueueIM
, TotalConferenceTimeOtherIM
, TotalIMSetupTime
, OutboundEmailsMade
, InternalEmailsMade
, TotalOutboundEmailTime
, TotalInternalEmailTime
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.AgentID
, src.QueueCallsReceived
, src.DirectCallsReceived
, src.OutboundCallsMade
, src.InternalCallsMade
, src.TransferredQueueCallsReceived
, src.TransferredOtherCallsReceived
, src.ConsultationQueueCallsPlaced
, src.ConsultationOtherCallsPlaced
, src.ConsultXferQueueCallsCompleted
, src.ConsultXferOtherCallsCompleted
, src.BlindXferQueueCallsPlaced
, src.BlindXferOtherCallsPlaced
, src.ConferenceQueueCallsInitiated
, src.ConferenceOtherCallsInitiated
, src.QueueCallsUnAnswered
, src.OtherCallsUnAnswered
, src.QueuedEmailsReceived
, src.OtherEmailsReceived
, src.QueuedWebChatsReceived
, src.OtherWebChatsReceived
, src.LogonDuration
, src.TotalQueueCallTime
, src.TotalDirectCallTime
, src.TotalOutboundCallTime
, src.TotalInternalCallTime
, src.TotalHoldingTimeQueueCalls
, src.TotalHoldingTimeOtherCalls
, src.TotalConsultationTimeQueueCalls
, src.TotalConsultationTimeOtherCalls
, src.TotalConferenceTimeQueueCalls
, src.TotalConferenceTimeOtherCalls
, src.TotalQueueCallAlertingTime
, src.TotalDirectCallAlertingTime
, src.TotalQueueEmailTime
, src.TotalOtherEmailTime
, src.TotalQueueWebChatTime
, src.TotalOtherWebChatTime
, src.TotalWrapUpTime
, src.TotalReadyTime
, src.TotalNotReadyTime
, src.TotalMonitoringTime
, src.TotalCallSetupTime
, src.TransferredQueueEmailsReceived
, src.TransferredOtherEmailsReceived
, src.QueueEmailsTransferred
, src.OtherEmailsTransferred
, src.TotalQueueIMAlertingTime
, src.TotalDirectIMAlertingTime
, src.TotalQueueEmailAlertingTime
, src.TotalDirectEmailAlertingTime
, src.TotalIMWrapUpTime
, src.QueueCallsStoppedAlerting
, src.OtherCallsStoppedAlerting
, src.QueueImsStoppedAlerting
, src.OtherImsStoppedAlerting
, src.QueueEmailsStoppedAlerting
, src.OtherEmailsStoppedAlerting
, src.QueueImsUnAnswered
, src.OtherImsUnAnswered
, src.QueueEmailsUnAnswered
, src.OtherEmailsUnAnswered
, src.OutboundIMsMade
, src.InternalIMsMade
, src.TotalOutboundIMTime
, src.TotalInternalIMTime
, src.TransferredQueueIMReceived
, src.TransferredOtherIMReceived
, src.ConsultationQueueIMPlaced
, src.ConsultationOtherIMPlaced
, src.ConsultXferQueueIMCompleted
, src.ConsultXferOtherIMCompleted
, src.BlindXferQueueIMPlaced
, src.BlindXferOtherIMPlaced
, src.ConferenceQueueIMInitiated
, src.ConferenceOtherIMInitiated
, src.TotalHoldingTimeQueueIM
, src.TotalHoldingTimeOtherIM
, src.TotalConsultationTimeQueueIM
, src.TotalConsultationTimeOtherIM
, src.TotalConferenceTimeQueueIM
, src.TotalConferenceTimeOtherIM
, src.TotalIMSetupTime
, src.OutboundEmailsMade
, src.InternalEmailsMade
, src.TotalOutboundEmailTime
, src.TotalInternalEmailTime
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentActivity_Y', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentActivity_Y.dat', N'MERGE [dbo].[Stat_AgentActivity_Y] AS tar
USING [dbo].[z_Stat_AgentActivity_Y] AS src
ON tar.StartDateTime = src.StartDateTime   AND tar.AgentID  =  src.AgentID  AND tar.SwitchID = src.SwitchID
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.QueueCallsReceived  =  src.QueueCallsReceived
, tar.DirectCallsReceived  =  src.DirectCallsReceived
, tar.OutboundCallsMade  =  src.OutboundCallsMade
, tar.InternalCallsMade  =  src.InternalCallsMade
, tar.TransferredQueueCallsReceived  =  src.TransferredQueueCallsReceived
, tar.TransferredOtherCallsReceived  =  src.TransferredOtherCallsReceived
, tar.ConsultationQueueCallsPlaced  =  src.ConsultationQueueCallsPlaced
, tar.ConsultationOtherCallsPlaced  =  src.ConsultationOtherCallsPlaced
, tar.ConsultXferQueueCallsCompleted  =  src.ConsultXferQueueCallsCompleted
, tar.ConsultXferOtherCallsCompleted  =  src.ConsultXferOtherCallsCompleted
, tar.BlindXferQueueCallsPlaced  =  src.BlindXferQueueCallsPlaced
, tar.BlindXferOtherCallsPlaced  =  src.BlindXferOtherCallsPlaced
, tar.ConferenceQueueCallsInitiated  =  src.ConferenceQueueCallsInitiated
, tar.ConferenceOtherCallsInitiated  =  src.ConferenceOtherCallsInitiated
, tar.QueueCallsUnAnswered  =  src.QueueCallsUnAnswered
, tar.OtherCallsUnAnswered  =  src.OtherCallsUnAnswered
, tar.QueuedEmailsReceived  =  src.QueuedEmailsReceived
, tar.OtherEmailsReceived  =  src.OtherEmailsReceived
, tar.QueuedWebChatsReceived  =  src.QueuedWebChatsReceived
, tar.OtherWebChatsReceived  =  src.OtherWebChatsReceived
, tar.LogonDuration  =  src.LogonDuration
, tar.TotalQueueCallTime  =  src.TotalQueueCallTime
, tar.TotalDirectCallTime  =  src.TotalDirectCallTime
, tar.TotalOutboundCallTime  =  src.TotalOutboundCallTime
, tar.TotalInternalCallTime  =  src.TotalInternalCallTime
, tar.TotalHoldingTimeQueueCalls  =  src.TotalHoldingTimeQueueCalls
, tar.TotalHoldingTimeOtherCalls  =  src.TotalHoldingTimeOtherCalls
, tar.TotalConsultationTimeQueueCalls  =  src.TotalConsultationTimeQueueCalls
, tar.TotalConsultationTimeOtherCalls  =  src.TotalConsultationTimeOtherCalls
, tar.TotalConferenceTimeQueueCalls  =  src.TotalConferenceTimeQueueCalls
, tar.TotalConferenceTimeOtherCalls  =  src.TotalConferenceTimeOtherCalls
, tar.TotalQueueCallAlertingTime  =  src.TotalQueueCallAlertingTime
, tar.TotalDirectCallAlertingTime  =  src.TotalDirectCallAlertingTime
, tar.TotalQueueEmailTime  =  src.TotalQueueEmailTime
, tar.TotalOtherEmailTime  =  src.TotalOtherEmailTime
, tar.TotalQueueWebChatTime  =  src.TotalQueueWebChatTime
, tar.TotalOtherWebChatTime  =  src.TotalOtherWebChatTime
, tar.TotalWrapUpTime  =  src.TotalWrapUpTime
, tar.TotalReadyTime  =  src.TotalReadyTime
, tar.TotalNotReadyTime  =  src.TotalNotReadyTime
, tar.TotalMonitoringTime  =  src.TotalMonitoringTime
, tar.TotalCallSetupTime  =  src.TotalCallSetupTime
, tar.TransferredQueueEmailsReceived  =  src.TransferredQueueEmailsReceived
, tar.TransferredOtherEmailsReceived  =  src.TransferredOtherEmailsReceived
, tar.QueueEmailsTransferred  =  src.QueueEmailsTransferred
, tar.OtherEmailsTransferred  =  src.OtherEmailsTransferred
, tar.TotalQueueIMAlertingTime  =  src.TotalQueueIMAlertingTime
, tar.TotalDirectIMAlertingTime  =  src.TotalDirectIMAlertingTime
, tar.TotalQueueEmailAlertingTime  =  src.TotalQueueEmailAlertingTime
, tar.TotalDirectEmailAlertingTime  =  src.TotalDirectEmailAlertingTime
, tar.TotalIMWrapUpTime  =  src.TotalIMWrapUpTime
, tar.QueueCallsStoppedAlerting  =  src.QueueCallsStoppedAlerting
, tar.OtherCallsStoppedAlerting  =  src.OtherCallsStoppedAlerting
, tar.QueueImsStoppedAlerting  =  src.QueueImsStoppedAlerting
, tar.OtherImsStoppedAlerting  =  src.OtherImsStoppedAlerting
, tar.QueueEmailsStoppedAlerting  =  src.QueueEmailsStoppedAlerting
, tar.OtherEmailsStoppedAlerting  =  src.OtherEmailsStoppedAlerting
, tar.QueueImsUnAnswered  =  src.QueueImsUnAnswered
, tar.OtherImsUnAnswered  =  src.OtherImsUnAnswered
, tar.QueueEmailsUnAnswered  =  src.QueueEmailsUnAnswered
, tar.OtherEmailsUnAnswered  =  src.OtherEmailsUnAnswered
, tar.OutboundIMsMade  =  src.OutboundIMsMade
, tar.InternalIMsMade  =  src.InternalIMsMade
, tar.TotalOutboundIMTime  =  src.TotalOutboundIMTime
, tar.TotalInternalIMTime  =  src.TotalInternalIMTime
, tar.TransferredQueueIMReceived  =  src.TransferredQueueIMReceived
, tar.TransferredOtherIMReceived  =  src.TransferredOtherIMReceived
, tar.ConsultationQueueIMPlaced  =  src.ConsultationQueueIMPlaced
, tar.ConsultationOtherIMPlaced  =  src.ConsultationOtherIMPlaced
, tar.ConsultXferQueueIMCompleted  =  src.ConsultXferQueueIMCompleted
, tar.ConsultXferOtherIMCompleted  =  src.ConsultXferOtherIMCompleted
, tar.BlindXferQueueIMPlaced  =  src.BlindXferQueueIMPlaced
, tar.BlindXferOtherIMPlaced  =  src.BlindXferOtherIMPlaced
, tar.ConferenceQueueIMInitiated  =  src.ConferenceQueueIMInitiated
, tar.ConferenceOtherIMInitiated  =  src.ConferenceOtherIMInitiated
, tar.TotalHoldingTimeQueueIM  =  src.TotalHoldingTimeQueueIM
, tar.TotalHoldingTimeOtherIM  =  src.TotalHoldingTimeOtherIM
, tar.TotalConsultationTimeQueueIM  =  src.TotalConsultationTimeQueueIM
, tar.TotalConsultationTimeOtherIM  =  src.TotalConsultationTimeOtherIM
, tar.TotalConferenceTimeQueueIM  =  src.TotalConferenceTimeQueueIM
, tar.TotalConferenceTimeOtherIM  =  src.TotalConferenceTimeOtherIM
, tar.TotalIMSetupTime  =  src.TotalIMSetupTime
, tar.OutboundEmailsMade  =  src.OutboundEmailsMade
, tar.InternalEmailsMade  =  src.InternalEmailsMade
, tar.TotalOutboundEmailTime  =  src.TotalOutboundEmailTime
, tar.TotalInternalEmailTime  =  src.TotalInternalEmailTime
WHEN NOT MATCHED THEN
   INSERT
   (
StartDateTime
, SwitchID
, AgentID
, QueueCallsReceived
, DirectCallsReceived
, OutboundCallsMade
, InternalCallsMade
, TransferredQueueCallsReceived
, TransferredOtherCallsReceived
, ConsultationQueueCallsPlaced
, ConsultationOtherCallsPlaced
, ConsultXferQueueCallsCompleted
, ConsultXferOtherCallsCompleted
, BlindXferQueueCallsPlaced
, BlindXferOtherCallsPlaced
, ConferenceQueueCallsInitiated
, ConferenceOtherCallsInitiated
, QueueCallsUnAnswered
, OtherCallsUnAnswered
, QueuedEmailsReceived
, OtherEmailsReceived
, QueuedWebChatsReceived
, OtherWebChatsReceived
, LogonDuration
, TotalQueueCallTime
, TotalDirectCallTime
, TotalOutboundCallTime
, TotalInternalCallTime
, TotalHoldingTimeQueueCalls
, TotalHoldingTimeOtherCalls
, TotalConsultationTimeQueueCalls
, TotalConsultationTimeOtherCalls
, TotalConferenceTimeQueueCalls
, TotalConferenceTimeOtherCalls
, TotalQueueCallAlertingTime
, TotalDirectCallAlertingTime
, TotalQueueEmailTime
, TotalOtherEmailTime
, TotalQueueWebChatTime
, TotalOtherWebChatTime
, TotalWrapUpTime
, TotalReadyTime
, TotalNotReadyTime
, TotalMonitoringTime
, TotalCallSetupTime
, TransferredQueueEmailsReceived
, TransferredOtherEmailsReceived
, QueueEmailsTransferred
, OtherEmailsTransferred
, TotalQueueIMAlertingTime
, TotalDirectIMAlertingTime
, TotalQueueEmailAlertingTime
, TotalDirectEmailAlertingTime
, TotalIMWrapUpTime
, QueueCallsStoppedAlerting
, OtherCallsStoppedAlerting
, QueueImsStoppedAlerting
, OtherImsStoppedAlerting
, QueueEmailsStoppedAlerting
, OtherEmailsStoppedAlerting
, QueueImsUnAnswered
, OtherImsUnAnswered
, QueueEmailsUnAnswered
, OtherEmailsUnAnswered
, OutboundIMsMade
, InternalIMsMade
, TotalOutboundIMTime
, TotalInternalIMTime
, TransferredQueueIMReceived
, TransferredOtherIMReceived
, ConsultationQueueIMPlaced
, ConsultationOtherIMPlaced
, ConsultXferQueueIMCompleted
, ConsultXferOtherIMCompleted
, BlindXferQueueIMPlaced
, BlindXferOtherIMPlaced
, ConferenceQueueIMInitiated
, ConferenceOtherIMInitiated
, TotalHoldingTimeQueueIM
, TotalHoldingTimeOtherIM
, TotalConsultationTimeQueueIM
, TotalConsultationTimeOtherIM
, TotalConferenceTimeQueueIM
, TotalConferenceTimeOtherIM
, TotalIMSetupTime
, OutboundEmailsMade
, InternalEmailsMade
, TotalOutboundEmailTime
, TotalInternalEmailTime
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.AgentID
, src.QueueCallsReceived
, src.DirectCallsReceived
, src.OutboundCallsMade
, src.InternalCallsMade
, src.TransferredQueueCallsReceived
, src.TransferredOtherCallsReceived
, src.ConsultationQueueCallsPlaced
, src.ConsultationOtherCallsPlaced
, src.ConsultXferQueueCallsCompleted
, src.ConsultXferOtherCallsCompleted
, src.BlindXferQueueCallsPlaced
, src.BlindXferOtherCallsPlaced
, src.ConferenceQueueCallsInitiated
, src.ConferenceOtherCallsInitiated
, src.QueueCallsUnAnswered
, src.OtherCallsUnAnswered
, src.QueuedEmailsReceived
, src.OtherEmailsReceived
, src.QueuedWebChatsReceived
, src.OtherWebChatsReceived
, src.LogonDuration
, src.TotalQueueCallTime
, src.TotalDirectCallTime
, src.TotalOutboundCallTime
, src.TotalInternalCallTime
, src.TotalHoldingTimeQueueCalls
, src.TotalHoldingTimeOtherCalls
, src.TotalConsultationTimeQueueCalls
, src.TotalConsultationTimeOtherCalls
, src.TotalConferenceTimeQueueCalls
, src.TotalConferenceTimeOtherCalls
, src.TotalQueueCallAlertingTime
, src.TotalDirectCallAlertingTime
, src.TotalQueueEmailTime
, src.TotalOtherEmailTime
, src.TotalQueueWebChatTime
, src.TotalOtherWebChatTime
, src.TotalWrapUpTime
, src.TotalReadyTime
, src.TotalNotReadyTime
, src.TotalMonitoringTime
, src.TotalCallSetupTime
, src.TransferredQueueEmailsReceived
, src.TransferredOtherEmailsReceived
, src.QueueEmailsTransferred
, src.OtherEmailsTransferred
, src.TotalQueueIMAlertingTime
, src.TotalDirectIMAlertingTime
, src.TotalQueueEmailAlertingTime
, src.TotalDirectEmailAlertingTime
, src.TotalIMWrapUpTime
, src.QueueCallsStoppedAlerting
, src.OtherCallsStoppedAlerting
, src.QueueImsStoppedAlerting
, src.OtherImsStoppedAlerting
, src.QueueEmailsStoppedAlerting
, src.OtherEmailsStoppedAlerting
, src.QueueImsUnAnswered
, src.OtherImsUnAnswered
, src.QueueEmailsUnAnswered
, src.OtherEmailsUnAnswered
, src.OutboundIMsMade
, src.InternalIMsMade
, src.TotalOutboundIMTime
, src.TotalInternalIMTime
, src.TransferredQueueIMReceived
, src.TransferredOtherIMReceived
, src.ConsultationQueueIMPlaced
, src.ConsultationOtherIMPlaced
, src.ConsultXferQueueIMCompleted
, src.ConsultXferOtherIMCompleted
, src.BlindXferQueueIMPlaced
, src.BlindXferOtherIMPlaced
, src.ConferenceQueueIMInitiated
, src.ConferenceOtherIMInitiated
, src.TotalHoldingTimeQueueIM
, src.TotalHoldingTimeOtherIM
, src.TotalConsultationTimeQueueIM
, src.TotalConsultationTimeOtherIM
, src.TotalConferenceTimeQueueIM
, src.TotalConferenceTimeOtherIM
, src.TotalIMSetupTime
, src.OutboundEmailsMade
, src.InternalEmailsMade
, src.TotalOutboundEmailTime
, src.TotalInternalEmailTime
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentActivityByQueue_D', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentActivityByQueue_D.dat', N'MERGE [dbo].[Stat_AgentActivityByQueue_D] AS tar
USING [dbo].[z_Stat_AgentActivityByQueue_D] AS src
ON tar.StartDateTime = src.StartDateTime   AND tar.AgentID  =  src.AgentID  AND tar.SwitchID = src.SwitchID  AND tar.QueueID = src.QueueID
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.QueueID  =  src.QueueID
, tar.CallsReceived  =  src.CallsReceived
, tar.TransferredCallsReceived  =  src.TransferredCallsReceived
, tar.ConsultationCallsPlaced  =  src.ConsultationCallsPlaced
, tar.ConsultXferCallsCompleted  =  src.ConsultXferCallsCompleted
, tar.BlindXferCallsPlaced  =  src.BlindXferCallsPlaced
, tar.ConferenceCallsInitiated  =  src.ConferenceCallsInitiated
, tar.CallsUnAnswered  =  src.CallsUnAnswered
, tar.EmailsReceived  =  src.EmailsReceived
, tar.WebChatsReceived  =  src.WebChatsReceived
, tar.LogonDuration  =  src.LogonDuration
, tar.TotalCallTime  =  src.TotalCallTime
, tar.TotalHoldingTime  =  src.TotalHoldingTime
, tar.TotalConsultationTime  =  src.TotalConsultationTime
, tar.TotalConferenceTime  =  src.TotalConferenceTime
, tar.TotalCallAlertingTime  =  src.TotalCallAlertingTime
, tar.TotalEmailTime  =  src.TotalEmailTime
, tar.TotalWebChatTime  =  src.TotalWebChatTime
, tar.TotalWrapUpTime  =  src.TotalWrapUpTime
, tar.EmailsTransferred  =  src.EmailsTransferred
, tar.TransferredEmailsReceived  =  src.TransferredEmailsReceived
, tar.TotalIMAlertingTime  =  src.TotalIMAlertingTime
, tar.TotalEmailAlertingTime  =  src.TotalEmailAlertingTime
, tar.TotalIMWrapUpTime  =  src.TotalIMWrapUpTime
, tar.TotalCallSetupTime  =  src.TotalCallSetupTime
, tar.TransferredCallsReceivedViaConsultWithWorkflowToAQueue  =  src.TransferredCallsReceivedViaConsultWithWorkflowToAQueue
, tar.CallsStoppedAlerting  =  src.CallsStoppedAlerting
, tar.ImsStoppedAlerting  =  src.ImsStoppedAlerting
, tar.EmailsStoppedAlerting  =  src.EmailsStoppedAlerting
, tar.ImsUnAnswered  =  src.ImsUnAnswered
, tar.EmailsUnAnswered  =  src.EmailsUnAnswered
, tar.TransferredIMReceived  =  src.TransferredIMReceived
, tar.ConsultationIMPlaced  =  src.ConsultationIMPlaced
, tar.ConsultXferIMCompleted  =  src.ConsultXferIMCompleted
, tar.BlindXferIMPlaced  =  src.BlindXferIMPlaced
, tar.ConferenceIMInitiated  =  src.ConferenceIMInitiated
, tar.TotalIMHoldingTime  =  src.TotalIMHoldingTime
, tar.TotalIMConsultationTime  =  src.TotalIMConsultationTime
, tar.TotalIMConferenceTime  =  src.TotalIMConferenceTime
, tar.TransferredIMReceivedViaConsultWithWorkflowToAQueue  =  src.TransferredIMReceivedViaConsultWithWorkflowToAQueue
, tar.TotalIMSetupTime  =  src.TotalIMSetupTime

WHEN NOT MATCHED THEN
   INSERT
   (
StartDateTime
, SwitchID
, AgentID
, QueueID
, CallsReceived
, TransferredCallsReceived
, ConsultationCallsPlaced
, ConsultXferCallsCompleted
, BlindXferCallsPlaced
, ConferenceCallsInitiated
, CallsUnAnswered
, EmailsReceived
, WebChatsReceived
, LogonDuration
, TotalCallTime
, TotalHoldingTime
, TotalConsultationTime
, TotalConferenceTime
, TotalCallAlertingTime
, TotalEmailTime
, TotalWebChatTime
, TotalWrapUpTime
, EmailsTransferred
, TransferredEmailsReceived
, TotalIMAlertingTime
, TotalEmailAlertingTime
, TotalIMWrapUpTime
, TotalCallSetupTime
, TransferredCallsReceivedViaConsultWithWorkflowToAQueue
, CallsStoppedAlerting
, ImsStoppedAlerting
, EmailsStoppedAlerting
, ImsUnAnswered
, EmailsUnAnswered
, TransferredIMReceived
, ConsultationIMPlaced
, ConsultXferIMCompleted
, BlindXferIMPlaced
, ConferenceIMInitiated
, TotalIMHoldingTime
, TotalIMConsultationTime
, TotalIMConferenceTime
, TransferredIMReceivedViaConsultWithWorkflowToAQueue
, TotalIMSetupTime
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.AgentID
, src.QueueID
, src.CallsReceived
, src.TransferredCallsReceived
, src.ConsultationCallsPlaced
, src.ConsultXferCallsCompleted
, src.BlindXferCallsPlaced
, src.ConferenceCallsInitiated
, src.CallsUnAnswered
, src.EmailsReceived
, src.WebChatsReceived
, src.LogonDuration
, src.TotalCallTime
, src.TotalHoldingTime
, src.TotalConsultationTime
, src.TotalConferenceTime
, src.TotalCallAlertingTime
, src.TotalEmailTime
, src.TotalWebChatTime
, src.TotalWrapUpTime
, src.EmailsTransferred
, src.TransferredEmailsReceived
, src.TotalIMAlertingTime
, src.TotalEmailAlertingTime
, src.TotalIMWrapUpTime
, src.TotalCallSetupTime
, src.TransferredCallsReceivedViaConsultWithWorkflowToAQueue
, src.CallsStoppedAlerting
, src.ImsStoppedAlerting
, src.EmailsStoppedAlerting
, src.ImsUnAnswered
, src.EmailsUnAnswered
, src.TransferredIMReceived
, src.ConsultationIMPlaced
, src.ConsultXferIMCompleted
, src.BlindXferIMPlaced
, src.ConferenceIMInitiated
, src.TotalIMHoldingTime
, src.TotalIMConsultationTime
, src.TotalIMConferenceTime
, src.TransferredIMReceivedViaConsultWithWorkflowToAQueue
, src.TotalIMSetupTime
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentActivityByQueue_I', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentActivityByQueue_I.dat', N'MERGE [dbo].[Stat_AgentActivityByQueue_I] AS tar
USING [dbo].[z_Stat_AgentActivityByQueue_I] AS src
ON tar.StartDateTime = src.StartDateTime   AND  tar.DSTStatus = src.DSTStatus  AND  tar.SwitchID = src.SwitchID AND tar.AgentID = src.AgentID  AND tar.QueueID = src.QueueID
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.DSTStatus  =  src.DSTStatus
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.QueueID  =  src.QueueID
, tar.IntervalDuration  =  src.IntervalDuration
, tar.IntervalID  =  src.IntervalID
, tar.CallsReceived  =  src.CallsReceived
, tar.TransferredCallsReceived  =  src.TransferredCallsReceived
, tar.ConsultationCallsPlaced  =  src.ConsultationCallsPlaced
, tar.ConsultXferCallsCompleted  =  src.ConsultXferCallsCompleted
, tar.BlindXferCallsPlaced  =  src.BlindXferCallsPlaced
, tar.ConferenceCallsInitiated  =  src.ConferenceCallsInitiated
, tar.CallsUnAnswered  =  src.CallsUnAnswered
, tar.EmailsReceived  =  src.EmailsReceived
, tar.WebChatsReceived  =  src.WebChatsReceived
, tar.LogonDuration  =  src.LogonDuration
, tar.TotalCallTime  =  src.TotalCallTime
, tar.TotalHoldingTime  =  src.TotalHoldingTime
, tar.TotalConsultationTime  =  src.TotalConsultationTime
, tar.TotalConferenceTime  =  src.TotalConferenceTime
, tar.TotalCallAlertingTime  =  src.TotalCallAlertingTime
, tar.TotalEmailTime  =  src.TotalEmailTime
, tar.TotalWebChatTime  =  src.TotalWebChatTime
, tar.TotalWrapUpTime  =  src.TotalWrapUpTime
, tar.RolledUp  =  src.RolledUp
, tar.EmailsTransferred  =  src.EmailsTransferred
, tar.TransferredEmailsReceived  =  src.TransferredEmailsReceived
, tar.TotalIMAlertingTime  =  src.TotalIMAlertingTime
, tar.TotalEmailAlertingTime  =  src.TotalEmailAlertingTime
, tar.TotalIMWrapUpTime  =  src.TotalIMWrapUpTime
, tar.TotalCallSetupTime  =  src.TotalCallSetupTime
, tar.TransferredCallsReceivedViaConsultWithWorkflowToAQueue  =  src.TransferredCallsReceivedViaConsultWithWorkflowToAQueue
, tar.CallsStoppedAlerting  =  src.CallsStoppedAlerting
, tar.ImsStoppedAlerting  =  src.ImsStoppedAlerting
, tar.EmailsStoppedAlerting  =  src.EmailsStoppedAlerting
, tar.ImsUnAnswered  =  src.ImsUnAnswered
, tar.EmailsUnAnswered  =  src.EmailsUnAnswered
, tar.TransferredIMReceived  =  src.TransferredIMReceived
, tar.ConsultationIMPlaced  =  src.ConsultationIMPlaced
, tar.ConsultXferIMCompleted  =  src.ConsultXferIMCompleted
, tar.BlindXferIMPlaced  =  src.BlindXferIMPlaced
, tar.ConferenceIMInitiated  =  src.ConferenceIMInitiated
, tar.TotalIMHoldingTime  =  src.TotalIMHoldingTime
, tar.TotalIMConsultationTime  =  src.TotalIMConsultationTime
, tar.TotalIMConferenceTime  =  src.TotalIMConferenceTime
, tar.TransferredIMReceivedViaConsultWithWorkflowToAQueue  =  src.TransferredIMReceivedViaConsultWithWorkflowToAQueue
, tar.TotalIMSetupTime  =  src.TotalIMSetupTime
WHEN NOT MATCHED THEN
   INSERT
   (
StartDateTime
, DSTStatus
, SwitchID
, AgentID
, QueueID
, IntervalDuration
, IntervalID
, CallsReceived
, TransferredCallsReceived
, ConsultationCallsPlaced
, ConsultXferCallsCompleted
, BlindXferCallsPlaced
, ConferenceCallsInitiated
, CallsUnAnswered
, EmailsReceived
, WebChatsReceived
, LogonDuration
, TotalCallTime
, TotalHoldingTime
, TotalConsultationTime
, TotalConferenceTime
, TotalCallAlertingTime
, TotalEmailTime
, TotalWebChatTime
, TotalWrapUpTime
, RolledUp
, EmailsTransferred
, TransferredEmailsReceived
, TotalIMAlertingTime
, TotalEmailAlertingTime
, TotalIMWrapUpTime
, TotalCallSetupTime
, TransferredCallsReceivedViaConsultWithWorkflowToAQueue
, CallsStoppedAlerting
, ImsStoppedAlerting
, EmailsStoppedAlerting
, ImsUnAnswered
, EmailsUnAnswered
, TransferredIMReceived
, ConsultationIMPlaced
, ConsultXferIMCompleted
, BlindXferIMPlaced
, ConferenceIMInitiated
, TotalIMHoldingTime
, TotalIMConsultationTime
, TotalIMConferenceTime
, TransferredIMReceivedViaConsultWithWorkflowToAQueue
, TotalIMSetupTime
   )
   VALUES
   (
src.StartDateTime
, src.DSTStatus
, src.SwitchID
, src.AgentID
, src.QueueID
, src.IntervalDuration
, src.IntervalID
, src.CallsReceived
, src.TransferredCallsReceived
, src.ConsultationCallsPlaced
, src.ConsultXferCallsCompleted
, src.BlindXferCallsPlaced
, src.ConferenceCallsInitiated
, src.CallsUnAnswered
, src.EmailsReceived
, src.WebChatsReceived
, src.LogonDuration
, src.TotalCallTime
, src.TotalHoldingTime
, src.TotalConsultationTime
, src.TotalConferenceTime
, src.TotalCallAlertingTime
, src.TotalEmailTime
, src.TotalWebChatTime
, src.TotalWrapUpTime
, src.RolledUp
, src.EmailsTransferred
, src.TransferredEmailsReceived
, src.TotalIMAlertingTime
, src.TotalEmailAlertingTime
, src.TotalIMWrapUpTime
, src.TotalCallSetupTime
, src.TransferredCallsReceivedViaConsultWithWorkflowToAQueue
, src.CallsStoppedAlerting
, src.ImsStoppedAlerting
, src.EmailsStoppedAlerting
, src.ImsUnAnswered
, src.EmailsUnAnswered
, src.TransferredIMReceived
, src.ConsultationIMPlaced
, src.ConsultXferIMCompleted
, src.BlindXferIMPlaced
, src.ConferenceIMInitiated
, src.TotalIMHoldingTime
, src.TotalIMConsultationTime
, src.TotalIMConferenceTime
, src.TransferredIMReceivedViaConsultWithWorkflowToAQueue
, src.TotalIMSetupTime
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentActivityByQueue_M', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentActivityByQueue_M.dat', N'MERGE [dbo].[Stat_AgentActivityByQueue_M] AS tar
USING [dbo].[z_Stat_AgentActivityByQueue_M] AS src
ON tar.StartDateTime = src.StartDateTime   AND  tar.SwitchID = src.SwitchID AND tar.AgentID = src.AgentID  AND tar.QueueID = src.QueueID
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.QueueID  =  src.QueueID
, tar.CallsReceived  =  src.CallsReceived
, tar.TransferredCallsReceived  =  src.TransferredCallsReceived
, tar.ConsultationCallsPlaced  =  src.ConsultationCallsPlaced
, tar.ConsultXferCallsCompleted  =  src.ConsultXferCallsCompleted
, tar.BlindXferCallsPlaced  =  src.BlindXferCallsPlaced
, tar.ConferenceCallsInitiated  =  src.ConferenceCallsInitiated
, tar.CallsUnAnswered  =  src.CallsUnAnswered
, tar.EmailsReceived  =  src.EmailsReceived
, tar.WebChatsReceived  =  src.WebChatsReceived
, tar.LogonDuration  =  src.LogonDuration
, tar.TotalCallTime  =  src.TotalCallTime
, tar.TotalHoldingTime  =  src.TotalHoldingTime
, tar.TotalConsultationTime  =  src.TotalConsultationTime
, tar.TotalConferenceTime  =  src.TotalConferenceTime
, tar.TotalCallAlertingTime  =  src.TotalCallAlertingTime
, tar.TotalEmailTime  =  src.TotalEmailTime
, tar.TotalWebChatTime  =  src.TotalWebChatTime
, tar.TotalWrapUpTime  =  src.TotalWrapUpTime
, tar.EmailsTransferred  =  src.EmailsTransferred
, tar.TransferredEmailsReceived  =  src.TransferredEmailsReceived
, tar.TotalIMAlertingTime  =  src.TotalIMAlertingTime
, tar.TotalEmailAlertingTime  =  src.TotalEmailAlertingTime
, tar.TotalIMWrapUpTime  =  src.TotalIMWrapUpTime
, tar.TotalCallSetupTime  =  src.TotalCallSetupTime
, tar.TransferredCallsReceivedViaConsultWithWorkflowToAQueue  =  src.TransferredCallsReceivedViaConsultWithWorkflowToAQueue
, tar.CallsStoppedAlerting  =  src.CallsStoppedAlerting
, tar.ImsStoppedAlerting  =  src.ImsStoppedAlerting
, tar.EmailsStoppedAlerting  =  src.EmailsStoppedAlerting
, tar.ImsUnAnswered  =  src.ImsUnAnswered
, tar.EmailsUnAnswered  =  src.EmailsUnAnswered
, tar.TransferredIMReceived  =  src.TransferredIMReceived
, tar.ConsultationIMPlaced  =  src.ConsultationIMPlaced
, tar.ConsultXferIMCompleted  =  src.ConsultXferIMCompleted
, tar.BlindXferIMPlaced  =  src.BlindXferIMPlaced
, tar.ConferenceIMInitiated  =  src.ConferenceIMInitiated
, tar.TotalIMHoldingTime  =  src.TotalIMHoldingTime
, tar.TotalIMConsultationTime  =  src.TotalIMConsultationTime
, tar.TotalIMConferenceTime  =  src.TotalIMConferenceTime
, tar.TransferredIMReceivedViaConsultWithWorkflowToAQueue  =  src.TransferredIMReceivedViaConsultWithWorkflowToAQueue
, tar.TotalIMSetupTime  =  src.TotalIMSetupTime

WHEN NOT MATCHED THEN
   INSERT
   (
StartDateTime
, SwitchID
, AgentID
, QueueID
, CallsReceived
, TransferredCallsReceived
, ConsultationCallsPlaced
, ConsultXferCallsCompleted
, BlindXferCallsPlaced
, ConferenceCallsInitiated
, CallsUnAnswered
, EmailsReceived
, WebChatsReceived
, LogonDuration
, TotalCallTime
, TotalHoldingTime
, TotalConsultationTime
, TotalConferenceTime
, TotalCallAlertingTime
, TotalEmailTime
, TotalWebChatTime
, TotalWrapUpTime
, EmailsTransferred
, TransferredEmailsReceived
, TotalIMAlertingTime
, TotalEmailAlertingTime
, TotalIMWrapUpTime
, TotalCallSetupTime
, TransferredCallsReceivedViaConsultWithWorkflowToAQueue
, CallsStoppedAlerting
, ImsStoppedAlerting
, EmailsStoppedAlerting
, ImsUnAnswered
, EmailsUnAnswered
, TransferredIMReceived
, ConsultationIMPlaced
, ConsultXferIMCompleted
, BlindXferIMPlaced
, ConferenceIMInitiated
, TotalIMHoldingTime
, TotalIMConsultationTime
, TotalIMConferenceTime
, TransferredIMReceivedViaConsultWithWorkflowToAQueue
, TotalIMSetupTime

   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.AgentID
, src.QueueID
, src.CallsReceived
, src.TransferredCallsReceived
, src.ConsultationCallsPlaced
, src.ConsultXferCallsCompleted
, src.BlindXferCallsPlaced
, src.ConferenceCallsInitiated
, src.CallsUnAnswered
, src.EmailsReceived
, src.WebChatsReceived
, src.LogonDuration
, src.TotalCallTime
, src.TotalHoldingTime
, src.TotalConsultationTime
, src.TotalConferenceTime
, src.TotalCallAlertingTime
, src.TotalEmailTime
, src.TotalWebChatTime
, src.TotalWrapUpTime
, src.EmailsTransferred
, src.TransferredEmailsReceived
, src.TotalIMAlertingTime
, src.TotalEmailAlertingTime
, src.TotalIMWrapUpTime
, src.TotalCallSetupTime
, src.TransferredCallsReceivedViaConsultWithWorkflowToAQueue
, src.CallsStoppedAlerting
, src.ImsStoppedAlerting
, src.EmailsStoppedAlerting
, src.ImsUnAnswered
, src.EmailsUnAnswered
, src.TransferredIMReceived
, src.ConsultationIMPlaced
, src.ConsultXferIMCompleted
, src.BlindXferIMPlaced
, src.ConferenceIMInitiated
, src.TotalIMHoldingTime
, src.TotalIMConsultationTime
, src.TotalIMConferenceTime
, src.TransferredIMReceivedViaConsultWithWorkflowToAQueue
, src.TotalIMSetupTime
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentActivityByQueue_W', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentActivityByQueue_W.dat', N'MERGE [dbo].[Stat_AgentActivityByQueue_W] AS tar
USING [dbo].[z_Stat_AgentActivityByQueue_W] AS src
ON tar.StartDateTime = src.StartDateTime   AND  tar.SwitchID = src.SwitchID AND tar.AgentID = src.AgentID  AND tar.QueueID = src.QueueID
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.QueueID  =  src.QueueID
, tar.CallsReceived  =  src.CallsReceived
, tar.TransferredCallsReceived  =  src.TransferredCallsReceived
, tar.ConsultationCallsPlaced  =  src.ConsultationCallsPlaced
, tar.ConsultXferCallsCompleted  =  src.ConsultXferCallsCompleted
, tar.BlindXferCallsPlaced  =  src.BlindXferCallsPlaced
, tar.ConferenceCallsInitiated  =  src.ConferenceCallsInitiated
, tar.CallsUnAnswered  =  src.CallsUnAnswered
, tar.EmailsReceived  =  src.EmailsReceived
, tar.WebChatsReceived  =  src.WebChatsReceived
, tar.LogonDuration  =  src.LogonDuration
, tar.TotalCallTime  =  src.TotalCallTime
, tar.TotalHoldingTime  =  src.TotalHoldingTime
, tar.TotalConsultationTime  =  src.TotalConsultationTime
, tar.TotalConferenceTime  =  src.TotalConferenceTime
, tar.TotalCallAlertingTime  =  src.TotalCallAlertingTime
, tar.TotalEmailTime  =  src.TotalEmailTime
, tar.TotalWebChatTime  =  src.TotalWebChatTime
, tar.TotalWrapUpTime  =  src.TotalWrapUpTime
, tar.EmailsTransferred  =  src.EmailsTransferred
, tar.TransferredEmailsReceived  =  src.TransferredEmailsReceived
, tar.TotalIMAlertingTime  =  src.TotalIMAlertingTime
, tar.TotalEmailAlertingTime  =  src.TotalEmailAlertingTime
, tar.TotalIMWrapUpTime  =  src.TotalIMWrapUpTime
, tar.TotalCallSetupTime  =  src.TotalCallSetupTime
, tar.TransferredCallsReceivedViaConsultWithWorkflowToAQueue  =  src.TransferredCallsReceivedViaConsultWithWorkflowToAQueue
, tar.CallsStoppedAlerting  =  src.CallsStoppedAlerting
, tar.ImsStoppedAlerting  =  src.ImsStoppedAlerting
, tar.EmailsStoppedAlerting  =  src.EmailsStoppedAlerting
, tar.ImsUnAnswered  =  src.ImsUnAnswered
, tar.EmailsUnAnswered  =  src.EmailsUnAnswered
, tar.TransferredIMReceived  =  src.TransferredIMReceived
, tar.ConsultationIMPlaced  =  src.ConsultationIMPlaced
, tar.ConsultXferIMCompleted  =  src.ConsultXferIMCompleted
, tar.BlindXferIMPlaced  =  src.BlindXferIMPlaced
, tar.ConferenceIMInitiated  =  src.ConferenceIMInitiated
, tar.TotalIMHoldingTime  =  src.TotalIMHoldingTime
, tar.TotalIMConsultationTime  =  src.TotalIMConsultationTime
, tar.TotalIMConferenceTime  =  src.TotalIMConferenceTime
, tar.TransferredIMReceivedViaConsultWithWorkflowToAQueue  =  src.TransferredIMReceivedViaConsultWithWorkflowToAQueue
, tar.TotalIMSetupTime  =  src.TotalIMSetupTime
WHEN NOT MATCHED THEN
   INSERT
   (
StartDateTime
, SwitchID
, AgentID
, QueueID
, CallsReceived
, TransferredCallsReceived
, ConsultationCallsPlaced
, ConsultXferCallsCompleted
, BlindXferCallsPlaced
, ConferenceCallsInitiated
, CallsUnAnswered
, EmailsReceived
, WebChatsReceived
, LogonDuration
, TotalCallTime
, TotalHoldingTime
, TotalConsultationTime
, TotalConferenceTime
, TotalCallAlertingTime
, TotalEmailTime
, TotalWebChatTime
, TotalWrapUpTime
, EmailsTransferred
, TransferredEmailsReceived
, TotalIMAlertingTime
, TotalEmailAlertingTime
, TotalIMWrapUpTime
, TotalCallSetupTime
, TransferredCallsReceivedViaConsultWithWorkflowToAQueue
, CallsStoppedAlerting
, ImsStoppedAlerting
, EmailsStoppedAlerting
, ImsUnAnswered
, EmailsUnAnswered
, TransferredIMReceived
, ConsultationIMPlaced
, ConsultXferIMCompleted
, BlindXferIMPlaced
, ConferenceIMInitiated
, TotalIMHoldingTime
, TotalIMConsultationTime
, TotalIMConferenceTime
, TransferredIMReceivedViaConsultWithWorkflowToAQueue
, TotalIMSetupTime
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.AgentID
, src.QueueID
, src.CallsReceived
, src.TransferredCallsReceived
, src.ConsultationCallsPlaced
, src.ConsultXferCallsCompleted
, src.BlindXferCallsPlaced
, src.ConferenceCallsInitiated
, src.CallsUnAnswered
, src.EmailsReceived
, src.WebChatsReceived
, src.LogonDuration
, src.TotalCallTime
, src.TotalHoldingTime
, src.TotalConsultationTime
, src.TotalConferenceTime
, src.TotalCallAlertingTime
, src.TotalEmailTime
, src.TotalWebChatTime
, src.TotalWrapUpTime
, src.EmailsTransferred
, src.TransferredEmailsReceived
, src.TotalIMAlertingTime
, src.TotalEmailAlertingTime
, src.TotalIMWrapUpTime
, src.TotalCallSetupTime
, src.TransferredCallsReceivedViaConsultWithWorkflowToAQueue
, src.CallsStoppedAlerting
, src.ImsStoppedAlerting
, src.EmailsStoppedAlerting
, src.ImsUnAnswered
, src.EmailsUnAnswered
, src.TransferredIMReceived
, src.ConsultationIMPlaced
, src.ConsultXferIMCompleted
, src.BlindXferIMPlaced
, src.ConferenceIMInitiated
, src.TotalIMHoldingTime
, src.TotalIMConsultationTime
, src.TotalIMConferenceTime
, src.TransferredIMReceivedViaConsultWithWorkflowToAQueue
, src.TotalIMSetupTime
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentActivityByQueue_Y', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentActivityByQueue_Y.dat', N'MERGE [dbo].[Stat_AgentActivityByQueue_Y] AS tar
USING [dbo].[z_Stat_AgentActivityByQueue_Y] AS src
ON tar.StartDateTime = src.StartDateTime   AND  tar.SwitchID = src.SwitchID AND tar.AgentID = src.AgentID  AND tar.QueueID = src.QueueID
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.QueueID  =  src.QueueID
, tar.CallsReceived  =  src.CallsReceived
, tar.TransferredCallsReceived  =  src.TransferredCallsReceived
, tar.ConsultationCallsPlaced  =  src.ConsultationCallsPlaced
, tar.ConsultXferCallsCompleted  =  src.ConsultXferCallsCompleted
, tar.BlindXferCallsPlaced  =  src.BlindXferCallsPlaced
, tar.ConferenceCallsInitiated  =  src.ConferenceCallsInitiated
, tar.CallsUnAnswered  =  src.CallsUnAnswered
, tar.EmailsReceived  =  src.EmailsReceived
, tar.WebChatsReceived  =  src.WebChatsReceived
, tar.LogonDuration  =  src.LogonDuration
, tar.TotalCallTime  =  src.TotalCallTime
, tar.TotalHoldingTime  =  src.TotalHoldingTime
, tar.TotalConsultationTime  =  src.TotalConsultationTime
, tar.TotalConferenceTime  =  src.TotalConferenceTime
, tar.TotalCallAlertingTime  =  src.TotalCallAlertingTime
, tar.TotalEmailTime  =  src.TotalEmailTime
, tar.TotalWebChatTime  =  src.TotalWebChatTime
, tar.TotalWrapUpTime  =  src.TotalWrapUpTime
, tar.EmailsTransferred  =  src.EmailsTransferred
, tar.TransferredEmailsReceived  =  src.TransferredEmailsReceived
, tar.TotalIMAlertingTime  =  src.TotalIMAlertingTime
, tar.TotalEmailAlertingTime  =  src.TotalEmailAlertingTime
, tar.TotalIMWrapUpTime  =  src.TotalIMWrapUpTime
, tar.TotalCallSetupTime  =  src.TotalCallSetupTime
, tar.TransferredCallsReceivedViaConsultWithWorkflowToAQueue  =  src.TransferredCallsReceivedViaConsultWithWorkflowToAQueue
, tar.CallsStoppedAlerting  =  src.CallsStoppedAlerting
, tar.ImsStoppedAlerting  =  src.ImsStoppedAlerting
, tar.EmailsStoppedAlerting  =  src.EmailsStoppedAlerting
, tar.ImsUnAnswered  =  src.ImsUnAnswered
, tar.EmailsUnAnswered  =  src.EmailsUnAnswered
, tar.TransferredIMReceived  =  src.TransferredIMReceived
, tar.ConsultationIMPlaced  =  src.ConsultationIMPlaced
, tar.ConsultXferIMCompleted  =  src.ConsultXferIMCompleted
, tar.BlindXferIMPlaced  =  src.BlindXferIMPlaced
, tar.ConferenceIMInitiated  =  src.ConferenceIMInitiated
, tar.TotalIMHoldingTime  =  src.TotalIMHoldingTime
, tar.TotalIMConsultationTime  =  src.TotalIMConsultationTime
, tar.TotalIMConferenceTime  =  src.TotalIMConferenceTime
, tar.TransferredIMReceivedViaConsultWithWorkflowToAQueue  =  src.TransferredIMReceivedViaConsultWithWorkflowToAQueue
, tar.TotalIMSetupTime  =  src.TotalIMSetupTime

WHEN NOT MATCHED THEN
   INSERT
   (
StartDateTime
, SwitchID
, AgentID
, QueueID
, CallsReceived
, TransferredCallsReceived
, ConsultationCallsPlaced
, ConsultXferCallsCompleted
, BlindXferCallsPlaced
, ConferenceCallsInitiated
, CallsUnAnswered
, EmailsReceived
, WebChatsReceived
, LogonDuration
, TotalCallTime
, TotalHoldingTime
, TotalConsultationTime
, TotalConferenceTime
, TotalCallAlertingTime
, TotalEmailTime
, TotalWebChatTime
, TotalWrapUpTime
, EmailsTransferred
, TransferredEmailsReceived
, TotalIMAlertingTime
, TotalEmailAlertingTime
, TotalIMWrapUpTime
, TotalCallSetupTime
, TransferredCallsReceivedViaConsultWithWorkflowToAQueue
, CallsStoppedAlerting
, ImsStoppedAlerting
, EmailsStoppedAlerting
, ImsUnAnswered
, EmailsUnAnswered
, TransferredIMReceived
, ConsultationIMPlaced
, ConsultXferIMCompleted
, BlindXferIMPlaced
, ConferenceIMInitiated
, TotalIMHoldingTime
, TotalIMConsultationTime
, TotalIMConferenceTime
, TransferredIMReceivedViaConsultWithWorkflowToAQueue
, TotalIMSetupTime
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.AgentID
, src.QueueID
, src.CallsReceived
, src.TransferredCallsReceived
, src.ConsultationCallsPlaced
, src.ConsultXferCallsCompleted
, src.BlindXferCallsPlaced
, src.ConferenceCallsInitiated
, src.CallsUnAnswered
, src.EmailsReceived
, src.WebChatsReceived
, src.LogonDuration
, src.TotalCallTime
, src.TotalHoldingTime
, src.TotalConsultationTime
, src.TotalConferenceTime
, src.TotalCallAlertingTime
, src.TotalEmailTime
, src.TotalWebChatTime
, src.TotalWrapUpTime
, src.EmailsTransferred
, src.TransferredEmailsReceived
, src.TotalIMAlertingTime
, src.TotalEmailAlertingTime
, src.TotalIMWrapUpTime
, src.TotalCallSetupTime
, src.TransferredCallsReceivedViaConsultWithWorkflowToAQueue
, src.CallsStoppedAlerting
, src.ImsStoppedAlerting
, src.EmailsStoppedAlerting
, src.ImsUnAnswered
, src.EmailsUnAnswered
, src.TransferredIMReceived
, src.ConsultationIMPlaced
, src.ConsultXferIMCompleted
, src.BlindXferIMPlaced
, src.ConferenceIMInitiated
, src.TotalIMHoldingTime
, src.TotalIMConsultationTime
, src.TotalIMConferenceTime
, src.TransferredIMReceivedViaConsultWithWorkflowToAQueue
, src.TotalIMSetupTime
   )
-- WHEN NOT MATCHED BY SOURCE THEN DELETE
;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentLineOfBusiness_D', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentLineOfBusiness_D.dat', N'MERGE [dbo].[Stat_AgentLineOfBusiness_D] AS tar
USING [dbo].[z_Stat_AgentLineOfBusiness_D] AS src
ON tar.StartDateTime = src.StartDateTime  AND  tar.SwitchID = src.SwitchID  AND  tar.AgentID = src.AgentID  AND tar.LOBCode = src.LOBCode  AND tar.QueueID = src.QueueID
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.LOBCode  =  src.LOBCode
, tar.QueueID  =  src.QueueID
, tar.NumberOfTimesTagged  =  src.NumberOfTimesTagged
, tar.Duration  =  src.Duration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, AgentID
, LOBCode
, QueueID
, NumberOfTimesTagged
, Duration
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.AgentID
, src.LOBCode
, src.QueueID
, src.NumberOfTimesTagged
, src.Duration
   )
-- WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentLineOfBusiness_I', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentLineOfBusiness_I.dat', N'MERGE [dbo].[Stat_AgentLineOfBusiness_I] AS tar
USING [dbo].[z_Stat_AgentLineOfBusiness_I] AS src
ON tar.StartDateTime = src.StartDateTime AND tar.DSTStatus = src.DSTStatus AND  tar.SwitchID = src.SwitchID  AND  tar.AgentID = src.AgentID  AND tar.LOBCode = src.LOBCode  AND tar.QueueID = src.QueueID
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.DSTStatus  =  src.DSTStatus
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.LOBCode  =  src.LOBCode
, tar.QueueID  =  src.QueueID
, tar.IntervalDuration  =  src.IntervalDuration
, tar.IntervalID  =  src.IntervalID
, tar.NumberOfTimesTagged  =  src.NumberOfTimesTagged
, tar.Duration  =  src.Duration
, tar.RolledUp  =  src.RolledUp
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, DSTStatus
, SwitchID
, AgentID
, LOBCode
, QueueID
, IntervalDuration
, IntervalID
, NumberOfTimesTagged
, Duration
, RolledUp
   )
   VALUES
   (
src.StartDateTime
, src.DSTStatus
, src.SwitchID
, src.AgentID
, src.LOBCode
, src.QueueID
, src.IntervalDuration
, src.IntervalID
, src.NumberOfTimesTagged
, src.Duration
, src.RolledUp
   )
-- WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentLineOfBusiness_M', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentLineOfBusiness_M.dat', N'MERGE [dbo].[Stat_AgentLineOfBusiness_M] AS tar
USING [dbo].[z_Stat_AgentLineOfBusiness_M] AS src
ON tar.StartDateTime = src.StartDateTime AND  tar.SwitchID = src.SwitchID  AND  tar.AgentID = src.AgentID  AND tar.LOBCode = src.LOBCode  AND tar.QueueID = src.QueueID
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.LOBCode  =  src.LOBCode
, tar.QueueID  =  src.QueueID
, tar.NumberOfTimesTagged  =  src.NumberOfTimesTagged
, tar.Duration  =  src.Duration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, AgentID
, LOBCode
, QueueID
, NumberOfTimesTagged
, Duration
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.AgentID
, src.LOBCode
, src.QueueID
, src.NumberOfTimesTagged
, src.Duration
   )
-- WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentLineOfBusiness_W', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentLineOfBusiness_W.dat', N'MERGE [dbo].[Stat_AgentLineOfBusiness_W] AS tar
USING [dbo].[z_Stat_AgentLineOfBusiness_W] AS src
ON tar.StartDateTime = src.StartDateTime AND  tar.SwitchID = src.SwitchID  AND  tar.AgentID = src.AgentID  AND tar.LOBCode = src.LOBCode  AND tar.QueueID = src.QueueID
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.LOBCode  =  src.LOBCode
, tar.QueueID  =  src.QueueID
, tar.NumberOfTimesTagged  =  src.NumberOfTimesTagged
, tar.Duration  =  src.Duration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, AgentID
, LOBCode
, QueueID
, NumberOfTimesTagged
, Duration
   )
   VALUES
   (
StartDateTime
, SwitchID
, AgentID
, LOBCode
, QueueID
, NumberOfTimesTagged
, Duration
   )
-- WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentLineOfBusiness_Y', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentLineOfBusiness_Y.dat', N'MERGE [dbo].[Stat_AgentLineOfBusiness_Y] AS tar
USING [dbo].[z_Stat_AgentLineOfBusiness_Y] AS src
ON tar.StartDateTime = src.StartDateTime AND  tar.SwitchID = src.SwitchID  AND  tar.AgentID = src.AgentID  AND tar.LOBCode = src.LOBCode  AND tar.QueueID = src.QueueID
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.LOBCode  =  src.LOBCode
, tar.QueueID  =  src.QueueID
, tar.NumberOfTimesTagged  =  src.NumberOfTimesTagged
, tar.Duration  =  src.Duration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, AgentID
, LOBCode
, QueueID
, NumberOfTimesTagged
, Duration
   )
   VALUES
   (
StartDateTime
, SwitchID
, AgentID
, LOBCode
, QueueID
, NumberOfTimesTagged
, Duration
   )
-- WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentNotReadyBreakdown_D', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentNotReadyBreakdown_D.dat', N'MERGE [dbo].[Stat_AgentNotReadyBreakdown_D] AS tar
USING [dbo].[z_Stat_AgentNotReadyBreakdown_D] AS src
ON tar.StartDateTime = src.StartDateTime AND  tar.SwitchID = src.SwitchID  AND  tar.AgentID = src.AgentID  AND tar.NotReadyReason = src.NotReadyReason
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.NotReadyReason  =  src.NotReadyReason
, tar.NumberOfTimesPressed  =  src.NumberOfTimesPressed
, tar.Duration  =  src.Duration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, AgentID
, NotReadyReason
, NumberOfTimesPressed
, Duration
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.AgentID
, src.NotReadyReason
, src.NumberOfTimesPressed
, src.Duration
   )
-- WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentNotReadyBreakdown_I', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentNotReadyBreakdown_I.dat', N'MERGE [dbo].[Stat_AgentNotReadyBreakdown_I] AS tar
USING [dbo].[z_Stat_AgentNotReadyBreakdown_I] AS src
ON tar.StartDateTime = src.StartDateTime AND tar.DSTStatus = src.DSTStatus  AND  tar.SwitchID = src.SwitchID  AND  tar.AgentID = src.AgentID  AND tar.NotReadyReason = src.NotReadyReason
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.DSTStatus  =  src.DSTStatus
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.NotReadyReason  =  src.NotReadyReason
, tar.IntervalDuration  =  src.IntervalDuration
, tar.IntervalID  =  src.IntervalID
, tar.NumberOfTimesPressed  =  src.NumberOfTimesPressed
, tar.Duration  =  src.Duration
, tar.RolledUp  =  src.RolledUp
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, DSTStatus
, SwitchID
, AgentID
, NotReadyReason
, IntervalDuration
, IntervalID
, NumberOfTimesPressed
, Duration
, RolledUp
   )
   VALUES
   (
src.StartDateTime
, src.DSTStatus
, src.SwitchID
, src.AgentID
, src.NotReadyReason
, src.IntervalDuration
, src.IntervalID
, src.NumberOfTimesPressed
, src.Duration
, src.RolledUp
   )
-- WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentNotReadyBreakdown_M', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentNotReadyBreakdown_M.dat', N'MERGE [dbo].[Stat_AgentNotReadyBreakdown_M] AS tar
USING [dbo].[z_Stat_AgentNotReadyBreakdown_M] AS src
ON tar.StartDateTime = src.StartDateTime AND  tar.SwitchID = src.SwitchID  AND  tar.AgentID = src.AgentID  AND tar.NotReadyReason = src.NotReadyReason
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.NotReadyReason  =  src.NotReadyReason
, tar.NumberOfTimesPressed  =  src.NumberOfTimesPressed
, tar.Duration  =  src.Duration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, AgentID
, NotReadyReason
, NumberOfTimesPressed
, Duration
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.AgentID
, src.NotReadyReason
, src.NumberOfTimesPressed
, src.Duration
   )
-- WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentNotReadyBreakdown_W', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentNotReadyBreakdown_W.dat', N'MERGE [dbo].[Stat_AgentNotReadyBreakdown_W] AS tar
USING [dbo].[z_Stat_AgentNotReadyBreakdown_W] AS src
ON tar.StartDateTime = src.StartDateTime AND  tar.SwitchID = src.SwitchID  AND  tar.AgentID = src.AgentID  AND tar.NotReadyReason = src.NotReadyReason
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.NotReadyReason  =  src.NotReadyReason
, tar.NumberOfTimesPressed  =  src.NumberOfTimesPressed
, tar.Duration  =  src.Duration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, AgentID
, NotReadyReason
, NumberOfTimesPressed
, Duration
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.AgentID
, src.NotReadyReason
, src.NumberOfTimesPressed
, src.Duration
   )
-- WHEN NOT MATCHED by SOURCE THEN DELETE
   ;')
;
INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_AgentNotReadyBreakdown_Y', N'c:\\ComputerTALKDB\\RAW', N'Stat_AgentNotReadyBreakdown_Y.dat', N'MERGE [dbo].[Stat_AgentNotReadyBreakdown_Y] AS tar
USING [dbo].[z_Stat_AgentNotReadyBreakdown_Y] AS src
ON tar.StartDateTime = src.StartDateTime AND  tar.SwitchID = src.SwitchID  AND  tar.AgentID = src.AgentID  AND tar.NotReadyReason = src.NotReadyReason
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AgentID  =  src.AgentID
, tar.NotReadyReason  =  src.NotReadyReason
, tar.NumberOfTimesPressed  =  src.NumberOfTimesPressed
, tar.Duration  =  src.Duration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, AgentID
, NotReadyReason
, NumberOfTimesPressed
, Duration
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.AgentID
, src.NotReadyReason
, src.NumberOfTimesPressed
, src.Duration
   )
-- WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_CDR', N'c:\\ComputerTALKDB\\RAW', N'Stat_CDR.dat', N'MERGE [dbo].[Stat_CDR] AS tar
USING [dbo].[z_Stat_CDR] AS src
ON tar.PrimaryKey = src.PrimaryKey 
WHEN MATCHED THEN
   UPDATE SET
tar.PrimaryKey  =  src.PrimaryKey
, tar.EventTime  =  src.EventTime
, tar.DSTStatus  =  src.DSTStatus
, tar.ContactID  =  src.ContactID
, tar.EventID  =  src.EventID
, tar.SwitchID  =  src.SwitchID
, tar.ContactType  =  src.ContactType
, tar.CurrentState  =  src.CurrentState
, tar.LastState  =  src.LastState
, tar.LastStateDuration  =  src.LastStateDuration
, tar.QueueID  =  src.QueueID
, tar.IntData1  =  src.IntData1
, tar.IntData2  =  src.IntData2
, tar.IntData3  =  src.IntData3
, tar.IntData4  =  src.IntData4
, tar.StrData1  =  src.StrData1
, tar.StrData2  =  src.StrData2
, tar.StrData3  =  src.StrData3
, tar.StrData4  =  src.StrData4
, tar.EventSequence  =  src.EventSequence
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
PrimaryKey
, EventTime
, DSTStatus
, ContactID
, EventID
, SwitchID
, ContactType
, CurrentState
, LastState
, LastStateDuration
, QueueID
, IntData1
, IntData2
, IntData3
, IntData4
, StrData1
, StrData2
, StrData3
, StrData4
, EventSequence
   )
   VALUES
   (
src.PrimaryKey
, src.EventTime
, src.DSTStatus
, src.ContactID
, src.EventID
, src.SwitchID
, src.ContactType
, src.CurrentState
, src.LastState
, src.LastStateDuration
, src.QueueID
, src.IntData1
, src.IntData2
, src.IntData3
, src.IntData4
, src.StrData1
, src.StrData2
, src.StrData3
, src.StrData4
, src.EventSequence

   )
-- WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_CDR_LastSummarized', N'c:\\ComputerTALKDB\\RAW', N'Stat_CDR_LastSummarized.dat', N'MERGE [dbo].[Stat_CDR_LastSummarized] AS tar
USING [dbo].[z_Stat_CDR_LastSummarized] AS src
ON tar.LastTimeSummarized = src.LastTimeSummarized 
WHEN MATCHED THEN
   UPDATE SET
tar.LastTimeSummarized  =  src.LastTimeSummarized
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
LastTimeSummarized
   )
   VALUES
   (
src.LastTimeSummarized
   )
  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_CDR_Summary', N'c:\\ComputerTALKDB\\RAW', N'Stat_CDR_Summary.dat', N'MERGE [dbo].[Stat_CDR_Summary] AS tar
USING [dbo].[z_Stat_CDR_Summary] AS src
ON tar.SwitchID = src.SwitchID AND  tar.ContactID = src.ContactID   AND  tar.CreatedDateTime = src.CreatedDateTime 
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.ContactID  =  src.ContactID
, tar.ContactType  =  src.ContactType
, tar.ContactTypeString  =  src.ContactTypeString
, tar.CreatedDateTime  =  src.CreatedDateTime
, tar.CreatedReason  =  src.CreatedReason
, tar.CreatedReasonString  =  src.CreatedReasonString
, tar.CreatedContactGroupID  =  src.CreatedContactGroupID
, tar.CreatedAddressID  =  src.CreatedAddressID
, tar.Duration  =  src.Duration
, tar.ReleasedReason  =  src.ReleasedReason
, tar.ReleasedReasonString  =  src.ReleasedReasonString
, tar.ReleasedDateTime  =  src.ReleasedDateTime
, tar.OriginatorAddress  =  src.OriginatorAddress
, tar.OriginatorName  =  src.OriginatorName
, tar.ReceivingAddress  =  src.ReceivingAddress
, tar.RedirectAddress  =  src.RedirectAddress
, tar.NumTimesInWorkflow  =  src.NumTimesInWorkflow
, tar.TimeInWorkflow  =  src.TimeInWorkflow
, tar.NumTimesRouted  =  src.NumTimesRouted
, tar.TimeInRouting  =  src.TimeInRouting
, tar.NumTimesInPAQ  =  src.NumTimesInPAQ
, tar.TimeInPAQ  =  src.TimeInPAQ
, tar.NumTimesOnOutbound  =  src.NumTimesOnOutbound
, tar.TimeOnOutbound  =  src.TimeOnOutbound
, tar.NumTimesHandledByAgent  =  src.NumTimesHandledByAgent
, tar.TimeHandledByAgent  =  src.TimeHandledByAgent
, tar.NumTimesQueued  =  src.NumTimesQueued
, tar.NumTimesReturned  =  src.NumTimesReturned
, tar.OriginalQueueID  =  src.OriginalQueueID
, tar.OriginalQueueName  =  src.OriginalQueueName
, tar.NumTimesHandledFromQueue  =  src.NumTimesHandledFromQueue
, tar.TotalTimeQueuedHandled  =  src.TotalTimeQueuedHandled
, tar.NumTimesAbandonedFromQueue  =  src.NumTimesAbandonedFromQueue
, tar.TotalTimeQueuedAbandoned  =  src.TotalTimeQueuedAbandoned
, tar.NumTimesRemovedFromQueue  =  src.NumTimesRemovedFromQueue
, tar.TotalTimeQueuedRemoved  =  src.TotalTimeQueuedRemoved
, tar.NumTimesSetUserData  =  src.NumTimesSetUserData
, tar.NumTimesActionCompleted  =  src.NumTimesActionCompleted
, tar.OriginalHandledQueueID  =  src.OriginalHandledQueueID
, tar.OriginalHandledQueueName  =  src.OriginalHandledQueueName
, tar.OriginalHandlingAgentID  =  src.OriginalHandlingAgentID
, tar.OriginalHandlingAgentName  =  src.OriginalHandlingAgentName
, tar.OriginalHandlingAgentSkillScore  =  src.OriginalHandlingAgentSkillScore
, tar.OriginalOutboundContactGroupID  =  src.OriginalOutboundContactGroupID
, tar.OriginalOutboundAddressID  =  src.OriginalOutboundAddressID
, tar.OriginalOutboundNumber  =  src.OriginalOutboundNumber
, tar.OriginalRoutedAddressID  =  src.OriginalRoutedAddressID
, tar.OriginalRoutedResult  =  src.OriginalRoutedResult
, tar.OriginalRoutedResultString  =  src.OriginalRoutedResultString
, tar.OriginalRoutedReason  =  src.OriginalRoutedReason
, tar.OriginalRoutedReasonString  =  src.OriginalRoutedReasonString
, tar.OriginalRoutedDestination  =  src.OriginalRoutedDestination
, tar.OriginalSetUserData  =  src.OriginalSetUserData
, tar.LastSetUserData  =  src.LastSetUserData
, tar.OriginalLoggedActionWfID  =  src.OriginalLoggedActionWfID
, tar.OriginalLoggedActionPageID  =  src.OriginalLoggedActionPageID
, tar.OriginalLoggedActionActionID  =  src.OriginalLoggedActionActionID
, tar.OriginalLoggedActionDuration  =  src.OriginalLoggedActionDuration
, tar.OriginalLoggedActionName  =  src.OriginalLoggedActionName
, tar.OriginalLoggedActionData  =  src.OriginalLoggedActionData
, tar.OriginalLoggedActionResult  =  src.OriginalLoggedActionResult
, tar.LastLoggedActionWfID  =  src.LastLoggedActionWfID
, tar.LastLoggedActionPageID  =  src.LastLoggedActionPageID
, tar.LastLoggedActionActionID  =  src.LastLoggedActionActionID
, tar.LastLoggedActionDuration  =  src.LastLoggedActionDuration
, tar.LastLoggedActionName  =  src.LastLoggedActionName
, tar.LastLoggedActionData  =  src.LastLoggedActionData
, tar.LastLoggedActionResult  =  src.LastLoggedActionResult
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
SwitchID
, ContactID
, ContactType
, ContactTypeString
, CreatedDateTime
, CreatedReason
, CreatedReasonString
, CreatedContactGroupID
, CreatedAddressID
, Duration
, ReleasedReason
, ReleasedReasonString
, ReleasedDateTime
, OriginatorAddress
, OriginatorName
, ReceivingAddress
, RedirectAddress
, NumTimesInWorkflow
, TimeInWorkflow
, NumTimesRouted
, TimeInRouting
, NumTimesInPAQ
, TimeInPAQ
, NumTimesOnOutbound
, TimeOnOutbound
, NumTimesHandledByAgent
, TimeHandledByAgent
, NumTimesQueued
, NumTimesReturned
, OriginalQueueID
, OriginalQueueName
, NumTimesHandledFromQueue
, TotalTimeQueuedHandled
, NumTimesAbandonedFromQueue
, TotalTimeQueuedAbandoned
, NumTimesRemovedFromQueue
, TotalTimeQueuedRemoved
, NumTimesSetUserData
, NumTimesActionCompleted
, OriginalHandledQueueID
, OriginalHandledQueueName
, OriginalHandlingAgentID
, OriginalHandlingAgentName
, OriginalHandlingAgentSkillScore
, OriginalOutboundContactGroupID
, OriginalOutboundAddressID
, OriginalOutboundNumber
, OriginalRoutedAddressID
, OriginalRoutedResult
, OriginalRoutedResultString
, OriginalRoutedReason
, OriginalRoutedReasonString
, OriginalRoutedDestination
, OriginalSetUserData
, LastSetUserData
, OriginalLoggedActionWfID
, OriginalLoggedActionPageID
, OriginalLoggedActionActionID
, OriginalLoggedActionDuration
, OriginalLoggedActionName
, OriginalLoggedActionData
, OriginalLoggedActionResult
, LastLoggedActionWfID
, LastLoggedActionPageID
, LastLoggedActionActionID
, LastLoggedActionDuration
, LastLoggedActionName
, LastLoggedActionData
, LastLoggedActionResult
   )
   VALUES
   (
src.SwitchID
, src.ContactID
, src.ContactType
, src.ContactTypeString
, src.CreatedDateTime
, src.CreatedReason
, src.CreatedReasonString
, src.CreatedContactGroupID
, src.CreatedAddressID
, src.Duration
, src.ReleasedReason
, src.ReleasedReasonString
, src.ReleasedDateTime
, src.OriginatorAddress
, src.OriginatorName
, src.ReceivingAddress
, src.RedirectAddress
, src.NumTimesInWorkflow
, src.TimeInWorkflow
, src.NumTimesRouted
, src.TimeInRouting
, src.NumTimesInPAQ
, src.TimeInPAQ
, src.NumTimesOnOutbound
, src.TimeOnOutbound
, src.NumTimesHandledByAgent
, src.TimeHandledByAgent
, src.NumTimesQueued
, src.NumTimesReturned
, src.OriginalQueueID
, src.OriginalQueueName
, src.NumTimesHandledFromQueue
, src.TotalTimeQueuedHandled
, src.NumTimesAbandonedFromQueue
, src.TotalTimeQueuedAbandoned
, src.NumTimesRemovedFromQueue
, src.TotalTimeQueuedRemoved
, src.NumTimesSetUserData
, src.NumTimesActionCompleted
, src.OriginalHandledQueueID
, src.OriginalHandledQueueName
, src.OriginalHandlingAgentID
, src.OriginalHandlingAgentName
, src.OriginalHandlingAgentSkillScore
, src.OriginalOutboundContactGroupID
, src.OriginalOutboundAddressID
, src.OriginalOutboundNumber
, src.OriginalRoutedAddressID
, src.OriginalRoutedResult
, src.OriginalRoutedResultString
, src.OriginalRoutedReason
, src.OriginalRoutedReasonString
, src.OriginalRoutedDestination
, src.OriginalSetUserData
, src.LastSetUserData
, src.OriginalLoggedActionWfID
, src.OriginalLoggedActionPageID
, src.OriginalLoggedActionActionID
, src.OriginalLoggedActionDuration
, src.OriginalLoggedActionName
, src.OriginalLoggedActionData
, src.OriginalLoggedActionResult
, src.LastLoggedActionWfID
, src.LastLoggedActionPageID
, src.LastLoggedActionActionID
, src.LastLoggedActionDuration
, src.LastLoggedActionName
, src.LastLoggedActionData
, src.LastLoggedActionResult
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_DNISActivity_D', N'c:\\ComputerTALKDB\\RAW', N'Stat_DNISActivity_D.dat', N'MERGE [dbo].[Stat_DNISActivity_D] AS tar
USING [dbo].[z_Stat_DNISActivity_D] AS src
ON tar.StartDateTime = src.StartDateTime   AND  tar.SwitchID = src.SwitchID   AND  tar.DNIS = src.DNIS 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.DNIS  =  src.DNIS
, tar.CallCount  =  src.CallCount
, tar.NumRejectedDNISMax  =  src.NumRejectedDNISMax
, tar.NumRejectedDNISMin  =  src.NumRejectedDNISMin
, tar.NumRejectedWorkflowAction  =  src.NumRejectedWorkflowAction
, tar.CallDuration  =  src.CallDuration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, DNIS
, CallCount
, NumRejectedDNISMax
, NumRejectedDNISMin
, NumRejectedWorkflowAction
, CallDuration
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.DNIS
, src.CallCount
, src.NumRejectedDNISMax
, src.NumRejectedDNISMin
, src.NumRejectedWorkflowAction
, src.CallDuration
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_DNISActivity_I', N'c:\\ComputerTALKDB\\RAW', N'Stat_DNISActivity_I.dat', N'MERGE [dbo].[Stat_DNISActivity_I] AS tar
USING [dbo].[z_Stat_DNISActivity_I] AS src
ON tar.StartDateTime = src.StartDateTime  AND  tar.DSTStatus = src.DSTStatus  AND  tar.SwitchID = src.SwitchID   AND  tar.DNIS = src.DNIS 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.DSTStatus  =  src.DSTStatus
, tar.SwitchID  =  src.SwitchID
, tar.DNIS  =  src.DNIS
, tar.IntervalDuration  =  src.IntervalDuration
, tar.IntervalID  =  src.IntervalID
, tar.CallCount  =  src.CallCount
, tar.NumRejectedDNISMax  =  src.NumRejectedDNISMax
, tar.NumRejectedDNISMin  =  src.NumRejectedDNISMin
, tar.NumRejectedWorkflowAction  =  src.NumRejectedWorkflowAction
, tar.CallDuration  =  src.CallDuration
, tar.RolledUp  =  src.RolledUp
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, DSTStatus
, SwitchID
, DNIS
, IntervalDuration
, IntervalID
, CallCount
, NumRejectedDNISMax
, NumRejectedDNISMin
, NumRejectedWorkflowAction
, CallDuration
, RolledUp
   )
   VALUES
   (
src.StartDateTime
, src.DSTStatus
, src.SwitchID
, src.DNIS
, src.IntervalDuration
, src.IntervalID
, src.CallCount
, src.NumRejectedDNISMax
, src.NumRejectedDNISMin
, src.NumRejectedWorkflowAction
, src.CallDuration
, src.RolledUp
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_DNISActivity_M', N'c:\\ComputerTALKDB\\RAW', N'Stat_DNISActivity_M.dat', N'MERGE [dbo].[Stat_DNISActivity_M] AS tar
USING [dbo].[z_Stat_DNISActivity_M] AS src
ON tar.StartDateTime = src.StartDateTime   AND  tar.SwitchID = src.SwitchID   AND  tar.DNIS = src.DNIS 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.DNIS  =  src.DNIS
, tar.CallCount  =  src.CallCount
, tar.NumRejectedDNISMax  =  src.NumRejectedDNISMax
, tar.NumRejectedDNISMin  =  src.NumRejectedDNISMin
, tar.NumRejectedWorkflowAction  =  src.NumRejectedWorkflowAction
, tar.CallDuration  =  src.CallDuration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, DNIS
, CallCount
, NumRejectedDNISMax
, NumRejectedDNISMin
, NumRejectedWorkflowAction
, CallDuration
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.DNIS
, src.CallCount
, src.NumRejectedDNISMax
, src.NumRejectedDNISMin
, src.NumRejectedWorkflowAction
, src.CallDuration
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_DNISActivity_W', N'c:\\ComputerTALKDB\\RAW', N'Stat_DNISActivity_W.dat', N'MERGE [dbo].[Stat_DNISActivity_W] AS tar
USING [dbo].[z_Stat_DNISActivity_W] AS src
ON tar.StartDateTime = src.StartDateTime   AND  tar.SwitchID = src.SwitchID   AND  tar.DNIS = src.DNIS 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.DNIS  =  src.DNIS
, tar.CallCount  =  src.CallCount
, tar.NumRejectedDNISMax  =  src.NumRejectedDNISMax
, tar.NumRejectedDNISMin  =  src.NumRejectedDNISMin
, tar.NumRejectedWorkflowAction  =  src.NumRejectedWorkflowAction
, tar.CallDuration  =  src.CallDuration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, DNIS
, CallCount
, NumRejectedDNISMax
, NumRejectedDNISMin
, NumRejectedWorkflowAction
, CallDuration
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.DNIS
, src.CallCount
, src.NumRejectedDNISMax
, src.NumRejectedDNISMin
, src.NumRejectedWorkflowAction
, src.CallDuration
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_DNISActivity_Y', N'c:\\ComputerTALKDB\\RAW', N'Stat_DNISActivity_Y.dat', N'MERGE [dbo].[Stat_DNISActivity_Y] AS tar
USING [dbo].[z_Stat_DNISActivity_Y] AS src
ON tar.StartDateTime = src.StartDateTime   AND  tar.SwitchID = src.SwitchID   AND  tar.DNIS = src.DNIS 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.DNIS  =  src.DNIS
, tar.CallCount  =  src.CallCount
, tar.NumRejectedDNISMax  =  src.NumRejectedDNISMax
, tar.NumRejectedDNISMin  =  src.NumRejectedDNISMin
, tar.NumRejectedWorkflowAction  =  src.NumRejectedWorkflowAction
, tar.CallDuration  =  src.CallDuration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, DNIS
, CallCount
, NumRejectedDNISMax
, NumRejectedDNISMin
, NumRejectedWorkflowAction
, CallDuration
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.DNIS
, src.CallCount
, src.NumRejectedDNISMax
, src.NumRejectedDNISMin
, src.NumRejectedWorkflowAction
, src.CallDuration
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_QueueActivity_D', N'c:\\ComputerTALKDB\\RAW', N'Stat_QueueActivity_D.dat', N'MERGE [dbo].[Stat_QueueActivity_D] AS tar
USING [dbo].[z_Stat_QueueActivity_D] AS src
ON tar.StartDateTime = src.StartDateTime   AND  tar.SwitchID = src.SwitchID   AND  tar.QueueID = src.QueueID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.QueueID  =  src.QueueID
, tar.HandledInThisQueueInt1  =  src.HandledInThisQueueInt1
, tar.HandledInThisQueueInt2  =  src.HandledInThisQueueInt2
, tar.HandledInThisQueueInt3  =  src.HandledInThisQueueInt3
, tar.HandledInThisQueueInt4  =  src.HandledInThisQueueInt4
, tar.HandledInThisQueueInt5  =  src.HandledInThisQueueInt5
, tar.HandledInThisQueueInt6  =  src.HandledInThisQueueInt6
, tar.HandledInOtherQueueInt1  =  src.HandledInOtherQueueInt1
, tar.HandledInOtherQueueInt2  =  src.HandledInOtherQueueInt2
, tar.HandledInOtherQueueInt3  =  src.HandledInOtherQueueInt3
, tar.HandledInOtherQueueInt4  =  src.HandledInOtherQueueInt4
, tar.HandledInOtherQueueInt5  =  src.HandledInOtherQueueInt5
, tar.HandledInOtherQueueInt6  =  src.HandledInOtherQueueInt6
, tar.AbandonedInt1  =  src.AbandonedInt1
, tar.AbandonedInt2  =  src.AbandonedInt2
, tar.AbandonedInt3  =  src.AbandonedInt3
, tar.AbandonedInt4  =  src.AbandonedInt4
, tar.AbandonedInt5  =  src.AbandonedInt5
, tar.AbandonedInt6  =  src.AbandonedInt6
, tar.Removed  =  src.Removed
, tar.TotalHandledInThisQueueTime  =  src.TotalHandledInThisQueueTime
, tar.TotalHandledInOtherQueueTime  =  src.TotalHandledInOtherQueueTime
, tar.TotalAbandonedTime  =  src.TotalAbandonedTime
, tar.TotalRemovedTime  =  src.TotalRemovedTime
, tar.LongestHandledInThisQueueTime  =  src.LongestHandledInThisQueueTime
, tar.LongestHandledInOtherQueueTime  =  src.LongestHandledInOtherQueueTime
, tar.LongestAbandonedTime  =  src.LongestAbandonedTime
, tar.LongestRemovedTime  =  src.LongestRemovedTime
, tar.TotalHandledLessThanTargetASA  =  src.TotalHandledLessThanTargetASA
, tar.TotalHandledLessThanTargetASAOther  =  src.TotalHandledLessThanTargetASAOther
, tar.MinAgentsLoggedOn  =  src.MinAgentsLoggedOn
, tar.MaxAgentsLoggedOn  =  src.MaxAgentsLoggedOn
, tar.TotalHandledLessThanTargetASA2  =  src.TotalHandledLessThanTargetASA2
, tar.TotalHandledLessThanTargetASAOther2  =  src.TotalHandledLessThanTargetASAOther2
, tar.RemovedInt1  =  src.RemovedInt1
, tar.RemovedInt2  =  src.RemovedInt2
, tar.RemovedInt3  =  src.RemovedInt3
, tar.RemovedInt4  =  src.RemovedInt4
, tar.RemovedInt5  =  src.RemovedInt5
, tar.RemovedInt6  =  src.RemovedInt6
, tar.TotalAbandonedLessThanThreshold  =  src.TotalAbandonedLessThanThreshold
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, QueueID
, HandledInThisQueueInt1
, HandledInThisQueueInt2
, HandledInThisQueueInt3
, HandledInThisQueueInt4
, HandledInThisQueueInt5
, HandledInThisQueueInt6
, HandledInOtherQueueInt1
, HandledInOtherQueueInt2
, HandledInOtherQueueInt3
, HandledInOtherQueueInt4
, HandledInOtherQueueInt5
, HandledInOtherQueueInt6
, AbandonedInt1
, AbandonedInt2
, AbandonedInt3
, AbandonedInt4
, AbandonedInt5
, AbandonedInt6
, Removed
, TotalHandledInThisQueueTime
, TotalHandledInOtherQueueTime
, TotalAbandonedTime
, TotalRemovedTime
, LongestHandledInThisQueueTime
, LongestHandledInOtherQueueTime
, LongestAbandonedTime
, LongestRemovedTime
, TotalHandledLessThanTargetASA
, TotalHandledLessThanTargetASAOther
, MinAgentsLoggedOn
, MaxAgentsLoggedOn
, TotalHandledLessThanTargetASA2
, TotalHandledLessThanTargetASAOther2
, RemovedInt1
, RemovedInt2
, RemovedInt3
, RemovedInt4
, RemovedInt5
, RemovedInt6
, TotalAbandonedLessThanThreshold
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.QueueID
, src.HandledInThisQueueInt1
, src.HandledInThisQueueInt2
, src.HandledInThisQueueInt3
, src.HandledInThisQueueInt4
, src.HandledInThisQueueInt5
, src.HandledInThisQueueInt6
, src.HandledInOtherQueueInt1
, src.HandledInOtherQueueInt2
, src.HandledInOtherQueueInt3
, src.HandledInOtherQueueInt4
, src.HandledInOtherQueueInt5
, src.HandledInOtherQueueInt6
, src.AbandonedInt1
, src.AbandonedInt2
, src.AbandonedInt3
, src.AbandonedInt4
, src.AbandonedInt5
, src.AbandonedInt6
, src.Removed
, src.TotalHandledInThisQueueTime
, src.TotalHandledInOtherQueueTime
, src.TotalAbandonedTime
, src.TotalRemovedTime
, src.LongestHandledInThisQueueTime
, src.LongestHandledInOtherQueueTime
, src.LongestAbandonedTime
, src.LongestRemovedTime
, src.TotalHandledLessThanTargetASA
, src.TotalHandledLessThanTargetASAOther
, src.MinAgentsLoggedOn
, src.MaxAgentsLoggedOn
, src.TotalHandledLessThanTargetASA2
, src.TotalHandledLessThanTargetASAOther2
, src.RemovedInt1
, src.RemovedInt2
, src.RemovedInt3
, src.RemovedInt4
, src.RemovedInt5
, src.RemovedInt6
, src.TotalAbandonedLessThanThreshold
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_QueueActivity_I', N'c:\\ComputerTALKDB\\RAW', N'Stat_QueueActivity_I.dat', N'MERGE [dbo].[Stat_QueueActivity_I] AS tar
USING [dbo].[z_Stat_QueueActivity_I] AS src
ON tar.StartDateTime = src.StartDateTime   AND  tar.DSTStatus = src.DSTStatus   AND  tar.SwitchID = src.SwitchID   AND  tar.QueueID = src.QueueID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.DSTStatus  =  src.DSTStatus
, tar.SwitchID  =  src.SwitchID
, tar.QueueID  =  src.QueueID
, tar.IntervalDuration  =  src.IntervalDuration
, tar.IntervalID  =  src.IntervalID
, tar.HandledInThisQueueInt1  =  src.HandledInThisQueueInt1
, tar.HandledInThisQueueInt2  =  src.HandledInThisQueueInt2
, tar.HandledInThisQueueInt3  =  src.HandledInThisQueueInt3
, tar.HandledInThisQueueInt4  =  src.HandledInThisQueueInt4
, tar.HandledInThisQueueInt5  =  src.HandledInThisQueueInt5
, tar.HandledInThisQueueInt6  =  src.HandledInThisQueueInt6
, tar.HandledInOtherQueueInt1  =  src.HandledInOtherQueueInt1
, tar.HandledInOtherQueueInt2  =  src.HandledInOtherQueueInt2
, tar.HandledInOtherQueueInt3  =  src.HandledInOtherQueueInt3
, tar.HandledInOtherQueueInt4  =  src.HandledInOtherQueueInt4
, tar.HandledInOtherQueueInt5  =  src.HandledInOtherQueueInt5
, tar.HandledInOtherQueueInt6  =  src.HandledInOtherQueueInt6
, tar.AbandonedInt1  =  src.AbandonedInt1
, tar.AbandonedInt2  =  src.AbandonedInt2
, tar.AbandonedInt3  =  src.AbandonedInt3
, tar.AbandonedInt4  =  src.AbandonedInt4
, tar.AbandonedInt5  =  src.AbandonedInt5
, tar.AbandonedInt6  =  src.AbandonedInt6
, tar.Removed  =  src.Removed
, tar.TotalHandledInThisQueueTime  =  src.TotalHandledInThisQueueTime
, tar.TotalHandledInOtherQueueTime  =  src.TotalHandledInOtherQueueTime
, tar.TotalAbandonedTime  =  src.TotalAbandonedTime
, tar.TotalRemovedTime  =  src.TotalRemovedTime
, tar.LongestHandledInThisQueueTime  =  src.LongestHandledInThisQueueTime
, tar.LongestHandledInOtherQueueTime  =  src.LongestHandledInOtherQueueTime
, tar.LongestAbandonedTime  =  src.LongestAbandonedTime
, tar.LongestRemovedTime  =  src.LongestRemovedTime
, tar.TotalHandledLessThanTargetASA  =  src.TotalHandledLessThanTargetASA
, tar.TotalHandledLessThanTargetASAOther  =  src.TotalHandledLessThanTargetASAOther
, tar.MinAgentsLoggedOn  =  src.MinAgentsLoggedOn
, tar.MaxAgentsLoggedOn  =  src.MaxAgentsLoggedOn
, tar.RolledUp  =  src.RolledUp
, tar.TotalHandledLessThanTargetASA2  =  src.TotalHandledLessThanTargetASA2
, tar.TotalHandledLessThanTargetASAOther2  =  src.TotalHandledLessThanTargetASAOther2
, tar.RemovedInt1  =  src.RemovedInt1
, tar.RemovedInt2  =  src.RemovedInt2
, tar.RemovedInt3  =  src.RemovedInt3
, tar.RemovedInt4  =  src.RemovedInt4
, tar.RemovedInt5  =  src.RemovedInt5
, tar.RemovedInt6  =  src.RemovedInt6
, tar.TotalAbandonedLessThanThreshold  =  src.TotalAbandonedLessThanThreshold
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, DSTStatus
, SwitchID
, QueueID
, IntervalDuration
, IntervalID
, HandledInThisQueueInt1
, HandledInThisQueueInt2
, HandledInThisQueueInt3
, HandledInThisQueueInt4
, HandledInThisQueueInt5
, HandledInThisQueueInt6
, HandledInOtherQueueInt1
, HandledInOtherQueueInt2
, HandledInOtherQueueInt3
, HandledInOtherQueueInt4
, HandledInOtherQueueInt5
, HandledInOtherQueueInt6
, AbandonedInt1
, AbandonedInt2
, AbandonedInt3
, AbandonedInt4
, AbandonedInt5
, AbandonedInt6
, Removed
, TotalHandledInThisQueueTime
, TotalHandledInOtherQueueTime
, TotalAbandonedTime
, TotalRemovedTime
, LongestHandledInThisQueueTime
, LongestHandledInOtherQueueTime
, LongestAbandonedTime
, LongestRemovedTime
, TotalHandledLessThanTargetASA
, TotalHandledLessThanTargetASAOther
, MinAgentsLoggedOn
, MaxAgentsLoggedOn
, RolledUp
, TotalHandledLessThanTargetASA2
, TotalHandledLessThanTargetASAOther2
, RemovedInt1
, RemovedInt2
, RemovedInt3
, RemovedInt4
, RemovedInt5
, RemovedInt6
, TotalAbandonedLessThanThreshold
   )
   VALUES
   (
src.StartDateTime
, src.DSTStatus
, src.SwitchID
, src.QueueID
, src.IntervalDuration
, src.IntervalID
, src.HandledInThisQueueInt1
, src.HandledInThisQueueInt2
, src.HandledInThisQueueInt3
, src.HandledInThisQueueInt4
, src.HandledInThisQueueInt5
, src.HandledInThisQueueInt6
, src.HandledInOtherQueueInt1
, src.HandledInOtherQueueInt2
, src.HandledInOtherQueueInt3
, src.HandledInOtherQueueInt4
, src.HandledInOtherQueueInt5
, src.HandledInOtherQueueInt6
, src.AbandonedInt1
, src.AbandonedInt2
, src.AbandonedInt3
, src.AbandonedInt4
, src.AbandonedInt5
, src.AbandonedInt6
, src.Removed
, src.TotalHandledInThisQueueTime
, src.TotalHandledInOtherQueueTime
, src.TotalAbandonedTime
, src.TotalRemovedTime
, src.LongestHandledInThisQueueTime
, src.LongestHandledInOtherQueueTime
, src.LongestAbandonedTime
, src.LongestRemovedTime
, src.TotalHandledLessThanTargetASA
, src.TotalHandledLessThanTargetASAOther
, src.MinAgentsLoggedOn
, src.MaxAgentsLoggedOn
, src.RolledUp
, src.TotalHandledLessThanTargetASA2
, src.TotalHandledLessThanTargetASAOther2
, src.RemovedInt1
, src.RemovedInt2
, src.RemovedInt3
, src.RemovedInt4
, src.RemovedInt5
, src.RemovedInt6
, src.TotalAbandonedLessThanThreshold
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_QueueActivity_M', N'c:\\ComputerTALKDB\\RAW', N'Stat_QueueActivity_M.dat', N'MERGE [dbo].[Stat_QueueActivity_M] AS tar
USING [dbo].[z_Stat_QueueActivity_M] AS src
ON tar.StartDateTime = src.StartDateTime  AND  tar.SwitchID = src.SwitchID   AND  tar.QueueID = src.QueueID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.QueueID  =  src.QueueID
, tar.HandledInThisQueueInt1  =  src.HandledInThisQueueInt1
, tar.HandledInThisQueueInt2  =  src.HandledInThisQueueInt2
, tar.HandledInThisQueueInt3  =  src.HandledInThisQueueInt3
, tar.HandledInThisQueueInt4  =  src.HandledInThisQueueInt4
, tar.HandledInThisQueueInt5  =  src.HandledInThisQueueInt5
, tar.HandledInThisQueueInt6  =  src.HandledInThisQueueInt6
, tar.HandledInOtherQueueInt1  =  src.HandledInOtherQueueInt1
, tar.HandledInOtherQueueInt2  =  src.HandledInOtherQueueInt2
, tar.HandledInOtherQueueInt3  =  src.HandledInOtherQueueInt3
, tar.HandledInOtherQueueInt4  =  src.HandledInOtherQueueInt4
, tar.HandledInOtherQueueInt5  =  src.HandledInOtherQueueInt5
, tar.HandledInOtherQueueInt6  =  src.HandledInOtherQueueInt6
, tar.AbandonedInt1  =  src.AbandonedInt1
, tar.AbandonedInt2  =  src.AbandonedInt2
, tar.AbandonedInt3  =  src.AbandonedInt3
, tar.AbandonedInt4  =  src.AbandonedInt4
, tar.AbandonedInt5  =  src.AbandonedInt5
, tar.AbandonedInt6  =  src.AbandonedInt6
, tar.Removed  =  src.Removed
, tar.TotalHandledInThisQueueTime  =  src.TotalHandledInThisQueueTime
, tar.TotalHandledInOtherQueueTime  =  src.TotalHandledInOtherQueueTime
, tar.TotalAbandonedTime  =  src.TotalAbandonedTime
, tar.TotalRemovedTime  =  src.TotalRemovedTime
, tar.LongestHandledInThisQueueTime  =  src.LongestHandledInThisQueueTime
, tar.LongestHandledInOtherQueueTime  =  src.LongestHandledInOtherQueueTime
, tar.LongestAbandonedTime  =  src.LongestAbandonedTime
, tar.LongestRemovedTime  =  src.LongestRemovedTime
, tar.TotalHandledLessThanTargetASA  =  src.TotalHandledLessThanTargetASA
, tar.TotalHandledLessThanTargetASAOther  =  src.TotalHandledLessThanTargetASAOther
, tar.MinAgentsLoggedOn  =  src.MinAgentsLoggedOn
, tar.MaxAgentsLoggedOn  =  src.MaxAgentsLoggedOn
, tar.TotalHandledLessThanTargetASA2  =  src.TotalHandledLessThanTargetASA2
, tar.TotalHandledLessThanTargetASAOther2  =  src.TotalHandledLessThanTargetASAOther2
, tar.RemovedInt1  =  src.RemovedInt1
, tar.RemovedInt2  =  src.RemovedInt2
, tar.RemovedInt3  =  src.RemovedInt3
, tar.RemovedInt4  =  src.RemovedInt4
, tar.RemovedInt5  =  src.RemovedInt5
, tar.RemovedInt6  =  src.RemovedInt6
, tar.TotalAbandonedLessThanThreshold  =  src.TotalAbandonedLessThanThreshold
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, QueueID
, HandledInThisQueueInt1
, HandledInThisQueueInt2
, HandledInThisQueueInt3
, HandledInThisQueueInt4
, HandledInThisQueueInt5
, HandledInThisQueueInt6
, HandledInOtherQueueInt1
, HandledInOtherQueueInt2
, HandledInOtherQueueInt3
, HandledInOtherQueueInt4
, HandledInOtherQueueInt5
, HandledInOtherQueueInt6
, AbandonedInt1
, AbandonedInt2
, AbandonedInt3
, AbandonedInt4
, AbandonedInt5
, AbandonedInt6
, Removed
, TotalHandledInThisQueueTime
, TotalHandledInOtherQueueTime
, TotalAbandonedTime
, TotalRemovedTime
, LongestHandledInThisQueueTime
, LongestHandledInOtherQueueTime
, LongestAbandonedTime
, LongestRemovedTime
, TotalHandledLessThanTargetASA
, TotalHandledLessThanTargetASAOther
, MinAgentsLoggedOn
, MaxAgentsLoggedOn
, TotalHandledLessThanTargetASA2
, TotalHandledLessThanTargetASAOther2
, RemovedInt1
, RemovedInt2
, RemovedInt3
, RemovedInt4
, RemovedInt5
, RemovedInt6
, TotalAbandonedLessThanThreshold
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.QueueID
, src.HandledInThisQueueInt1
, src.HandledInThisQueueInt2
, src.HandledInThisQueueInt3
, src.HandledInThisQueueInt4
, src.HandledInThisQueueInt5
, src.HandledInThisQueueInt6
, src.HandledInOtherQueueInt1
, src.HandledInOtherQueueInt2
, src.HandledInOtherQueueInt3
, src.HandledInOtherQueueInt4
, src.HandledInOtherQueueInt5
, src.HandledInOtherQueueInt6
, src.AbandonedInt1
, src.AbandonedInt2
, src.AbandonedInt3
, src.AbandonedInt4
, src.AbandonedInt5
, src.AbandonedInt6
, src.Removed
, src.TotalHandledInThisQueueTime
, src.TotalHandledInOtherQueueTime
, src.TotalAbandonedTime
, src.TotalRemovedTime
, src.LongestHandledInThisQueueTime
, src.LongestHandledInOtherQueueTime
, src.LongestAbandonedTime
, src.LongestRemovedTime
, src.TotalHandledLessThanTargetASA
, src.TotalHandledLessThanTargetASAOther
, src.MinAgentsLoggedOn
, src.MaxAgentsLoggedOn
, src.TotalHandledLessThanTargetASA2
, src.TotalHandledLessThanTargetASAOther2
, src.RemovedInt1
, src.RemovedInt2
, src.RemovedInt3
, src.RemovedInt4
, src.RemovedInt5
, src.RemovedInt6
, src.TotalAbandonedLessThanThreshold
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_QueueActivity_W', N'c:\\ComputerTALKDB\\RAW', N'Stat_QueueActivity_W.dat', N'MERGE [dbo].[Stat_QueueActivity_W] AS tar
USING [dbo].[z_Stat_QueueActivity_W] AS src
ON tar.StartDateTime = src.StartDateTime  AND  tar.SwitchID = src.SwitchID   AND  tar.QueueID = src.QueueID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.QueueID  =  src.QueueID
, tar.HandledInThisQueueInt1  =  src.HandledInThisQueueInt1
, tar.HandledInThisQueueInt2  =  src.HandledInThisQueueInt2
, tar.HandledInThisQueueInt3  =  src.HandledInThisQueueInt3
, tar.HandledInThisQueueInt4  =  src.HandledInThisQueueInt4
, tar.HandledInThisQueueInt5  =  src.HandledInThisQueueInt5
, tar.HandledInThisQueueInt6  =  src.HandledInThisQueueInt6
, tar.HandledInOtherQueueInt1  =  src.HandledInOtherQueueInt1
, tar.HandledInOtherQueueInt2  =  src.HandledInOtherQueueInt2
, tar.HandledInOtherQueueInt3  =  src.HandledInOtherQueueInt3
, tar.HandledInOtherQueueInt4  =  src.HandledInOtherQueueInt4
, tar.HandledInOtherQueueInt5  =  src.HandledInOtherQueueInt5
, tar.HandledInOtherQueueInt6  =  src.HandledInOtherQueueInt6
, tar.AbandonedInt1  =  src.AbandonedInt1
, tar.AbandonedInt2  =  src.AbandonedInt2
, tar.AbandonedInt3  =  src.AbandonedInt3
, tar.AbandonedInt4  =  src.AbandonedInt4
, tar.AbandonedInt5  =  src.AbandonedInt5
, tar.AbandonedInt6  =  src.AbandonedInt6
, tar.Removed  =  src.Removed
, tar.TotalHandledInThisQueueTime  =  src.TotalHandledInThisQueueTime
, tar.TotalHandledInOtherQueueTime  =  src.TotalHandledInOtherQueueTime
, tar.TotalAbandonedTime  =  src.TotalAbandonedTime
, tar.TotalRemovedTime  =  src.TotalRemovedTime
, tar.LongestHandledInThisQueueTime  =  src.LongestHandledInThisQueueTime
, tar.LongestHandledInOtherQueueTime  =  src.LongestHandledInOtherQueueTime
, tar.LongestAbandonedTime  =  src.LongestAbandonedTime
, tar.LongestRemovedTime  =  src.LongestRemovedTime
, tar.TotalHandledLessThanTargetASA  =  src.TotalHandledLessThanTargetASA
, tar.TotalHandledLessThanTargetASAOther  =  src.TotalHandledLessThanTargetASAOther
, tar.MinAgentsLoggedOn  =  src.MinAgentsLoggedOn
, tar.MaxAgentsLoggedOn  =  src.MaxAgentsLoggedOn
, tar.TotalHandledLessThanTargetASA2  =  src.TotalHandledLessThanTargetASA2
, tar.TotalHandledLessThanTargetASAOther2  =  src.TotalHandledLessThanTargetASAOther2
, tar.RemovedInt1  =  src.RemovedInt1
, tar.RemovedInt2  =  src.RemovedInt2
, tar.RemovedInt3  =  src.RemovedInt3
, tar.RemovedInt4  =  src.RemovedInt4
, tar.RemovedInt5  =  src.RemovedInt5
, tar.RemovedInt6  =  src.RemovedInt6
, tar.TotalAbandonedLessThanThreshold  =  src.TotalAbandonedLessThanThreshold
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, QueueID
, HandledInThisQueueInt1
, HandledInThisQueueInt2
, HandledInThisQueueInt3
, HandledInThisQueueInt4
, HandledInThisQueueInt5
, HandledInThisQueueInt6
, HandledInOtherQueueInt1
, HandledInOtherQueueInt2
, HandledInOtherQueueInt3
, HandledInOtherQueueInt4
, HandledInOtherQueueInt5
, HandledInOtherQueueInt6
, AbandonedInt1
, AbandonedInt2
, AbandonedInt3
, AbandonedInt4
, AbandonedInt5
, AbandonedInt6
, Removed
, TotalHandledInThisQueueTime
, TotalHandledInOtherQueueTime
, TotalAbandonedTime
, TotalRemovedTime
, LongestHandledInThisQueueTime
, LongestHandledInOtherQueueTime
, LongestAbandonedTime
, LongestRemovedTime
, TotalHandledLessThanTargetASA
, TotalHandledLessThanTargetASAOther
, MinAgentsLoggedOn
, MaxAgentsLoggedOn
, TotalHandledLessThanTargetASA2
, TotalHandledLessThanTargetASAOther2
, RemovedInt1
, RemovedInt2
, RemovedInt3
, RemovedInt4
, RemovedInt5
, RemovedInt6
, TotalAbandonedLessThanThreshold
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.QueueID
, src.HandledInThisQueueInt1
, src.HandledInThisQueueInt2
, src.HandledInThisQueueInt3
, src.HandledInThisQueueInt4
, src.HandledInThisQueueInt5
, src.HandledInThisQueueInt6
, src.HandledInOtherQueueInt1
, src.HandledInOtherQueueInt2
, src.HandledInOtherQueueInt3
, src.HandledInOtherQueueInt4
, src.HandledInOtherQueueInt5
, src.HandledInOtherQueueInt6
, src.AbandonedInt1
, src.AbandonedInt2
, src.AbandonedInt3
, src.AbandonedInt4
, src.AbandonedInt5
, src.AbandonedInt6
, src.Removed
, src.TotalHandledInThisQueueTime
, src.TotalHandledInOtherQueueTime
, src.TotalAbandonedTime
, src.TotalRemovedTime
, src.LongestHandledInThisQueueTime
, src.LongestHandledInOtherQueueTime
, src.LongestAbandonedTime
, src.LongestRemovedTime
, src.TotalHandledLessThanTargetASA
, src.TotalHandledLessThanTargetASAOther
, src.MinAgentsLoggedOn
, src.MaxAgentsLoggedOn
, src.TotalHandledLessThanTargetASA2
, src.TotalHandledLessThanTargetASAOther2
, src.RemovedInt1
, src.RemovedInt2
, src.RemovedInt3
, src.RemovedInt4
, src.RemovedInt5
, src.RemovedInt6
, src.TotalAbandonedLessThanThreshold
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_QueueActivity_Y', N'c:\\ComputerTALKDB\\RAW', N'Stat_QueueActivity_Y.dat', N'MERGE [dbo].[Stat_QueueActivity_Y] AS tar
USING [dbo].[z_Stat_QueueActivity_Y] AS src
ON tar.StartDateTime = src.StartDateTime  AND  tar.SwitchID = src.SwitchID   AND  tar.QueueID = src.QueueID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.QueueID  =  src.QueueID
, tar.HandledInThisQueueInt1  =  src.HandledInThisQueueInt1
, tar.HandledInThisQueueInt2  =  src.HandledInThisQueueInt2
, tar.HandledInThisQueueInt3  =  src.HandledInThisQueueInt3
, tar.HandledInThisQueueInt4  =  src.HandledInThisQueueInt4
, tar.HandledInThisQueueInt5  =  src.HandledInThisQueueInt5
, tar.HandledInThisQueueInt6  =  src.HandledInThisQueueInt6
, tar.HandledInOtherQueueInt1  =  src.HandledInOtherQueueInt1
, tar.HandledInOtherQueueInt2  =  src.HandledInOtherQueueInt2
, tar.HandledInOtherQueueInt3  =  src.HandledInOtherQueueInt3
, tar.HandledInOtherQueueInt4  =  src.HandledInOtherQueueInt4
, tar.HandledInOtherQueueInt5  =  src.HandledInOtherQueueInt5
, tar.HandledInOtherQueueInt6  =  src.HandledInOtherQueueInt6
, tar.AbandonedInt1  =  src.AbandonedInt1
, tar.AbandonedInt2  =  src.AbandonedInt2
, tar.AbandonedInt3  =  src.AbandonedInt3
, tar.AbandonedInt4  =  src.AbandonedInt4
, tar.AbandonedInt5  =  src.AbandonedInt5
, tar.AbandonedInt6  =  src.AbandonedInt6
, tar.Removed  =  src.Removed
, tar.TotalHandledInThisQueueTime  =  src.TotalHandledInThisQueueTime
, tar.TotalHandledInOtherQueueTime  =  src.TotalHandledInOtherQueueTime
, tar.TotalAbandonedTime  =  src.TotalAbandonedTime
, tar.TotalRemovedTime  =  src.TotalRemovedTime
, tar.LongestHandledInThisQueueTime  =  src.LongestHandledInThisQueueTime
, tar.LongestHandledInOtherQueueTime  =  src.LongestHandledInOtherQueueTime
, tar.LongestAbandonedTime  =  src.LongestAbandonedTime
, tar.LongestRemovedTime  =  src.LongestRemovedTime
, tar.TotalHandledLessThanTargetASA  =  src.TotalHandledLessThanTargetASA
, tar.TotalHandledLessThanTargetASAOther  =  src.TotalHandledLessThanTargetASAOther
, tar.MinAgentsLoggedOn  =  src.MinAgentsLoggedOn
, tar.MaxAgentsLoggedOn  =  src.MaxAgentsLoggedOn
, tar.TotalHandledLessThanTargetASA2  =  src.TotalHandledLessThanTargetASA2
, tar.TotalHandledLessThanTargetASAOther2  =  src.TotalHandledLessThanTargetASAOther2
, tar.RemovedInt1  =  src.RemovedInt1
, tar.RemovedInt2  =  src.RemovedInt2
, tar.RemovedInt3  =  src.RemovedInt3
, tar.RemovedInt4  =  src.RemovedInt4
, tar.RemovedInt5  =  src.RemovedInt5
, tar.RemovedInt6  =  src.RemovedInt6
, tar.TotalAbandonedLessThanThreshold  =  src.TotalAbandonedLessThanThreshold
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, QueueID
, HandledInThisQueueInt1
, HandledInThisQueueInt2
, HandledInThisQueueInt3
, HandledInThisQueueInt4
, HandledInThisQueueInt5
, HandledInThisQueueInt6
, HandledInOtherQueueInt1
, HandledInOtherQueueInt2
, HandledInOtherQueueInt3
, HandledInOtherQueueInt4
, HandledInOtherQueueInt5
, HandledInOtherQueueInt6
, AbandonedInt1
, AbandonedInt2
, AbandonedInt3
, AbandonedInt4
, AbandonedInt5
, AbandonedInt6
, Removed
, TotalHandledInThisQueueTime
, TotalHandledInOtherQueueTime
, TotalAbandonedTime
, TotalRemovedTime
, LongestHandledInThisQueueTime
, LongestHandledInOtherQueueTime
, LongestAbandonedTime
, LongestRemovedTime
, TotalHandledLessThanTargetASA
, TotalHandledLessThanTargetASAOther
, MinAgentsLoggedOn
, MaxAgentsLoggedOn
, TotalHandledLessThanTargetASA2
, TotalHandledLessThanTargetASAOther2
, RemovedInt1
, RemovedInt2
, RemovedInt3
, RemovedInt4
, RemovedInt5
, RemovedInt6
, TotalAbandonedLessThanThreshold
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.QueueID
, src.HandledInThisQueueInt1
, src.HandledInThisQueueInt2
, src.HandledInThisQueueInt3
, src.HandledInThisQueueInt4
, src.HandledInThisQueueInt5
, src.HandledInThisQueueInt6
, src.HandledInOtherQueueInt1
, src.HandledInOtherQueueInt2
, src.HandledInOtherQueueInt3
, src.HandledInOtherQueueInt4
, src.HandledInOtherQueueInt5
, src.HandledInOtherQueueInt6
, src.AbandonedInt1
, src.AbandonedInt2
, src.AbandonedInt3
, src.AbandonedInt4
, src.AbandonedInt5
, src.AbandonedInt6
, src.Removed
, src.TotalHandledInThisQueueTime
, src.TotalHandledInOtherQueueTime
, src.TotalAbandonedTime
, src.TotalRemovedTime
, src.LongestHandledInThisQueueTime
, src.LongestHandledInOtherQueueTime
, src.LongestAbandonedTime
, src.LongestRemovedTime
, src.TotalHandledLessThanTargetASA
, src.TotalHandledLessThanTargetASAOther
, src.MinAgentsLoggedOn
, src.MaxAgentsLoggedOn
, src.TotalHandledLessThanTargetASA2
, src.TotalHandledLessThanTargetASAOther2
, src.RemovedInt1
, src.RemovedInt2
, src.RemovedInt3
, src.RemovedInt4
, src.RemovedInt5
, src.RemovedInt6
, src.TotalAbandonedLessThanThreshold
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_SkillActivity_D', N'c:\\ComputerTALKDB\\RAW', N'Stat_SkillActivity_D.dat', N'MERGE [dbo].[Stat_SkillActivity_D] AS tar
USING [dbo].[z_Stat_SkillActivity_D] AS src
ON tar.StartDateTime = src.StartDateTime  AND  tar.SwitchID = src.SwitchID   AND  tar.SkillID = src.SkillID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.SkillID  =  src.SkillID
, tar.UseCount  =  src.UseCount
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, SkillID
, UseCount
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.SkillID
, src.UseCount
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_SkillActivity_I', N'c:\\ComputerTALKDB\\RAW', N'Stat_SkillActivity_I.dat', N'MERGE [dbo].[Stat_SkillActivity_I] AS tar
USING [dbo].[z_Stat_SkillActivity_I] AS src
ON tar.StartDateTime = src.StartDateTime AND tar.DSTStatus = src.DSTStatus  AND  tar.SwitchID = src.SwitchID   AND  tar.SkillID = src.SkillID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.DSTStatus  =  src.DSTStatus
, tar.SwitchID  =  src.SwitchID
, tar.SkillID  =  src.SkillID
, tar.IntervalDuration  =  src.IntervalDuration
, tar.IntervalID  =  src.IntervalID
, tar.UseCount  =  src.UseCount
, tar.RolledUp  =  src.RolledUp
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, DSTStatus
, SwitchID
, SkillID
, IntervalDuration
, IntervalID
, UseCount
, RolledUp
   )
   VALUES
   (
src.StartDateTime
, src.DSTStatus
, src.SwitchID
, src.SkillID
, src.IntervalDuration
, src.IntervalID
, src.UseCount
, src.RolledUp
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');




INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_SkillActivity_M', N'c:\\ComputerTALKDB\\RAW', N'Stat_SkillActivity_M.dat', N'MERGE [dbo].[Stat_SkillActivity_M] AS tar
USING [dbo].[z_Stat_SkillActivity_M] AS src
ON tar.StartDateTime = src.StartDateTime  AND  tar.SwitchID = src.SwitchID   AND  tar.SkillID = src.SkillID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.SkillID  =  src.SkillID
, tar.UseCount  =  src.UseCount
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, SkillID
, UseCount
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.SkillID
, src.UseCount
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_SkillActivity_W', N'c:\\ComputerTALKDB\\RAW', N'Stat_SkillActivity_W.dat', N'MERGE [dbo].[Stat_SkillActivity_W] AS tar
USING [dbo].[z_Stat_SkillActivity_W] AS src
ON tar.StartDateTime = src.StartDateTime  AND  tar.SwitchID = src.SwitchID   AND  tar.SkillID = src.SkillID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.SkillID  =  src.SkillID
, tar.UseCount  =  src.UseCount
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, SkillID
, UseCount
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.SkillID
, src.UseCount
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_SkillActivity_Y', N'c:\\ComputerTALKDB\\RAW', N'Stat_SkillActivity_Y.dat', N'MERGE [dbo].[Stat_SkillActivity_Y] AS tar
USING [dbo].[z_Stat_SkillActivity_Y] AS src
ON tar.StartDateTime = src.StartDateTime  AND  tar.SwitchID = src.SwitchID   AND  tar.SkillID = src.SkillID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.SkillID  =  src.SkillID
, tar.UseCount  =  src.UseCount
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, SkillID
, UseCount
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.SkillID
, src.UseCount
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_TrunkActivity_D', N'c:\\ComputerTALKDB\\RAW', N'Stat_TrunkActivity_D.dat', N'MERGE [dbo].[Stat_TrunkActivity_D] AS tar
USING [dbo].[z_Stat_TrunkActivity_D] AS src
ON tar.StartDateTime = src.StartDateTime  AND  tar.SwitchID = src.SwitchID   AND  tar.AddressID = src.AddressID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AddressID  =  src.AddressID
, tar.InboundCallCount  =  src.InboundCallCount
, tar.OutboundCallCount  =  src.OutboundCallCount
, tar.NumRejected  =  src.NumRejected
, tar.InboundCallDuration  =  src.InboundCallDuration
, tar.OutboundCallDuration  =  src.OutboundCallDuration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, AddressID
, InboundCallCount
, OutboundCallCount
, NumRejected
, InboundCallDuration
, OutboundCallDuration
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.AddressID
, src.InboundCallCount
, src.OutboundCallCount
, src.NumRejected
, src.InboundCallDuration
, src.OutboundCallDuration
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');




INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_TrunkActivity_I', N'c:\\ComputerTALKDB\\RAW', N'Stat_TrunkActivity_I.dat', N'MERGE [dbo].[Stat_TrunkActivity_I] AS tar
USING [dbo].[z_Stat_TrunkActivity_I] AS src
ON tar.StartDateTime = src.StartDateTime  AND  tar.DSTStatus = src.DSTStatus  AND  tar.SwitchID = src.SwitchID   AND  tar.AddressID = src.AddressID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.DSTStatus  =  src.DSTStatus
, tar.SwitchID  =  src.SwitchID
, tar.AddressID  =  src.AddressID
, tar.IntervalDuration  =  src.IntervalDuration
, tar.IntervalID  =  src.IntervalID
, tar.InboundCallCount  =  src.InboundCallCount
, tar.OutboundCallCount  =  src.OutboundCallCount
, tar.NumRejected  =  src.NumRejected
, tar.InboundCallDuration  =  src.InboundCallDuration
, tar.OutboundCallDuration  =  src.OutboundCallDuration
, tar.RolledUp  =  src.RolledUp
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, DSTStatus
, SwitchID
, AddressID
, IntervalDuration
, IntervalID
, InboundCallCount
, OutboundCallCount
, NumRejected
, InboundCallDuration
, OutboundCallDuration
, RolledUp
   )
   VALUES
   (
src.StartDateTime
, src.DSTStatus
, src.SwitchID
, src.AddressID
, src.IntervalDuration
, src.IntervalID
, src.InboundCallCount
, src.OutboundCallCount
, src.NumRejected
, src.InboundCallDuration
, src.OutboundCallDuration
, src.RolledUp
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');




INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_TrunkActivity_M', N'c:\\ComputerTALKDB\\RAW', N'Stat_TrunkActivity_M.dat', N'MERGE [dbo].[Stat_TrunkActivity_M] AS tar
USING [dbo].[z_Stat_TrunkActivity_M] AS src
ON tar.StartDateTime = src.StartDateTime   AND  tar.SwitchID = src.SwitchID   AND  tar.AddressID = src.AddressID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AddressID  =  src.AddressID
, tar.InboundCallCount  =  src.InboundCallCount
, tar.OutboundCallCount  =  src.OutboundCallCount
, tar.NumRejected  =  src.NumRejected
, tar.InboundCallDuration  =  src.InboundCallDuration
, tar.OutboundCallDuration  =  src.OutboundCallDuration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, AddressID
, InboundCallCount
, OutboundCallCount
, NumRejected
, InboundCallDuration
, OutboundCallDuration
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.AddressID
, src.InboundCallCount
, src.OutboundCallCount
, src.NumRejected
, src.InboundCallDuration
, src.OutboundCallDuration
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');




INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_TrunkActivity_W', N'c:\\ComputerTALKDB\\RAW', N'Stat_TrunkActivity_W.dat', N'MERGE [dbo].[Stat_TrunkActivity_W] AS tar
USING [dbo].[z_Stat_TrunkActivity_W] AS src
ON tar.StartDateTime = src.StartDateTime   AND  tar.SwitchID = src.SwitchID   AND  tar.AddressID = src.AddressID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AddressID  =  src.AddressID
, tar.InboundCallCount  =  src.InboundCallCount
, tar.OutboundCallCount  =  src.OutboundCallCount
, tar.NumRejected  =  src.NumRejected
, tar.InboundCallDuration  =  src.InboundCallDuration
, tar.OutboundCallDuration  =  src.OutboundCallDuration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, AddressID
, InboundCallCount
, OutboundCallCount
, NumRejected
, InboundCallDuration
, OutboundCallDuration
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.AddressID
, src.InboundCallCount
, src.OutboundCallCount
, src.NumRejected
, src.InboundCallDuration
, src.OutboundCallDuration
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');




INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_TrunkActivity_Y', N'c:\\ComputerTALKDB\\RAW', N'Stat_TrunkActivity_Y.dat', N'MERGE [dbo].[Stat_TrunkActivity_Y] AS tar
USING [dbo].[z_Stat_TrunkActivity_Y] AS src
ON tar.StartDateTime = src.StartDateTime   AND  tar.SwitchID = src.SwitchID   AND  tar.AddressID = src.AddressID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.AddressID  =  src.AddressID
, tar.InboundCallCount  =  src.InboundCallCount
, tar.OutboundCallCount  =  src.OutboundCallCount
, tar.NumRejected  =  src.NumRejected
, tar.InboundCallDuration  =  src.InboundCallDuration
, tar.OutboundCallDuration  =  src.OutboundCallDuration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, AddressID
, InboundCallCount
, OutboundCallCount
, NumRejected
, InboundCallDuration
, OutboundCallDuration
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.AddressID
, src.InboundCallCount
, src.OutboundCallCount
, src.NumRejected
, src.InboundCallDuration
, src.OutboundCallDuration
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');




INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_WorkflowActionActivity_D', N'c:\\ComputerTALKDB\\RAW', N'Stat_WorkflowActionActivity_D.dat', N'MERGE [dbo].[Stat_WorkflowActionActivity_D] AS tar
USING [dbo].[z_Stat_WorkflowActionActivity_D] AS src
ON tar.StartDateTime = src.StartDateTime   AND  tar.SwitchID = src.SwitchID   AND  tar.WorkflowID = src.WorkflowID   AND  tar.PageID = src.PageID    AND  tar.ActionID = src.ActionID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.WorkflowID  =  src.WorkflowID
, tar.PageID  =  src.PageID
, tar.ActionID  =  src.ActionID
, tar.UseCount  =  src.UseCount
, tar.Duration  =  src.Duration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, WorkflowID
, PageID
, ActionID
, UseCount
, Duration
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.WorkflowID
, src.PageID
, src.ActionID
, src.UseCount
, src.Duration
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');




INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_WorkflowActionActivity_I', N'c:\\ComputerTALKDB\\RAW', N'Stat_WorkflowActionActivity_I.dat', N'MERGE [dbo].[Stat_WorkflowActionActivity_I] AS tar
USING [dbo].[z_Stat_WorkflowActionActivity_I] AS src
ON tar.StartDateTime = src.StartDateTime   AND  tar.DSTStatus = src.DSTStatus   AND  tar.SwitchID = src.SwitchID   AND  tar.WorkflowID = src.WorkflowID   AND  tar.PageID = src.PageID    AND  tar.ActionID = src.ActionID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.DSTStatus  =  src.DSTStatus
, tar.SwitchID  =  src.SwitchID
, tar.WorkflowID  =  src.WorkflowID
, tar.PageID  =  src.PageID
, tar.ActionID  =  src.ActionID
, tar.IntervalDuration  =  src.IntervalDuration
, tar.IntervalID  =  src.IntervalID
, tar.UseCount  =  src.UseCount
, tar.Duration  =  src.Duration
, tar.RolledUp  =  src.RolledUp
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, DSTStatus
, SwitchID
, WorkflowID
, PageID
, ActionID
, IntervalDuration
, IntervalID
, UseCount
, Duration
, RolledUp
   )
   VALUES
   (
src.StartDateTime
, src.DSTStatus
, src.SwitchID
, src.WorkflowID
, src.PageID
, src.ActionID
, src.IntervalDuration
, src.IntervalID
, src.UseCount
, src.Duration
, src.RolledUp
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');




INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_WorkflowActionActivity_M', N'c:\\ComputerTALKDB\\RAW', N'Stat_WorkflowActionActivity_M.dat', N'MERGE [dbo].[Stat_WorkflowActionActivity_M] AS tar
USING [dbo].[z_Stat_WorkflowActionActivity_M] AS src
ON tar.StartDateTime = src.StartDateTime   AND  tar.SwitchID = src.SwitchID   AND  tar.WorkflowID = src.WorkflowID   AND  tar.PageID = src.PageID    AND  tar.ActionID = src.ActionID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.WorkflowID  =  src.WorkflowID
, tar.PageID  =  src.PageID
, tar.ActionID  =  src.ActionID
, tar.UseCount  =  src.UseCount
, tar.Duration  =  src.Duration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, WorkflowID
, PageID
, ActionID
, UseCount
, Duration
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.WorkflowID
, src.PageID
, src.ActionID
, src.UseCount
, src.Duration
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');




INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_WorkflowActionActivity_W', N'c:\\ComputerTALKDB\\RAW', N'Stat_WorkflowActionActivity_W.dat', N'MERGE [dbo].[Stat_WorkflowActionActivity_W] AS tar
USING [dbo].[z_Stat_WorkflowActionActivity_W] AS src
ON tar.StartDateTime = src.StartDateTime   AND  tar.SwitchID = src.SwitchID   AND  tar.WorkflowID = src.WorkflowID   AND  tar.PageID = src.PageID    AND  tar.ActionID = src.ActionID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.WorkflowID  =  src.WorkflowID
, tar.PageID  =  src.PageID
, tar.ActionID  =  src.ActionID
, tar.UseCount  =  src.UseCount
, tar.Duration  =  src.Duration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, WorkflowID
, PageID
, ActionID
, UseCount
, Duration
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.WorkflowID
, src.PageID
, src.ActionID
, src.UseCount
, src.Duration
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');




INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Stat_WorkflowActionActivity_Y', N'c:\\ComputerTALKDB\\RAW', N'Stat_WorkflowActionActivity_Y.dat', N'MERGE [dbo].[Stat_WorkflowActionActivity_Y] AS tar
USING [dbo].[z_Stat_WorkflowActionActivity_Y] AS src
ON tar.StartDateTime = src.StartDateTime   AND  tar.SwitchID = src.SwitchID   AND  tar.WorkflowID = src.WorkflowID   AND  tar.PageID = src.PageID    AND  tar.ActionID = src.ActionID 
WHEN MATCHED THEN
   UPDATE SET
tar.StartDateTime  =  src.StartDateTime
, tar.SwitchID  =  src.SwitchID
, tar.WorkflowID  =  src.WorkflowID
, tar.PageID  =  src.PageID
, tar.ActionID  =  src.ActionID
, tar.UseCount  =  src.UseCount
, tar.Duration  =  src.Duration
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
StartDateTime
, SwitchID
, WorkflowID
, PageID
, ActionID
, UseCount
, Duration
   )
   VALUES
   (
src.StartDateTime
, src.SwitchID
, src.WorkflowID
, src.PageID
, src.ActionID
, src.UseCount
, src.Duration
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;');




INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_StatVersion', N'c:\\ComputerTALKDB\\RAW', N'StatVersion.dat', N'MERGE [dbo].[StatVersion] AS tar
USING [dbo].[z_StatVersion] AS src
ON tar.major = src.major   AND  tar.minor = src.minor   AND  tar.patch = src.patch   AND  tar.[status] = src.[status]    AND  tar.substatus = src.substatus 
WHEN MATCHED THEN
   UPDATE SET
tar.major  =  src.major
, tar.minor  =  src.minor
, tar.patch  =  src.patch
, tar.[status]  =  src.[status]
, tar.substatus  =  src.substatus
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
major
, minor
, patch
, [status]
, substatus
   )
   VALUES
   (
src.major
, src.minor
, src.patch
, src.[status]
, src.substatus
   )
--  WHEN NOT MATCHED by SOURCE THEN DELETE
   ;
');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Switch', N'c:\\ComputerTALKDB\\RAW', N'Switch.dat', N'MERGE [dbo].[Switch] AS tar
USING [dbo].[z_Switch] AS src
ON tar.SwitchID = src.SwitchID  
WHEN MATCHED THEN
   UPDATE SET
tar.SiteID  =  src.SiteID
, tar.NodeID  =  src.NodeID
, tar.SwitchNumber  =  src.SwitchNumber
, tar.SwitchID  =  src.SwitchID
, tar.SwitchName  =  src.SwitchName
, tar.ConfigServerName  =  src.ConfigServerName
, tar.ConfigDatabaseName  =  src.ConfigDatabaseName
, tar.StatsServerName  =  src.StatsServerName
, tar.StatsDatabaseName  =  src.StatsDatabaseName
, tar.DailyStatsResetTime  =  src.DailyStatsResetTime
, tar.StatsSetup  =  src.StatsSetup
, tar.StatsIntervalLength  =  src.StatsIntervalLength
, tar.StatsDBBufferCapacity  =  src.StatsDBBufferCapacity
, tar.StatsDBWriterThreads  =  src.StatsDBWriterThreads
, tar.StatsQueueTimeBoundary1  =  src.StatsQueueTimeBoundary1
, tar.StatsQueueTimeBoundary2  =  src.StatsQueueTimeBoundary2
, tar.StatsQueueTimeBoundary3  =  src.StatsQueueTimeBoundary3
, tar.StatsQueueTimeBoundary4  =  src.StatsQueueTimeBoundary4
, tar.StatsQueueTimeBoundary5  =  src.StatsQueueTimeBoundary5
, tar.FirstDayOfWeek  =  src.FirstDayOfWeek
, tar.FirstMonthOfYear  =  src.FirstMonthOfYear
, tar.MaxAge_ADR  =  src.MaxAge_ADR
, tar.MaxAge_CDR  =  src.MaxAge_CDR
, tar.MaxAge_CDR_Summary  =  src.MaxAge_CDR_Summary
, tar.MaxAge_I  =  src.MaxAge_I
, tar.MaxAge_D  =  src.MaxAge_D
, tar.MaxAge_W  =  src.MaxAge_W
, tar.MaxAge_M  =  src.MaxAge_M
, tar.MaxAge_Y  =  src.MaxAge_Y
, tar.AvailTime_ADR  =  src.AvailTime_ADR
, tar.AvailTime_CDR  =  src.AvailTime_CDR
, tar.AvailTime_CDR_Summary  =  src.AvailTime_CDR_Summary
, tar.AvailTime_I  =  src.AvailTime_I
, tar.AvailTime_D  =  src.AvailTime_D
, tar.AvailTime_W  =  src.AvailTime_W
, tar.AvailTime_M  =  src.AvailTime_M
, tar.AvailTime_Y  =  src.AvailTime_Y
, tar.WorkflowActionFlags  =  src.WorkflowActionFlags
, tar.SecurityKey  =  src.SecurityKey
, tar.OutboundWorkflowDN  =  src.OutboundWorkflowDN
, tar.OutboundWorkflowMode  =  src.OutboundWorkflowMode
, tar.PasswordMaxFailedAttempts  =  src.PasswordMaxFailedAttempts
, tar.PasswordMaxDuration  =  src.PasswordMaxDuration
, tar.PasswordFailedLockOutPeriod  =  src.PasswordFailedLockOutPeriod
, tar.PasswordMinDuration  =  src.PasswordMinDuration
, tar.PasswordMinLength  =  src.PasswordMinLength
, tar.SwitchCOS  =  src.SwitchCOS
, tar.OperatingMode  =  src.OperatingMode
, tar.MaxAgents  =  src.MaxAgents
, tar.MaxTeamLeads  =  src.MaxTeamLeads
, tar.MaxSupervisors  =  src.MaxSupervisors
, tar.MaxAdministrators  =  src.MaxAdministrators
, tar.MaxVoiceContacts  =  src.MaxVoiceContacts
, tar.MaxIMContacts  =  src.MaxIMContacts
, tar.MaxEmailContacts  =  src.MaxEmailContacts
, tar.MaxRecordings  =  src.MaxRecordings
, tar.MaxAutoStartSessions  =  src.MaxAutoStartSessions
, tar.MaxConcurrentACDLogons  =  src.MaxConcurrentACDLogons
, tar.MaxWorkflowFlags  =  src.MaxWorkflowFlags
, tar.MaxStatsSetup  =  src.MaxStatsSetup
, tar.StartTime  =  src.StartTime
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
SiteID
, NodeID
, SwitchNumber
, SwitchID
, SwitchName
, ConfigServerName
, ConfigDatabaseName
, StatsServerName
, StatsDatabaseName
, DailyStatsResetTime
, StatsSetup
, StatsIntervalLength
, StatsDBBufferCapacity
, StatsDBWriterThreads
, StatsQueueTimeBoundary1
, StatsQueueTimeBoundary2
, StatsQueueTimeBoundary3
, StatsQueueTimeBoundary4
, StatsQueueTimeBoundary5
, FirstDayOfWeek
, FirstMonthOfYear
, MaxAge_ADR
, MaxAge_CDR
, MaxAge_CDR_Summary
, MaxAge_I
, MaxAge_D
, MaxAge_W
, MaxAge_M
, MaxAge_Y
, AvailTime_ADR
, AvailTime_CDR
, AvailTime_CDR_Summary
, AvailTime_I
, AvailTime_D
, AvailTime_W
, AvailTime_M
, AvailTime_Y
, WorkflowActionFlags
, SecurityKey
, OutboundWorkflowDN
, OutboundWorkflowMode
, PasswordMaxFailedAttempts
, PasswordMaxDuration
, PasswordFailedLockOutPeriod
, PasswordMinDuration
, PasswordMinLength
, SwitchCOS
, OperatingMode
, MaxAgents
, MaxTeamLeads
, MaxSupervisors
, MaxAdministrators
, MaxVoiceContacts
, MaxIMContacts
, MaxEmailContacts
, MaxRecordings
, MaxAutoStartSessions
, MaxConcurrentACDLogons
, MaxWorkflowFlags
, MaxStatsSetup
, StartTime
   )
   VALUES
   (
src.SiteID
, src.NodeID
, src.SwitchNumber
, src.SwitchID
, src.SwitchName
, src.ConfigServerName
, src.ConfigDatabaseName
, src.StatsServerName
, src.StatsDatabaseName
, src.DailyStatsResetTime
, src.StatsSetup
, src.StatsIntervalLength
, src.StatsDBBufferCapacity
, src.StatsDBWriterThreads
, src.StatsQueueTimeBoundary1
, src.StatsQueueTimeBoundary2
, src.StatsQueueTimeBoundary3
, src.StatsQueueTimeBoundary4
, src.StatsQueueTimeBoundary5
, src.FirstDayOfWeek
, src.FirstMonthOfYear
, src.MaxAge_ADR
, src.MaxAge_CDR
, src.MaxAge_CDR_Summary
, src.MaxAge_I
, src.MaxAge_D
, src.MaxAge_W
, src.MaxAge_M
, src.MaxAge_Y
, src.AvailTime_ADR
, src.AvailTime_CDR
, src.AvailTime_CDR_Summary
, src.AvailTime_I
, src.AvailTime_D
, src.AvailTime_W
, src.AvailTime_M
, src.AvailTime_Y
, src.WorkflowActionFlags
, src.SecurityKey
, src.OutboundWorkflowDN
, src.OutboundWorkflowMode
, src.PasswordMaxFailedAttempts
, src.PasswordMaxDuration
, src.PasswordFailedLockOutPeriod
, src.PasswordMinDuration
, src.PasswordMinLength
, src.SwitchCOS
, src.OperatingMode
, src.MaxAgents
, src.MaxTeamLeads
, src.MaxSupervisors
, src.MaxAdministrators
, src.MaxVoiceContacts
, src.MaxIMContacts
, src.MaxEmailContacts
, src.MaxRecordings
, src.MaxAutoStartSessions
, src.MaxConcurrentACDLogons
, src.MaxWorkflowFlags
, src.MaxStatsSetup
, src.StartTime
   )
WHEN NOT MATCHED by SOURCE THEN DELETE
   ;
');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Team', N'c:\\ComputerTALKDB\\RAW', N'Team.dat', N'MERGE [dbo].[Team] AS tar
USING [dbo].[z_Team] AS src
ON tar.SwitchID = src.SwitchID  AND  tar.TeamID = src.TeamID  
WHEN MATCHED THEN
   UPDATE SET
   tar.SwitchID  =  src.SwitchID
, tar.TeamID  =  src.TeamID
, tar.TeamName  =  src.TeamName
, tar.TeamShortName  =  src.TeamShortName
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
   SwitchID
, TeamID
, TeamName
, TeamShortName
   )
   VALUES
   (
   src.SwitchID
, src.TeamID
, src.TeamName
, src.TeamShortName
   )
WHEN NOT MATCHED by SOURCE THEN DELETE
   ;
')
INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_TeamAssignment', N'c:\\ComputerTALKDB\\RAW', N'TeamAssignment.dat', N'MERGE [dbo].[TeamAssignment] AS tar
USING [dbo].[z_TeamAssignment] AS src
ON tar.SwitchID = src.SwitchID  AND  tar.TeamID = src.TeamID  AND  tar.AgentID = src.AgentID  
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.TeamID  =  src.TeamID
, tar.AgentID  =  src.AgentID
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
SwitchID
, TeamID
, AgentID
   )
   VALUES
   (
src.SwitchID
, src.TeamID
, src.AgentID
   )
WHEN NOT MATCHED by SOURCE THEN DELETE
   ;
');


INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_Trunk', N'c:\\ComputerTALKDB\\RAW', N'Trunk.dat', N'MERGE [dbo].[Trunk] AS tar
USING [dbo].[z_Trunk] AS src
ON tar.SwitchID = src.SwitchID  AND  tar.TrunkID = src.TrunkID 
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.TrunkID  =  src.TrunkID
, tar.TrunkGroupID  =  src.TrunkGroupID
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
SwitchID
, TrunkID
, TrunkGroupID
   )
   VALUES
   (
src.SwitchID
, src.TrunkID
, src.TrunkGroupID
   )
-- WHEN NOT MATCHED by SOURCE THEN DELETE
   ;
');





INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_TrunkGroup', N'c:\\ComputerTALKDB\\RAW', N'TrunkGroup.dat', N'MERGE [dbo].[TrunkGroup] AS tar
USING [dbo].[z_TrunkGroup] AS src
ON tar.SwitchID = src.SwitchID  AND  tar.TrunkGroupID = src.TrunkGroupID 
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.TrunkGroupID  =  src.TrunkGroupID
, tar.TrunkGroupName  =  src.TrunkGroupName
, tar.TrunkGroupType  =  src.TrunkGroupType
, tar.AccessCode  =  src.AccessCode
, tar.Prefix  =  src.Prefix
, tar.StartingWfID  =  src.StartingWfID
, tar.StartingPageID  =  src.StartingPageID
, tar.StartingActionID  =  src.StartingActionID
, tar.OutboundHuntOrder  =  src.OutboundHuntOrder
, tar.OutboundCallerNum  =  src.OutboundCallerNum
, tar.PBXAccessCodePSTN  =  src.PBXAccessCodePSTN
, tar.PBXAccessCodeICE  =  src.PBXAccessCodeICE
, tar.OutboundCallerName  =  src.OutboundCallerName
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
SwitchID
, TrunkGroupID
, TrunkGroupName
, TrunkGroupType
, AccessCode
, Prefix
, StartingWfID
, StartingPageID
, StartingActionID
, OutboundHuntOrder
, OutboundCallerNum
, PBXAccessCodePSTN
, PBXAccessCodeICE
, OutboundCallerName
   )
   VALUES
   (
src.SwitchID
, src.TrunkGroupID
, src.TrunkGroupName
, src.TrunkGroupType
, src.AccessCode
, src.Prefix
, src.StartingWfID
, src.StartingPageID
, src.StartingActionID
, src.OutboundHuntOrder
, src.OutboundCallerNum
, src.PBXAccessCodePSTN
, src.PBXAccessCodeICE
, src.OutboundCallerName
   )
-- WHEN NOT MATCHED by SOURCE THEN DELETE
   ;
');




INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_UCAddress', N'c:\\ComputerTALKDB\\RAW', N'UCAddress.dat', N'MERGE [dbo].[UCAddress] AS tar
USING [dbo].[z_UCAddress] AS src
ON tar.SwitchID = src.SwitchID  AND  tar.UCAddress = src.UCAddress 
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.UCAddress  =  src.UCAddress
, tar.UCGroupID  =  src.UCGroupID
, tar.LanguageCode  =  src.LanguageCode
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
SwitchID
, UCAddress
, UCGroupID
, LanguageCode
   )
   VALUES
   (
src.SwitchID
, src.UCAddress
, src.UCGroupID
, src.LanguageCode
   )
-- WHEN NOT MATCHED by SOURCE THEN DELETE
   ;
');





INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_UCGroup', N'c:\\ComputerTALKDB\\RAW', N'UCGroup.dat', N'MERGE [dbo].[UCGroup] AS tar
USING [dbo].[z_UCGroup] AS src
ON tar.SwitchID = src.SwitchID  AND  tar.UCGroupID = src.UCGroupID 
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.UCGroupID  =  src.UCGroupID
, tar.UCGroupName  =  src.UCGroupName
, tar.StartingAVWfID  =  src.StartingAVWfID
, tar.StartingAVPageID  =  src.StartingAVPageID
, tar.StartingAVActionID  =  src.StartingAVActionID
, tar.StartingIMWfID  =  src.StartingIMWfID
, tar.StartingIMPageID  =  src.StartingIMPageID
, tar.StartingIMActionID  =  src.StartingIMActionID
, tar.OutboundCallerUri  =  src.OutboundCallerUri
, tar.OutboundCallerName  =  src.OutboundCallerName
, tar.MaxInboundAV  =  src.MaxInboundAV
, tar.MaxInboundIM  =  src.MaxInboundIM
, tar.[COS]  =  src.[COS]
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
SwitchID
, UCGroupID
, UCGroupName
, StartingAVWfID
, StartingAVPageID
, StartingAVActionID
, StartingIMWfID
, StartingIMPageID
, StartingIMActionID
, OutboundCallerUri
, OutboundCallerName
, MaxInboundAV
, MaxInboundIM
, [COS]
   )
   VALUES
   (
src.SwitchID
, src.UCGroupID
, src.UCGroupName
, src.StartingAVWfID
, src.StartingAVPageID
, src.StartingAVActionID
, src.StartingIMWfID
, src.StartingIMPageID
, src.StartingIMActionID
, src.OutboundCallerUri
, src.OutboundCallerName
, src.MaxInboundAV
, src.MaxInboundIM
, src.[COS]
   )
WHEN NOT MATCHED by SOURCE THEN DELETE
   ;
');





INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_WaitingList', N'c:\\ComputerTALKDB\\RAW', N'WaitingList.dat', N'MERGE [dbo].[WaitingList] AS tar
USING [dbo].[z_WaitingList] AS src
ON tar.ID = src.ID   
WHEN MATCHED THEN
   UPDATE SET
tar.Prospect_ID  =  src.Prospect_ID
, tar.Campaign_ID  =  src.Campaign_ID
, tar.Current_Agent_ID  =  src.Current_Agent_ID
, tar.Callback_Timestamp  =  src.Callback_Timestamp
, tar.Comments  =  src.Comments
, tar.Last_Agent_ID  =  src.Last_Agent_ID
, tar.Callback_Time  =  src.Callback_Time
, tar.Lock_Time  =  src.Lock_Time
, tar.Priority  =  src.Priority
, tar.Callback_Number  =  src.Callback_Number
, tar.Call_Attempts  =  src.Call_Attempts
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
Prospect_ID
, Campaign_ID
, Current_Agent_ID
, Callback_Timestamp
, Comments
, Last_Agent_ID
, Callback_Time
, Lock_Time
, Priority
, Callback_Number
, Call_Attempts
   )
   VALUES
   (
src.Prospect_ID
, src.Campaign_ID
, src.Current_Agent_ID
, src.Callback_Timestamp
, src.Comments
, src.Last_Agent_ID
, src.Callback_Time
, src.Lock_Time
, src.Priority
, src.Callback_Number
, src.Call_Attempts
   )
-- WHEN NOT MATCHED by SOURCE THEN DELETE
   ;
');





INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_WfAction', N'c:\\ComputerTALKDB\\RAW', N'WfAction.dat', N'MERGE [dbo].[WfAction] AS tar
USING [dbo].[z_WfAction] AS src
ON tar.WfID = src.WfID    AND   tar.PageID = src.PageID    AND   tar.ActionID = src.ActionID    AND   tar.SwitchID = src.SwitchID  
WHEN MATCHED THEN
   UPDATE SET
tar.WfID  =  src.WfID
, tar.PageID  =  src.PageID
, tar.ActionID  =  src.ActionID
, tar.ActionType  =  src.ActionType
, tar.ActionName  =  src.ActionName
, tar.ActionCompleted  =  src.ActionCompleted
, tar.IconTopLeftXCoord  =  src.IconTopLeftXCoord
, tar.IconTopLeftYCoord  =  src.IconTopLeftYCoord
, tar.IconWidth  =  src.IconWidth
, tar.IconHeight  =  src.IconHeight
, tar.LogAction  =  src.LogAction
, tar.SwitchID  =  src.SwitchID
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
WfID
, PageID
, ActionID
, ActionType
, ActionName
, ActionCompleted
, IconTopLeftXCoord
, IconTopLeftYCoord
, IconWidth
, IconHeight
, LogAction
, SwitchID
   )
   VALUES
   (
src.WfID
, src.PageID
, src.ActionID
, src.ActionType
, src.ActionName
, src.ActionCompleted
, src.IconTopLeftXCoord
, src.IconTopLeftYCoord
, src.IconWidth
, src.IconHeight
, src.LogAction
, src.SwitchID
   )
 WHEN NOT MATCHED by SOURCE THEN DELETE
   ;
');





INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_WfAttributeDetail', N'c:\\ComputerTALKDB\\RAW', N'WfAttributeDetail.dat', N'MERGE [dbo].[WfAttributeDetail] AS tar
USING [dbo].[z_WfAttributeDetail] AS src
ON tar.WfID = src.WfID    AND   tar.PageID = src.PageID    AND   tar.ActionID = src.ActionID   AND   tar.AttributeID = src.AttributeID    AND   tar.FieldName = src.FieldName     AND   tar.SwitchID = src.SwitchID  
WHEN MATCHED THEN
   UPDATE SET
tar.WfID  =  src.WfID
, tar.PageID  =  src.PageID
, tar.ActionID  =  src.ActionID
, tar.AttributeID  =  src.AttributeID
, tar.FieldName  =  src.FieldName
, tar.FieldValue  =  src.FieldValue
, tar.SwitchID  =  src.SwitchID
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
WfID
, PageID
, ActionID
, AttributeID
, FieldName
, FieldValue
, SwitchID
   )
   VALUES
   (
src.WfID
, src.PageID
, src.ActionID
, src.AttributeID
, src.FieldName
, src.FieldValue
, src.SwitchID
   )
 WHEN NOT MATCHED by SOURCE THEN DELETE
   ;
');





INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_WfGraph', N'c:\\ComputerTALKDB\\RAW', N'WfGraph.dat', N'MERGE [dbo].[WfGraph] AS tar
USING [dbo].[z_WfGraph] AS src
ON tar.WfID = src.WfID     AND   tar.SwitchID = src.SwitchID  
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.WfID  =  src.WfID
, tar.GraphName  =  src.GraphName
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
SwitchID
, WfID
, GraphName
   )
   VALUES
   (
src.SwitchID
, src.WfID
, src.GraphName
   )
 WHEN NOT MATCHED by SOURCE THEN DELETE
   ;
');




INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_WfLink', N'c:\\ComputerTALKDB\\RAW', N'WfLink.dat', N'MERGE [dbo].[WfLink] AS tar
USING [dbo].[z_WfLink] AS src
ON tar.WfID = src.WfID     AND   tar.SwitchID = src.SwitchID   AND  tar.PageID  = src.PageID   AND  tar.ActionID  = src.ActionID    AND   tar.LinkID  = src.LinkID
WHEN MATCHED THEN
   UPDATE SET
tar.WfID  =  src.WfID
, tar.PageID  =  src.PageID
, tar.ActionID  =  src.ActionID
, tar.LinkID  =  src.LinkID
, tar.LinkName  =  src.LinkName
, tar.ConnectedWfID  =  src.ConnectedWfID
, tar.ConnectedPageID  =  src.ConnectedPageID
, tar.ConnectedActionID  =  src.ConnectedActionID
, tar.SwitchID  =  src.SwitchID
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
WfID
, PageID
, ActionID
, LinkID
, LinkName
, ConnectedWfID
, ConnectedPageID
, ConnectedActionID
, SwitchID
   )
   VALUES
   (
src.WfID
, src.PageID
, src.ActionID
, src.LinkID
, src.LinkName
, src.ConnectedWfID
, src.ConnectedPageID
, src.ConnectedActionID
, src.SwitchID
   )
 WHEN NOT MATCHED by SOURCE THEN DELETE
   ;
');





INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_WfLinkDetail', N'c:\\ComputerTALKDB\\RAW', N'WfLinkDetail.dat', N'MERGE [dbo].[WfLinkDetail] AS tar
USING [dbo].[z_WfLinkDetail] AS src
ON tar.WfID = src.WfID     AND   tar.SwitchID = src.SwitchID   AND  tar.PageID  = src.PageID   AND  tar.ActionID  = src.ActionID    AND   tar.LinkID  = src.LinkID  AND tar.FieldName  =  src.FieldName
WHEN MATCHED THEN
   UPDATE SET
tar.WfID  =  src.WfID
, tar.PageID  =  src.PageID
, tar.ActionID  =  src.ActionID
, tar.LinkID  =  src.LinkID
, tar.FieldName  =  src.FieldName
, tar.FieldValue  =  src.FieldValue
, tar.SwitchID  =  src.SwitchID
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
WfID
, PageID
, ActionID
, LinkID
, FieldName
, FieldValue
, SwitchID
   )
   VALUES
   (
src.WfID
, src.PageID
, src.ActionID
, src.LinkID
, src.FieldName
, src.FieldValue
, src.SwitchID
   )
 WHEN NOT MATCHED by SOURCE THEN DELETE
   ;
');




INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_WfPage', N'c:\\ComputerTALKDB\\RAW', N'WfPage.dat', N'MERGE [dbo].[WfPage] AS tar
USING [dbo].[z_WfPage] AS src
ON tar.WfID = src.WfID     AND   tar.SwitchID = src.SwitchID   AND  tar.PageID  = src.PageID   
WHEN MATCHED THEN
   UPDATE SET
tar.WfID  =  src.WfID
, tar.PageID  =  src.PageID
, tar.PageName  =  src.PageName
, tar.SwitchID  =  src.SwitchID
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
WfID
, PageID
, PageName
, SwitchID
   )
   VALUES
   (
src.WfID
, src.PageID
, src.PageName
, src.SwitchID
   )
 WHEN NOT MATCHED by SOURCE THEN DELETE
   ;
') ;




--INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_WfSubApplication', N'c:\\ComputerTALKDB\\RAW', N'WfSubApplication.dat', N'MERGE [dbo].[WfSubApplication] AS tar
--USING [dbo].[z_WfSubApplication] AS src
--ON tar.SubAppID = src.SubAppID     AND   tar.SwitchID = src.SwitchID  
--WHEN MATCHED THEN
--   UPDATE SET
--tar.SwitchID  =  src.SwitchID
--, tar.SubAppID  =  src.SubAppID
--, tar.SubAppName  =  src.SubAppName
--, tar.Password1  =  src.Password1
--, tar.Password2  =  src.Password2
--, tar.Password3  =  src.Password3
--, tar.[Version]  =  src.[Version]
--, tar.LastModified  =  src.LastModified
--, tar.Summary  =  src.Summary
--WHEN NOT MATCHED  BY TARGET THEN
--   INSERT
--   (
--SwitchID
--, SubAppID
--, SubAppName
--, Password1
--, Password2
--, Password3
--, [Version]
--, LastModified
--, Summary
--   )
--   VALUES
--   (
--src.SwitchID
--, src.SubAppID
--, src.SubAppName
--, src.Password1
--, src.Password2
--, src.Password3
--, src.[Version]
--, src.LastModified
--, src.Summary
--   )
---- WHEN NOT MATCHED by SOURCE THEN DELETE
--   ;
--');





INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_WfSubAppMethod', N'c:\\ComputerTALKDB\\RAW', N'WfSubAppMethod.dat', N'MERGE [dbo].[WfSubAppMethod] AS tar
USING [dbo].[z_WfSubAppMethod] AS src
ON tar.SubAppID = src.SubAppID     AND   tar.SwitchID = src.SwitchID  AND  tar.MethodID  =  src.MethodID
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.SubAppID  =  src.SubAppID
, tar.MethodID  =  src.MethodID
, tar.MethodName  =  src.MethodName
, tar.Access  =  src.Access
, tar.Summary  =  src.Summary
, tar.EntryPointWfID  =  src.EntryPointWfID
, tar.EntryPointPageID  =  src.EntryPointPageID
, tar.EntryPointActionID  =  src.EntryPointActionID
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
SwitchID
, SubAppID
, MethodID
, MethodName
, Access
, Summary
, EntryPointWfID
, EntryPointPageID
, EntryPointActionID
   )
   VALUES
   (
src.SwitchID
, src.SubAppID
, src.MethodID
, src.MethodName
, src.Access
, src.Summary
, src.EntryPointWfID
, src.EntryPointPageID
, src.EntryPointActionID
   )
-- WHEN NOT MATCHED by SOURCE THEN DELETE
   ;
');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_WfVariables', N'c:\\ComputerTALKDB\\RAW', N'WfVariables.dat', N'MERGE [dbo].[WfVariables] AS tar
USING [dbo].[z_WfVariables] AS src
ON tar.SubAppID = src.SubAppID     AND   tar.SwitchID = src.SwitchID  AND  tar.MethodID  =  src.MethodID  AND  tar.VariableID = src.VariableID  AND  tar.WfID = src.WfID  AND  tar.PageID = src.PageID
WHEN MATCHED THEN
   UPDATE SET
tar.SwitchID  =  src.SwitchID
, tar.VariableName  =  src.VariableName
, tar.VariableType  =  src.VariableType
, tar.VariableID  =  src.VariableID
, tar.SubAppID  =  src.SubAppID
, tar.MethodID  =  src.MethodID
, tar.WfID  =  src.WfID
, tar.PageID  =  src.PageID
, tar.DefaultValueSet  =  src.DefaultValueSet
, tar.DefaultValue  =  src.DefaultValue
, tar.Summary  =  src.Summary
, tar.Comments  =  src.Comments
, tar.Scope  =  src.Scope
, tar.ArgumentPassby  =  src.ArgumentPassby
, tar.VariableTypeModifier  =  src.VariableTypeModifier
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
SwitchID
, VariableName
, VariableType
, VariableID
, SubAppID
, MethodID
, WfID
, PageID
, DefaultValueSet
, DefaultValue
, Summary
, Comments
, Scope
, ArgumentPassby
, VariableTypeModifier
   )
   VALUES
   (
src.SwitchID
, src.VariableName
, src.VariableType
, src.VariableID
, src.SubAppID
, src.MethodID
, src.WfID
, src.PageID
, src.DefaultValueSet
, src.DefaultValue
, src.Summary
, src.Comments
, src.Scope
, src.ArgumentPassby
, src.VariableTypeModifier
   )
 WHEN NOT MATCHED by SOURCE THEN DELETE
   ;
');



INSERT [dbo].[zTblPath] ([Table_name], [File_path], [File_name], [sql_string]) VALUES (N'z_zDBVersion', N'c:\\ComputerTALKDB\\RAW', N'zDBVersion.dat', N'MERGE [dbo].[zDBVersion] AS tar
USING [dbo].[z_zDBVersion] AS src
ON tar.[Version] = src.[Version]    
WHEN MATCHED THEN
   UPDATE SET
tar.[Version]  =  src.[Version]
WHEN NOT MATCHED  BY TARGET THEN
   INSERT
   (
[Version]
   )
   VALUES
   (
src.[Version]
   )
-- WHEN NOT MATCHED by SOURCE THEN DELETE
   ;
')

END
GO
