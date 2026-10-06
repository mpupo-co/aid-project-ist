DROP DATABASE IF EXISTS DevelopmentDB;
CREATE DATABASE DevelopmentDB;
USE DevelopmentDB;

CREATE TABLE maddison_indicators (
  country_iso3   CHAR(3)       NOT NULL,
  country_name   VARCHAR(50)   NOT NULL,
  indicator_code VARCHAR(10)   NOT NULL,
  indicator_name VARCHAR(100)  NOT NULL,
  year           INT          NOT NULL,
  value          DECIMAL(24,6) NOT NULL,
  loaded_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (country_iso3, indicator_code, year)
);

CREATE TABLE wdi_indicators (
  country_iso3   CHAR(3)       NOT NULL,
  country_name   VARCHAR(50)   NOT NULL,
  indicator_code VARCHAR(30)   NOT NULL,
  indicator_name VARCHAR(100)  NOT NULL,
  year           INT          NOT NULL,
  value          DECIMAL(24,6) NOT NULL,
  loaded_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (country_iso3, indicator_code, year)
);

CREATE TABLE historical_events (
  event_id        INT AUTO_INCREMENT PRIMARY KEY,
  year            INT          NOT NULL,
  country_iso3    CHAR(3)      NOT NULL,
  country_name    VARCHAR(50)  NOT NULL,
  event           VARCHAR(255) NOT NULL,
  category        VARCHAR(50)  NOT NULL,
  economic_impact VARCHAR(100) NOT NULL,
  loaded_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);