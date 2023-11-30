/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [id]
      ,[first_name]
      ,[last_name]
      ,[birthdate]
      ,[gender]
      ,[race]
      ,[department]
      ,[jobtitle]
      ,[location]
      ,[hire_date]
      ,[termdate]
      ,[location_city]
      ,[location_state]
  FROM [hr].[dbo].[hr_info]
  -- 1. What is the gender breakdown of employees in the company?
  
-- 2. What is the race/ethnicity breakdown of employees in the company?
-- 3. What is the age distribution of employees in the company?
-- 4. How many employees work at headquarters versus remote locations?
---- 5. What is the average length of employment for employees who have been terminated?
SELECT round(avg(datediff(termdate, hire_date))/365,0) AS avg_length_employment
-- 6. How does the gender distribution vary across departments and job titles?
-- 7. What is the distribution of job titles across the company?
-- 8. Which department has the highest turnover rate?
-- 9. What is the distribution of employees across locations by city and state?
-- 10. How has the company's employee count changed over time based on hire and term dates?


-- 11. What is the tenure distribution for each department?
 --- data cleaning
 ---checking for null or duplicate values

 select id, count (*)count
 from[dbo].[hr_info]
 group by id
 having count (*)>1
 select location
from[dbo].[hr_info]

 --checking for null values
 select 'first_name'columnn  , count (*)count
  from[dbo].[hr_info]
  where first_name IS null
  group by first_name
  union
  select 'id'columnn  , count (*)count
  from[dbo].[hr_info]
  where id IS null
  group by id
  union
select' last_name'colunmn, count (*)count
  from[dbo].[hr_info]
  where last_name IS null
  group by last_name
  union
  select' birthdate'colunmn, count (*)count
  from[dbo].[hr_info]
  where birthdate IS null
  group by birthdate
  union 
  select 'gender'colunmn, count (*)count
  from[dbo].[hr_info]
  where gender IS null
  group by gender
  union
select' race'colunmn, count (*)count
  from[dbo].[hr_info]
  where race IS null
  group by race
  union
  select' department'colunmn, count (*)count
  from[dbo].[hr_info]
  where department IS null
  group by department
  union 
select' jobtitle'colunmn, count (*)count
  from[dbo].[hr_info]
  where jobtitle IS null
  group by jobtitle
  union
select' location'colunmn,count (*)count
  from[dbo].[hr_info]
  where location IS null
  group by location
  union
select' hire_date'colunmn, count (*)count
  from[dbo].[hr_info]
  where hire_date IS null
  group by hire_date
  union
  select'location_city'colunmn, count (*)count
  from[dbo].[hr_info]
  where location_city IS null
  group by location_city
  union
 select'location_state'colunmn, count (*)count
  from[dbo].[hr_info]
  where location_state IS null
  group by location_state

 ---there is one null value
 select *from [dbo].[hr_info]
 where first_name is null 

 --delete the null values from the table
 delete from [dbo].[hr_info]
 where first_name is null

  select *
  from [dbo].[hr_info]

    -- 1. What is the gender breakdown of employees in the company?
select *from[dbo].[hr_info]

	select gender, department,
	count (gender) over (partition by department)
	from[dbo].[hr_info]

	select department,gender, count(gender)count
	from[dbo].[hr_info]
	group by department, gender
	order by count desc
-- 3. What is the age distribution of employees in the company?
--- there is no age in the column to find that we have to take difference btw current date and birth date
alter table [dbo].[hr_info]
add age int
--ADDED THE AGE COLUMN
update[dbo].[hr_info]
set age = datediff(year, birthdate, getdate())
--- DIFFERENTIATED THE DATE 

select age
from[dbo].[hr_info]
wh
--- this was too long 

ere age >18
--- PRATICE
select datename(MONTH, birthdate)Month,birthdate,first_name,last_name
from [dbo].[hr_info]
SELECT DATENAME(MONTH,( BIRTHDATE)), YEAR (BIRTHDATE), day(BIRTHDATE)
FROM [dbo].[hr_info]
-- 3. What is the age distribution of employees in the company?
SELECT jobtitle, department,age,
   case
	WHEN age>=18 AND age <=24 THEN '18-24'
        WHEN age>=25 AND age <=34 THEN '25-34'
        WHEN age>=35 AND age <=44 THEN '35-44'
        WHEN age>=45 AND age <=54 THEN '45-54'
        WHEN age>=55 AND age <=64 THEN '55-64'
		ELSE '65+'
end as age_distribution, count(*) over (partition by 
	case
	WHEN age>=18 AND age <=24 THEN '18-24'
        WHEN age>=25 AND age <=34 THEN '25-34'
        WHEN age>=35 AND age <=44 THEN '35-44'
        WHEN age>=45 AND age <=54 THEN '45-54'
        WHEN age>=55 AND age <=64 THEN '55-64'
		ELSE '65+'
end )as age_distribution_count
from[dbo].[hr_info]
group by jobtitle, department,age, 
case
	WHEN age>=18 AND age <=24 THEN '18-24'
        WHEN age>=25 AND age <=34 THEN '25-34'
        WHEN age>=35 AND age <=44 THEN '35-44'
        WHEN age>=45 AND age <=54 THEN '45-54'
        WHEN age>=55 AND age <=64 THEN '55-64'
		ELSE '65+'
end
-- 6. How does the gender distribution vary across departments and job titles?

WITH age_distribution AS (
    SELECT 
        jobtitle,
        department,
        age,
        CASE
          WHEN age>=18 AND age <=24 THEN '18-24'
        WHEN age>=25 AND age <=34 THEN '25-34'
        WHEN age>=35 AND age <=44 THEN '35-44'
        WHEN age>=45 AND age <=54 THEN '45-54'
        WHEN age>=55 AND age <=64 THEN '55-64'
		ELSE '65+'
        END AS age_distribution
    FROM [dbo].[hr_info]
)

SELECT age_distribution, department,COUNT( age_distribution)over (partition by department)COUNT_OF_DEPARTMENT 
FROM age_distribution
where age_distribution ='18-24' 

-- 2. What is the race/ethnicity breakdown of employees in the company?
select first_name,last_name, race, count(race) over (partition by jobtitle, department )count_of_race,jobtitle,department,location
FROM[dbo].[hr_info]
group by race,first_name,last_name

SELECT DISTINCT (race) AS distinct_race_count
FROM [dbo].[hr_info];

-- 4. How many employees work at headquarters versus remote locations?
select first_name,last_name,location,count(location) over (partition by department)count_of_remote, department, jobtitle
from[dbo].[hr_info]
where location = 'remote'

select first_name,last_name,location,count(location) over (partition by department)count_of_headquarters, department, jobtitle
from[dbo].[hr_info]
where location = 'headquarters'

-- 7. What is the distribution of job titles across the company?
select first_name,last_name,age,jobtitle
from [dbo].[hr_info]
select distinct (jobtitle)
from [dbo].[hr_info]

-- 9. What is the distribution of employees across locations by city and state?
select first_name, last_name,location_city,location_state,location,
count(location_city) over (partition by location_city ) count_of_employee_location_city
from[dbo].[hr_info]

select *
from[dbo].[hr_info]

alter table [dbo].[hr_info]
drop column termdate

---5. What is the average length of employment for employees who have been terminated?
alter table [dbo].[hr_info]
add lenght_of_employee  int

update [dbo].[hr_info]
set lenght_of_employee = datediff(year,hire_date, getdate())

select first_name,last_name, hire_date,datediff(year,hire_date, getdate())no_of_year,
	case
	when lenght_of_employee=0 and lenght_of_employee<=3 then 'just hired'
	when lenght_of_employee>=3 and lenght_of_employee<=5then 'hired for a while'
	when lenght_of_employee>=5 and lenght_of_employee<=10 then ' hired for longtime'
	else 'due for long service benefit'
	end statues
from [dbo].[hr_info]
order by no_of_year 

-- 10. How has the company's employee count changed over time based on hire?
select first_name, last_name,hire_date,datename(year,hire_date)hire_year,
count(*) over (partition by datename(year,hire_date))count_of_employees
from [dbo].[hr_info]
order by count_of_employees desc


--- no of employee that works remotely & at the headquarter
select  distinct ( first_name),last_name, jobtitle
from [dbo].[hr_info]
where location = 'remote'
select  distinct ( first_name), last_name, jobtitle
from [dbo].[hr_info]
where location = 'headquarters' 

select last_name ,count(*)
from[dbo].[hr_info]
group by first_name, last_name
having count(*) >1

select*
from[dbo].[hr_info]