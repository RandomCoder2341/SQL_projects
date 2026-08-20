Select 
    cd.name AS company_name,
    count(jpf.job_id) AS posting_count,
FROM job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
    On jpf.company_id = cd.company_id
WHERE 
    jpf.job_country = 'United States'
GROUP BY cd.name
having count(jpf.job_id) > 3000
ORDER BY posting_count desc
limit 5
;

Select 
    cd.name AS company_name,
    cd.company_id
FROM company_dim AS cd
LEFT JOIN job_postings_fact AS jpf
    On jpf.company_id = cd.company_id
WHERE jpf.job_id is null;

SELECT 
    cd.name AS company_name,
    count(job_work_from_home) AS total_remote_jobs
From job_postings_fact AS jpf
    join company_dim AS cd
    ON jpf.company_id = cd.company_id
where
    jpf.job_work_from_home = TRUE
Group By
    cd.name
HAVING count(job_work_from_home) > 10
Order By
    total_remote_jobs desc;
