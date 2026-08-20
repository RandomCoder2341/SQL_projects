/*select 
   jpf.job_id,
   jpf.job_title_short,
   cd.company_id,
   cd.name AS company_name,
   jpf.job_location

from
    job_postings_fact AS jpf
Left Join company_dim AS cd
    On jpf.company_id = cd.company_id
limit
    10;
select 
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills
From
    job_postings_fact AS jpf
Left Join skills_job_dim AS sjd
    on jpf.job_id = sjd.job_id
left Join skills_dim AS sd
    on sjd.skill_id = sd.skill_id;
select 
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills
From
    job_postings_fact AS jpf
Inner Join skills_job_dim AS sjd
    on jpf.job_id = sjd.job_id
Inner Join skills_dim AS sd
    on sjd.skill_id = sd.skill_id;*/

--Testing/sample problems

-- Select Excercise 1
--     cd.name AS company_name,
--     jpf.job_title_short,
--     cd.company_id
-- from 
--     job_postings_fact AS jpf
-- join company_dim AS cd
--     ON jpf.company_id = cd.company_id
-- limit 10;

--Excercise 2
Select
    cd.name AS company_name,
    count(jpf.job_id) AS total_jobs
from 
    company_dim AS cd
left join  job_postings_fact AS jpf
    ON jpf.company_id = cd.company_id
group by
    cd.name
order by 
    total_jobs;

--exercise 3
Select
    cd.name AS company_name,
    avg(salary_year_avg) AS avg_salary
from 
    job_postings_fact AS jpf
 Inner join company_dim AS cd
    ON jpf.company_id = cd.company_id
where
    job_title_short = 'Data Engineer' and salary_year_avg is not null
group by
    cd.name
order by
avg_salary desc
limit 5;
