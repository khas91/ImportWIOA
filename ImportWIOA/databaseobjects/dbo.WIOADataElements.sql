USE [Adhoc]
GO

/****** Object:  Table [dbo].[WIOADataElements]    Script Date: 1/27/2017 11:07:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WIOADataElements](
	[Student ID] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[DOB] [nvarchar](255) NULL,
	[ESOL] [nvarchar](255) NULL,
	[Campus Center] [nvarchar](255) NULL,
	[1048 - Adult Origin of Schooling] [nvarchar](255) NULL,
	[1058 - CAE Single Parent] [nvarchar](255) NULL,
	[1059 - CAE Displaced Homemaker] [nvarchar](255) NULL,
	[1060 - AGE Ex-Offender] [nvarchar](255) NULL,
	[1061 - AGE Homeless/Runaway] [nvarchar](255) NULL,
	[1062 - AGE Employment Barriers] [nvarchar](255) NULL,
	[1063 - AGE Migrant/Seasonal Farm Worker] [nvarchar](255) NULL,
	[1064 - CAE Level of Schooling Achieved] [nvarchar](255) NULL
) ON [PRIMARY]

GO


