/*
Question: What are the most optimal skills (high demand + high pay) for data roles in the Philippines?
- Join job_postings_fact to skills_job_dim and skills_dim to associate specific skills with job postings.
- Filter for job postings located in the Philippines across Data Analyst, Data Engineer, and Data Scientist roles.
- Exclude records where salary_year_avg IS NULL to avoid skewing salary averages.
- Group by job title and skill name, using a HAVING clause (COUNT > 10) to eliminate low-volume outliers.
- Why? Identifies skills that balance strong job security with premium compensation in the Philippine market,
  helping professionals prioritize high-ROI learning paths.
*/
SELECT 
    job_title_short,
    sd.skills AS skill_name,
    count(jpf.job_id) AS skill_count,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
    FROM job_postings_fact AS jpf
    JOIN skills_job_dim AS sjd
        ON jpf.job_id = sjd.job_id
    JOIN skills_dim AS sd
        On sd.skill_id = sjd.skill_id
WHERE 
    (job_country = 'Philippines' AND salary_year_avg is not null)
AND 
    job_title_short IN ('Data Engineer','Data Scientist','Data Analyst')
GROUP BY 
    job_title_short,
    sd.skills
HAVING 
COUNT(jpf.job_id) > 10
Order BY
    job_title_short,
    avg_salary desc;

/*
Here's the breakdown of the most optimal skills for data roles in the Philippines:
Data Analysts see top financial return by pairing BI visualization tools like Tableau ($69,815) with foundational skills like SQL and Excel (26 postings each).
Data Engineers command the highest top-tier salaries through big-data and system tools like Hadoop ($94,437) and Linux ($94,398), while Python and SQL maintain strong volume above $88k+.
Data Scientists gain the highest overall compensation yield from Python ($96,716), marking it as the single most lucrative core skill in the local dataset.

Key takeaways:
- Data Analyst: Tableau leads compensation, while SQL and Excel provide the highest job security. Combining SQL with Tableau offers the best ROI for analysts.
- Data Engineer: Specialized infrastructure tools (Hadoop, Linux) command peak salaries, while SQL and Python remain non-negotiable core drivers above $88k+.
- Data Scientist: Python stands out as the single most optimal skill for this role, driving an average salary near $97k.
┌─────────────────┬─────────────┬─────────────┬────────────┐
│ job_title_short │ skill_name  │ skill_count │ avg_salary │
│     varchar     │   varchar   │    int64    │   double   │
├─────────────────┼─────────────┼─────────────┼────────────┤
│ Data Analyst    │ tableau     │          13 │   69815.19 │
│ Data Analyst    │ sql         │          26 │   69548.62 │
│ Data Analyst    │ excel       │          26 │   67961.06 │
│ Data Analyst    │ python      │          17 │   67075.97 │
│ Data Engineer   │ hadoop      │          17 │   94437.53 │
│ Data Engineer   │ linux       │          17 │   94398.06 │
│ Data Engineer   │ python      │          27 │   90105.19 │
│ Data Engineer   │ sql         │          30 │    88566.3 │
│ Data Engineer   │ spark       │          11 │   87563.09 │
│ Data Engineer   │ mysql       │          13 │   84982.08 │
│ Data Engineer   │ ringcentral │          12 │    83999.5 │
│ Data Engineer   │ word        │          12 │    83999.5 │
│ Data Engineer   │ snowflake   │          18 │   83005.53 │
│ Data Scientist  │ python      │          12 │   96716.75 │
└─────────────────┴─────────────┴─────────────┴────────────┘
*/