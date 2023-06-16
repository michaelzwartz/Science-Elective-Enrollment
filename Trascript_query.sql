USE science_course_study

/*
SELECT COUNT(student_stateID), student_stateID 
	FROM #bio_grades
	GROUP BY student_stateID
	ORDER BY COUNT(student_stateID) DESC;


SELECT DISTINCT student_stateID, schoolName 
	INTO science_grade_summary
	FROM transcript
	WHERE schoolName IN (
	'Central Campus', 'West Campus', 
	'Summer School', 'Remote Learning', 
	'Pathways', 'Lincoln');



SELECT COUNT(DISTINCT student_stateID), courseName, startYear
	FROM transcript
	WHERE courseName IN (
		SELECT Course_Name 
		FROM science_courses)
	GROUP BY courseName, startYear
	ORDER BY COUNT(DISTINCT student_stateID) DESC;



SELECT COUNT(student_stateID), courseName, avg("percent")
	FROM transcript
	WHERE courseName IN(
		SELECT Course_Name
		FROM science_courses)
		--WHERE Required = 0)
	GROUP BY courseName
	ORDER BY COUNT(student_stateID) DESC;
*/

SELECT ID, courseName, score, avg("percent") 
	FROM transcript
	WHERE grade = 9
	AND courseName LIKE ('Alg%')
	--ID IN (SELECT ID FROM science_grades20_22)
	GROUP BY ID, courseName, score
	ORDER BY avg("percent") DESC;
	
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

select * from transcript;