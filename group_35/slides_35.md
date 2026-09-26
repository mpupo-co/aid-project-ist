# Report

## 1. Task 1

### 1.1. Maddison Project Database 2023

**Country-Level Temporal Coverage**

| Country | First Year | Last Year | Number of Years |
| ------- | ---------: | --------: | --------------: |
| BEL     |       1900 |      2022 |             123 |
| CZE     |       1970 |      2022 |              53 |
| DEU     |       1900 |      2022 |             123 |
| ESP     |       1900 |      2022 |             123 |
| EST     |       1973 |      2022 |              44 |
| FRA     |       1900 |      2022 |             123 |
| GRC     |       1900 |      2022 |             123 |
| HUN     |       1900 |      2022 |             100 |
| IRL     |       1913 |      2022 |             103 |
| ITA     |       1900 |      2022 |             123 |
| LTU     |       1973 |      2022 |              44 |
| LVA     |       1973 |      2022 |              44 |
| POL     |       1900 |      2022 |              89 |
| PRT     |       1900 |      2022 |             123 |
| ROU     |       1900 |      2022 |             123 |


The Maddison dataset provides an overall coverage from **1900 to 2022**.

However, historical coverage is not uniform across countries:

* Belgium, Germany, Spain, France, Greece, Italy, Portugal and Romania have observations covering the full 1900–2022 period.
* Ireland starts in 1913.
* Czechia starts in 1970.
* Estonia, Latvia and Lithuania start in 1973.
* Hungary and Poland start in 1900 but contain internal gaps, resulting in fewer than 123 observed years.

---

### 1.2. World Development Indicators

**Indicator Coverage**

| Indicator Code    | Indicator                                | First Year | Last Year | Countries | Years | Observations |
| ----------------- | ---------------------------------------- | ---------: | --------: | --------: | ----: | -----------: |
| NE.EXP.GNFS.ZS    | Exports of goods and services (% of GDP) |       1960 |      2025 |        16 |    66 |          757 |
| NE.IMP.GNFS.ZS    | Imports of goods and services (% of GDP) |       1960 |      2025 |        16 |    66 |          757 |
| NV.AGR.TOTL.CD    | Agriculture value added (current US$)    |       1960 |      2025 |        16 |    66 |          547 |
| NV.AGR.TOTL.ZS    | Agriculture value added (% of GDP)       |       1960 |      2025 |        16 |    66 |          547 |
| NV.IND.MANF.CD    | Manufacturing value added (current US$)  |       1960 |      2025 |        16 |    66 |          550 |
| NV.IND.MANF.ZS    | Manufacturing value added (% of GDP)     |       1960 |      2025 |        16 |    66 |          550 |
| NV.IND.TOTL.CD    | Industry value added (current US$)       |       1960 |      2025 |        16 |    66 |          551 |
| NV.IND.TOTL.ZS    | Industry value added (% of GDP)          |       1960 |      2025 |        16 |    66 |          551 |
| NV.SRV.TOTL.CD    | Services value added (current US$)       |       1960 |      2025 |        16 |    66 |          551 |
| NV.SRV.TOTL.ZS    | Services value added (% of GDP)          |       1960 |      2025 |        16 |    66 |          551 |
| NY.GDP.MKTP.KD.ZG | GDP growth (annual %)                    |       1961 |      2025 |        16 |    65 |          860 |
| NY.GNP.PCAP.CD    | GNI per capita                           |       1962 |      2025 |        16 |    64 |          823 |
| SL.AGR.EMPL.ZS    | Employment in agriculture                |       1991 |      2025 |        16 |    35 |          560 |
| SL.IND.EMPL.ZS    | Employment in industry                   |       1991 |      2025 |        16 |    35 |          560 |
| SL.SRV.EMPL.ZS    | Employment in services                   |       1991 |      2025 |        16 |    35 |          560 |
| SP.DYN.LE00.IN    | Life expectancy at birth                 |       1960 |      2024 |        16 |    65 |        1,040 |
| SP.URB.TOTL.IN.ZS | Urban population                         |       1960 |      2025 |        16 |    66 |        1,056 |

The indicator-level profiling shows that the WDI dataset contains 17 indicators across all 16 geographical entities. The overall temporal range is 1960–2025, but the historical depth differs substantially between indicator groups.

The indicators with the longest coverage are exports, imports, sectoral value added, life expectancy and urban population, all of which reach back to 1960 at the dataset level. However, this does not mean that every country has observations from 1960 for these indicators.

Other indicators begin later:

* GDP growth starts in 1961.
* GNI per capita starts in 1962.
* Employment by sector starts in 1991.
* Life expectancy ends in 2024, while the other indicators generally extend to 2025.

The number of observations also varies considerably. For example, urban population has 1,056 observations, corresponding to the theoretical maximum of 16 entities × 66 years, while agriculture value added has 547 observations. 

**Country × Indicator Temporal Coverage**

| Country ISO3 | Country        | Indicator Code    | Indicator                                                                | First Year | Last Year | Number of Years |
| ------------ | -------------- | ----------------- | ------------------------------------------------------------------------ | ---------: | --------: | --------------: |
| BEL          | Belgium        | NE.EXP.GNFS.ZS    | Exports of goods and services (% of GDP)                                 |       1970 |      2025 |              56 |
| BEL          | Belgium        | NE.IMP.GNFS.ZS    | Imports of goods and services (% of GDP)                                 |       1970 |      2025 |              56 |
| BEL          | Belgium        | NV.AGR.TOTL.CD    | Agriculture, forestry, and fishing, value added (current US$)            |       1995 |      2025 |              31 |
| BEL          | Belgium        | NV.AGR.TOTL.ZS    | Agriculture, forestry, and fishing, value added (% of GDP)               |       1995 |      2025 |              31 |
| BEL          | Belgium        | NV.IND.MANF.CD    | Manufacturing, value added (current US$)                                 |       1995 |      2025 |              31 |
| BEL          | Belgium        | NV.IND.MANF.ZS    | Manufacturing, value added (% of GDP)                                    |       1995 |      2025 |              31 |
| BEL          | Belgium        | NV.IND.TOTL.CD    | Industry (including construction), value added (current US$)             |       1995 |      2025 |              31 |
| BEL          | Belgium        | NV.IND.TOTL.ZS    | Industry (including construction), value added (% of GDP)                |       1995 |      2025 |              31 |
| BEL          | Belgium        | NV.SRV.TOTL.CD    | Services, value added (current US$)                                      |       1995 |      2025 |              31 |
| BEL          | Belgium        | NV.SRV.TOTL.ZS    | Services, value added (% of GDP)                                         |       1995 |      2025 |              31 |
| BEL          | Belgium        | NY.GDP.MKTP.KD.ZG | GDP growth (annual %)                                                    |       1961 |      2025 |              65 |
| BEL          | Belgium        | NY.GNP.PCAP.CD    | GNI per capita, Atlas method (current US$)                               |       1962 |      2025 |              64 |
| BEL          | Belgium        | SL.AGR.EMPL.ZS    | Employment in agriculture (% of total employment) (modeled ILO estimate) |       1991 |      2025 |              35 |
| BEL          | Belgium        | SL.IND.EMPL.ZS    | Employment in industry (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| BEL          | Belgium        | SL.SRV.EMPL.ZS    | Employment in services (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| BEL          | Belgium        | SP.DYN.LE00.IN    | Life expectancy at birth, total (years)                                  |       1960 |      2024 |              65 |
| BEL          | Belgium        | SP.URB.TOTL.IN.ZS | Urban population (% of total population)                                 |       1960 |      2025 |              66 |
| CZE          | Czechia        | NE.EXP.GNFS.ZS    | Exports of goods and services (% of GDP)                                 |       1990 |      2025 |              36 |
| CZE          | Czechia        | NE.IMP.GNFS.ZS    | Imports of goods and services (% of GDP)                                 |       1990 |      2025 |              36 |
| CZE          | Czechia        | NV.AGR.TOTL.CD    | Agriculture, forestry, and fishing, value added (current US$)            |       1993 |      2025 |              33 |
| CZE          | Czechia        | NV.AGR.TOTL.ZS    | Agriculture, forestry, and fishing, value added (% of GDP)               |       1993 |      2025 |              33 |
| CZE          | Czechia        | NV.IND.MANF.CD    | Manufacturing, value added (current US$)                                 |       1993 |      2025 |              33 |
| CZE          | Czechia        | NV.IND.MANF.ZS    | Manufacturing, value added (% of GDP)                                    |       1993 |      2025 |              33 |
| CZE          | Czechia        | NV.IND.TOTL.CD    | Industry (including construction), value added (current US$)             |       1993 |      2025 |              33 |
| CZE          | Czechia        | NV.IND.TOTL.ZS    | Industry (including construction), value added (% of GDP)                |       1993 |      2025 |              33 |
| CZE          | Czechia        | NV.SRV.TOTL.CD    | Services, value added (current US$)                                      |       1993 |      2025 |              33 |
| CZE          | Czechia        | NV.SRV.TOTL.ZS    | Services, value added (% of GDP)                                         |       1993 |      2025 |              33 |
| CZE          | Czechia        | NY.GDP.MKTP.KD.ZG | GDP growth (annual %)                                                    |       1991 |      2025 |              35 |
| CZE          | Czechia        | NY.GNP.PCAP.CD    | GNI per capita, Atlas method (current US$)                               |       1992 |      2025 |              34 |
| CZE          | Czechia        | SL.AGR.EMPL.ZS    | Employment in agriculture (% of total employment) (modeled ILO estimate) |       1991 |      2025 |              35 |
| CZE          | Czechia        | SL.IND.EMPL.ZS    | Employment in industry (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| CZE          | Czechia        | SL.SRV.EMPL.ZS    | Employment in services (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| CZE          | Czechia        | SP.DYN.LE00.IN    | Life expectancy at birth, total (years)                                  |       1960 |      2024 |              65 |
| CZE          | Czechia        | SP.URB.TOTL.IN.ZS | Urban population (% of total population)                                 |       1960 |      2025 |              66 |
| DEU          | Germany        | NE.EXP.GNFS.ZS    | Exports of goods and services (% of GDP)                                 |       1970 |      2025 |              56 |
| DEU          | Germany        | NE.IMP.GNFS.ZS    | Imports of goods and services (% of GDP)                                 |       1970 |      2025 |              56 |
| DEU          | Germany        | NV.AGR.TOTL.CD    | Agriculture, forestry, and fishing, value added (current US$)            |       1991 |      2025 |              35 |
| DEU          | Germany        | NV.AGR.TOTL.ZS    | Agriculture, forestry, and fishing, value added (% of GDP)               |       1991 |      2025 |              35 |
| DEU          | Germany        | NV.IND.MANF.CD    | Manufacturing, value added (current US$)                                 |       1991 |      2025 |              35 |
| DEU          | Germany        | NV.IND.MANF.ZS    | Manufacturing, value added (% of GDP)                                    |       1991 |      2025 |              35 |
| DEU          | Germany        | NV.IND.TOTL.CD    | Industry (including construction), value added (current US$)             |       1991 |      2025 |              35 |
| DEU          | Germany        | NV.IND.TOTL.ZS    | Industry (including construction), value added (% of GDP)                |       1991 |      2025 |              35 |
| DEU          | Germany        | NV.SRV.TOTL.CD    | Services, value added (current US$)                                      |       1991 |      2025 |              35 |
| DEU          | Germany        | NV.SRV.TOTL.ZS    | Services, value added (% of GDP)                                         |       1991 |      2025 |              35 |
| DEU          | Germany        | NY.GDP.MKTP.KD.ZG | GDP growth (annual %)                                                    |       1961 |      2025 |              65 |
| DEU          | Germany        | NY.GNP.PCAP.CD    | GNI per capita, Atlas method (current US$)                               |       1962 |      2025 |              64 |
| DEU          | Germany        | SL.AGR.EMPL.ZS    | Employment in agriculture (% of total employment) (modeled ILO estimate) |       1991 |      2025 |              35 |
| DEU          | Germany        | SL.IND.EMPL.ZS    | Employment in industry (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| DEU          | Germany        | SL.SRV.EMPL.ZS    | Employment in services (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| DEU          | Germany        | SP.DYN.LE00.IN    | Life expectancy at birth, total (years)                                  |       1960 |      2024 |              65 |
| DEU          | Germany        | SP.URB.TOTL.IN.ZS | Urban population (% of total population)                                 |       1960 |      2025 |              66 |
| ESP          | Spain          | NE.EXP.GNFS.ZS    | Exports of goods and services (% of GDP)                                 |       1970 |      2025 |              56 |
| ESP          | Spain          | NE.IMP.GNFS.ZS    | Imports of goods and services (% of GDP)                                 |       1970 |      2025 |              56 |
| ESP          | Spain          | NV.AGR.TOTL.CD    | Agriculture, forestry, and fishing, value added (current US$)            |       1995 |      2025 |              31 |
| ESP          | Spain          | NV.AGR.TOTL.ZS    | Agriculture, forestry, and fishing, value added (% of GDP)               |       1995 |      2025 |              31 |
| ESP          | Spain          | NV.IND.MANF.CD    | Manufacturing, value added (current US$)                                 |       1995 |      2025 |              31 |
| ESP          | Spain          | NV.IND.MANF.ZS    | Manufacturing, value added (% of GDP)                                    |       1995 |      2025 |              31 |
| ESP          | Spain          | NV.IND.TOTL.CD    | Industry (including construction), value added (current US$)             |       1995 |      2025 |              31 |
| ESP          | Spain          | NV.IND.TOTL.ZS    | Industry (including construction), value added (% of GDP)                |       1995 |      2025 |              31 |
| ESP          | Spain          | NV.SRV.TOTL.CD    | Services, value added (current US$)                                      |       1995 |      2025 |              31 |
| ESP          | Spain          | NV.SRV.TOTL.ZS    | Services, value added (% of GDP)                                         |       1995 |      2025 |              31 |
| ESP          | Spain          | NY.GDP.MKTP.KD.ZG | GDP growth (annual %)                                                    |       1961 |      2025 |              65 |
| ESP          | Spain          | NY.GNP.PCAP.CD    | GNI per capita, Atlas method (current US$)                               |       1962 |      2025 |              64 |
| ESP          | Spain          | SL.AGR.EMPL.ZS    | Employment in agriculture (% of total employment) (modeled ILO estimate) |       1991 |      2025 |              35 |
| ESP          | Spain          | SL.IND.EMPL.ZS    | Employment in industry (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| ESP          | Spain          | SL.SRV.EMPL.ZS    | Employment in services (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| ESP          | Spain          | SP.DYN.LE00.IN    | Life expectancy at birth, total (years)                                  |       1960 |      2024 |              65 |
| ESP          | Spain          | SP.URB.TOTL.IN.ZS | Urban population (% of total population)                                 |       1960 |      2025 |              66 |
| EST          | Estonia        | NE.EXP.GNFS.ZS    | Exports of goods and services (% of GDP)                                 |       1993 |      2025 |              33 |
| EST          | Estonia        | NE.IMP.GNFS.ZS    | Imports of goods and services (% of GDP)                                 |       1993 |      2025 |              33 |
| EST          | Estonia        | NV.AGR.TOTL.CD    | Agriculture, forestry, and fishing, value added (current US$)            |       1995 |      2025 |              31 |
| EST          | Estonia        | NV.AGR.TOTL.ZS    | Agriculture, forestry, and fishing, value added (% of GDP)               |       1995 |      2025 |              31 |
| EST          | Estonia        | NV.IND.MANF.CD    | Manufacturing, value added (current US$)                                 |       1995 |      2025 |              31 |
| EST          | Estonia        | NV.IND.MANF.ZS    | Manufacturing, value added (% of GDP)                                    |       1995 |      2025 |              31 |
| EST          | Estonia        | NV.IND.TOTL.CD    | Industry (including construction), value added (current US$)             |       1995 |      2025 |              31 |
| EST          | Estonia        | NV.IND.TOTL.ZS    | Industry (including construction), value added (% of GDP)                |       1995 |      2025 |              31 |
| EST          | Estonia        | NV.SRV.TOTL.CD    | Services, value added (current US$)                                      |       1995 |      2025 |              31 |
| EST          | Estonia        | NV.SRV.TOTL.ZS    | Services, value added (% of GDP)                                         |       1995 |      2025 |              31 |
| EST          | Estonia        | NY.GDP.MKTP.KD.ZG | GDP growth (annual %)                                                    |       1991 |      2025 |              35 |
| EST          | Estonia        | NY.GNP.PCAP.CD    | GNI per capita, Atlas method (current US$)                               |       1995 |      2025 |              31 |
| EST          | Estonia        | SL.AGR.EMPL.ZS    | Employment in agriculture (% of total employment) (modeled ILO estimate) |       1991 |      2025 |              35 |
| EST          | Estonia        | SL.IND.EMPL.ZS    | Employment in industry (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| EST          | Estonia        | SL.SRV.EMPL.ZS    | Employment in services (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| EST          | Estonia        | SP.DYN.LE00.IN    | Life expectancy at birth, total (years)                                  |       1960 |      2024 |              65 |
| EST          | Estonia        | SP.URB.TOTL.IN.ZS | Urban population (% of total population)                                 |       1960 |      2025 |              66 |
| EUU          | European Union | NE.EXP.GNFS.ZS    | Exports of goods and services (% of GDP)                                 |       1970 |      2025 |              56 |
| EUU          | European Union | NE.IMP.GNFS.ZS    | Imports of goods and services (% of GDP)                                 |       1970 |      2025 |              56 |
| EUU          | European Union | NV.AGR.TOTL.CD    | Agriculture, forestry, and fishing, value added (current US$)            |       1995 |      2025 |              31 |
| EUU          | European Union | NV.AGR.TOTL.ZS    | Agriculture, forestry, and fishing, value added (% of GDP)               |       1995 |      2025 |              31 |
| EUU          | European Union | NV.IND.MANF.CD    | Manufacturing, value added (current US$)                                 |       1991 |      2025 |              35 |
| EUU          | European Union | NV.IND.MANF.ZS    | Manufacturing, value added (% of GDP)                                    |       1991 |      2025 |              35 |
| EUU          | European Union | NV.IND.TOTL.CD    | Industry (including construction), value added (current US$)             |       1991 |      2025 |              35 |
| EUU          | European Union | NV.IND.TOTL.ZS    | Industry (including construction), value added (% of GDP)                |       1991 |      2025 |              35 |
| EUU          | European Union | NV.SRV.TOTL.CD    | Services, value added (current US$)                                      |       1991 |      2025 |              35 |
| EUU          | European Union | NV.SRV.TOTL.ZS    | Services, value added (% of GDP)                                         |       1991 |      2025 |              35 |
| EUU          | European Union | NY.GDP.MKTP.KD.ZG | GDP growth (annual %)                                                    |       1961 |      2025 |              65 |
| EUU          | European Union | NY.GNP.PCAP.CD    | GNI per capita, Atlas method (current US$)                               |       1962 |      2025 |              64 |
| EUU          | European Union | SL.AGR.EMPL.ZS    | Employment in agriculture (% of total employment) (modeled ILO estimate) |       1991 |      2025 |              35 |
| EUU          | European Union | SL.IND.EMPL.ZS    | Employment in industry (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| EUU          | European Union | SL.SRV.EMPL.ZS    | Employment in services (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| EUU          | European Union | SP.DYN.LE00.IN    | Life expectancy at birth, total (years)                                  |       1960 |      2024 |              65 |
| EUU          | European Union | SP.URB.TOTL.IN.ZS | Urban population (% of total population)                                 |       1960 |      2025 |              66 |
| FRA          | France         | NE.EXP.GNFS.ZS    | Exports of goods and services (% of GDP)                                 |       1960 |      2025 |              66 |
| FRA          | France         | NE.IMP.GNFS.ZS    | Imports of goods and services (% of GDP)                                 |       1960 |      2025 |              66 |
| FRA          | France         | NV.AGR.TOTL.CD    | Agriculture, forestry, and fishing, value added (current US$)            |       1960 |      2025 |              66 |
| FRA          | France         | NV.AGR.TOTL.ZS    | Agriculture, forestry, and fishing, value added (% of GDP)               |       1960 |      2025 |              66 |
| FRA          | France         | NV.IND.MANF.CD    | Manufacturing, value added (current US$)                                 |       1960 |      2025 |              66 |
| FRA          | France         | NV.IND.MANF.ZS    | Manufacturing, value added (% of GDP)                                    |       1960 |      2025 |              66 |
| FRA          | France         | NV.IND.TOTL.CD    | Industry (including construction), value added (current US$)             |       1960 |      2025 |              66 |
| FRA          | France         | NV.IND.TOTL.ZS    | Industry (including construction), value added (% of GDP)                |       1960 |      2025 |              66 |
| FRA          | France         | NV.SRV.TOTL.CD    | Services, value added (current US$)                                      |       1960 |      2025 |              66 |
| FRA          | France         | NV.SRV.TOTL.ZS    | Services, value added (% of GDP)                                         |       1960 |      2025 |              66 |
| FRA          | France         | NY.GDP.MKTP.KD.ZG | GDP growth (annual %)                                                    |       1961 |      2025 |              65 |
| FRA          | France         | NY.GNP.PCAP.CD    | GNI per capita, Atlas method (current US$)                               |       1962 |      2025 |              64 |
| FRA          | France         | SL.AGR.EMPL.ZS    | Employment in agriculture (% of total employment) (modeled ILO estimate) |       1991 |      2025 |              35 |
| FRA          | France         | SL.IND.EMPL.ZS    | Employment in industry (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| FRA          | France         | SL.SRV.EMPL.ZS    | Employment in services (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| FRA          | France         | SP.DYN.LE00.IN    | Life expectancy at birth, total (years)                                  |       1960 |      2024 |              65 |
| FRA          | France         | SP.URB.TOTL.IN.ZS | Urban population (% of total population)                                 |       1960 |      2025 |              66 |
| GRC          | Greece         | NE.EXP.GNFS.ZS    | Exports of goods and services (% of GDP)                                 |       1960 |      2025 |              66 |
| GRC          | Greece         | NE.IMP.GNFS.ZS    | Imports of goods and services (% of GDP)                                 |       1960 |      2025 |              66 |
| GRC          | Greece         | NV.AGR.TOTL.CD    | Agriculture, forestry, and fishing, value added (current US$)            |       1995 |      2025 |              31 |
| GRC          | Greece         | NV.AGR.TOTL.ZS    | Agriculture, forestry, and fishing, value added (% of GDP)               |       1995 |      2025 |              31 |
| GRC          | Greece         | NV.IND.MANF.CD    | Manufacturing, value added (current US$)                                 |       1995 |      2025 |              31 |
| GRC          | Greece         | NV.IND.MANF.ZS    | Manufacturing, value added (% of GDP)                                    |       1995 |      2025 |              31 |
| GRC          | Greece         | NV.IND.TOTL.CD    | Industry (including construction), value added (current US$)             |       1995 |      2025 |              31 |
| GRC          | Greece         | NV.IND.TOTL.ZS    | Industry (including construction), value added (% of GDP)                |       1995 |      2025 |              31 |
| GRC          | Greece         | NV.SRV.TOTL.CD    | Services, value added (current US$)                                      |       1995 |      2025 |              31 |
| GRC          | Greece         | NV.SRV.TOTL.ZS    | Services, value added (% of GDP)                                         |       1995 |      2025 |              31 |
| GRC          | Greece         | NY.GDP.MKTP.KD.ZG | GDP growth (annual %)                                                    |       1961 |      2025 |              65 |
| GRC          | Greece         | NY.GNP.PCAP.CD    | GNI per capita, Atlas method (current US$)                               |       1962 |      2025 |              64 |
| GRC          | Greece         | SL.AGR.EMPL.ZS    | Employment in agriculture (% of total employment) (modeled ILO estimate) |       1991 |      2025 |              35 |
| GRC          | Greece         | SL.IND.EMPL.ZS    | Employment in industry (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| GRC          | Greece         | SL.SRV.EMPL.ZS    | Employment in services (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| GRC          | Greece         | SP.DYN.LE00.IN    | Life expectancy at birth, total (years)                                  |       1960 |      2024 |              65 |
| GRC          | Greece         | SP.URB.TOTL.IN.ZS | Urban population (% of total population)                                 |       1960 |      2025 |              66 |
| HUN          | Hungary        | NE.EXP.GNFS.ZS    | Exports of goods and services (% of GDP)                                 |       1991 |      2025 |              35 |
| HUN          | Hungary        | NE.IMP.GNFS.ZS    | Imports of goods and services (% of GDP)                                 |       1991 |      2025 |              35 |
| HUN          | Hungary        | NV.AGR.TOTL.CD    | Agriculture, forestry, and fishing, value added (current US$)            |       1995 |      2025 |              31 |
| HUN          | Hungary        | NV.AGR.TOTL.ZS    | Agriculture, forestry, and fishing, value added (% of GDP)               |       1995 |      2025 |              31 |
| HUN          | Hungary        | NV.IND.MANF.CD    | Manufacturing, value added (current US$)                                 |       1995 |      2025 |              31 |
| HUN          | Hungary        | NV.IND.MANF.ZS    | Manufacturing, value added (% of GDP)                                    |       1995 |      2025 |              31 |
| HUN          | Hungary        | NV.IND.TOTL.CD    | Industry (including construction), value added (current US$)             |       1995 |      2025 |              31 |
| HUN          | Hungary        | NV.IND.TOTL.ZS    | Industry (including construction), value added (% of GDP)                |       1995 |      2025 |              31 |
| HUN          | Hungary        | NV.SRV.TOTL.CD    | Services, value added (current US$)                                      |       1995 |      2025 |              31 |
| HUN          | Hungary        | NV.SRV.TOTL.ZS    | Services, value added (% of GDP)                                         |       1995 |      2025 |              31 |
| HUN          | Hungary        | NY.GDP.MKTP.KD.ZG | GDP growth (annual %)                                                    |       1961 |      2025 |              65 |
| HUN          | Hungary        | NY.GNP.PCAP.CD    | GNI per capita, Atlas method (current US$)                               |       1970 |      2025 |              56 |
| HUN          | Hungary        | SL.AGR.EMPL.ZS    | Employment in agriculture (% of total employment) (modeled ILO estimate) |       1991 |      2025 |              35 |
| HUN          | Hungary        | SL.IND.EMPL.ZS    | Employment in industry (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| HUN          | Hungary        | SL.SRV.EMPL.ZS    | Employment in services (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| HUN          | Hungary        | SP.DYN.LE00.IN    | Life expectancy at birth, total (years)                                  |       1960 |      2024 |              65 |
| HUN          | Hungary        | SP.URB.TOTL.IN.ZS | Urban population (% of total population)                                 |       1960 |      2025 |              66 |
| IRL          | Ireland        | NE.EXP.GNFS.ZS    | Exports of goods and services (% of GDP)                                 |       1970 |      2025 |              56 |
| IRL          | Ireland        | NE.IMP.GNFS.ZS    | Imports of goods and services (% of GDP)                                 |       1970 |      2025 |              56 |
| IRL          | Ireland        | NV.AGR.TOTL.CD    | Agriculture, forestry, and fishing, value added (current US$)            |       1995 |      2025 |              31 |
| IRL          | Ireland        | NV.AGR.TOTL.ZS    | Agriculture, forestry, and fishing, value added (% of GDP)               |       1995 |      2025 |              31 |
| IRL          | Ireland        | NV.IND.MANF.CD    | Manufacturing, value added (current US$)                                 |       1995 |      2025 |              31 |
| IRL          | Ireland        | NV.IND.MANF.ZS    | Manufacturing, value added (% of GDP)                                    |       1995 |      2025 |              31 |
| IRL          | Ireland        | NV.IND.TOTL.CD    | Industry (including construction), value added (current US$)             |       1995 |      2025 |              31 |
| IRL          | Ireland        | NV.IND.TOTL.ZS    | Industry (including construction), value added (% of GDP)                |       1995 |      2025 |              31 |
| IRL          | Ireland        | NV.SRV.TOTL.CD    | Services, value added (current US$)                                      |       1995 |      2025 |              31 |
| IRL          | Ireland        | NV.SRV.TOTL.ZS    | Services, value added (% of GDP)                                         |       1995 |      2025 |              31 |
| IRL          | Ireland        | NY.GDP.MKTP.KD.ZG | GDP growth (annual %)                                                    |       1961 |      2025 |              65 |
| IRL          | Ireland        | NY.GNP.PCAP.CD    | GNI per capita, Atlas method (current US$)                               |       1962 |      2025 |              64 |
| IRL          | Ireland        | SL.AGR.EMPL.ZS    | Employment in agriculture (% of total employment) (modeled ILO estimate) |       1991 |      2025 |              35 |
| IRL          | Ireland        | SL.IND.EMPL.ZS    | Employment in industry (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| IRL          | Ireland        | SL.SRV.EMPL.ZS    | Employment in services (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| IRL          | Ireland        | SP.DYN.LE00.IN    | Life expectancy at birth, total (years)                                  |       1960 |      2024 |              65 |
| IRL          | Ireland        | SP.URB.TOTL.IN.ZS | Urban population (% of total population)                                 |       1960 |      2025 |              66 |
| ITA          | Italy          | NE.EXP.GNFS.ZS    | Exports of goods and services (% of GDP)                                 |       1970 |      2025 |              56 |
| ITA          | Italy          | NE.IMP.GNFS.ZS    | Imports of goods and services (% of GDP)                                 |       1970 |      2025 |              56 |
| ITA          | Italy          | NV.AGR.TOTL.CD    | Agriculture, forestry, and fishing, value added (current US$)            |       1990 |      2025 |              36 |
| ITA          | Italy          | NV.AGR.TOTL.ZS    | Agriculture, forestry, and fishing, value added (% of GDP)               |       1990 |      2025 |              36 |
| ITA          | Italy          | NV.IND.MANF.CD    | Manufacturing, value added (current US$)                                 |       1990 |      2025 |              36 |
| ITA          | Italy          | NV.IND.MANF.ZS    | Manufacturing, value added (% of GDP)                                    |       1990 |      2025 |              36 |
| ITA          | Italy          | NV.IND.TOTL.CD    | Industry (including construction), value added (current US$)             |       1990 |      2025 |              36 |
| ITA          | Italy          | NV.IND.TOTL.ZS    | Industry (including construction), value added (% of GDP)                |       1990 |      2025 |              36 |
| ITA          | Italy          | NV.SRV.TOTL.CD    | Services, value added (current US$)                                      |       1990 |      2025 |              36 |
| ITA          | Italy          | NV.SRV.TOTL.ZS    | Services, value added (% of GDP)                                         |       1990 |      2025 |              36 |
| ITA          | Italy          | NY.GDP.MKTP.KD.ZG | GDP growth (annual %)                                                    |       1961 |      2025 |              65 |
| ITA          | Italy          | NY.GNP.PCAP.CD    | GNI per capita, Atlas method (current US$)                               |       1962 |      2025 |              64 |
| ITA          | Italy          | SL.AGR.EMPL.ZS    | Employment in agriculture (% of total employment) (modeled ILO estimate) |       1991 |      2025 |              35 |
| ITA          | Italy          | SL.IND.EMPL.ZS    | Employment in industry (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| ITA          | Italy          | SL.SRV.EMPL.ZS    | Employment in services (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| ITA          | Italy          | SP.DYN.LE00.IN    | Life expectancy at birth, total (years)                                  |       1960 |      2024 |              65 |
| ITA          | Italy          | SP.URB.TOTL.IN.ZS | Urban population (% of total population)                                 |       1960 |      2025 |              66 |
| LTU          | Lithuania      | NE.EXP.GNFS.ZS    | Exports of goods and services (% of GDP)                                 |       1995 |      2025 |              31 |
| LTU          | Lithuania      | NE.IMP.GNFS.ZS    | Imports of goods and services (% of GDP)                                 |       1995 |      2025 |              31 |
| LTU          | Lithuania      | NV.AGR.TOTL.CD    | Agriculture, forestry, and fishing, value added (current US$)            |       1995 |      2025 |              31 |
| LTU          | Lithuania      | NV.AGR.TOTL.ZS    | Agriculture, forestry, and fishing, value added (% of GDP)               |       1995 |      2025 |              31 |
| LTU          | Lithuania      | NV.IND.MANF.CD    | Manufacturing, value added (current US$)                                 |       1995 |      2025 |              31 |
| LTU          | Lithuania      | NV.IND.MANF.ZS    | Manufacturing, value added (% of GDP)                                    |       1995 |      2025 |              31 |
| LTU          | Lithuania      | NV.IND.TOTL.CD    | Industry (including construction), value added (current US$)             |       1995 |      2025 |              31 |
| LTU          | Lithuania      | NV.IND.TOTL.ZS    | Industry (including construction), value added (% of GDP)                |       1995 |      2025 |              31 |
| LTU          | Lithuania      | NV.SRV.TOTL.CD    | Services, value added (current US$)                                      |       1995 |      2025 |              31 |
| LTU          | Lithuania      | NV.SRV.TOTL.ZS    | Services, value added (% of GDP)                                         |       1995 |      2025 |              31 |
| LTU          | Lithuania      | NY.GDP.MKTP.KD.ZG | GDP growth (annual %)                                                    |       1991 |      2025 |              35 |
| LTU          | Lithuania      | NY.GNP.PCAP.CD    | GNI per capita, Atlas method (current US$)                               |       1997 |      2025 |              29 |
| LTU          | Lithuania      | SL.AGR.EMPL.ZS    | Employment in agriculture (% of total employment) (modeled ILO estimate) |       1991 |      2025 |              35 |
| LTU          | Lithuania      | SL.IND.EMPL.ZS    | Employment in industry (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| LTU          | Lithuania      | SL.SRV.EMPL.ZS    | Employment in services (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| LTU          | Lithuania      | SP.DYN.LE00.IN    | Life expectancy at birth, total (years)                                  |       1960 |      2024 |              65 |
| LTU          | Lithuania      | SP.URB.TOTL.IN.ZS | Urban population (% of total population)                                 |       1960 |      2025 |              66 |
| LVA          | Latvia         | NE.EXP.GNFS.ZS    | Exports of goods and services (% of GDP)                                 |       1995 |      2025 |              31 |
| LVA          | Latvia         | NE.IMP.GNFS.ZS    | Imports of goods and services (% of GDP)                                 |       1995 |      2025 |              31 |
| LVA          | Latvia         | NV.AGR.TOTL.CD    | Agriculture, forestry, and fishing, value added (current US$)            |       1995 |      2025 |              31 |
| LVA          | Latvia         | NV.AGR.TOTL.ZS    | Agriculture, forestry, and fishing, value added (% of GDP)               |       1995 |      2025 |              31 |
| LVA          | Latvia         | NV.IND.MANF.CD    | Manufacturing, value added (current US$)                                 |       1995 |      2025 |              31 |
| LVA          | Latvia         | NV.IND.MANF.ZS    | Manufacturing, value added (% of GDP)                                    |       1995 |      2025 |              31 |
| LVA          | Latvia         | NV.IND.TOTL.CD    | Industry (including construction), value added (current US$)             |       1995 |      2025 |              31 |
| LVA          | Latvia         | NV.IND.TOTL.ZS    | Industry (including construction), value added (% of GDP)                |       1995 |      2025 |              31 |
| LVA          | Latvia         | NV.SRV.TOTL.CD    | Services, value added (current US$)                                      |       1995 |      2025 |              31 |
| LVA          | Latvia         | NV.SRV.TOTL.ZS    | Services, value added (% of GDP)                                         |       1995 |      2025 |              31 |
| LVA          | Latvia         | NY.GDP.MKTP.KD.ZG | GDP growth (annual %)                                                    |       1991 |      2025 |              35 |
| LVA          | Latvia         | NY.GNP.PCAP.CD    | GNI per capita, Atlas method (current US$)                               |       1997 |      2025 |              29 |
| LVA          | Latvia         | SL.AGR.EMPL.ZS    | Employment in agriculture (% of total employment) (modeled ILO estimate) |       1991 |      2025 |              35 |
| LVA          | Latvia         | SL.IND.EMPL.ZS    | Employment in industry (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| LVA          | Latvia         | SL.SRV.EMPL.ZS    | Employment in services (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| LVA          | Latvia         | SP.DYN.LE00.IN    | Life expectancy at birth, total (years)                                  |       1960 |      2024 |              65 |
| LVA          | Latvia         | SP.URB.TOTL.IN.ZS | Urban population (% of total population)                                 |       1960 |      2025 |              66 |
| POL          | Poland         | NE.EXP.GNFS.ZS    | Exports of goods and services (% of GDP)                                 |       1995 |      2025 |              31 |
| POL          | Poland         | NE.IMP.GNFS.ZS    | Imports of goods and services (% of GDP)                                 |       1995 |      2025 |              31 |
| POL          | Poland         | NV.AGR.TOTL.CD    | Agriculture, forestry, and fishing, value added (current US$)            |       1995 |      2025 |              31 |
| POL          | Poland         | NV.AGR.TOTL.ZS    | Agriculture, forestry, and fishing, value added (% of GDP)               |       1995 |      2025 |              31 |
| POL          | Poland         | NV.IND.MANF.CD    | Manufacturing, value added (current US$)                                 |       1995 |      2025 |              31 |
| POL          | Poland         | NV.IND.MANF.ZS    | Manufacturing, value added (% of GDP)                                    |       1995 |      2025 |              31 |
| POL          | Poland         | NV.IND.TOTL.CD    | Industry (including construction), value added (current US$)             |       1995 |      2025 |              31 |
| POL          | Poland         | NV.IND.TOTL.ZS    | Industry (including construction), value added (% of GDP)                |       1995 |      2025 |              31 |
| POL          | Poland         | NV.SRV.TOTL.CD    | Services, value added (current US$)                                      |       1995 |      2025 |              31 |
| POL          | Poland         | NV.SRV.TOTL.ZS    | Services, value added (% of GDP)                                         |       1995 |      2025 |              31 |
| POL          | Poland         | NY.GDP.MKTP.KD.ZG | GDP growth (annual %)                                                    |       1991 |      2025 |              35 |
| POL          | Poland         | NY.GNP.PCAP.CD    | GNI per capita, Atlas method (current US$)                               |       1992 |      2025 |              34 |
| POL          | Poland         | SL.AGR.EMPL.ZS    | Employment in agriculture (% of total employment) (modeled ILO estimate) |       1991 |      2025 |              35 |
| POL          | Poland         | SL.IND.EMPL.ZS    | Employment in industry (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| POL          | Poland         | SL.SRV.EMPL.ZS    | Employment in services (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| POL          | Poland         | SP.DYN.LE00.IN    | Life expectancy at birth, total (years)                                  |       1960 |      2024 |              65 |
| POL          | Poland         | SP.URB.TOTL.IN.ZS | Urban population (% of total population)                                 |       1960 |      2025 |              66 |
| PRT          | Portugal       | NE.EXP.GNFS.ZS    | Exports of goods and services (% of GDP)                                 |       1970 |      2025 |              56 |
| PRT          | Portugal       | NE.IMP.GNFS.ZS    | Imports of goods and services (% of GDP)                                 |       1970 |      2025 |              56 |
| PRT          | Portugal       | NV.AGR.TOTL.CD    | Agriculture, forestry, and fishing, value added (current US$)            |       1995 |      2025 |              31 |
| PRT          | Portugal       | NV.AGR.TOTL.ZS    | Agriculture, forestry, and fishing, value added (% of GDP)               |       1995 |      2025 |              31 |
| PRT          | Portugal       | NV.IND.MANF.CD    | Manufacturing, value added (current US$)                                 |       1995 |      2025 |              31 |
| PRT          | Portugal       | NV.IND.MANF.ZS    | Manufacturing, value added (% of GDP)                                    |       1995 |      2025 |              31 |
| PRT          | Portugal       | NV.IND.TOTL.CD    | Industry (including construction), value added (current US$)             |       1995 |      2025 |              31 |
| PRT          | Portugal       | NV.IND.TOTL.ZS    | Industry (including construction), value added (% of GDP)                |       1995 |      2025 |              31 |
| PRT          | Portugal       | NV.SRV.TOTL.CD    | Services, value added (current US$)                                      |       1995 |      2025 |              31 |
| PRT          | Portugal       | NV.SRV.TOTL.ZS    | Services, value added (% of GDP)                                         |       1995 |      2025 |              31 |
| PRT          | Portugal       | NY.GDP.MKTP.KD.ZG | GDP growth (annual %)                                                    |       1961 |      2025 |              65 |
| PRT          | Portugal       | NY.GNP.PCAP.CD    | GNI per capita, Atlas method (current US$)                               |       1962 |      2025 |              64 |
| PRT          | Portugal       | SL.AGR.EMPL.ZS    | Employment in agriculture (% of total employment) (modeled ILO estimate) |       1991 |      2025 |              35 |
| PRT          | Portugal       | SL.IND.EMPL.ZS    | Employment in industry (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| PRT          | Portugal       | SL.SRV.EMPL.ZS    | Employment in services (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| PRT          | Portugal       | SP.DYN.LE00.IN    | Life expectancy at birth, total (years)                                  |       1960 |      2024 |              65 |
| PRT          | Portugal       | SP.URB.TOTL.IN.ZS | Urban population (% of total population)                                 |       1960 |      2025 |              66 |
| ROU          | Romania        | NE.EXP.GNFS.ZS    | Exports of goods and services (% of GDP)                                 |       1990 |      2025 |              36 |
| ROU          | Romania        | NE.IMP.GNFS.ZS    | Imports of goods and services (% of GDP)                                 |       1990 |      2025 |              36 |
| ROU          | Romania        | NV.AGR.TOTL.CD    | Agriculture, forestry, and fishing, value added (current US$)            |       1990 |      2025 |              36 |
| ROU          | Romania        | NV.AGR.TOTL.ZS    | Agriculture, forestry, and fishing, value added (% of GDP)               |       1990 |      2025 |              36 |
| ROU          | Romania        | NV.IND.MANF.CD    | Manufacturing, value added (current US$)                                 |       1991 |      2025 |              35 |
| ROU          | Romania        | NV.IND.MANF.ZS    | Manufacturing, value added (% of GDP)                                    |       1991 |      2025 |              35 |
| ROU          | Romania        | NV.IND.TOTL.CD    | Industry (including construction), value added (current US$)             |       1990 |      2025 |              36 |
| ROU          | Romania        | NV.IND.TOTL.ZS    | Industry (including construction), value added (% of GDP)                |       1990 |      2025 |              36 |
| ROU          | Romania        | NV.SRV.TOTL.CD    | Services, value added (current US$)                                      |       1990 |      2025 |              36 |
| ROU          | Romania        | NV.SRV.TOTL.ZS    | Services, value added (% of GDP)                                         |       1990 |      2025 |              36 |
| ROU          | Romania        | NY.GDP.MKTP.KD.ZG | GDP growth (annual %)                                                    |       1991 |      2025 |              35 |
| ROU          | Romania        | NY.GNP.PCAP.CD    | GNI per capita, Atlas method (current US$)                               |       1992 |      2025 |              34 |
| ROU          | Romania        | SL.AGR.EMPL.ZS    | Employment in agriculture (% of total employment) (modeled ILO estimate) |       1991 |      2025 |              35 |
| ROU          | Romania        | SL.IND.EMPL.ZS    | Employment in industry (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| ROU          | Romania        | SL.SRV.EMPL.ZS    | Employment in services (% of total employment) (modeled ILO estimate)    |       1991 |      2025 |              35 |
| ROU          | Romania        | SP.DYN.LE00.IN    | Life expectancy at birth, total (years)                                  |       1960 |      2024 |              65 |
| ROU          | Romania        | SP.URB.TOTL.IN.ZS | Urban population (% of total population)                                 |       1960 |      2025 |              66 |


The country × indicator analysis provides a more detailed view of the temporal coverage and confirms that availability varies substantially across geographical entities.

A notable pattern is that life expectancy and urban population have the most consistent historical coverage. All 16 entities have life expectancy observations from 1960–2024 and urban population observations from 1960–2025.

In contrast, the economic and sectoral indicators generally have more recent starting dates:

* France and Greece have exports and imports available from 1960–2025.
* Belgium, Germany, Spain, Ireland and Portugal have exports and imports from 1970–2025.
* Czechia and Romania begin their exports and imports series in 1990.
* Hungary begins in 1991.
* Lithuania, Latvia and Poland begin in 1995.

Sectoral value-added indicators show a similar pattern. France has observations from 1960, while several countries begin in the 1990s. For example, Belgium, Spain, Estonia, Greece, Hungary, Ireland, Portugal and the Baltic countries generally have sectoral observations beginning in 1995. Italy and Romania begin in 1990, while Germany begins in 1991.

The GDP growth indicator is comparatively consistent across the dataset. Most countries have observations from 1961, while countries such as Czechia, Estonia, Lithuania, Latvia, Poland and Romania begin in 1991.

GNI per capita also varies by country. Most Western European countries have observations from 1962, whereas later starting points occur for Czechia, Estonia, Hungary, Poland, Romania, Lithuania and Latvia.

The three employment indicators have a particularly consistent coverage pattern: all entities have observations from 1991 to 2025, giving 35 years of data for each country–indicator combination.
