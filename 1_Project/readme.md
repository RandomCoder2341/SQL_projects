# Philippine Data Job Market Project (SQL)

An exploratory data analysis project examining the hiring demand, compensation trends, and most valuable technical skills for **Data Analysts**, **Data Engineers**, and **Data Scientists** in the Philippines.

## **Project Overview**
This project uses SQL to query a comprehensive database of job postings to answer key career-planning questions:
1. Which data roles have the highest hiring volume and best average salaries?
2. What are the top demanded skills for each role?
3. Which skills provide the best return on investment (balancing high demand with high pay)?

## **Problem and Context**
The Philippine data market is growing rapidly, but job seekers and career switchers often struggle to navigate conflicting advice about which skills to learn. While global market trends emphasize certain cloud tools or programming languages, local hiring requirements in the Philippines differ based on regional business priorities.

This project analyzes local job market data to address three critical gaps for aspiring data professionals:
* **Role Clarity:** Determining which career path offers the highest concentration of open positions versus the best compensation.
* **Skill Prioritization:** Identifying whether foundational tools (like Excel and SQL) or advanced technologies (like Spark and Azure) dominate local job listings.
* **Return on Investment (ROI):** Highlighting the "optimal" skills that balance strong job security (posting volume) with above-average salaries.

## **SQL Skills Demonstrated**

This project applies core database querying and analytical techniques to extract business insights from relational data:

* **Multi-Table Joins (`JOIN`):** Connected core transaction data (`job_postings_fact`) with skill mapping dimensions (`skills_job_dim` and `skills_dim`) to analyze skill demand per role.
* **Data Aggregation & Filtering:** Used `COUNT()`, `ROUND()`, and `AVG()` alongside `GROUP BY` and `WHERE` clauses to summarize salaries and demand while filtering out `NULL` compensation records.
* **Advanced Filtering with `HAVING`:** Applied threshold filters (`COUNT(job_id) > 10`) on aggregated groups to remove statistical noise and isolate meaningful skill trends.
* **Window Functions (`ROW_NUMBER()`):** Implemented `ROW_NUMBER() OVER (PARTITION BY ... ORDER BY ...)` inside Common Table Expressions to calculate top-N ranked skills per job category.
* **Common Table Expressions (`WITH` CTEs):** Structured modular queries to break down multi-step logic into readable, maintainable execution blocks.