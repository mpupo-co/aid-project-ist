# Maddison Indicators — Data Dictionary

## Dataset Overview

| Property                   | Description                                                                        |
| -------------------------- | ---------------------------------------------------------------------------------- |
| **Dataset**                | Maddison Project Database 2023                                                     |
| **File**                   | `maddison_indicators.csv`                                                          |
| **Purpose**                | Historical measures of GDP, GDP per capita, and population for European countries. |
| **Rows**                   | 4 349                                                                              |
| **Entities**               | 15 countries                                                                       |
| **Indicators**             | 3                                                                                  |
| **Year span**              | 1900–2022                                                                          |
| **Geographic scope**       | 15 European countries; no `EUU` aggregate                                          |
| **Grain**                  | Country × indicator × year                                                         |
| **Missing values**         | None                                                                               |
| **Duplicate observations** | None at country × indicator × year grain                                           |

## Column Dictionary

| Column           | Type            | Description                                                              | Unit / Values         |
| ---------------- | --------------- | ------------------------------------------------------------------------ | --------------------- |
| `maddison_id`    | `INT`           | Surrogate identifier automatically generated for each staging record. It is the primary key of the staging table and was created for database management purposes. | Ordinal Number |
| `country_iso3`   | `VARCHAR(3)`    | ISO 3166-1 alpha-3 identifier of the country.                            | ISO3 code             |
| `country_name`   | `VARCHAR(15)`   | Country name corresponding to `country_iso3`.                            | Text                  |
| `indicator_code` | `VARCHAR(5)`    | Identifier of the Maddison economic/demographic measure.                 | `GDP`, `GDPPC`, `POP` |
| `indicator_name` | `TEXT`          | Descriptive name of the indicator.                                       | Text                  |
| `year`           | `INT`           | Observation year.                                                        | Calendar year         |
| `value`          | `DECIMAL(20,4)` | Numerical value of the corresponding indicator for the country and year. | Indicator-dependent   |

## Indicators and Units

| Code    | Indicator      | Unit                                  |
| ------- | -------------- | ------------------------------------- |
| `GDP`   | GDP            | 2011 international dollars            |
| `GDPPC` | GDP per capita | 2011 international dollars per capita |
| `POP`   | Population     | Thousands of persons                  |

## Geographic and Temporal Coverage

Coverage is not uniform across countries.

| Country | First Year | Last Year | Years | Coverage      |
| ------- | ---------: | --------: | ----: | ------------- |
| BEL     |       1900 |      2022 |   123 | Complete      |
| CZE     |       1970 |      2022 |    53 | Late start    |
| DEU     |       1900 |      2022 |   123 | Complete      |
| ESP     |       1900 |      2022 |   123 | Complete      |
| EST     |       1973 |      2022 |    44 | Late start    |
| FRA     |       1900 |      2022 |   123 | Complete      |
| GRC     |       1900 |      2022 |   123 | Complete      |
| HUN     |       1900 |      2022 |   100 | Internal gaps |
| IRL     |       1913 |      2022 |   103 | Late start    |
| ITA     |       1900 |      2022 |   123 | Complete      |
| LTU     |       1973 |      2022 |    44 | Late start    |
| LVA     |       1973 |      2022 |    44 | Late start    |
| POL     |       1900 |      2022 |    89 | Internal gaps |
| PRT     |       1900 |      2022 |   123 | Complete      |
| ROU     |       1900 |      2022 |   123 | Complete      |

Eight countries — **BEL, DEU, ESP, FRA, GRC, ITA, PRT and ROU** — have continuous coverage from 1900 to 2022.

## Relevant Particularities

* The dataset is in **long format**, meaning GDP, GDP per capita and population are represented as separate observations identified by indicator_code, rather than as separate columns.
* The analytical grain is `country_iso3 + indicator_code + year`.
* `maddison_id` was generated in the staging table, is a technical surrogate key and is not the analytical grain.
* Coverage is substantially longer for Western European countries than for several Central/Eastern European and Baltic countries.
* Hungary and Poland contain internal temporal gaps.
* `EUU` is not present in the Maddison dataset.
* All three indicators use the same country × year structure, with no missing values in the supplied file.
