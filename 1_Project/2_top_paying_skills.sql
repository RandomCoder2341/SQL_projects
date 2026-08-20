/*
Question: What are the most popular programming languages and skills for core data roles in the Philippines?
- Join job_postings_fact to skills_job_dim and skills_dim to map specific skills to job posts.
- Filter for job postings located in the Philippines for Data Analyst, Data Engineer, and Data Scientist roles.
- Use a Window Function (ROW_NUMBER) partitioned by role title to determine the top 5 requested skills for each role.
- Why? Identifies the essential tools and programming languages required across different data career paths locally,
 helping professionals focus their learning on high-demand skills.
*/
WITH RankedSkills AS (
    SELECT 
    job_title_short,
    sd.skills AS skill_name,
    count(jpf.job_id) AS skill_count,
    ROW_NUMBER() OVER (
        PARTITION BY jpf.job_title_short
        ORDER BY count(jpf.job_id) DESC
    )
 AS Rank
    FROM job_postings_fact AS jpf
    JOIN skills_job_dim AS sjd
        ON jpf.job_id = sjd.job_id
    JOIN skills_dim AS sd
        On sd.skill_id = sjd.skill_id
WHERE 
    job_country = 'Philippines'
AND 
    job_title_short IN ('Data Engineer','Data Scientist','Data Analyst')
GROUP BY 
    job_title_short,
    sd.skills
)

SELECT 
    job_title_short,
    skill_name,
    skill_count
FROM 
    RankedSkills
WHERE 
    rank <= 5
Order by 
    job_title_short,
    rank asc;

/*
Here's the breakdown of the most demanded skills for data roles in the Philippines:
SQL and Python emerge as universal baseline languages, securing top spots across all three core data roles.
Data Analysts are heavily reliant on spreadsheet and business intelligence software, with Excel taking the top position over SQL.
Data Engineers prioritize core infrastructure and big data technologies, with cloud platforms like Azure leading ahead of AWS.
Data Scientists maintain a strong statistical modeling focus, with R ranking directly alongside SQL and Python.

Key takeaways:
- SQL and Python are non-negotiable core programming languages across the entire data domain in the Philippines.
- Data Analyst roles focus heavily on reporting and visual tools (Excel, Tableau, Power BI).
- Data Engineering demands specialized big data frameworks (Spark) and cloud platforms (Azure, AWS).
- Data Science requires traditional statistical tools (R) alongside core database and programming capabilities.

┌─────────────────┬────────────┬─────────────┐
│ job_title_short │ skill_name │ skill_count │
│     varchar     │  varchar   │    int64    │
├─────────────────┼────────────┼─────────────┤
│ Data Analyst    │ excel      │        4566 │
│ Data Analyst    │ sql        │        3683 │
│ Data Analyst    │ python     │        2075 │
│ Data Analyst    │ tableau    │        2029 │
│ Data Analyst    │ power bi   │        1949 │
│ Data Engineer   │ sql        │        2870 │
│ Data Engineer   │ python     │        2403 │
│ Data Engineer   │ azure      │        1535 │
│ Data Engineer   │ aws        │        1235 │
│ Data Engineer   │ spark      │         860 │
│ Data Scientist  │ sql        │        1407 │
│ Data Scientist  │ python     │        1377 │
│ Data Scientist  │ r          │         838 │
│ Data Scientist  │ excel      │         798 │
│ Data Scientist  │ tableau    │         619 │
└─────────────────┴────────────┴─────────────┘
*/