Select
    job_location,
    avg(salary_year_avg) as avg_salary
From
     job_postings_fact
Where  
    salary_year_avg is not null
Group by 
    job_location
Having
    avg(salary_year_avg) >120000 AND count (salary_year_avg) >= 5
Order by
    avg_salary desc;
