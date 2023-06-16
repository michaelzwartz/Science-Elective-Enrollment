USE science_course_study

SELECT COUNT(StudentNumber), Course_Name, Request_Type
	FROM requests23_24
	WHERE Course_Name IN(
		SELECT Course_Name
		FROM science_courses
		WHERE Required = 0)
	GROUP BY Course_Name, Request_Type;

SELECT COUNT(DISTINCT ID) from science_grades20_22;
SELECT COUNT(DISTINCT ID), chemCourse FROM science_grades20_22
	GROUP BY chemCourse;

SELECT requests22_23.Course_Name, requests22_23.Request_Type,
	transcript.ID, transcript.courseName, transcript."percent"
	INTO #chem_request_grades
	FROM requests22_23
	RIGHT JOIN transcript
	ON requests22_23.StudentNumber = transcript.ID
	AND requests22_23.Course_Name = transcript.courseName
	WHERE courseName IN (SELECT Course_Name 
						FROM science_courses
						WHERE Course_Name LIKE 'Chem%' 
						AND startYear = 2022)

SELECT courseName, avg("percent") FROM #chem_request_grades
	WHERE Course_Name = courseName
	GROUP BY courseName;

SELECT * FROM science_grades20_22;
		