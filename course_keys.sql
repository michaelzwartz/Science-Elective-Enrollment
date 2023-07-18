USE science_course_study


/*
--Create a new table containing Central records only. 
SELECT * 
	INTO central_clean_report
	FROM student_core_grades
	WHERE schoolName = 0

SELECT * FROM central_clean_report
*/

/*
--Update the course names to a to coded int variables

UPDATE central_clean_report
SET math9 =
	CASE 
		WHEN math9 IS NULL THEN 0
		WHEN math9 ='Algebra 1' THEN 1
		WHEN math9 ='Algebra 1 Hon' THEN 2
		WHEN math9 ='Algebra 1 In (2 hr)' THEN 3
		WHEN math9 ='Algebra 1 Bi' THEN 4
		ELSE 5
	END
------------------------------------------------

UPDATE central_clean_report
SET math10 =
	CASE 
		WHEN math10 IS NULL THEN 0
		WHEN math10 ='Geometry' THEN 1
		WHEN math10 ='Geometry CR Grading' THEN 1
		WHEN math10 ='Geometry Hon' THEN 2
		WHEN math10 ='Geometry (2 hr)' THEN 3
		WHEN math10 ='Geometry 2HR CR Grading' THEN 3
		WHEN math10 ='Geometry In' THEN 3
		WHEN math10 ='Geometry Bi' THEN 4
		ELSE 5
	END
------------------------------------------------

UPDATE central_clean_report
SET eng9 =
	CASE 
		WHEN eng9 IS NULL THEN 0
		WHEN eng9 ='English 1' THEN 1
		WHEN eng9 = 'English 1 Hon' THEN 2		
		WHEN eng9 ='English 1 In' THEN 3
		WHEN eng9 ='English 1 EL' THEN 4
		ELSE 5
	END

------------------------------------------------

UPDATE central_clean_report
SET eng10 =
	CASE 
		WHEN eng10 IS NULL THEN 0
		WHEN eng10 ='English 2' THEN 1
		WHEN eng10 = 'English 2 Hon' THEN 2		
		WHEN eng10 ='English 2 In' THEN 3
		WHEN eng10 ='English 2 EL' THEN 4
		ELSE 5
	END

------------------------------------------------

UPDATE central_clean_report
SET hist9 = 
	CASE 
		WHEN hist9 IS NULL THEN 0
		WHEN hist9 ='World Affairs' THEN 1
		WHEN hist9 = 'AP Human Geography' THEN 2
		WHEN hist9 = 'World Affairs In' THEN 3
		WHEN hist9 = 'World Affairs Bi' THEN 4
		ELSE 5
	END
------------------------------------------------
UPDATE central_clean_report
SET bio9 = 
	CASE 
		WHEN bio9 IS NULL THEN 0
		WHEN bio9 ='Biology 1' THEN 1
		WHEN bio9 ='Biology' THEN 1
		WHEN bio9 = 'Biology 1 Hon' THEN 2
		WHEN bio9 = 'Biology 1 In' THEN 3
		WHEN bio9 = 'Biology 1 Bi' THEN 4
		ELSE 5
	END
------------------------------------------------

UPDATE central_clean_report
SET phys10 = 
	CASE 
		WHEN phys10 IS NULL THEN 0
		WHEN phys10 ='Physics 1' THEN 1
		WHEN phys10 ='Physics' THEN 1
		WHEN phys10 = 'Physics 1 Hon' THEN 2
		WHEN phys10 = 'Physics 1 In' THEN 3
		WHEN phys10 = 'Physics 1 Bi' THEN 4
		ELSE 5
	END
------------------------------------------------

UPDATE central_clean_report
SET chem11 = 
	CASE 
		WHEN chem11 IS NULL THEN 0
		WHEN chem11 ='Chemistry 1' THEN 1
		WHEN chem11 ='Physics' THEN 1
		WHEN chem11 = 'Chemistry 1 Hon' THEN 2
		WHEN chem11 = 'Chemistry 1 In' THEN 3
		WHEN chem11 = 'Chemistry 1 Bi' THEN 4
		ELSE 5
	END


SELECT * FROM central_clean_report
*/

/*
SELECT DISTINCT(eng10), COUNT(eng10)
	FROM central_clean_report
	GROUP BY eng10
	ORDER BY COUNT(eng10) DESC
*/