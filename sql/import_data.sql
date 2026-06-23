USE JobMarketAnalytics;
GO

BULK INSERT candidates
FROM 'E:\Job_Market_Analytics\data\candidates.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

BULK INSERT skills
FROM 'E:\Job_Market_Analytics\data\skills.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

BULK INSERT salary_offers
FROM 'E:\Job_Market_Analytics\data\salary_offers.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

BULK INSERT hiring_process
FROM 'E:\Job_Market_Analytics\data\hiring_process.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);