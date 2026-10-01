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

-- Table 3: historical_events

SELECT COUNT(*) AS total_rows
FROM historical_events;

-- range and number of years
SELECT MIN(year) AS first_year,
       MAX(year) AS last_year,
       COUNT(DISTINCT year) AS number_of_years
FROM historical_events;

-- Events and year coverage by country
SELECT country_iso3,
       country_name,
       COUNT(*) AS n_events,
       COUNT(DISTINCT year) AS distinct_years,
       MIN(year) AS first_year,
       MAX(year) AS last_year
FROM historical_events
GROUP BY country_iso3, country_name
ORDER BY n_events DESC;

-- distinct countries in historical_events
SELECT DISTINCT country_iso3, country_name
FROM historical_events
ORDER BY country_iso3;

-- number of events per country
SELECT country_iso3, COUNT(*) AS n_events
FROM historical_events 
GROUP BY country_iso3
ORDER BY n_events DESC;

-- number of events per category
SELECT category, COUNT(*) AS n_events
FROM historical_events
GROUP BY category
ORDER BY n_events DESC;

-- country-years with more than one event
SELECT country_iso3, year, COUNT(*) AS n_events
FROM historical_events
GROUP BY country_iso3, year
HAVING COUNT(*) > 1
ORDER BY n_events DESC, year;

-- number of distinct economic_impact
SELECT COUNT(DISTINCT economic_impact) AS distinct_economic_impact
FROM historical_events;

-- Exact duplicates (country, year, event).
SELECT country_iso3, year, event, COUNT(*) AS duplicate_count
FROM historical_events
GROUP BY country_iso3, year, event
HAVING COUNT(*) > 1;

-- Check null columns
SELECT event_id
FROM historical_events
WHERE event IS NULL
OR category IS NULL
OR economic_impact IS NULL
OR country_name IS NULL
OR country_iso3 IS NULL
OR year IS NULL;

-- Events in years outside the range of Maddison (1900-2022) — relevant for DIM_TIME
SELECT country_iso3, year, event
FROM historical_events
WHERE year > (SELECT MAX(year) FROM maddison_indicators)
   OR year < (SELECT MIN(year) FROM maddison_indicators);
   
-- Events per decade
SELECT FLOOR(year / 10) * 10 AS decade, COUNT(*) AS n_events
FROM historical_events
GROUP BY decade
ORDER BY decade;