# World Development Indicators — Data Dictionary

## 1. Source & Staging Overview
| Item | Description |
| :--- | :--- |
| **Staging Table Name** | `wdi_indicators` |
| **Target Database** | `DevelopmentDB` |
| **Purpose** | Stores annual World Development Indicators for selected European countries and the European Union. |
| **Total Rows** | **11,371** |
| **Distinct Entities** | **16 Entities** (15 European Countries + `EUU` European Union) |
| **Distinct Indicators** | **17 Development Metrics** |
| **Overall Year Span** | **1960–2025** (66 distinct years) |
| **Unit of Observation** | Entity–Indicator–Year |
| **Primary Key** | Composite: `(country_iso3, indicator_code, year)` |
| **Audit Tracking** | `loaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP` |

The table has a common global span of 1960–2025, but individual indicators and entities have different first years, final years, and degrees of completeness.

---

## 2. Table Schema & Column Specifications
| Column Name | MySQL Data Type | Key Type | Nullable | Description |
| :--- | :--- | :--- | :--- | :--- |
| `country_iso3` | `CHAR(3)` | **PK** | `NOT NULL` | Standard 3-letter ISO code or entity aggregate |
| `country_name` | `VARCHAR(50)` | — | `NOT NULL` | Full country or entity name |
| `indicator_code` | `VARCHAR(30)` | **PK** | `NOT NULL` | World Bank / WDI indicator code|
| `indicator_name` | `VARCHAR(100)` | — | `NOT NULL` | Full metric description |
| `year` | `INT` | **PK** | `NOT NULL` | Observation year (1960–2025) |
| `value` | `DECIMAL(24,6)` | — | `NOT NULL` | Numerical value of the metric |
| `loaded_at` | `TIMESTAMP` | — | `NOT NULL` | Ingestion audit timestamp (auto-populated by MySQL) |

---

## 3. Indicator Catalog & Target Dimension Mapping
| Indicator Code | Indicator Description | Unit |
| :--- | :--- | :--- |
| `NE.EXP.GNFS.ZS` | Exports of goods and services | % of GDP | 
| `NE.IMP.GNFS.ZS` | Imports of goods and services | % of GDP | 
| `NV.AGR.TOTL.CD` | Agriculture, forestry & fishing value added | Current US$ | 
| `NV.AGR.TOTL.ZS` | Agriculture value added | % of GDP |
| `NV.IND.MANF.CD` | Manufacturing value added | Current US$ | 
| `NV.IND.MANF.ZS` | Manufacturing value added | % of GDP | 
| `NV.IND.TOTL.CD` | Industry including construction value added | Current US$ |
| `NV.IND.TOTL.ZS` | Industry value added | % of GDP | `FACT_SECTOR` |
| `NV.SRV.TOTL.CD` | Services value added | Current US$ | `FACT_SECTOR` |
| `NV.SRV.TOTL.ZS` | Services value added | % of GDP | `FACT_SECTOR` |
| `NY.GDP.MKTP.KD.ZG`| Annual GDP growth | Annual % | `FACT_ECONOMY` |
| `NY.GNP.PCAP.CD` | GNI per capita (Atlas method) | Current US$ | 
| `SL.AGR.EMPL.ZS` | Employment in agriculture | % of total employment | 
| `SL.IND.EMPL.ZS` | Employment in industry | % of total employment | 
| `SL.SRV.EMPL.ZS` | Employment in services | % of total employment | 
| `SP.DYN.LE00.IN` | Life expectancy at birth | Years | `FACT_SOCIETY` |
| `SP.URB.TOTL.IN.ZS`| Urban population share | % of total population |

---

## 4. Temporal Coverage by Indicator Group
| Indicator Group / Code | First Year | Last Year | Distinct Years | Total Rows | Expected vs. Actual Coverage |
| :--- | :---: | :---: | :---: | :---: | :--- |
| Exports (`NE.EXP.GNFS.ZS`) | 1960 | 2025 | 66 | 757 | Sparse historical coverage before 1970 |
| Imports (`NE.IMP.GNFS.ZS`) | 1960 | 2025 | 66 | 757 | Sparse historical coverage before 1970 |
| Sector Value-Added (Agri, Manf, Ind, Srv) | 1960 | 2025 | 66 | ~550 each | Gaps in early decade observations |
| Annual GDP Growth (`NY.GDP.MKTP.KD.ZG`) | 1961 | 2025 | 65 | 860 | 120 negative growth observations present |
| GNI per Capita (`NY.GNP.PCAP.CD`) | 1962 | 2025 | 64 | 823 | Begins in 1962 |
| Employment Shares (Agri, Ind, Srv) | 1991 | 2025 | 35 | 560 each | **100% Complete panel** (16 × 35) over 1991–2025 |
| Life Expectancy (`SP.DYN.LE00.IN`) | 1960 | 2024 | 65 | 1,040 | **100% Complete panel** (16 × 65) over 1960–2024 |
| Urban Population (`SP.URB.TOTL.IN.ZS`) | 1960 | 2025 | 66 | 1,056 | **100% Complete panel** (16 × 66) over 1960–2025 |

---

## 5. Entity-Level Observations (1960–2025)
| Entity Name | ISO3 | Nominal Span | Total Observations |
| :--- | :---: | :---: | :---: |
| Belgium | `BEL` | 1960–2025 | 725 |
| Czechia | `CZE` | 1960–2025 | 641 |
| Germany | `DEU` | 1960–2025 | 757 |
| Spain | `ESP` | 1960–2025 | 725 |
| Estonia | `EST` | 1960–2025 | 616 |
| European Union | `EUU` | 1960–2025 | 749 |
| France | `FRA` | 1960–2025 | 1,025 |
| Greece | `GRC` | 1960–2025 | 745 |
| Hungary | `HUN` | 1960–2025 | 675 |
| Ireland | `IRL` | 1960–2025 | 725 |
| Italy | `ITA` | 1960–2025 | 765 |
| Lithuania | `LTU` | 1960–2025 | 610 |
| Latvia | `LVA` | 1960–2025 | 610 |
| Poland | `POL` | 1960–2025 | 615 |
| Portugal | `PRT` | 1960–2025 | 725 |
| Romania | `ROU` | 1960–2025 | 663 |

---

## 6. Data Quality and Limitations

 **Completeness**
 
 * All the fields are fully populated. However, the row counts reveal coverage gaps within several indicator series.

**Missing and uneven coverage**

* The WDI data does not provide a uniform historical panel across all indicators. The main limitations are: (i) GDP growth starts in 1961 rather than 1960. (ii) GNI per capita starts in 1962. (iii) Employment indicators only begin in 1991. (iv) Life expectancy ends in 2024, one year before the end of the overall dataset. (v) Sector indicators have substantially less complete historical coverage than the broader economic and social indicators. (vi) Some countries have later observations for particular indicators.

**Negative Values**

* The dataset contains 120 negative GDP-growth observations. These are valid values because negative annual GDP growth is economically possible and represents contraction.
