# TASK 1 - Staging Database and Profile Data

## 1. Overview

Exploratory SQL profiling was performed on the three source datasets used for the data warehouse: the Historical Events dataset, the World Development Indicators (WDI), and the Maddison Project Database. The profiling focused on row counts, geographic coverage, temporal coverage, indicator availability, missing values, and potential data-integrity issues.

The results show that the three sources have complementary temporal and geographic characteristics. The Maddison dataset provides long-run historical economic indicators from 1900 to 2022, the WDI dataset provides more recent and broader socioeconomic indicators from 1960 to 2025, and the Historical Events dataset provides selected historical events associated with the countries and periods covered by the project.

## 2. Historical Events

The Historical Events dataset contains **387 records covering 16 entities and 110 distinct years between 1900 and 2025**. The geographic coverage comprises 15 European countries and the European Union.

The number of events varies considerably between entities. Portugal has **125 event records**, substantially more than the other entities, while the remaining entities contain between 5 and 22 records.

Temporal coverage is also uneven. Most entities have events between 1900 and 2020, while Portugal contains events through 2025. The European Union has a narrower range, from 1957 to 2007. Portugal has 125 events distributed across 88 distinct years, demonstrating that multiple events may occur in the same year.

No missing ISO3 codes, entity names, years, or event descriptions were detected. The principal limitation is therefore not missing data fields but the selective nature of event coverage. 

## 3. World Development Indicators

The WDI dataset contains **11 371 observations, 16 entities, and 17 indicators**. The geographic coverage includes the same 15 European countries as the Maddison dataset plus the European Union.

The overall WDI temporal span is **1960–2025**, but individual indicators have different periods of availability. Exports and imports cover 1960–2025, while GDP growth begins in 1961 and GNI per capita in 1962. The three employment indicators begin considerably later, in 1991. Life expectancy covers 1960–2024, while urban population covers 1960–2025.

The indicator-level row counts demonstrate that the nominal year range does not imply complete coverage. For example, exports and imports contain 757 observations each, compared with 1,056 observations that would result from a complete 16-entity × 66-year panel. Agriculture value added contains 547 observations, while GDP growth contains 860 observations over 65 years.

In contrast, the employment indicators each contain 560 observations, corresponding to complete coverage across the 16 entities for 1991–2025. Life expectancy contains 1 040 observations, corresponding to complete 1960–2024 coverage, and urban population contains 1 056 observations, corresponding to complete 1960–2025 coverage.

No missing values were found in the loaded `value` field or in the main identifying fields. The profiling also identified 120 negative GDP-growth observations. These were treated as valid observations because negative annual GDP growth represents economic contraction and is not inherently a data-integrity problem.

## 4. Maddison Project Database

The Maddison dataset contains **4 349 observations covering 15 countries and three indicators: GDP, GDP per capita, and population**. Its temporal span is **1900–2022**, providing the longest historical coverage of the three sources.

All three indicators have an overall span of 1900–2022. However, coverage differs substantially by country. Belgium, Germany, Spain, France, Greece, Italy, and Portugal have 123 distinct years, while Czechia begins in 1970 and Estonia, Lithuania, and Latvia begin in 1973. Ireland begins in 1913, Hungary contains 100 distinct years, and Poland contains 89 distinct years.

Romania has a nominal 1900–2022 span but contains 335 observations rather than the 369 observations expected from complete coverage of three indicators across 123 years.

No missing values were identified in the main fields or indicator values. The main data limitation is therefore uneven country-year availability.

## 5. Cross-source comparison

The three datasets provide different types of information and temporal coverage:

| Source            |   Rows | Entities | Indicators / event type          | Overall period |
| ----------------- | -----: | -------: | -------------------------------- | -------------- |
| Historical Events |    387 |       16 | Historical events                | 1900–2025      |
| WDI               | 11 371 |       16 | 17 socioeconomic indicators      | 1960–2025      |
| Maddison          |  4 349 |       15 | 3 historical economic indicators | 1900–2022      |

The datasets overlap geographically for the 15 European countries, while WDI and Historical Events additionally contain the European Union entity. Maddison provides the earliest historical coverage, while WDI provides the largest number of contemporary socioeconomic indicators and extends to 2025.

The different temporal structures should be considered when integrating the datasets into the analytical warehouse. In particular, the absence of an observation in a particular year. 

## 6. Data quality assessment

The exploratory SQL checks found no missing values in the principal identifying and measurement fields of the three datasets. This indicates that the loaded staging data is structurally complete with respect to NULL values.

However, the profiling also demonstrates that **absence of NULL values does not mean complete temporal coverage**. Several indicators and countries have gaps within their broader first-to-last-year ranges. 

