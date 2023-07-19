USE science_course_study
/*
--DROP TABLE #bio9;
--DROP TABLE #phys10;
--DROP TABLE #chem11;
--DROP TABLE science_grades;

SELECT ID, courseName, avg("percent") as bio_score
	INTO #bio9
	FROM transcript
	WHERE courseName 
		LIKE ('Bio%')
		AND grade=9
		AND startYear = 2020
	GROUP BY ID, courseName;

EXEC tempdb.sys.sp_rename N'#bio9.courseName', N'bio9', N'COLUMN';


SELECT ID, courseName, avg("percent") as phys10_score
	INTO #phys10
	FROM transcript
	WHERE courseName 
		LIKE ('%Physics%')
		AND grade=10
		AND startYear = 2021
	GROUP BY ID, courseName;

EXEC tempdb.sys.sp_rename N'#phys10.courseName', N'phys10', N'COLUMN';

SELECT ID, courseName, avg("percent") as chem11_score
	INTO #chem11
	FROM transcript
	WHERE courseName 
		LIKE ('%Chem%')
		AND grade=11
		AND startYear = 2022
	GROUP BY ID, courseName;

EXEC tempdb.sys.sp_rename N'#chem11.courseName', N'chem11', N'COLUMN';


SELECT #bio9.*, #phys10.phys10, #phys10.phys10_score,
	#chem11.chem11, #chem11.chem11_score
	INTO science_grades
	FROM #bio9
	FULL OUTER JOIN #phys10
		ON #bio9.ID = #phys10.ID
	FULL OUTER JOIN #chem11 
		ON #bio9.ID = #chem11.ID

SELECT * FROM science_grades;

*/
SELECT COUNT(DISTINCT ID),bio9, phys10, chem11 
	FROM science_grades
	GROUP BY bio9, phys10, chem11 
	ORDER BY COUNT(DISTINCT ID) DESC;

SELECT COUNT(DISTINCT ID), schoolName
	FROM science_grades
	WHERE bioCourse LIKE 'Biology 1 Hon'
		AND physCourse like 'Physics 1 Hon'
	GROUP BY schoolName
	ORDER BY COUNT(DISTINCT ID) DESC;


SELECT COUNT(DISTINCT ID), schoolName, electiveCourse
	FROM science_grades20_22
	WHERE bioCourse IS NOT NULL
		AND physCourse IS NOT NULL
	GROUP BY schoolName, electiveCourse
	ORDER BY COUNT(DISTINCT ID) DESC;

SELECT COUNT(DISTINCT ID), courseName, startYear, grade
	FROM transcript
	WHERE courseName IN(
		SELECT Course_Name 
			FROM science_courses
			WHERE College_Credit = 1)
	GROUP BY courseName, startYear, grade
	ORDER BY COUNT(DISTINCT ID) DESC;


SELECT * FROM science_grades20_22
	WHERE ID = 2230724;

SELECT startYear, grade FROM transcript
	WHERE courseName = 'AP Chemistry'
	AND ID LIKE '2%';

