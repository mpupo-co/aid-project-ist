-- AID Project
-- Task 1
CREATE DATABASE IF NOT EXISTS aid_db; 
USE aid_db;

DROP TABLE IF EXISTS maddison_indicators;
CREATE TABLE maddison_indicators (
	country_iso3 	CHAR(3) 		NOT NULL,
    country_name    VARCHAR(50)     NOT NULL,
    indicator_code  VARCHAR(10)     NOT NULL,   -- gdp | gdppc | pop
    indicator_name  VARCHAR(60)     NOT NULL,
    year            SMALLINT        NOT NULL,
    value           DECIMAL(20,4)   NOT NULL,
    UNIQUE KEY uq_maddison (country_iso3, indicator_code, year)
);

DROP TABLE IF EXISTS wdi_indicators;
CREATE TABLE wdi_indicators (
	country_iso3 	CHAR(3) 		NOT NULL,
    country_name    VARCHAR(50)     NOT NULL,
    indicator_code  VARCHAR(20)		NOT NULL, 
    indicator_name  VARCHAR(100)	NOT NULL,
    year 			SMALLINT		NOT NULL,
    value			DECIMAL(22,6)	NOT NULL,
    UNIQUE KEY uq_wdi(country_iso3, indicator_code, year)
);

DROP TABLE IF EXISTS staging_events;
CREATE TABLE staging_events (
	event_id	INT AUTO_INCREMENT PRIMARY KEY,
    year             SMALLINT      NOT NULL,
    country_iso3     CHAR(3)       NOT NULL,
    country_name     VARCHAR(50)   NOT NULL,
    event            VARCHAR(255)  NOT NULL,
    category         VARCHAR(60),
    economic_impact  VARCHAR(60)
);