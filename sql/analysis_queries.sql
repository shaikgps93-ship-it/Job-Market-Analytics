USE JobMarketAnalytics;
GO

/* =========================
   CANDIDATE ANALYSIS
========================= */

SELECT COUNT_BIG(*) AS total_candidates
FROM candidates;

SELECT country,
       COUNT(*) AS total_candidates
FROM candidates
GROUP BY country
ORDER BY total_candidates DESC;

SELECT education_level,
       AVG(CAST(years_experience AS FLOAT)) AS avg_experience
FROM candidates
GROUP BY education_level
ORDER BY avg_experience DESC;

SELECT major,
       COUNT(*) AS total_candidates
FROM candidates
GROUP BY major
ORDER BY total_candidates DESC;


/* =========================
   SKILLS ANALYSIS
========================= */

SELECT ai_specialization,
       COUNT(*) AS total_candidates
FROM skills
GROUP BY ai_specialization
ORDER BY total_candidates DESC;

SELECT primary_language,
       COUNT(*) AS total_candidates
FROM skills
GROUP BY primary_language
ORDER BY total_candidates DESC;

SELECT ml_framework,
       COUNT(*) AS total_candidates
FROM skills
GROUP BY ml_framework
ORDER BY total_candidates DESC;


/* =========================
   SALARY ANALYSIS
========================= */

SELECT AVG(CAST(offered_salary_usd AS FLOAT)) AS avg_salary
FROM salary_offers;

SELECT company_industry,
       AVG(CAST(offered_salary_usd AS FLOAT)) AS avg_salary
FROM salary_offers
GROUP BY company_industry
ORDER BY avg_salary DESC;


/* =========================
   HIRING ANALYSIS
========================= */

SELECT hired,
       COUNT(*) AS total_candidates
FROM hiring_process
GROUP BY hired;

SELECT AVG(CAST(technical_score AS FLOAT)) AS avg_technical_score
FROM hiring_process;


/* =========================
   MASTER JOIN QUERY
========================= */

SELECT TOP 100
    candidates.candidate_id,
    candidates.country,
    candidates.city,
    candidates.education_level,
    candidates.major,
    candidates.years_experience,
    skills.ai_specialization,
    skills.primary_language,
    salary_offers.company_industry,
    salary_offers.offered_salary_usd,
    hiring_process.technical_score,
    hiring_process.interview_score,
    hiring_process.hired
FROM candidates
INNER JOIN skills
    ON candidates.candidate_id = skills.candidate_id
INNER JOIN salary_offers
    ON candidates.candidate_id = salary_offers.candidate_id
INNER JOIN hiring_process
    ON candidates.candidate_id = hiring_process.candidate_id;
