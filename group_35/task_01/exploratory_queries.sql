-- =============================================================================
-- Task 1: Exploratory Data Profiling Queries
-- Database: DevelopmentDB
-- Target Tables: maddison_indicators, wdi_indicators, historical_events
-- =============================================================================

USE DevelopmentDB;

-- -----------------------------------------------------------------------------
-- SECTION 1: OVERVIEW & ROW COUNT VERIFICATION
-- Verify total volume loaded per staging table against source file benchmarks.
-- -----------------------------------------------------------------------------
SELECT 'maddison_indicators' AS table_name, COUNT(*) AS total_rows FROM maddison_indicators
UNION ALL
SELECT 'wdi_indicators'      AS table_name, COUNT(*) AS total_rows FROM wdi_indicators
UNION ALL
SELECT 'historical_events'  AS table_name, COUNT(*) AS total_rows FROM historical_events;


-- -----------------------------------------------------------------------------
-- SECTION 2: GEOGRAPHIC COVERAGE & ENTITY BREAKDOWN
-- Inspect distinct country codes and names per staging table to identify coverage.
-- -----------------------------------------------------------------------------

-- 2.1 Distinct entities in Maddison (15 countries)
SELECT 
    country_iso3, 
    country_name, 
    COUNT(*) AS total_observations,
    MIN(year) AS min_year,
    MAX(year) AS max_year,
    COUNT(DISTINCT year) AS distinct_years
FROM maddison_indicators
GROUP BY country_iso3, country_name
ORDER BY country_name;

-- 2.2 Distinct entities in WDI (15 countries + EUU European Union aggregate)
SELECT 
    country_iso3, 
    country_name, 
    COUNT(*) AS total_observations,
    MIN(year) AS min_year,
    MAX(year) AS max_year,
    COUNT(DISTINCT year) AS distinct_years
FROM wdi_indicators
GROUP BY country_iso3, country_name
ORDER BY country_name;

-- 2.3 Distinct entities in Historical Events (16 entities, Portugal focus)
SELECT 
    country_iso3, 
    country_name, 
    COUNT(*) AS total_events,
    MIN(year) AS min_year,
    MAX(year) AS max_year,
    COUNT(DISTINCT year) AS distinct_years
FROM historical_events
GROUP BY country_iso3, country_name
ORDER BY total_events DESC;


-- -----------------------------------------------------------------------------
-- SECTION 3: TEMPORAL COVERAGE & YEAR SPANS
-- Profile overall year ranges, distinct year counts, and indicator availability.
-- -----------------------------------------------------------------------------

-- 3.1 Overall temporal span per table
SELECT 
    'maddison_indicators' AS table_name,
    MIN(year) AS start_year,
    MAX(year) AS end_year,
    MAX(year) - MIN(year) + 1 AS nominal_span_years,
    COUNT(DISTINCT year) AS actual_distinct_years
FROM maddison_indicators
UNION ALL
SELECT 
    'wdi_indicators' AS table_name,
    MIN(year) AS start_year,
    MAX(year) AS end_year,
    MAX(year) - MIN(year) + 1 AS nominal_span_years,
    COUNT(DISTINCT year) AS actual_distinct_years
FROM wdi_indicators
UNION ALL
SELECT 
    'historical_events' AS table_name,
    MIN(year) AS start_year,
    MAX(year) AS end_year,
    MAX(year) - MIN(year) + 1 AS nominal_span_years,
    COUNT(DISTINCT year) AS actual_distinct_years
FROM historical_events;

-- 3.2 WDI temporal coverage by indicator group (detecting 1960 vs 1991 start years)
SELECT 
    indicator_code,
    indicator_name,
    MIN(year) AS min_year,
    MAX(year) AS max_year,
    COUNT(DISTINCT year) AS distinct_years,
    COUNT(*) AS total_rows,
    COUNT(DISTINCT country_iso3) AS covered_entities
FROM wdi_indicators
GROUP BY indicator_code, indicator_name
ORDER BY min_year, indicator_code;


-- -----------------------------------------------------------------------------
-- SECTION 4: DATA QUALITY, NULL & MISSING VALUE CHECKS
-- Verify that all mandatory identifying and measurement columns are complete.
-- -----------------------------------------------------------------------------

-- 4.1 Null check for Maddison staging
SELECT 
    SUM(CASE WHEN country_iso3 IS NULL THEN 1 ELSE 0 END) AS null_iso3,
    SUM(CASE WHEN country_name IS NULL THEN 1 ELSE 0 END) AS null_name,
    SUM(CASE WHEN indicator_code IS NULL THEN 1 ELSE 0 END) AS null_indicator_code,
    SUM(CASE WHEN year IS NULL THEN 1 ELSE 0 END) AS null_year,
    SUM(CASE WHEN value IS NULL THEN 1 ELSE 0 END) AS null_value
FROM maddison_indicators;

-- 4.2 Null check for WDI staging
SELECT 
    SUM(CASE WHEN country_iso3 IS NULL THEN 1 ELSE 0 END) AS null_iso3,
    SUM(CASE WHEN country_name IS NULL THEN 1 ELSE 0 END) AS null_name,
    SUM(CASE WHEN indicator_code IS NULL THEN 1 ELSE 0 END) AS null_indicator_code,
    SUM(CASE WHEN year IS NULL THEN 1 ELSE 0 END) AS null_year,
    SUM(CASE WHEN value IS NULL THEN 1 ELSE 0 END) AS null_value
FROM wdi_indicators;

-- 4.3 Null check for Historical Events staging
SELECT 
    SUM(CASE WHEN country_iso3 IS NULL THEN 1 ELSE 0 END) AS null_iso3,
    SUM(CASE WHEN country_name IS NULL THEN 1 ELSE 0 END) AS null_name,
    SUM(CASE WHEN year IS NULL THEN 1 ELSE 0 END) AS null_year,
    SUM(CASE WHEN event IS NULL OR TRIM(event) = '' THEN 1 ELSE 0 END) AS null_event
FROM historical_events;


-- -----------------------------------------------------------------------------
-- SECTION 5: PRIMARY KEY & UNIQUENESS INTEGRITY CHECKS
-- Verify primary key assumptions and detect multi-event occurrences.
-- -----------------------------------------------------------------------------

-- 5.1 Check Maddison composite key (country_iso3, indicator_code, year)
SELECT country_iso3, indicator_code, year, COUNT(*) AS duplicate_count
FROM maddison_indicators
GROUP BY country_iso3, indicator_code, year
HAVING COUNT(*) > 1;

-- 5.2 Check WDI composite key (country_iso3, indicator_code, year)
SELECT country_iso3, indicator_code, year, COUNT(*) AS duplicate_count
FROM wdi_indicators
GROUP BY country_iso3, indicator_code, year
HAVING COUNT(*) > 1;

-- 5.3 Profile multi-event years in Historical Events (validates AUTO_INCREMENT PK)
SELECT country_iso3, country_name, year, COUNT(*) AS events_in_year
FROM historical_events
GROUP BY country_iso3, country_name, year
HAVING COUNT(*) > 1
ORDER BY events_in_year DESC, year;


-- -----------------------------------------------------------------------------
-- SECTION 6: VALUE RANGE & ANOMALY ANALYSIS
-- Check for negative values, extreme outliers, and benchmark aggregate behavior.
-- -----------------------------------------------------------------------------

-- 6.1 Identify negative GDP growth observations in WDI (valid economic contractions)
SELECT country_iso3, country_name, year, value AS gdp_growth_pct
FROM wdi_indicators
WHERE indicator_code = 'NY.GDP.MKTP.KD.ZG' AND value < 0
ORDER BY value ASC;

-- 6.2 Value summary statistics (MIN/MAX/AVG per indicator)
SELECT 
    indicator_code,
    indicator_name,
    ROUND(MIN(value), 4) AS min_val,
    ROUND(MAX(value), 4) AS max_val,
    ROUND(AVG(value), 4) AS avg_val
FROM wdi_indicators
GROUP BY indicator_code, indicator_name
ORDER BY indicator_code;

-- 6.3 Verify European Union aggregate (EUU) indicator coverage
SELECT indicator_code, indicator_name, COUNT(*) AS euu_rows, MIN(year) AS min_yr, MAX(year) AS max_yr
FROM wdi_indicators
WHERE country_iso3 = 'EUU'
GROUP BY indicator_code, indicator_name
ORDER BY indicator_code;