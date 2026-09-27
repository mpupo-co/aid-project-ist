# World Development Indicators — Data Dictionary

## 1. Source overview

| Item                | Description                                                                         |
| ------------------- | ----------------------------------------------------------------------------------- |
| Source table        | `wdi_indicators`                                                                    |
| Total rows          | **11 371**                                                                          |
| Distinct entities   | **16**                                                                              |
| Distinct indicators | **17**                                                                              |
| Overall year span   | **1960–2025**                                                                       |
| Geographic coverage | 15 European countries + European Union (`EUU`)                                      |
| Unit of observation | Entity–indicator–year                                                               |
| Missing values      | No missing values detected in the loaded observations                               |
| Missing key fields  | No missing entity codes, names, indicator codes, indicator names, or years detected |

## 2. Columns

| Column           | Type        | Description                                |
| ---------------- | ----------- | ------------------------------------------ |
| `wdi_id`         | INT         | Unique identifier for each event record - Surrogate identifier automatically generated |
| `iso3`           | VARCHAR(3)  | ISO3/entity code                           |
| `name`           | VARCHAR(15) | Country or entity name                     |
| `indicator_code` | VARCHAR(20) | World Bank/WDI indicator code              |
| `indicator_name` | TEXT        | Indicator description                      |
| `year`           | INT         | Observation year                           |
| `value`          | DECIMAL     | Numerical value of the indicator           |

## 3. Indicators and units

| Indicator           | Unit                                                       |
| ------------------- | ---------------------------------------------------------- |
| `NE.EXP.GNFS.ZS`    | Exports of goods and services, % of GDP                    |
| `NE.IMP.GNFS.ZS`    | Imports of goods and services, % of GDP                    |
| `NV.AGR.TOTL.CD`    | Agriculture, forestry and fishing value added, current US$ |
| `NV.AGR.TOTL.ZS`    | Agriculture, forestry and fishing value added, % of GDP    |
| `NV.IND.MANF.CD`    | Manufacturing value added, current US$                     |
| `NV.IND.MANF.ZS`    | Manufacturing value added, % of GDP                        |
| `NV.IND.TOTL.CD`    | Industry including construction value added, current US$   |
| `NV.IND.TOTL.ZS`    | Industry including construction value added, % of GDP      |
| `NV.SRV.TOTL.CD`    | Services value added, current US$                          |
| `NV.SRV.TOTL.ZS`    | Services value added, % of GDP                             |
| `NY.GDP.MKTP.KD.ZG` | GDP growth, annual %                                       |
| `NY.GNP.PCAP.CD`    | GNI per capita, Atlas method, current US$                  |
| `SL.AGR.EMPL.ZS`    | Employment in agriculture, % of total employment           |
| `SL.IND.EMPL.ZS`    | Employment in industry, % of total employment              |
| `SL.SRV.EMPL.ZS`    | Employment in services, % of total employment              |
| `SP.DYN.LE00.IN`    | Life expectancy at birth, years                            |
| `SP.URB.TOTL.IN.ZS` | Urban population, % of total population                    |

## 4. Geographic coverage

The dataset contains **16 entities**:

Belgium, Czechia, Germany, Spain, Estonia, European Union, France, Greece, Hungary, Ireland, Italy, Lithuania, Latvia, Poland, Portugal, and Romania.

All **17 indicators cover all 16 entities** at least once.

The `EUU` entity represents the European Union and should be distinguished from the 15 individual countries.

## 5. Overall temporal coverage

The WDI dataset covers **1960–2025**, with 66 distinct years overall.

However, temporal coverage differs by indicator:

| Indicator group           | First year | Last year | Distinct years |  Rows |
| ------------------------- | ---------: | --------: | -------------: | ----: |
| Exports                   |       1960 |      2025 |             66 |   757 |
| Imports                   |       1960 |      2025 |             66 |   757 |
| Agriculture value added   |       1960 |      2025 |             66 |   547 |
| Manufacturing value added |       1960 |      2025 |             66 |   550 |
| Industry value added      |       1960 |      2025 |             66 |   551 |
| Services value added      |       1960 |      2025 |             66 |   551 |
| GDP growth                |       1961 |      2025 |             65 |   860 |
| GNI per capita            |       1962 |      2025 |             64 |   823 |
| Agriculture employment    |       1991 |      2025 |             35 |   560 |
| Industry employment       |       1991 |      2025 |             35 |   560 |
| Services employment       |       1991 |      2025 |             35 |   560 |
| Life expectancy           |       1960 |      2024 |             65 | 1 040 |
| Urban population          |       1960 |      2025 |             66 | 1 056 |

The value-added indicators have the same nominal 1960–2025 span but contain substantially fewer observations than a complete 16-country × 66-year series. This indicates gaps in country-year coverage.

The three employment indicators have a much shorter common span, **1991–2025**.

Life expectancy ends in **2024**, one year earlier than other indicators.

## 6. Country-level coverage

All 16 entities have observations spanning **1960–2025**, but the number of observations differs:

| Entity         | Year span |  Rows |
| -------------- | --------: | ----: |
| Belgium        | 1960–2025 |   725 |
| Czechia        | 1960–2025 |   641 |
| Germany        | 1960–2025 |   757 |
| Spain          | 1960–2025 |   725 |
| Estonia        | 1960–2025 |   616 |
| European Union | 1960–2025 |   749 |
| France         | 1960–2025 | 1 025 |
| Greece         | 1960–2025 |   745 |
| Hungary        | 1960–2025 |   675 |
| Ireland        | 1960–2025 |   725 |
| Italy          | 1960–2025 |   765 |
| Lithuania      | 1960–2025 |   610 |
| Latvia         | 1960–2025 |   610 |
| Poland         | 1960–2025 |   615 |
| Portugal       | 1960–2025 |   725 |
| Romania        | 1960–2025 |   663 |

The common year range therefore should **not** be interpreted as complete coverage for every indicator and country.

## 7. Data quality and coverage gaps

No missing values were detected in the loaded `value` field, and no missing entity codes, names, indicator codes, indicator names, or years were detected.

However, the row counts reveal **coverage gaps** within several indicator series.

For example:

* exports/imports: 757 observations each versus 1 056 possible observations for a complete 16 × 66 series(entities/ coutries x nº of years);
* agriculture value added: 547 observations;
* manufacturing value added: 550 observations;
* GDP growth: 860 observations over 65 years;
* GNI per capita: 823 observations over 64 years.

The three employment indicators contain **560 observations each**, corresponding to complete 16 × 35 coverage over 1991–2025.

Life expectancy contains **1 040 observations**, corresponding to complete 16 × 65 coverage over 1960–2024.

Urban population contains **1,056 observations**, corresponding to complete 16 × 66 coverage over 1960–2025.

The dataset contains **120 negative GDP-growth observations**. These are valid values because negative annual GDP growth is economically possible and represents contraction.
