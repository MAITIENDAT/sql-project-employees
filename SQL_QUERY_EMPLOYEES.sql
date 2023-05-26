
-- 1. What is the gender breakdown of employees in the company?
create view BreakdownGender as
select gender, count(*) as CountOfGender
from dbo.[Human Resources]
GROUP BY gender;

-- 2. What is the race/ethnicity breakdown of employees in the company?
create view BreakdownRace as
select race, count(*) as CountOfGender
from dbo.[Human Resources]
GROUP BY race;

-- 3. What is the age distribution of employees in the company?
create view MinAndMaxAge as
select min(YEAR(GETDATE()) - YEAR(birthdate)) as Youngest, max(YEAR(GETDATE()) - YEAR(birthdate)) as Oldest
from dbo.[Human Resources]

create view AgeDistributionInCompany as
select 
	 case 
		when YEAR(GETDATE()) - YEAR(birthdate) >= 18 AND  YEAR(GETDATE()) - YEAR(birthdate) <= 24 then '18-24'
		when YEAR(GETDATE()) - YEAR(birthdate) >= 25 AND  YEAR(GETDATE()) - YEAR(birthdate) <= 34 then '25-34'
		when YEAR(GETDATE()) - YEAR(birthdate) >= 35 AND  YEAR(GETDATE()) - YEAR(birthdate) <= 44 then '35-44'
		when YEAR(GETDATE()) - YEAR(birthdate) >= 45 AND  YEAR(GETDATE()) - YEAR(birthdate) <= 54 then '45-54'
		when YEAR(GETDATE()) - YEAR(birthdate) >= 55 AND  YEAR(GETDATE()) - YEAR(birthdate) <= 64 then '55-64'
		else '65+'
		end as Age_group,gender,
		count(*) as count
FROM dbo.[Human Resources]
group by case 
		when YEAR(GETDATE()) - YEAR(birthdate) >= 18 AND  YEAR(GETDATE()) - YEAR(birthdate) <= 24 then '18-24'
		when YEAR(GETDATE()) - YEAR(birthdate) >= 25 AND  YEAR(GETDATE()) - YEAR(birthdate) <= 34 then '25-34'
		when YEAR(GETDATE()) - YEAR(birthdate) >= 35 AND  YEAR(GETDATE()) - YEAR(birthdate) <= 44 then '35-44'
		when YEAR(GETDATE()) - YEAR(birthdate) >= 45 AND  YEAR(GETDATE()) - YEAR(birthdate) <= 54 then '45-54'
		when YEAR(GETDATE()) - YEAR(birthdate) >= 55 AND  YEAR(GETDATE()) - YEAR(birthdate) <= 64 then '55-64'
		else '65+'
		end ,gender 
order by case 
		when YEAR(GETDATE()) - YEAR(birthdate) >= 18 AND  YEAR(GETDATE()) - YEAR(birthdate) <= 24 then '18-24'
		when YEAR(GETDATE()) - YEAR(birthdate) >= 25 AND  YEAR(GETDATE()) - YEAR(birthdate) <= 34 then '25-34'
		when YEAR(GETDATE()) - YEAR(birthdate) >= 35 AND  YEAR(GETDATE()) - YEAR(birthdate) <= 44 then '35-44'
		when YEAR(GETDATE()) - YEAR(birthdate) >= 45 AND  YEAR(GETDATE()) - YEAR(birthdate) <= 54 then '45-54'
		when YEAR(GETDATE()) - YEAR(birthdate) >= 55 AND  YEAR(GETDATE()) - YEAR(birthdate) <= 64 then '55-64'
		else '65+'
		end,gender offset 0  rows

-- 4. How many employees work at headquarters versus remote locations?
create view EmployeesWorkOfLocations as
select location, count(*) as count
from dbo.[Human Resources]
group by location;


-- 5. What is the average length of employment for employees who have been terminated?
create view AVGEMOFTER as
select avg( DATEDIFF(DAY,hire_date,convert(date,left(termdate,10))))/365 as avgLengthOfEmployees
from dbo.[Human Resources]
where CONVERT(date, LEFT(termdate, 10)) <= CONVERT(date, GETDATE()) 

select * from AVGEMOFTER


-- 6. How does the gender distribution vary across departments and job titles?
create view GendderDistribution as
select HR.department, HR.gender, count(*) as Count
from dbo.[Human Resources] as HR
group by HR.department, HR.gender
order by HR.department offset 0 rows




