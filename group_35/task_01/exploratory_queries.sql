USE DevelopmentStg;

-- Table 1: maddison_indicators

SELECT COUNT(*) AS total_rows
FROM maddison_indicators;

SELECT DISTINCT country_iso3, country_name 
FROM maddison_indicators 
ORDER BY country_iso3;

SELECT MIN(year) AS first_year, 
	MAX(year) AS last_year, 
	COUNT(DISTINCT year) AS number_of_years 
FROM maddison_indicators;

SELECT DISTINCT country_iso3, country_name 
FROM maddison_indicators; 

-- Year coverage by country
SELECT country_iso3, 
	country_name, 
    MIN(year) AS first_year, 
    MAX(year) AS last_year, 
    COUNT(DISTINCT year) AS number_of_years 
FROM maddison_indicators 
GROUP BY country_iso3, country_name 
ORDER BY country_iso3;

-- Missing values
SELECT
    country_iso3,
    country_name,
    indicator_code,
    indicator_name,
    COUNT(*) AS total_rows,
    SUM(value IS NULL) AS missing_values
FROM maddison_indicators
GROUP BY
    country_iso3,
    country_name,
    indicator_code,
    indicator_name
ORDER BY
    country_iso3,
    indicator_code;
    
-- Check for invalide negative values
SELECT * FROM maddison_indicators 
WHERE value < 0;

-- check for duplicate observations
SELECT
    country_iso3,
    indicator_code,
    year,
    COUNT(*) AS duplicate_count
FROM maddison_indicators
GROUP BY
    country_iso3,
    indicator_code,
    year
HAVING COUNT(*) > 1;