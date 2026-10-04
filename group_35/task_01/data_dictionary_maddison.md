# Maddison Project Database — Data Dictionary

## 1. Source & Staging Overview
| Item | Description |
| :--- | :--- |
| **Staging Table Name** | `maddison_indicators` |
| **Target Database** | `DevelopmentDB` |
| **Purpose** | Stores annual macroeconomic indicators for the selected European countries.| 
| **Total Rows** | **4,349** |
| **Distinct Entities** | **15 European Countries** |
| **Distinct Indicators** | **3 Metrics** (`gdp`, `gdppc`, `pop`) |
| **Overall Year Span** | **1900–2022** (123 distinct years) |
| **Unit of Observation** | Country–Indicator–Year |
| **Primary Key** | Composite: `(country_iso3, indicator_code, year)` |
| **Audit Tracking** | `loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP` |

The Maddison dataset provides the longest historical coverage among the project's quantitative sources, beginning in 1900 for several countries and extending through 2022. However, coverage is not uniform across countries. Some countries have shorter historical series or internal gaps.

---

## 2. Table Schema & Column Specifications
| Column Name | MySQL Data Type | Key Type | Nullable | Description |
| :--- | :--- | :--- | :--- | :--- |
| `country_iso3` | `VARCHAR(3)` | **PK** | `NOT NULL` | Standard 3-letter ISO country code |
| `country_name` | `VARCHAR(50)` | — | `NOT NULL` | Full country name |
| `indicator_code` | `VARCHAR(50)` | **PK** | `NOT NULL` | Short metric identifier (`gdp`, `gdppc`, `pop`) |
| `indicator_name` | `VARCHAR(100)` | — | `NOT NULL` | Full descriptive title of the economic metric |
| `year` | `INT` | **PK** | `NOT NULL` | Observation year (1900–2022) |
| `value` | `DECIMAL(24,6)` | — | `NOT NULL` | Numerical value of the indicator |
| `loaded_at` | `TIMESTAMP` | — | `NOT NULL` | Ingestion audit timestamp (auto-populated by MySQL) |

---

## 3. Indicator Definitions & Units
| Indicator Code | Indicator Name | Unit of Measurement | Target Fact Table |
| :--- | :--- | :--- | :--- |
| `gdp` | Gross Domestic Product | Real 2011 International $ | `FACT_ECONOMY` |
| `gdppc` | Real GDP per capita | Real 2011 International $ per person | `FACT_ECONOMY` |
| `pop` | Total Population | Thousands of inhabitants | `FACT_SOCIETY` |

The following relationship was validated:
`GDP = GDP per capita × Population × 1000`

---

## 4. Geographic Coverage
The staging table covers **15 European countries**:
*   Belgium (`BEL`), Czechia (`CZE`), Germany (`DEU`), Spain (`ESP`), Estonia (`EST`), France (`FRA`), Greece (`GRC`), Hungary (`HUN`), Ireland (`IRL`), Italy (`ITA`), Lithuania (`LTU`), Latvia (`LVA`), Poland (`POL`), Portugal (`PRT`), and Romania (`ROU`).

*   *Note*: Unlike the WDI and Events datasets, Maddison excludes the European Union (`EUU`) regional aggregate.

---

## 5. Temporal Coverage & Indicator Breakdown
The dataset spans **1900 to 2022** (123 distinct years).
| Indicator Code | First Year | Last Year | Distinct Years | Total Rows |
| :--- | :---: | :---: | :---: | :---: |
| `gdp` | 1900 | 2022 | 123 | 1,444 |
| `gdppc` | 1900 | 2022 | 123 | 1,461 |
| `pop` | 1900 | 2022 | 123 | 1,444 |

Although all three indicators have the same overall temporal span, the row counts indicate some country-year gaps.

---

## 6. Country-Level Breakdown & Historical Gaps

The following table summarizes the temporal coverage and number of observations available for each country across the three indicators.

| Country Name | ISO3 | First Year | Last Year | Distinct Years | Total Rows | Historical Notes |
| :--- | :---: | :---: | :---: | :---: | :---: | :--- |
| Belgium | `BEL` | 1900 | 2022 | 123 | 369 | Complete 123-year series |
| Czechia | `CZE` | 1970 | 2022 | 53 | 159 | Series begins in 1970 |
| Germany | `DEU` | 1900 | 2022 | 123 | 369 | Complete 123-year series |
| Spain | `ESP` | 1900 | 2022 | 123 | 369 | Complete 123-year series |
| Estonia | `EST` | 1973 | 2022 | 44 | 132 | Series begins in 1973 |
| France | `FRA` | 1900 | 2022 | 123 | 369 | Complete 123-year series |
| Greece | `GRC` | 1900 | 2022 | 123 | 369 | Complete 123-year series |
| Hungary | `HUN` | 1900 | 2022 | 100 | 300 | 100 distinct years recorded |
| Ireland | `IRL` | 1913 | 2022 | 103 | 309 | Series begins in 1913 |
| Italy | `ITA` | 1900 | 2022 | 123 | 369 | Complete 123-year series |
| Lithuania | `LTU` | 1973 | 2022 | 44 | 132 | Series begins in 1973 |
| Latvia | `LVA` | 1973 | 2022 | 44 | 132 | Series begins in 1973 |
| Poland | `POL` | 1900 | 2022 | 89 | 267 | 89 distinct years recorded |
| Portugal | `PRT` | 1900 | 2022 | 123 | 369 | Complete 123-year benchmark series |
| Romania | `ROU` | 1900 | 2022 | 123 | 335 | 123-year span with internal missing years |

Countries such as Belgium, Germany, Spain, France, Greece, Italy and Portugal have complete observations for all three indicators across the 1900–2022 period.

Other countries have either: (i) shorter historical series, where observations begin after 1900; or (ii) internal gaps, where observations are absent for one or more years between the first and last available observations.

---
## 7. Missing information

The following countries contain internal gaps between their first and last recorded years:

| Country   | Indicators | Missing Years per Indicator |
| --------- | ------------------- | ------------------------------------: |
| Estonia   | gdp, gdppc, pop     | 6                                    |
| Hungary   | gdp, gdppc, pop     | 23                                   |
| Ireland   | gdp, gdppc, pop     | 7                                    |
| Lithuania | gdp, gdppc, pop     | 6                                    |
| Latvia    | gdp, gdppc, pop     | 6                                    |
| Poland    | gdp, gdppc, pop     | 34                                   |
| Romania   | gdp, pop            | 17                                   |


## 8. Data Quality and Limitations

**Completeness**

* The profiling results indicate that all fields are fully populated. However there are some missing observations at country-year-indicator level.

**Missing records**

* Missing observations occur for specific countries and periods.

