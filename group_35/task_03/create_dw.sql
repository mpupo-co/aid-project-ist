DROP DATABASE IF EXISTS DevelopmentDW;
CREATE DATABASE DevelopmentDW;
USE DevelopmentDW;

-- 1. DIMENSION TABLES

CREATE TABLE DIM_COUNTRY (
    country_key   INT AUTO_INCREMENT,
    iso3_code     CHAR(3)     NOT NULL,
    country_name  VARCHAR(50) NOT NULL,
    country_group VARCHAR(30) NOT NULL,
    PRIMARY KEY (country_key),
    UNIQUE (iso3_code)
);

CREATE TABLE DIM_TIME (
    time_key INT AUTO_INCREMENT,
    year     INT NOT NULL,
    decade   INT NOT NULL,
    PRIMARY KEY (time_key),
    UNIQUE (year)
);

CREATE TABLE DIM_SECTOR (
    sector_key   INT AUTO_INCREMENT,
    sector_name  VARCHAR(50) NOT NULL,
    broad_sector VARCHAR(20) NOT NULL,
    PRIMARY KEY (sector_key),
    UNIQUE (sector_name)
);

-- 2. FACT TABLES

-- 2.1 FACT_ECONOMY: one row per country per year
CREATE TABLE FACT_ECONOMY (
    country_key     INT,
    time_key        INT,
    gdp_per_capita  DECIMAL(24,6),
    gdp             DECIMAL(24,6),
    gdp_growth_pct  DECIMAL(24,6),
    exports_pct_gdp DECIMAL(24,6),
    imports_pct_gdp DECIMAL(24,6),
    PRIMARY KEY (country_key, time_key),
    FOREIGN KEY (country_key) REFERENCES DIM_COUNTRY (country_key),
    FOREIGN KEY (time_key)    REFERENCES DIM_TIME (time_key)
);

-- 2.2 FACT_SOCIETY: one row per country per year
CREATE TABLE FACT_SOCIETY (
    country_key     INT,
    time_key        INT,
    population      DECIMAL(24,6),
    gni_per_capita  DECIMAL(24,6),
    life_expectancy DECIMAL(24,6),
    urban_pop_pct   DECIMAL(24,6),
    PRIMARY KEY (country_key, time_key),
    FOREIGN KEY (country_key) REFERENCES DIM_COUNTRY (country_key),
    FOREIGN KEY (time_key)    REFERENCES DIM_TIME (time_key)
);

-- 2.3 FACT_SECTOR: one row per country per year per sector
CREATE TABLE FACT_SECTOR (
    country_key         INT,
    time_key            INT,
    sector_key          INT,
    value_added_pct_gdp DECIMAL(24,6),
    value_added_usd     DECIMAL(24,6),
    employment_pct      DECIMAL(24,6),   
    PRIMARY KEY (country_key, time_key, sector_key),
    FOREIGN KEY (country_key) REFERENCES DIM_COUNTRY (country_key),
    FOREIGN KEY (time_key)    REFERENCES DIM_TIME (time_key),
    FOREIGN KEY (sector_key)  REFERENCES DIM_SECTOR (sector_key)
);

-- 3. HISTORICAL EVENTS: bridge between DIM_COUNTRY and DIM_TIME

CREATE TABLE BRIDGE_EVENT (
    event_key       INT AUTO_INCREMENT,
    country_key     INT          NOT NULL,
    time_key        INT          NOT NULL,
    event_id		INT			 NOT NULL,
    event           VARCHAR(255) NOT NULL,
    category        VARCHAR(50)  NOT NULL,
    economic_impact VARCHAR(100) NOT NULL,
    PRIMARY KEY (event_key),
    UNIQUE (event_id),
    FOREIGN KEY (country_key) REFERENCES DIM_COUNTRY (country_key),
    FOREIGN KEY (time_key)    REFERENCES DIM_TIME (time_key)
);