# Human Resource

 ## Project Overview 

 This data analysis project  aims to provide insight on the staff information of an American company with employees from different race and country. By analyzing various aspect of staff information to extract insight and information and to identify trends ,  make data driven decision on staff rentention and employment of staff to gain deeper understanding about staff information

 ## Data Source

This dataset was gotten from  Irene-arch github account as csv file which was downloaded to work on 

## Tools

- WPS Spreedsheet - This was used to make quick correction and make a first check of dataset
- Sequel Sever - This was used to clean and analysis the dataset to extract insight
- Power Bi - This was used for visualization of insight and to expansaite
- Power Query

## Data Cleaning
  Initially the data cleaning steps was performed from
  - Data Loading
  - Data Cleaning
  - Removal of Missing Values
 
  ## Exploratory Data Analysis

  EDA involves explaining the human resource datasetbto answerthese questions 
  
  1. What is the total number of staff?
  2. What is the number of employees  works on remote ?
  3. What is the number of employees work phyiscally at the head quarter?
  4. Number of employees employed in the past year ?
  5. A trend of employement of staff ?
  6. asdftrdc
     
## Data Analysis
Include some interesting code/features worked with
```sql
select *
from table 1;select 'first_name'columnn  , count (*)count
  from[dbo].[hr_info]
  where first_name IS null
  group by first_name
  union
  select 'id'columnn  , count (*)count
  from[dbo].[hr_info]
  where id IS null
  group by id;
```

```sql
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
from[dbo].[hr_info];
`````

### Results/Findings
[Report on Investigation Findings dashboard .pdf](https://github.com/user-attachments/files/17688620/Report.on.Investigation.Findings.dashboard.pdf)

The analysis results are summarized as follows:
1. The total employees are 570
2. The employees working  at the headquarter phyiscally are 436 in number
3. The employees works remotely 134 in number
4. In the year 2002 the company emploted about 37 employee also in the year 2016 the company employed 36 employees

## Recommendations
Based on the analysis, we recommend the following actions:
1. Increase number of staff that works remotely
2. Reduction in the number of employees employed in the next business year
3. Increase  employmnet of  employees from other races

## References

Github                                               
Her data project youtube channel 



