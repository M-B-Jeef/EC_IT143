/***********************************************************************************
NAME: EC_IT143_W5.2_IndianEngineering_BL.sql
PURPOSE: Answer questions for Indian Engineering dataset

MODIFICATION LOG:
Ver      Date        Author        Description
1.0      02/14/2026  BJ            Project 5.2 answers
***********************************************************************************/

USE EC_IT143_DA;
GO

-- Question 1
-- Author: Berly Jeeffrey (me)
-- Question: Do more study hours lead to higher participation in hackathons?

SELECT 
    study_hours_per_day,
    AVG(hackathons_participated) AS avg_hackathons
FROM dbo.indian_engineering_student_placement
GROUP BY study_hours_per_day
ORDER BY study_hours_per_day;
GO

-- Question 2
-- Author: Berly Jeeffrey (me)
-- Question: Does family income and internet access affect participation in hackathons and projects?

SELECT 
    family_income_level,
    internet_access,
    AVG(hackathons_participated) AS avg_hackathons,
    AVG(projects_completed) AS avg_projects
FROM dbo.indian_engineering_student_placement
GROUP BY family_income_level, internet_access;
GO

-- Question 3
-- Author: Berly Jeeffrey (me)
-- Question: Are sleep hours and study hours related to stress levels?

SELECT 
    sleep_hours,
    study_hours_per_day,
    AVG(stress_level) AS avg_stress
FROM dbo.indian_engineering_student_placement
GROUP BY sleep_hours, study_hours_per_day
ORDER BY avg_stress DESC;
GO

-- Question 4
-- Author: Berly Jeeffrey (me)
-- Question: Does participation in extracurricular activities affect communication skills?

SELECT 
    extracurricular_involvement,
    AVG(communication_skill_rating) AS avg_communication
FROM dbo.indian_engineering_student_placement
GROUP BY extracurricular_involvement;
GO
