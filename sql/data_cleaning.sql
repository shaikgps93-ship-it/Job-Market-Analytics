USE JobMarketAnalytics;
GO

/* =========================
   DATA CLEANING
========================= */

-- Check for NULL values in candidates table
SELECT *
FROM candidates
WHERE country IS NULL
   OR education_level IS NULL
   OR major IS NULL;


-- Check duplicate candidate IDs
SELECT candidate_id,
       COUNT(*) AS duplicate_count
FROM candidates
GROUP BY candidate_id
HAVING COUNT(*) > 1;


-- Remove duplicate records (if any)
WITH DuplicateRows AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY candidate_id
               ORDER BY candidate_id
           ) AS rn
    FROM candidates
)
DELETE FROM DuplicateRows
WHERE rn > 1;


-- Standardize text values
UPDATE candidates
SET country = TRIM(country),
    city = TRIM(city),
    education_level = TRIM(education_level),
    major = TRIM(major);


-- Replace NULL experience values with 0
UPDATE candidates
SET years_experience = 0
WHERE years_experience IS NULL;


-- Validate salary values
SELECT *
FROM salary_offers
WHERE offered_salary_usd <= 0
   OR expected_salary_usd <= 0;


-- Validate score ranges
SELECT *
FROM hiring_process
WHERE technical_score NOT BETWEEN 0 AND 100
   OR interview_score NOT BETWEEN 0 AND 100
   OR coding_test_score NOT BETWEEN 0 AND 100;


-- Verify row counts
SELECT COUNT(*) AS candidate_count
FROM candidates;

SELECT COUNT(*) AS skills_count
FROM skills;

SELECT COUNT(*) AS salary_count
FROM salary_offers;

SELECT COUNT(*) AS hiring_count
FROM hiring_process;