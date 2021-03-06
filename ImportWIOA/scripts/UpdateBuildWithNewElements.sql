SELECT
	*
FROM
	[Adhoc].[dbo].[WIOADataElements] wioa
													

UPDATE wioa
	SET 
		wioa.[1048 - Adult Origin of Schooling] 
			= LEFT( wioa.[1048 - Adult Origin of Schooling], 1)
		,wioa.[1058 - CAE Single Parent]
			= LEFT(wioa.[1058 - CAE Single Parent], 1)
		,wioa.[1059 - CAE Displaced Homemaker]
			= LEFT(wioa.[1059 - CAE Displaced Homemaker], 1)
		,wioa.[1060 - AGE Ex-Offender]
			= LEFT(wioa.[1060 - AGE Ex-Offender], 1)
		,wioa.[1061 - AGE Homeless/Runaway]
			= LEFT(wioa.[1061 - AGE Homeless/Runaway], 1)
		,wioa.[1062 - AGE Employment Barriers]
			= LEFT([1062 - AGE Employment Barriers], 1)
		,wioa.[1063 - AGE Migrant/Seasonal Farm Worker]
			= LEFT(wioa.[1063 - AGE Migrant/Seasonal Farm Worker], 1)
	FROM [Adhoc].dbo.WIOADataElements wioa
	

	
UPDATE r1
	set r1.DE1048 = CASE
						WHEN r1.DE1048 NOT IN ('X','Z') THEN r1.DE1048
						WHEN wioa.[1048 - Adult Origin of Schooling] IN ('U','N','X') THEN wioa.[1048 - Adult Origin of Schooling]
						ELSE 'X'
					END
		,r1.DE1062 = CASE
						WHEN r1.DE1062 NOT IN ('N','Z') THEN r1.DE1062
						WHEN wioa.[1062 - AGE Employment Barriers] IN ('C','N','Z') THEN wioa.[1062 - AGE Employment Barriers]
						ELSE 'N'
					END
		,r1.DE1063 = CASE
						WHEN r1.DE1063 NOT IN ('N','Z') THEN r1.DE1063
						WHEN wioa.[1063 - AGE Migrant/Seasonal Farm Worker] IN ('A','B','N','Z') THEN wioa.[1063 - AGE Migrant/Seasonal Farm Worker]
						ELSE 'N'
					END
		,r1.DE1061 = CASE
						WHEN r1.DE1061 NOT IN ('N','Z') THEN r1.DE1061
						WHEN wioa.[1061 - AGE Homeless/Runaway] IN ('A','B','C','D','N','Z') THEN wioa.[1061 - AGE Homeless/Runaway]
						ELSE 'N'
					END
		,r1.DE1059 = CASE
						WHEN r1.DE1059 <> 'Z' THEN r1.DE1059
						WHEN wioa.[1059 - CAE Displaced Homemaker] IN ('A','B','C','D','Z') THEN wioa.[1059 - CAE Displaced Homemaker]
						ELSE 'Z'
					END
		,r1.DE1058 = CASE
						WHEN r1.DE1058 <> 'Z' THEN r1.DE1058
						WHEN wioa.[1058 - CAE Single Parent] IN ('B','S','W','Z') THEN wioa.[1058 - CAE Single Parent]
						ELSE 'Z'
					END
		,r1.DE1060 = CASE
						WHEN r1.DE1060 NOT IN ('N','Z') THEN r1.DE1060
						WHEN wioa.[1060 - AGE Ex-Offender] IN ('A','N','Z') THEN wioa.[1060 - AGE Ex-Offender]
						ELSE 'Z'
					END
		,r1.DE1064 = CASE
						WHEN r1.DE1064 NOT IN ('ZZ','NN') THEN r1.DE1064
						WHEN wioa.[1064 - CAE Level of Schooling Achieved] <> '' THEN REPLICATE('0', 2 - LEN(CAST(wioa.[1064 - CAE Level of Schooling Achieved] AS VARCHAR))) 
							+ CAST(wioa.[1064 - CAE Level of Schooling Achieved] AS VARCHAR)
						ELSE 'ZZ'
					END
FROM
	State_Report_Data.EOT.sdb_rtype_1 r1
	INNER JOIN Adhoc.dbo.WIOADataElements wioa ON wioa.[Student ID] = r1.stdnt_id

UPDATE r1
	set r1.DE1048 = CASE
						WHEN r1.DE1048 NOT IN ('X','Z') THEN r1.DE1048
						WHEN wioa.[1048 - Adult Origin of Schooling] IN ('U','N','X') THEN wioa.[1048 - Adult Origin of Schooling]
						ELSE 'X'
					END
		,r1.DE1062 = CASE
						WHEN r1.DE1062 NOT IN ('N','Z') THEN r1.DE1062
						WHEN wioa.[1062 - AGE Employment Barriers] IN ('C','N','Z') THEN wioa.[1062 - AGE Employment Barriers]
						ELSE 'N'
					END
		,r1.DE1063 = CASE
						WHEN r1.DE1063 NOT IN ('N','Z') THEN r1.DE1063
						WHEN wioa.[1063 - AGE Migrant/Seasonal Farm Worker] IN ('A','B','N','Z') THEN wioa.[1063 - AGE Migrant/Seasonal Farm Worker]
						ELSE 'N'
					END
		,r1.DE1061 = CASE
						WHEN r1.DE1061 NOT IN ('N','Z') THEN r1.DE1061
						WHEN wioa.[1061 - AGE Homeless/Runaway] IN ('A','B','C','D','N','Z') THEN wioa.[1061 - AGE Homeless/Runaway]
						ELSE 'N'
					END
		,r1.DE1059 = CASE
						WHEN r1.DE1059 <> 'Z' THEN r1.DE1059
						WHEN wioa.[1059 - CAE Displaced Homemaker] IN ('A','B','C','D','Z') THEN wioa.[1059 - CAE Displaced Homemaker]
						ELSE 'Z'
					END
		,r1.DE1058 = CASE
						WHEN r1.DE1058 <> 'Z' THEN r1.DE1058
						WHEN wioa.[1058 - CAE Single Parent] IN ('B','S','W','Z') THEN wioa.[1058 - CAE Single Parent]
						ELSE 'Z'
					END
		,r1.DE1060 = CASE
						WHEN r1.DE1060 NOT IN ('N','Z') THEN r1.DE1060
						WHEN wioa.[1060 - AGE Ex-Offender] IN ('A','N','Z') THEN wioa.[1060 - AGE Ex-Offender]
						ELSE 'Z'
					END
		,r1.DE1064 = CASE
						WHEN r1.DE1064 NOT IN ('ZZ','NN') THEN r1.DE1064
						WHEN wioa.[1064 - CAE Level of Schooling Achieved] <> '' THEN REPLICATE('0', 2 - LEN(CAST(wioa.[1064 - CAE Level of Schooling Achieved] AS VARCHAR))) 
							+ CAST(wioa.[1064 - CAE Level of Schooling Achieved] AS VARCHAR)
						ELSE 'ZZ'
					END
FROM
	State_Report_Data.BOT.sdb_rtype_1 r1
	INNER JOIN Adhoc.dbo.WIOADataElements wioa ON wioa.[Student ID] = r1.stdnt_id

UPDATE r1
	set r1.DE1048 = CASE
						WHEN r1.DE1048 NOT IN ('X','Z') THEN r1.DE1048
						WHEN wioa.[1048 - Adult Origin of Schooling] IN ('U','N','X') THEN wioa.[1048 - Adult Origin of Schooling]
						ELSE 'X'
					END
		,r1.DE1062 = CASE
						WHEN r1.DE1062 NOT IN ('N','Z') THEN r1.DE1062
						WHEN wioa.[1062 - AGE Employment Barriers] IN ('C','N','Z') THEN wioa.[1062 - AGE Employment Barriers]
						ELSE 'N'
					END
		,r1.DE1063 = CASE
						WHEN r1.DE1063 NOT IN ('N','Z') THEN r1.DE1063
						WHEN wioa.[1063 - AGE Migrant/Seasonal Farm Worker] IN ('A','B','N','Z') THEN wioa.[1063 - AGE Migrant/Seasonal Farm Worker]
						ELSE 'N'
					END
		,r1.DE1061 = CASE
						WHEN r1.DE1061 NOT IN ('N','Z') THEN r1.DE1061
						WHEN wioa.[1061 - AGE Homeless/Runaway] IN ('A','B','C','D','N','Z') THEN wioa.[1061 - AGE Homeless/Runaway]
						ELSE 'N'
					END
		,r1.DE1059 = CASE
						WHEN r1.DE1059 <> 'Z' THEN r1.DE1059
						WHEN wioa.[1059 - CAE Displaced Homemaker] IN ('A','B','C','D','Z') THEN wioa.[1059 - CAE Displaced Homemaker]
						ELSE 'Z'
					END
		,r1.DE1058 = CASE
						WHEN r1.DE1058 <> 'Z' THEN r1.DE1058
						WHEN wioa.[1058 - CAE Single Parent] IN ('B','S','W','Z') THEN wioa.[1058 - CAE Single Parent]
						ELSE 'Z'
					END
		,r1.DE1060 = CASE
						WHEN r1.DE1060 NOT IN ('N','Z') THEN r1.DE1060
						WHEN wioa.[1060 - AGE Ex-Offender] IN ('A','N','Z') THEN wioa.[1060 - AGE Ex-Offender]
						ELSE 'Z'
					END
		,r1.DE1064 = CASE
						WHEN r1.DE1064 NOT IN ('ZZ','NN') THEN r1.DE1064
						WHEN wioa.[1064 - CAE Level of Schooling Achieved] <> '' THEN REPLICATE('0', 2 - LEN(CAST(wioa.[1064 - CAE Level of Schooling Achieved] AS VARCHAR))) 
							+ CAST(wioa.[1064 - CAE Level of Schooling Achieved] AS VARCHAR)
						ELSE 'ZZ'
					END
FROM
	State_Report_Data.dbo.sdb_rtype_1 r1
	INNER JOIN Adhoc.dbo.WIOADataElements wioa ON wioa.[Student ID] = r1.stdnt_id

