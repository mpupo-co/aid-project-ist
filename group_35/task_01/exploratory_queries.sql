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

-- Table 2: wdi_indicators

SELECT DISTINCT indicator_code, indicator_name
FROM wdi_indicators;

SELECT COUNT(*) AS total_observations
FROM wdi_indicators;

SELECT COUNT(DISTINCT indicator_code) AS distinct_indicators
FROM wdi_indicators;

SELECT
    MIN(year) AS first_year,
    MAX(year) AS last_year,
    COUNT(DISTINCT year) AS number_of_years
FROM wdi_indicators;

-- Number of indicators available per country
SELECT DISTINCT
    country_iso3,
    country_name
FROM wdi_indicators
ORDER BY country_iso3;

SELECT
    country_iso3,
    country_name,
    COUNT(DISTINCT indicator_code) AS number_of_indicators
FROM wdi_indicators
GROUP BY
    country_iso3,
    country_name
ORDER BY country_iso3;

-- Year coverage of each indicator
SELECT
    indicator_code,
    indicator_name,
    MIN(year) AS first_year,
    MAX(year) AS last_year,
    COUNT(DISTINCT country_iso3) AS number_of_countries,
    COUNT(DISTINCT year) AS number_of_years,
    COUNT(*) AS number_of_observations
FROM wdi_indicators
GROUP BY
    indicator_code,
    indicator_name
ORDER BY indicator_code;

-- Year coverage by country and indicator
SELECT
    country_iso3,
    country_name,
    indicator_code,
    indicator_name,
    MIN(year) AS first_year,
    MAX(year) AS last_year,
    COUNT(DISTINCT year) AS number_of_years
FROM wdi_indicators
GROUP BY
    country_iso3,
    country_name,
    indicator_code,
    indicator_name
ORDER BY
    country_iso3,
    indicator_code;

-- Earliest and latest year by indicator
SELECT
    indicator_code,
    indicator_name,
    MIN(year) AS first_year,
    MAX(year) AS last_year
FROM wdi_indicators
GROUP BY
    indicator_code,
    indicator_name
ORDER BY
    first_year,
    indicator_code;

SELECT COUNT(*) AS missing_country_codes
FROM wdi_indicators
WHERE country_iso3 IS NULL;

-- Check duplicates
SELECT
    country_iso3,
    indicator_code,
    year,
    COUNT(*) AS duplicate_count
FROM wdi_indicators
GROUP BY
    country_iso3,
    indicator_code,
    year
HAVING COUNT(*) > 1;

