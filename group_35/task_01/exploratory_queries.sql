/* ============================================================
   TASK 1 - Exploratory SQL / Data Profiling
   ============================================================ */

USE DevelopmentDB;

/* ============================================================
   1. HISTORICAL EVENTS
   ============================================================ */

-- Total number of rows
SELECT COUNT(*) AS total_rows
FROM historical_events;

-- List distinct countries
SELECT DISTINCT
    country_iso3,
    country_name
FROM historical_events
ORDER BY country_iso3;

-- Overall year range
SELECT
    MIN(year) AS first_year,
    MAX(year) AS last_year,
    COUNT(DISTINCT year) AS distinct_years
FROM historical_events;

-- Number of events by country
SELECT
    country_iso3,
    country_name,
    COUNT(*) AS event_count
FROM historical_events
GROUP BY country_iso3, country_name
ORDER BY country_iso3;

-- Year range by country
SELECT
    country_iso3,
    country_name,
    MIN(year) AS first_year,
    MAX(year) AS last_year,
    COUNT(DISTINCT year) AS distinct_years,
    COUNT(*) AS event_count
FROM historical_events
GROUP BY country_iso3, country_name
ORDER BY country_iso3;

-- Check for missing country codes
SELECT COUNT(*) AS missing_country_iso3
FROM historical_events
WHERE country_iso3 IS NULL OR TRIM(country_iso3) = '';

-- Check for missing country country_names
SELECT COUNT(*) AS missing_country_country_names
FROM historical_events
WHERE country_name IS NULL OR TRIM(country_name) = '';

-- Check for missing years
SELECT COUNT(*) AS missing_years
FROM historical_events
WHERE year IS NULL;

-- Check for missing event descriptions
SELECT COUNT(*) AS missing_events
FROM historical_events
WHERE event IS NULL OR TRIM(event) = '';

-- Check for invalid year values
SELECT *
FROM historical_events
WHERE year < 1 OR year > YEAR(CURDATE());

-- Check for duplicate event records
SELECT
    year,
    country_iso3,
    country_name,
    event,
    COUNT(*) AS duplicate_count
FROM historical_events
GROUP BY year, country_iso3, country_name, event
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

/* ============================================================
   2. WDI INDICATORS
   ============================================================ */

-- Total number of rows
SELECT COUNT(*) AS total_rows
FROM wdi_indicators;

-- List distinct countries
SELECT DISTINCT
    country_iso3,
    country_name
FROM wdi_indicators
ORDER BY country_iso3;

-- Number of distinct indicators
SELECT
    COUNT(DISTINCT indicator_code) AS distinct_indicators
FROM wdi_indicators;

-- List indicators
SELECT DISTINCT
    indicator_code,
    indicator_name
FROM wdi_indicators
ORDER BY indicator_code;

-- Overall year range
SELECT
    MIN(year) AS first_year,
    MAX(year) AS last_year,
    COUNT(DISTINCT year) AS distinct_years
FROM wdi_indicators;

-- Year range by indicator
SELECT
    indicator_code,
    indicator_name,
    MIN(year) AS first_year,
    MAX(year) AS last_year,
    COUNT(DISTINCT year) AS distinct_years,
    COUNT(*) AS row_count
FROM wdi_indicators
GROUP BY indicator_code, indicator_name
ORDER BY indicator_code;

-- Year range by country
SELECT
    country_iso3,
    country_name,
    MIN(year) AS first_year,
    MAX(year) AS last_year,
    COUNT(DISTINCT year) AS distinct_years,
    COUNT(*) AS row_count
FROM wdi_indicators
GROUP BY country_iso3, country_name
ORDER BY country_iso3;

-- Country coverage by indicator
SELECT
    indicator_code,
    indicator_name,
    COUNT(DISTINCT country_iso3) AS countries
FROM wdi_indicators
GROUP BY indicator_code, indicator_name
ORDER BY indicator_code;

-- Missing country codes
SELECT COUNT(*) AS missing_country_iso3
FROM wdi_indicators
WHERE country_iso3 IS NULL OR TRIM(country_iso3) = '';

-- Missing country country_names
SELECT COUNT(*) AS missing_country_names
FROM wdi_indicators
WHERE country_name IS NULL OR TRIM(country_name) = '';

-- Missing indicator codes
SELECT COUNT(*) AS missing_indicator_codes
FROM wdi_indicators
WHERE indicator_code IS NULL OR TRIM(indicator_code) = '';

-- Missing indicator country_names
SELECT COUNT(*) AS missing_indicator_names
FROM wdi_indicators
WHERE indicator_name IS NULL OR TRIM(indicator_name) = '';

-- Missing years
SELECT COUNT(*) AS missing_years
FROM wdi_indicators
WHERE year IS NULL;

-- Missing values
SELECT COUNT(*) AS missing_values
FROM wdi_indicators
WHERE value IS NULL;

-- Duplicate country-indicator-year combinations
SELECT
    country_iso3,
    indicator_code,
    year,
    COUNT(*) AS duplicate_count
FROM wdi_indicators
GROUP BY country_iso3, indicator_code, year
HAVING COUNT(*) > 1;

-- Invalid year values
SELECT *
FROM wdi_indicators
WHERE year < 1900 OR year > YEAR(CURDATE());

-- Negative values
SELECT
    indicator_code,
    indicator_name,
    COUNT(*) AS negative_values
FROM wdi_indicators
WHERE value < 0
GROUP BY indicator_code, indicator_name;

/* ============================================================
   3. MADDISON INDICATORS
   ============================================================ */

-- Total number of rows
SELECT COUNT(*) AS total_rows
FROM maddison_indicators;

-- Number of distinct countries
SELECT
    COUNT(DISTINCT country_iso3) AS distinct_countries
FROM maddison_indicators;

-- List distinct countries
SELECT DISTINCT
    country_iso3,
    country_name
FROM maddison_indicators;

-- List indicators
SELECT DISTINCT
    indicator_code,
    indicator_name
FROM maddison_indicators
ORDER BY indicator_code;

-- Overall year range
SELECT
    MIN(year) AS first_year,
    MAX(year) AS last_year,
    COUNT(DISTINCT year) AS distinct_years
FROM maddison_indicators;

-- Year range by indicator
SELECT
    indicator_code,
    indicator_name,
    MIN(year) AS first_year,
    MAX(year) AS last_year,
    COUNT(DISTINCT year) AS distinct_years,
    COUNT(*) AS row_count
FROM maddison_indicators
GROUP BY indicator_code, indicator_name
ORDER BY indicator_code;

-- Year range by country
SELECT
    country_iso3,
    country_name,
    MIN(year) AS first_year,
    MAX(year) AS last_year,
    COUNT(DISTINCT year) AS distinct_years,
    COUNT(*) AS row_count
FROM maddison_indicators
GROUP BY country_iso3, country_name
ORDER BY country_iso3;

-- Country coverage by indicator
SELECT
    indicator_code,
    indicator_name,
    COUNT(DISTINCT country_iso3) AS countries
FROM maddison_indicators
GROUP BY indicator_code, indicator_name
ORDER BY indicator_code;

-- Missing country codes
SELECT COUNT(*) AS missing_country_iso3
FROM maddison_indicators
WHERE country_iso3 IS NULL
   OR TRIM(country_iso3) = '';

-- Missing country country_names
SELECT COUNT(*) AS missing_country_names
FROM maddison_indicators
WHERE country_name IS NULL
   OR TRIM(country_name) = '';

-- Missing indicator codes
SELECT COUNT(*) AS missing_indicator_codes
FROM maddison_indicators
WHERE indicator_code IS NULL
   OR TRIM(indicator_code) = '';

-- Missing indicator country_names
SELECT COUNT(*) AS missing_indicator_ames
FROM maddison_indicators
WHERE indicator_name IS NULL
   OR TRIM(indicator_name) = '';

-- Missing years
SELECT COUNT(*) AS missing_years
FROM maddison_indicators
WHERE year IS NULL;

-- Missing values
SELECT COUNT(*) AS missing_values
FROM maddison_indicators
WHERE value IS NULL;

-- Duplicate country-indicator-year combinations
SELECT
    country_iso3,
    indicator_code,
    year,
    COUNT(*) AS duplicate_count
FROM maddison_indicators
GROUP BY country_iso3, indicator_code, year
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

-- Invalid year values
SELECT *
FROM maddison_indicators
WHERE year < 1900 OR year > YEAR(CURDATE());

-- Negative values
SELECT
    indicator_code,
    indicator_name,
    COUNT(*) AS negative_values
FROM maddison_indicators
WHERE value < 0
GROUP BY indicator_code, indicator_name
ORDER BY negative_values DESC;