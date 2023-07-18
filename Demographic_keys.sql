USE science_course_study

/*
--create a temp table for student ID's and school during the 2021 year
-- No remote option during 2021
SELECT ID, schoolName 
	INTO #school_name
	FROM transcript
	WHERE startYear = 2021

--Add a schoolName column to deographics table
ALTER TABLE demographics 
	ADD schoolName varchar(50)

--Update demographics table using join from temp table
update demographics
set demographics.schoolName = #school_name.schoolName
from demographics
    LEFT join #school_name 
		ON demographics.Student_ID = #school_name.ID
-------------------------------------------------------------
*/

/*
--Update the Gender to coded 0 = female, 1 = male, 2 = Non-binary
UPDATE demographics
SET Gender = 0
	WHERE Gender = 'Female'

UPDATE demographics
SET Gender = 1
	WHERE Gender = 'Male'

UPDATE demographics
SET Gender = 2
	WHERE Gender = 'Non-Binary'
----------------------------------------------------------------

--Create a table with ID Numbers to use instead of counselor names--

--DROP TABLE CounselorID

CREATE TABLE CounselorID (
	counselorID INT IDENTITY(10, 3) NOT NULL,
	counselor_name VARCHAR(50)
	)

INSERT INTO CounselorID(counselor_name)
	SELECT DISTINCT(Counselor)
		FROM demographics
		WHERE Counselor IS NOT NULL
		
SELECT * FROM CounselorID
	ORDER BY counselor_name ASC

UPDATE demographics 
SET Counselor = CounselorID.counselorID
	FROM CounselorID
	WHERE demographics.Counselor = CounselorID.counselor_name
--------------------------------------------------------------
--Update Double_Math to binary codes
UPDATE demographics 
SET Double_Math = 1
	WHERE Double_Math = 'Yes'

UPDATE demographics 
SET Double_Math = 0 
	WHERE Double_Math IS NULL
----------------------------------------------------------------
--Update the FRPL_Status to coded int variables 

UPDATE demographics
SET FRPL_Status =
	CASE 
		WHEN FRPL_Status = 'Paid' THEN 1
		WHEN FRPL_Status = 'Reduced' THEN 2
		WHEN FRPL_Status = 'Free' THEN 3
	END
-------------------------------------------------------------
--Update Home Language to coded numerical values
UPDATE demographics
SET Home_Language =
	CASE 
		WHEN Home_Language = 'English' THEN 0
		WHEN Home_Language IS NULL THEN 0
		WHEN Home_Language = 'Spanish' THEN 1
		WHEN Home_Language = 'French' THEN 2
		WHEN Home_Language = 'Arabic' THEN 3
		WHEN Home_Language = 'Ewe' THEN 4
		WHEN Home_Language = 'Lao' THEN 5
		WHEN Home_Language = 'Greek' THEN 6
	END
----------------------------------------------------------------

--Update the schoolName to coded int variables 3 is for transfer students outside our district

UPDATE demographics
SET schoolName =
	CASE 
		WHEN schoolName = 'Central Campus' THEN 0
		WHEN schoolName = 'West Campus' THEN 1
		WHEN schoolName = 'Summer School' THEN 2
		WHEN schoolName IS NOT NULL THEN 3
	END
----------------------------------------------------------------
--Update the Race-Ethnicity to coded int variables

UPDATE demographics
SET Race_Ethnicity =
	CASE 
		WHEN Race_Ethnicity ='American Indian or Alaskan Nat' THEN 0
		WHEN Race_Ethnicity = 'Multiracial/Ethnic' THEN 1
		WHEN Race_Ethnicity = 'Black or African American' THEN 2
		WHEN Race_Ethnicity = 'Hispanic' THEN 3
		WHEN Race_Ethnicity = 'Asian or Pacific Islander' THEN 4
		WHEN Race_Ethnicity = 'White' THEN 5
		
	END
*/

SELECT * FROM demographics


	
