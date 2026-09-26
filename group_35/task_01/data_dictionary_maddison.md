# Data Dictionary — Maddison Project Database 2023

## 1. Dataset Overview

| Attribute                    | Description                                                                                                    |
| ---------------------------- | -------------------------------------------------------------------------------------------------------------- |
| **Source**                   | Maddison Project Database 2023                                                                                 |
| **Staging table**            | `maddison_indicators`                                                                                      |
| **Purpose**                  | Provides historical estimates of economic output and population used to analyse long-run economic development. |
| **Observation grain**        | One observation per country, indicator and year                                                                |
| **Geographic unit**          | Country/entity identified by ISO3 code                                                                         |
| **Temporal unit**            | Year                                                                                                           |
| **Main indicators**          | GDP, GDP per capita (GDPPC) AND population (POP)                                                                             |
| **Expected source coverage** | 1900–2022                                                                                                      |
| **Data format**              | Long format                                                                                                    |
| **Role in the warehouse**    | Source for `FACT_ECONOMY` and `FACT_SOCIETY`                                                                   |

The dataset is stored in **long format**, meaning that GDP, GDP per capita and population are represented as separate observations identified by `indicator_code`, rather than as separate columns.

---

## 2. Column Dictionary

| Column           | Data Type       | Nullable | Description                                                                                                                                                                                                        |
| ---------------- | --------------- | -------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `maddison_id`    | `INT`           |       No | Surrogate identifier automatically generated for each staging record. It is the primary key of the staging table and was created for database management purposes. |
| `country_iso3`   | `VARCHAR(3)`    |      Yes | Three-letter ISO3 code identifying the country or geographical entity associated with the observation. Used as the common geographical identifier across the project datasets.                                     |
| `country_name`   | `VARCHAR(15)`   |      Yes | Name of the country or geographical entity associated with the observation.                                                                                                                                        |
| `indicator_code` | `VARCHAR(5)`    |      Yes | Code identifying the indicator represented by the observation. It distinguishes GDP, GDP per capita and population.                                                                                                |
| `indicator_name` | `TEXT`          |      Yes | Descriptive name of the indicator associated with the observation.                                                                                                                                                 |
| `year`           | `INT`           |      Yes | Calendar year to which the observation refers.                                                                                                                                                                     |
| `value`          | `DECIMAL(20,4)` |      Yes | Numerical value of the indicator for the specified country and year. Its unit and interpretation depend on the associated indicator.                                                                               |

> **Note:** The data types shown above correspond to the staging schema designed for this project. They are database storage decisions and do not necessarily represent the original data types used by the Maddison Project Database.

---

## 3. Indicators and Units

The `value` column contains different types of measures. Its unit must therefore be interpreted together with `indicator_code` or `indicator_name`.

| Indicator          | Unit                             |
| ------------------ | ---------------------------------|
| **GDP**            | 2011$ (real GDP)                 |
| **GDP per capita** | 2011$ per capita                 |
| **Population**     | Population, mid-year (thousands) |

---

## 4. Data Volume

The following statistics should be recorded from the profiling of the loaded staging table.

| Measure                     | Result |
| --------------------------- | --------: |
| Total observations          | 4349 |
| Distinct countries          | 15 |
| Distinct indicators         | 3 |
| Year range                  | 1900 - 2022|
| umber of years (coverage)   | 123 |

The dataset is expected the overall coverage extending from  **1900 to 2022**. Actual coverage may differ between countries and indicators.

---

## 5. Geographic Coverage

The dataset uses ISO3 codes to identify geographical entities. The countries on dataset are:

| Country Group              | Countries                                                                                                       |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| **Focus country**          | Portugal (`PRT`)                                                                                                |
| **Western Europe**         | Spain (`ESP`), France (`FRA`), Germany (`DEU`), Belgium (`BEL`), Italy (`ITA`), Ireland (`IRL`), Greece (`GRC`) |
| **Central/Eastern Europe** | Poland (`POL`), Czechia (`CZE`), Hungary (`HUN`), Romania (`ROU`)                                               |
| **Post-Soviet**            | Estonia (`EST`), Latvia (`LVA`), Lithuania (`LTU`)                                                              |


The **EU aggregate (`EUU`) does not have Maddison GDP or population observations** for this project - it does not appear on the source dataset. 

---

## 6. Temporal Coverage

The Maddison dataset covers the period **1900–2022**, but the available historical series differ across countries. Therefore, the dataset does not provide a complete 1900–2022 time series for every country.

The country-level coverage identified in the loaded dataset is:

| Country   | ISO3 | First Year | Last Year | Number of Years |
| --------- | ---- | ---------: | --------: | --------------: |
| Belgium   | BEL  |       1900 |      2022 |             123 |
| Czechia   | CZE  |       1970 |      2022 |              53 |
| Germany   | DEU  |       1900 |      2022 |             123 |
| Spain     | ESP  |       1900 |      2022 |             123 |
| Estonia   | EST  |       1973 |      2022 |              44 |
| France    | FRA  |       1900 |      2022 |             123 |
| Greece    | GRC  |       1900 |      2022 |             123 |
| Hungary   | HUN  |       1900 |      2022 |             100 |
| Ireland   | IRL  |       1913 |      2022 |             103 |
| Italy     | ITA  |       1900 |      2022 |             123 |
| Lithuania | LTU  |       1973 |      2022 |              44 |
| Latvia    | LVA  |       1973 |      2022 |              44 |
| Poland    | POL  |       1900 |      2022 |              89 |
| Portugal  | PRT  |       1900 |      2022 |             123 |
| Romania   | ROU  |       1900 |      2022 |             123 |

### Coverage patterns

The historical coverage can be divided into several groups:

* **Complete coverage from 1900 to 2022:** Belgium, Germany, Spain, France, Greece, Italy, Portugal and Romania, with **123 annual observations**.
* **Coverage beginning in the early twentieth century:** Ireland begins in **1913**.
* **Coverage beginning in 1900 but with gaps:** Hungary and Poland both start in **1900** but contain fewer than 123 observations, indicating that their series are not continuous across the entire period.
* **Later historical coverage:** Czechia begins in **1970**, while Estonia, Latvia and Lithuania begin in **1973**.


### Coverage summary

| Coverage characteristic                                                    | Finding                                |
| -------------------------------------------------------------------------- | -------------------------------------- |
| Overall dataset span                                                       | 1900–2022                              |
| Common final year                                                          | 2022                                   |
| Countries with 1900–2022 and 123 observations                              | 8                                      |
| Earliest starting year                                                     | 1900                                   |
| Latest starting year                                                       | 1973                                   |
| Country with latest start                                                  | Estonia, Latvia and Lithuania          |
| Country with earliest start after 1900                                     | Ireland, 1913                          |
| Countries with internal gaps indicated by fewer observations than the span | Hungary and Poland                     |
| Countries with later starting periods                                      | Czechia, Estonia, Latvia and Lithuania |

> **Note:** `number_of_years` represents the number of distinct years with observations. It should not be interpreted as proof that the series is continuous.

---

## 7. Missing Values

No missing values.

---

## 8. Data Integrity

The natural grain of the source data is:

> **One country × one indicator × one year**

Therefore, observations should be unique at this combination of attributes.

The `maddison_id` primary key uniquely identifies rows in the staging table, but it does **not** represent the analytical grain of the source data.

The dataset is valid since it does not contain multiple observations for the same  `country × indicator × year`