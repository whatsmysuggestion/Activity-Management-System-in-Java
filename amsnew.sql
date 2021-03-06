if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AGT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AGT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[APPT]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[APPT]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CST]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CSTOld]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CSTOld]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CustPolicy]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CustPolicy]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EnqDetails]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EnqDetails]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MGR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MGR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Payment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Payment]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ZMGR]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ZMGR]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[incentive]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[incentive]
GO

CREATE TABLE [dbo].[AGT] (
	[AGNO] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[FirstName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LastName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LoginName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LoginPwd] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[BRNO] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[EMail] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Address] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[PhoneNo] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Target] [int] NULL ,
	[TargetDate] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TargetSetDate] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PoliciesSold] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[APPT] (
	[APID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[AGNO] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[APDate] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Time] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CSName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[BR] (
	[BRNO] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[BRName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[BRAddress] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ZMGNO] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CST] (
	[CSNO] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[FirstName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LastName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LoginName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LoginPwd] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Email] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Address] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Phone] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AGNO] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CSTOld] (
	[CSNO] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[FirstName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LastName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LoginName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LoginPwd] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PNO] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AGNO] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Email] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Address] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Phone] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CustPolicy] (
	[policyno] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[csno] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[pdate] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[years] [int] NULL ,
	[pamt] [int] NULL ,
	[mode] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[premium] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[EnqDetails] (
	[ENo] [int] NULL ,
	[EnqfName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Enqlname] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[EnqType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[EnqDate] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[agno] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[email] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[phone] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[status] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MGR] (
	[MGNO] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[FirstName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LastName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LoginName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LoginPwd] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[EmailID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Address] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PhoneNo] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[BRNO] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Payment] (
	[policyid] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[duedate] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[paydate] [smalldatetime] NULL ,
	[payment] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ZMGR] (
	[ZMGNO] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[FirstName] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[LastName] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[LoginName] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[LoginPwd] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[incentive] (
	[zmgno] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[target] [int] NULL ,
	[incentive] [int] NULL 
) ON [PRIMARY]
GO

