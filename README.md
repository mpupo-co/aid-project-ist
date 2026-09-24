# aid-project @ IST 2026/27

Master's Project for the course **Data Analysis and Integration (AID)**  
Instituto Superior Técnico – MSc in Computer Science and Engineering  
Academic Year: 2026/2027

## Overview

This project consists in **building an analytical data warehouse** to investigate Portugal's Economic and Human Development: A Century of Transformation.
The challenge is to **integrate two international datasets and an historical events** dataset into a coherent star schema and use OLAP technologies to analyze how economic growth, structural transformation and wellbeing evolved through the last century.
The source datasets encode the observation and/or estimates of economic and societal indicators per year for distinct countries.

The data sources are:
- [Maddison Project Database 2023](/project_data_sources_2627/maddison_indicators.csv): historical reconstruction from 1900 to 2022 of long-run GDP per capita, GDP and population
- [World Bank World Development Indicators (WDI)](/project_data_sources_2627/wdi_indicators.csv): modern economic, structural and social indicators (GDP growth, GNI per capita, sector value added, employment by sector, life expectancy, urbanization, trade)
- [Historical Events Dataset](/project_data_sources_2627/historical_events.csv): with 387 major economic, political, infrastructure and social events for Portugal and the comparison countries (1900-2025)
