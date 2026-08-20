/*
Question: What are the most popular data roles in the Philippines and how do their average salaries compare?
- Filter job_postings_fact for jobs located in the Philippines.
- Focus specifically on the core roles: Data Analyst, Data Engineer, and Data Scientist.
- Aggregate job posting counts and average annual salaries per role.
- Why? Identifies which data roles have the highest hiring demand and best financial yield in the Philippine market, 
  helping professionals choose a career track based on volume vs. pay.
*/
Select 
    job_title_short,
    count(job_id) AS job_postings,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM
    job_postings_fact
Where
    job_country ='Philippines'
AND 
    job_title_short IN ('Data Engineer','Data Scientist','Data Analyst')
GROUP BY
    job_title_short
ORDER BY
    job_postings desc;

/*
Here's the breakdown of the most popular data roles in the Philippines:
Data Analyst dominates total hiring demand with 10,203 postings—more than double the volume of Data Engineers.
Data Engineer commands the highest average compensation ($89,224.60), outearning both Data Scientists and Data Analysts.
Data Scientist represents a highly specialized path with the lowest job volume (3,432 postings) and an average salary of $83,936.11.

Key takeaways:
- Data Analyst is the primary entry point into the Philippine data market due to high volume.
- Data Engineering offers the highest financial return on investment among core data roles locally.
- Higher volume roles tend to show lower baseline starting compensation compared to infrastructure-heavy engineering roles.

┌─────────────────┬──────────────┬────────────┐
│ job_title_short │ job_postings │ avg_salary │
│     varchar     │    int64     │   double   │
├─────────────────┼──────────────┼────────────┤
│ Data Analyst    │        10203 │   68473.26 │
│ Data Engineer   │         4595 │    89224.6 │
│ Data Scientist  │         3432 │   83936.11 │
└─────────────────┴──────────────┴────────────┘
*/


