DROP DATABASE IF EXISTS DevelopmentStg;
CREATE DATABASE DevelopmentStg;
USE DevelopmentStg;

CREATE TABLE maddison_indicators (
    maddison_id     INT         	NOT NULL AUTO_INCREMENT,
    country_iso3    VARCHAR(3)  	NULL,
    country_name    VARCHAR(15) 	NULL,
    indicator_code  VARCHAR(5)  	NULL,
    indicator_name  TEXT        	NULL,   
    year            INT         	NULL,
    value           DECIMAL(20,4)   NULL,
    PRIMARY KEY (maddison_id)  
);

CREATE TABLE wdi_indicators (
    wdi_id          INT         	NOT NULL AUTO_INCREMENT,
    country_iso3    VARCHAR(3)    	NULL,
    country_name    VARCHAR(15)   	NULL,
    indicator_code  VARCHAR(30)   	NULL,
    indicator_name  TEXT        	NULL,
    year            INT         	NULL,
    value           DECIMAL(20,4)   NULL,
    PRIMARY KEY (wdi_id)
);

CREATE TABLE historical_events (
    event_id        INT         NOT NULL AUTO_INCREMENT,
    year            INT         NULL,
    country_iso3    VARCHAR(3)  NULL,
    country_name    VARCHAR(15) NULL,
    event           TEXT        NULL,
    category        VARCHAR(50) NULL,
    economic_impact TEXT   		NULL,
    PRIMARY KEY (event_id)
);
