USE JobMarketAnalytics;
GO

/* =========================
   CANDIDATES TABLE
========================= */

CREATE TABLE candidates (
    candidate_id BIGINT PRIMARY KEY,
    full_name NVARCHAR(100),
    gender NVARCHAR(20),
    country NVARCHAR(50),
    city NVARCHAR(50),
    education_level NVARCHAR(50),
    major NVARCHAR(100),
    years_experience FLOAT,
    university_tier NVARCHAR(20)
);


/* =========================
   SKILLS TABLE
========================= */

CREATE TABLE skills (
    candidate_id BIGINT,
    ai_specialization NVARCHAR(100),
    primary_language NVARCHAR(50),
    ml_framework NVARCHAR(50),
    kaggle_score FLOAT,
    github_repositories INT,
    linkedin_connections INT,
    internship_count INT,

    FOREIGN KEY (candidate_id)
    REFERENCES candidates(candidate_id)
);


/* =========================
   SALARY OFFERS TABLE
========================= */

CREATE TABLE salary_offers (
    candidate_id BIGINT,
    company_industry NVARCHAR(100),
    company_rating FLOAT,
    offered_salary_usd FLOAT,
    expected_salary_usd FLOAT,
    offer_accepted BIT,

    FOREIGN KEY (candidate_id)
    REFERENCES candidates(candidate_id)
);


/* =========================
   HIRING PROCESS TABLE
========================= */

CREATE TABLE hiring_process (
    candidate_id BIGINT,
    technical_score FLOAT,
    interview_score FLOAT,
    coding_test_score FLOAT,
    hiring_rounds INT,
    hired BIT,

    FOREIGN KEY (candidate_id)
    REFERENCES candidates(candidate_id)
);;