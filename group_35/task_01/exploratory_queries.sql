-- Task 1: exploratory queries on the staging database
USE DevelopmentDB;


-- 1. DISTINCT COUNTRIES PER SOURCE

-- 1.1 Countries in Maddison
SELECT country_iso3, country_name, COUNT(*) AS total_rows,
       MIN(year) AS first_year, MAX(year) AS last_year
FROM maddison_indicators
GROUP BY country_iso3, country_name
ORDER BY country_iso3;

-- 1.2 Countries in WDI
SELECT country_iso3, country_name, COUNT(*) AS total_rows,
       MIN(year) AS first_year, MAX(year) AS last_year
FROM wdi_indicators
GROUP BY country_iso3, country_name
ORDER BY country_iso3;

-- 1.3 Countries in the events
SELECT country_iso3, country_name, COUNT(*) AS total_events,
       MIN(year) AS first_year, MAX(year) AS last_year
FROM historical_events
GROUP BY country_iso3, country_name
ORDER BY total_events DESC;

-- 1.4 Countries missing from a source (expected: EUU is not in Maddison)
SELECT DISTINCT country_iso3 AS in_wdi_not_in_maddison
FROM wdi_indicators
WHERE country_iso3 NOT IN (SELECT country_iso3 FROM maddison_indicators);

SELECT DISTINCT country_iso3 AS in_events_not_in_maddison
FROM historical_events
WHERE country_iso3 NOT IN (SELECT country_iso3 FROM maddison_indicators);


-- 2. YEAR RANGES

-- 2.1 Rows, entities and year span per source
SELECT 'maddison_indicators' AS source, COUNT(*) AS total_rows,
       COUNT(DISTINCT country_iso3) AS entities,
       MIN(year) AS first_year, MAX(year) AS last_year
FROM maddison_indicators
UNION ALL
SELECT 'wdi_indicators', COUNT(*), COUNT(DISTINCT country_iso3), MIN(year), MAX(year)
FROM wdi_indicators
UNION ALL
SELECT 'historical_events', COUNT(*), COUNT(DISTINCT country_iso3), MIN(year), MAX(year)
FROM historical_events;

-- 2.2 Year range per Maddison indicator
SELECT indicator_code, COUNT(*) AS total_rows, COUNT(DISTINCT country_iso3) AS entities,
       MIN(year) AS first_year, MAX(year) AS last_year
FROM maddison_indicators
GROUP BY indicator_code;

-- 2.3 Year range per WDI indicator (shows the later start of sector and employment series)
SELECT indicator_code, indicator_name, COUNT(*) AS total_rows,
       COUNT(DISTINCT country_iso3) AS entities,
       MIN(year) AS first_year, MAX(year) AS last_year
FROM wdi_indicators
GROUP BY indicator_code, indicator_name
ORDER BY first_year, indicator_code;


-- 3. DATA INTEGRITY

-- 3.1 Rows loaded (expected: 4349, 11371 and 387, the same as the files)
SELECT 'maddison_indicators' AS table_name, COUNT(*) AS total_rows FROM maddison_indicators
UNION ALL
SELECT 'wdi_indicators', COUNT(*) FROM wdi_indicators
UNION ALL
SELECT 'historical_events', COUNT(*) FROM historical_events;

-- 3.2 Each ISO3 code has only one name across the sources (expected: no rows)
SELECT country_iso3, COUNT(DISTINCT country_name) AS names
FROM (SELECT country_iso3, country_name FROM maddison_indicators
      UNION
      SELECT country_iso3, country_name FROM wdi_indicators
      UNION
      SELECT country_iso3, country_name FROM historical_events) AS all_countries
GROUP BY country_iso3
HAVING COUNT(DISTINCT country_name) > 1;

-- 3.3 Each indicator code has only one name (expected: no rows)
SELECT indicator_code, COUNT(DISTINCT indicator_name) AS names
FROM (SELECT indicator_code, indicator_name FROM maddison_indicators
      UNION
      SELECT indicator_code, indicator_name FROM wdi_indicators) AS all_indicators
GROUP BY indicator_code
HAVING COUNT(DISTINCT indicator_name) > 1;

-- 3.4 The same event repeated (expected: no rows)
SELECT year, country_iso3, event, COUNT(*) AS repeated
FROM historical_events
GROUP BY year, country_iso3, event
HAVING COUNT(*) > 1;

-- 3.5 Categories of the events (expected: short category names only)
SELECT category, COUNT(*) AS total_events
FROM historical_events
GROUP BY category
ORDER BY category;

-- 3.6 Percentage indicators outside 0-100 (expected: no rows; only exports and imports can exceed 100)
SELECT * FROM wdi_indicators
WHERE indicator_code LIKE '%.ZS'
  AND indicator_code NOT IN ('NE.EXP.GNFS.ZS', 'NE.IMP.GNFS.ZS')
  AND (value < 0 OR value > 100);

-- 3.10 Maddison: gdp should equal gdppc * pop * 1000 (expected: no rows)
SELECT g.country_iso3, g.year, g.value AS gdp, c.value * p.value * 1000 AS gdppc_x_pop
FROM maddison_indicators g
JOIN maddison_indicators c ON c.country_iso3 = g.country_iso3 AND c.year = g.year
                          AND c.indicator_code = 'gdppc'
JOIN maddison_indicators p ON p.country_iso3 = g.country_iso3 AND p.year = g.year
                          AND p.indicator_code = 'pop'
WHERE g.indicator_code = 'gdp'
  AND ABS(g.value / (c.value * p.value * 1000) - 1) > 0.01;


-- 4. COVERAGE AND PARTICULARITIES (for the data dictionaries)

-- 4.1 Series with missing years between their first and last year
SELECT 'maddison' AS source, country_iso3, indicator_code, MIN(year) AS first_year,
       MAX(year) AS last_year, MAX(year) - MIN(year) + 1 - COUNT(*) AS missing_years
FROM maddison_indicators
GROUP BY country_iso3, indicator_code
HAVING MAX(year) - MIN(year) + 1 <> COUNT(*)
UNION ALL
SELECT 'wdi', country_iso3, indicator_code, MIN(year), MAX(year),
       MAX(year) - MIN(year) + 1 - COUNT(*)
FROM wdi_indicators
GROUP BY country_iso3, indicator_code
HAVING MAX(year) - MIN(year) + 1 <> COUNT(*);

-- 4.2 Maddison: years with gdppc but without gdp (explains why gdppc has more rows)
SELECT c.country_iso3, COUNT(*) AS years_without_gdp,
       MIN(c.year) AS first_year, MAX(c.year) AS last_year
FROM maddison_indicators c
LEFT JOIN maddison_indicators g ON g.country_iso3 = c.country_iso3 AND g.year = c.year
                               AND g.indicator_code = 'gdp'
WHERE c.indicator_code = 'gdppc' AND g.year IS NULL
GROUP BY c.country_iso3;

-- 4.3 WDI: first year of sector value added per country
SELECT country_iso3, MIN(year) AS first_year
FROM wdi_indicators
WHERE indicator_code LIKE 'NV.%'
GROUP BY country_iso3
ORDER BY first_year, country_iso3;

-- 4.4 WDI: first year of sector employment per country
SELECT country_iso3, MIN(year) AS first_year
FROM wdi_indicators
WHERE indicator_code LIKE 'SL.%'
GROUP BY country_iso3
ORDER BY first_year, country_iso3;

-- 4.5 Events: country-years with more than one event (why event_id is the primary key)
SELECT country_iso3, year, COUNT(*) AS events_in_year
FROM historical_events
GROUP BY country_iso3, year
HAVING COUNT(*) > 1
ORDER BY events_in_year DESC, country_iso3, year;