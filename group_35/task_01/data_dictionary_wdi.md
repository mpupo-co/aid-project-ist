# Data Dictionary — World Development Indicators

## 1. Dataset Overview

| Attribute                 | Description                                                                                                                                                                 |
| ------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Source**                | World Development Indicators (World Bank)                                                                                                                                   |
| **Staging table**         | `wdi_indicators`                                                                                                                                                            |
| **Purpose**               | Provides modern economic, social and sectoral indicators used to analyse Portugal's economic and human development and to complement the long-run historical Maddison data. |
| **Observation grain**     | One observation per country, indicator and year                                                                                                                             |
| **Geographic unit**       | Country/entity identified by ISO3 code                                                                                                                                      |
| **Temporal unit**         | Year                                                                                                                                                                        |
| **Main indicators**       | GDP growth, exports, imports, GNI per capita, life expectancy, urban population, sector value added and sector employment                                                   |
| **Data format**           | Long format                                                                                                                                                                 |
| **Role in the warehouse** | Source for `FACT_ECONOMY`, `FACT_SOCIETY` and `FACT_SECTOR`                                                                                                                 |

The dataset is stored in **long format**, meaning that the different economic, social and sectoral indicators are represented as separate observations identified by `indicator_code`, rather than as separate columns.

---

## 2. Column Dictionary

| Column           | Data Type       | Nullable | Description                                                                                                                                                                    |
| ---------------- | --------------- | -------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `wdi_id`         | `INT`           |       No | Surrogate identifier automatically generated for each staging record. It is the primary key of the staging table and was created for database management purposes.             |
| `country_iso3`   | `VARCHAR(3)`    |      Yes | Three-letter ISO3 code identifying the country or geographical entity associated with the observation. Used as the common geographical identifier across the project datasets. |
| `country_name`   | `VARCHAR(15)`   |      Yes | Name of the country or geographical entity associated with the observation.                                                                                                    |
| `indicator_code` | `VARCHAR(20)`   |      Yes | World Bank code identifying the indicator represented by the observation. It distinguishes the different economic, social and sectoral measures.                               |
| `indicator_name` | `TEXT`          |      Yes | Descriptive name of the indicator associated with the observation.                                                                                                             |
| `year`           | `INT`           |      Yes | Calendar year to which the observation refers.                                                                                                                                 |
| `value`          | `DECIMAL(20,4)` |      Yes | Numerical value of the indicator for the specified country and year. Its unit and interpretation depend on the associated indicator.                                           |

> **Note:** The data types shown above correspond to the staging schema designed for this project. They are database storage decisions and do not necessarily represent the original data types used by the World Bank.

---

## 3. Indicators and Units

The `value` column contains different types of measures. Its unit and interpretation must therefore be considered together with `indicator_code` or `indicator_name`.

| Indicator Code      | Indicator                                                      | Unit                   |
| ------------------- | -------------------------------------------------------------- | ---------------------- |
| `NE.EXP.GNFS.ZS`    | Exports of goods and services                                  | % of GDP               |
| `NE.IMP.GNFS.ZS`    | Imports of goods and services                                  | % of GDP               |
| `NV.AGR.TOTL.CD`    | Agriculture, forestry, and fishing, value added                | Current US$            |
| `NV.AGR.TOTL.ZS`    | Agriculture, forestry, and fishing, value added                | % of GDP               |
| `NV.IND.MANF.CD`    | Manufacturing, value added                                     | Current US$            |
| `NV.IND.MANF.ZS`    | Manufacturing, value added                                     | % of GDP               |
| `NV.IND.TOTL.CD`    | Industry (including construction)                              | Current US$            |
| `NV.IND.TOTL.ZS`    | Industry (including construction)                              | % of GDP               |
| `NV.SRV.TOTL.CD`    | Services, value added                                          | Current US$            |
| `NV.SRV.TOTL.ZS`    | Services, value added                                          | % of GDP               |
| `NY.GDP.MKTP.KD.ZG` | GDP growth                                                     | Annual %               |
| `NY.GNP.PCAP.CD`    | GNI per capita, Atlas method                                   | Current US$ per capita |
| `SL.AGR.EMPL.ZS`    | Employment in agriculture                                      | % of total employment  |
| `SL.IND.EMPL.ZS`    | Employment in industry                                         | % of total employment  |
| `SL.SRV.EMPL.ZS`    | Employment in services                                         | % of total employment  |
| `SP.DYN.LE00.IN`    | Life expectancy at birth                                       | Years                  |
| `SP.URB.TOTL.IN.ZS` | Urban population                                               | % of total population  |

The indicators can be grouped into three analytical areas:

| Analytical Area | Indicators                                                                                                      |
| --------------- | --------------------------------------------------------------------------------------------------------------- |
| **Economic**    | GDP growth, exports of goods and services, imports of goods and services, GNI per capita                        |
| **Society**     | Life expectancy at birth, urban population                                                                      |
| **Sectoral**    | Agriculture, industry, manufacturing and services value added; employment in agriculture, industry and services |


---

## 4. Data Volume


| Measure                 |                      Result |
| ----------------------- | --------------------------: |
| **Total observations**  | 11371 |
| **Distinct countries**  | 16 |
| **Distinct indicators** | 17 |
| **Year range**          |1960 - 2025 |


---

## 5. Geographic Coverage

The dataset uses ISO3 codes to identify geographical entities. The countries and aggregate included in the project are:

| Country Group              | Countries                                                                                                       |
| -------------------------- | --------------------------------------------------------------------------------------------------------------- |
| **Focus country**          | Portugal (`PRT`)                                                                                                |
| **Western Europe**         | Spain (`ESP`), France (`FRA`), Germany (`DEU`), Belgium (`BEL`), Italy (`ITA`), Ireland (`IRL`), Greece (`GRC`) |
| **Central/Eastern Europe** | Poland (`POL`), Czechia (`CZE`), Hungary (`HUN`), Romania (`ROU`)                                               |
| **Post-Soviet**            | Estonia (`EST`), Latvia (`LVA`), Lithuania (`LTU`)                                                              |
| **EU aggregate**           | European Union (`EUU`)                                                                                          |

The loaded WDI dataset contains **16 geographical entities**, corresponding to the 15 countries in the project plus the **European Union aggregate (`EUU`)**.

The number of available indicators may differ between countries and entities because individual WDI indicators have different historical coverage.

---

## 6. Temporal Coverage

The WDI dataset has an overall temporal range of **1960–2025**, but individual indicators have different starting and ending years.

### Coverage patterns

The WDI indicators can be divided into several temporal coverage groups:

* **Indicators beginning in 1960:** Exports, imports, all sectoral value-added indicators, life expectancy and urban population.
* **GDP growth:** begins in **1961** and extends through **2025**.
* **GNI per capita:** begins in **1962** and extends through **2025**.
* **Employment indicators:** begin in **1991** and extend through **2025**.
* **Life expectancy:** extends only to **2024**, while all other indicators extend to **2025**.
* **Sectoral value-added indicators:** although their overall indicator-level range starts in 1960, the country-level results show that several countries only have observations from the **1990s onwards**.

The country-level results demonstrate that temporal coverage varies substantially between countries and indicators. For example:

* Belgium has trade indicators from **1970**, while its sectoral value-added indicators begin in **1995**.
* Czechia has trade indicators from **1990**, while its sectoral value-added indicators begin in **1993**.
* Estonia has trade indicators from **1993**, while its sectoral value-added indicators begin in **1995**.
* Germany has sectoral value-added indicators from **1991**.
* Employment indicators begin in **1991** for the countries/entities shown in the profiling results.

Therefore, the WDI dataset should not be treated as a uniform 1960–2025 panel. Temporal comparisons must consider the coverage of the specific indicator and country being analysed.

### Coverage summary

| Coverage characteristic                    | Finding   |
| ------------------------------------------ | --------- |
| **Overall dataset span**                   | 1960–2025 |
| **Number of countries/entities**           | 16        |
| **Number of indicators**                   | 17        |
| **Earliest indicator start**               | 1960      |
| **Latest indicator start**                 | 1991      |
| **Latest common year for most indicators** | 2025      |
| **Life expectancy latest year**            | 2024      |
| **Employment indicators start**            | 1991      |
| **GDP growth starts**                      | 1961      |
| **GNI per capita starts**                  | 1962      |

> **Note:** The `number_of_years` reported for each indicator represents the number of distinct years containing observations somewhere in the dataset. It does not imply that every country has observations for every year in that range.

---

## 7. Missing Values

No missing values.

---

## 8. Data Integrity

The natural grain of the source data is:

> **One country × one indicator × one year**

The dataset is valid since it does not contain multiple observations for the same  `country × indicator × year`.
