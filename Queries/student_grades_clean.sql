USE science_course_study

--Join demographic information with core grades
SELECT *
	INTO student_core_grades
	FROM core_grades
	LEFT JOIN demographics
		ON core_grades.ID = demographics.Student_ID

--Drop duplicate ID column from Join
ALTER TABLE student_core_grades
DROP COLUMN Student_ID;


SELECT * FROM student_core_grades;
	
