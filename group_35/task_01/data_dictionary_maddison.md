# Maddison Project Database — Data Dictionary

## 1. Source overview

| Item                | Description                     |
| ------------------- | ------------------------------- |
| Source table        | `maddison_indicators`           |
| Total rows          | **4 349**                       |
| Distinct countries  | **15**                          |
| Distinct indicators | **3**                           |
| Overall year span   | **1900–2022**                   |
| Geographic coverage | 15 European countries           |
| Unit of observation | Country–indicator–year          |
| Missing values      | No missing values detected      |
| Source indicators   | GDP, GDP per capita, population |

## 2. Columns

| Column           | Type          | Description                            |
| ---------------- | ------------- | -------------------------------------- |
| `maddison_id`    | INT           | Unique identifier for each event record - Surrogate identifier automatically generated |
| `country_iso3`   | VARCHAR(3)    | ISO3 country code                      |
| `country_name`   | VARCHAR(15)   | Country name                           |
| `indicator_code` | VARCHAR(5)    | Maddison indicator identifier          |
| `indicator_name` | TEXT          | Indicator description                  |
| `year`           | INT           | Observation year                       |
| `value`          | DECIMAL(20,4) | Numerical value of the indicator       |

## 3. Indicators and units

| Indicator | Unit                                 |
| --------- | ------------------------------------ |
| `gdp`     | GDP, 2011 international $            |
| `gdppc`   | GDP per capita, 2011 international $ |
| `pop`     | Population, thousands                |

## 4. Geographic coverage

The dataset contains **15 countries**:

Belgium, Czechia, Germany, Spain, Estonia, France, Greece, Hungary, Ireland, Italy, Lithuania, Latvia, Poland, Portugal, and Romania.

Unlike the WDI and Historical Events datasets, the Maddison dataset does **not** contain the `EUU` European Union entity.

All three indicators cover all 15 countries at least once.

## 5. Overall temporal coverage

The dataset covers **1900–2022**, corresponding to 123 distinct years.

| Indicator      | First year | Last year | Distinct years |  Rows |
| -------------- | ---------: | --------: | -------------: | ----: |
| GDP            |       1900 |      2022 |            123 | 1 444 |
| GDP per capita |       1900 |      2022 |            123 | 1 461 |
| Population     |       1900 |      2022 |            123 | 1 444 |

Although all three indicators have the same overall temporal span, the row counts indicate some country-year gaps.

## 6. Country-level temporal coverage

| Country   | First year | Last year | Distinct years | Rows |
| --------- | ---------: | --------: | -------------: | ---: |
| Belgium   |       1900 |      2022 |            123 |  369 |
| Czechia   |       1970 |      2022 |             53 |  159 |
| Germany   |       1900 |      2022 |            123 |  369 |
| Spain     |       1900 |      2022 |            123 |  369 |
| Estonia   |       1973 |      2022 |             44 |  132 |
| France    |       1900 |      2022 |            123 |  369 |
| Greece    |       1900 |      2022 |            123 |  369 |
| Hungary   |       1900 |      2022 |            100 |  300 |
| Ireland   |       1913 |      2022 |            103 |  309 |
| Italy     |       1900 |      2022 |            123 |  369 |
| Lithuania |       1973 |      2022 |             44 |  132 |
| Latvia    |       1973 |      2022 |             44 |  132 |
| Poland    |       1900 |      2022 |             89 |  267 |
| Portugal  |       1900 |      2022 |            123 |  369 |
| Romania   |       1900 |      2022 |            123 |  335 |

The dataset provides a long historical perspective but with **uneven country coverage**.

Full 1900–2022 coverage is available for Belgium, Germany, Spain, France, Greece, Italy, Portugal, and the reported time span of Romania, although Romania has fewer observations than a complete 3-indicator × 123-year series.

Czechia begins in 1970; Estonia, Lithuania and Latvia begin in 1973; Ireland begins in 1913; Hungary has 100 distinct years; and Poland has 89 distinct years.

## 7. Data quality and coverage gaps

No missing country codes, country names, indicator codes, indicator names, years, or values were detected.

The main limitation is therefore **uneven historical coverage**, rather than explicit missing values.

For example, Romania has a 1900–2022 span but only **335 observations**, compared with 369 observations expected from a complete 123-year × 3-indicator series. This indicates missing country-indicator-year observations within the reported temporal span.

The Maddison dataset should consequently be interpreted as a historical reconstruction with **country-specific availability**, rather than assuming that every country has a continuous annual series from 1900 onward.
