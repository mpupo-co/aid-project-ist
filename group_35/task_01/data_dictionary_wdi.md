# World Development Indicators — Data Dictionary

## Dataset Overview

| Property                   | Description                                                                                 |
| -------------------------- | ------------------------------------------------------------------------------------------- |
| **Dataset**                | World Bank World Development Indicators                                                     |
| **File**                   | `wdi_indicators.csv`                                                                        |
| **Purpose**                | Provides contemporary economic, structural, demographic, and social-development indicators. |
| **Rows**                   | 11 371                                                                                      |
| **Entities**               | 16                                                                                          |
| **Indicators**             | 17                                                                                          |
| **Overall year span**      | 1960–2025                                                                                   |
| **Geographic scope**       | 15 European countries + European Union (`EUU`)                                              |
| **Grain**                  | Country × indicator × year                                                                  |
| **Missing values**         | None                                                                                        |
| **Duplicate observations** | None at  country × indicator × year grain                                                   |

## Column Dictionary

| Column           | Type          | Description                                                | Unit / Values       |
| ---------------- | ------------- | ---------------------------------------------------------- | ------------------- |
| `wdi_id`         | `INT`         | Surrogate identifier automatically generated for each staging record. It is the primary key of the staging table and was created for database management purposes. | Ordinal Number |
| `country_iso3`   | `VARCHAR(3)`  | ISO 3166-1 alpha-3 identifier of the country or aggregate. | ISO3 code           |
| `country_name`   | `VARCHAR(15)` | Country/entity name corresponding to `country_iso3`.       | Text                |
| `indicator_code` | `VARCHAR(20)` | World Bank identifier for the WDI indicator.               | WDI code            |
| `indicator_name` | `TEXT`        | Human-readable WDI indicator name.                         | Text                |
| `year`           | `INT`         | Observation year.                                          | Calendar year       |
| `value`          | `DECIMAL`     | Numerical value of the indicator for the entity and year.  | Indicator-dependent |

## Indicators and Units

| Indicator Code      | Indicator                                      | Unit                   |
| ------------------- | ---------------------------------------------- | ---------------------- |
| `NE.EXP.GNFS.ZS`    | Exports of goods and services                  | % of GDP               |
| `NE.IMP.GNFS.ZS`    | Imports of goods and services                  | % of GDP               |
| `NV.AGR.TOTL.CD`    | Agriculture, forestry and fishing, value added | Current US$            |
| `NV.AGR.TOTL.ZS`    | Agriculture, forestry and fishing, value added | % of GDP               |
| `NV.IND.MANF.CD`    | Manufacturing, value added                     | Current US$            |
| `NV.IND.MANF.ZS`    | Manufacturing, value added                     | % of GDP               |
| `NV.IND.TOTL.CD`    | Industry, including construction, value added  | Current US$            |
| `NV.IND.TOTL.ZS`    | Industry, including construction, value added  | % of GDP               |
| `NV.SRV.TOTL.CD`    | Services, value added                          | Current US$            |
| `NV.SRV.TOTL.ZS`    | Services, value added                          | % of GDP               |
| `NY.GDP.MKTP.KD.ZG` | GDP growth                                     | Annual %               |
| `NY.GNP.PCAP.CD`    | GNI per capita, Atlas method                   | Current US$ per capita |
| `SL.AGR.EMPL.ZS`    | Employment in agriculture                      | % of total employment  |
| `SL.IND.EMPL.ZS`    | Employment in industry                         | % of total employment  |
| `SL.SRV.EMPL.ZS`    | Employment in services                         | % of total employment  |
| `SP.DYN.LE00.IN`    | Life expectancy at birth                       | Years                  |
| `SP.URB.TOTL.IN.ZS` | Urban population                               | % of total population  |

Employment indicators are based on **modeled ILO estimates**, as specified in the indicator definitions.

## Indicator-Level Temporal Coverage

| Indicator group      | First Year | Last Year | Main coverage characteristic                                                      |
| -------------------- | ---------: | --------: | --------------------------------------------------------------------------------- |
| Exports / Imports    |       1960 |      2025 | Longest economic coverage, but country-specific starts vary                       |
| Sectoral value added |       1960 |      2025 | Large country differences in starting years                                       |
| GDP growth           |       1961 |      2025 | Earlier coverage for Western Europe; later for several Eastern European countries |
| GNI per capita       |       1962 |      2025 | Later starts for several Central/Eastern European countries                       |
| Employment by sector |       1991 |      2025 | Consistently shorter historical coverage                                          |
| Life expectancy      |       1960 |      2024 | Latest year is 2024 rather than 2025                                              |
| Urban population     |       1960 |      2025 | Broadest and most consistent coverage                                             |

The indicator-level first and last years represent the **overall range across the 16 entities**, not necessarily the coverage of every country.

## Geographic Coverage and Gaps

Country-level coverage varies considerably by indicator.

Relevant patterns include:

* **Life expectancy**: 1960–2024 for all 16 entities.
* **Urban population**: 1960–2025 for all 16 entities.
* **Employment indicators**: 1991–2025 for all 16 entities.
* **Exports/imports** range from 1960 for France and Greece to 1995 for Lithuania, Latvia and Poland.
* **Sectoral value added** generally begins in the 1990s for many countries, although France has coverage from 1960.
* **GDP growth** starts in 1961 for several Western European countries, while several Central/Eastern European and Baltic entities begin in 1991.
* **GNI per capita** starts in 1962 for several Western European countries but later for some Eastern European and Baltic countries.
* Romania has a specific sectoral gap: agriculture, industry and services begin in 1990, while manufacturing begins in 1991.
* For the European Union (`EUU`), agriculture value added starts in 1995, while manufacturing, total industry and services start in 1991.

## Relevant Particularities

* The dataset is in **long format**.
* The analytical grain is `country_iso3 + indicator_code + year`.
* There are **17 indicators with different temporal coverage**.
* The dataset is therefore **not a complete 16 × 17 × 66 panel**.
* `EUU` is an aggregate entity and should be distinguished analytically from individual countries.
