# Historical Events — Data Dictionary

## 1. Source overview

| Item                | Description                                                                 |
| ------------------- | --------------------------------------------------------------------------- |
| Source table        | `historical_events`                                                         |
| Total rows          | **387**                                                                     |
| Distinct entities   | **16**                                                                      |
| Overall year span   | **1900–2025**                                                               |
| Geographic coverage | 15 European countries + European Union (`EUU`)                              |
| Unit of observation | One historical event associated with an entity and year                     |
| Missing values      | No missing ISO3 codes, country names, years, or event descriptions detected |

## 2. Columns

| Column     | Type        | Description                                                |
| ---------- | ----------- | ---------------------------------------------------------- |
| `event_id` | INT         | Unique identifier for each event record - Surrogate identifier automatically generated |
| `year`     | INT         | Year in which the historical event occurred                |
| `iso3`     | VARCHAR(3)  | ISO3/entity code identifying the country or European Union |
| `name`     | VARCHAR(15) | Country or entity name                                     |
| `event`    | TEXT        | Description of the historical event                        |

## 3. Geographic coverage

The dataset contains **16 entities**:

Belgium (`BEL`), Czechia (`CZE`), Germany (`DEU`), Spain (`ESP`), Estonia (`EST`), European Union (`EUU`), France (`FRA`), Greece (`GRC`), Hungary (`HUN`), Ireland (`IRL`), Italy (`ITA`), Lithuania (`LTU`), Latvia (`LVA`), Poland (`POL`), Portugal (`PRT`), and Romania (`ROU`).

The `EUU` record represents the **European Union rather than an individual country**.

Portugal has the highest number of event records (**125**), while the other entities have between **5 and 22** records.

## 4. Temporal coverage

The overall event range is **1900–2025**, covering 110 distinct years.

Coverage varies substantially by entity:

| Entity         | First year | Last year | Distinct event years | Events |
| -------------- | ---------: | --------: | -------------------: | -----: |
| Belgium        |       1900 |      2020 |                   15 |     15 |
| Czechia        |       1918 |      2020 |                   17 |     17 |
| Germany        |       1900 |      2020 |                   22 |     22 |
| Spain          |       1900 |      2020 |                   19 |     19 |
| Estonia        |       1900 |      2020 |                   21 |     21 |
| European Union |       1957 |      2007 |                    5 |      5 |
| France         |       1900 |      2020 |                   19 |     19 |
| Greece         |       1900 |      2020 |                   19 |     19 |
| Hungary        |       1900 |      2020 |                   16 |     16 |
| Ireland        |       1900 |      2020 |                   17 |     17 |
| Italy          |       1900 |      2020 |                   17 |     17 |
| Lithuania      |       1900 |      2020 |                   17 |     17 |
| Latvia         |       1900 |      2020 |                   19 |     19 |
| Poland         |       1900 |      2020 |                   21 |     21 |
| Portugal       |       1900 |      2025 |                   88 |    125 |
| Romania        |       1900 |      2020 |                   18 |     18 |

The overall 1900–2025 range therefore does **not** represent continuous annual event coverage. The dataset records selected historical events rather than one observation for every country-year. Portugal contains multiple events in some years, explaining why its **125 events correspond to only 88 distinct years**.

## 5. Data quality and coverage gaps

No missing values were detected.

The main coverage limitation is therefore **event sparsity**, rather than missing values. Most entities have events only for selected years, and most entities have no events after 2020. The European Union has a particularly limited temporal coverage, from 1957 to 2007.