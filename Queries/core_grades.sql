USE science_course_study

/*
--Update the Null percent grades with standard percent based on letter grade
UPDATE transcript
SET "percent" = 95
	WHERE "percent" IS NULL
	AND score = 'A'

UPDATE transcript
SET "percent" = 85
	WHERE "percent" IS NULL
	AND score = 'B'

UPDATE transcript
SET "percent" = 75
	WHERE "percent" IS NULL
	AND score = 'C'

UPDATE transcript
SET "percent" = 65
	WHERE "percent" IS NULL
	AND score = 'D'
	OR score = 'P'

UPDATE transcript
SET "percent" = 50
	WHERE "percent" IS NULL
	AND score = 'F'

UPDATE transcript
SET "percent" = 50
	WHERE "percent" IS NULL
	AND score = 'I'

*/

--create a temp table for core classes, use temp tables to join into
--one table containing all core classes and grades

SELECT ID, courseName, avg("percent") as math9_score
	INTO #math9
	FROM transcript
	WHERE courseName 
		LIKE ('Alg%')
		AND grade=9
		AND startYear = 2020
	GROUP BY ID, courseName;

EXEC tempdb.sys.sp_rename N'#math9.courseName', N'math9', N'COLUMN';

SELECT ID, courseName, avg("percent") as math10_score
	INTO #math10
	FROM transcript
	WHERE courseName 
		LIKE ('Geo%')
		AND grade=10
		AND startYear = 2021
	GROUP BY ID, courseName;

EXEC tempdb.sys.sp_rename N'#math10.courseName', N'math10', N'COLUMN';


SELECT ID, courseName, avg("percent") as eng9_score
	INTO #eng9
	FROM transcript
	WHERE courseName LIKE 'Eng%'
		AND grade=9
		AND startYear = 2020
	GROUP BY ID, courseName;

EXEC tempdb.sys.sp_rename N'#eng9.courseName', N'eng9', N'COLUMN';

SELECT ID, courseName, avg("percent") as eng10_score
	INTO #eng10
	FROM transcript
	WHERE courseName LIKE 'Eng%'
		AND grade=10
		AND startYear = 2021
	GROUP BY ID, courseName;

EXEC tempdb.sys.sp_rename N'#eng10.courseName', N'eng10', N'COLUMN';


SELECT ID, courseName, avg("percent") as hist9_score
	INTO #hist9
	FROM transcript
	WHERE courseName 
		LIKE 'AP Hum%'
		OR courseName LIKE 'World%'
		AND grade=9
		AND startYear = 2020
	GROUP BY ID, courseName;

EXEC tempdb.sys.sp_rename N'#hist9.courseName', N'hist9', N'COLUMN';

--Join temp tables into one table core grades based on ID numbers
SELECT #math9.*, #math10.math10, #math10.math10_score,
	#eng9.eng9, #eng9.eng9_score, #eng10.eng10, #eng10.eng10_score,
	#hist9.hist9, #hist9.hist9_score, science_grades.bio9, 
	science_grades.bio_score, science_grades.phys10, science_grades.phys10_score,
	science_grades.chem11, science_grades.chem11_score
	INTO core_grades
	FROM #math9
	FULL OUTER JOIN #math10
		ON #math9.ID = #math10.ID
	FULL OUTER JOIN  #eng9
		ON #math9.ID = #eng9.ID
	FULL OUTER JOIN #eng10
		ON #math9.ID = #eng10.ID
	FULL OUTER JOIN #hist9
		ON #math9.ID = #hist9.ID
	FULL OUTER JOIN science_grades
		ON #math9.ID = science_grades.ID

SELECT * FROM core_grades
