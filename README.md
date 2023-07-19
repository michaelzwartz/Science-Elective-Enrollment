# Science-Elective-Enrollment
In this project, the goal is to predict student enrollment in science elective courses. Check out the READ ME file for more detail. 

The data was transformed using SQL Server to prepare it for machine learning using python. 
First, bio_phys_chem_query.sql was run to create the table science_grades. 
Second, core_grades.sql was run to create the core_grades table that included english, math, and history. 
Third, student_grades_clean.sql was run to create the table student_core_grades. This table included all grade infomration and demographic info. 

Next the data was key for learning algorithms: 
Demographic_keys.sql was run to change categorial data to nominal numerical data.
Last step, course_keys.sql was run. This created the table Central_clean report. This report had only students from Central with coded demogrpahic and course data. 
