# Historical Events — Data Dictionary

## Dataset Overview

| Property             | Description |
| -------------------- | ----------- |
| **Dataset**          | Historical Events Dataset|
| **File**             | `historical_events.csv` |
| **Purpose**          | Provides event-based historical context for interpreting economic, political, social, financial, infrastructural, industrial, and geopolitical changes. |
| **Rows**             | 387 |
| **Entities**         | 16 |
| **Year span**        | 1900–2025 |
| **Distinct years**   | 110 |
| **Geographic scope** | 15 European countries + European Union (`EUU`) |
| **Source columns**   | 6 |
| **Grain**            | Country × year × event |
| **Missing values**   | None |
| **Duplicate rows**   | None |

## Column Dictionary

| Column            | Type          | Description                                                                                      | Unit / Values    |
| ----------------- | ------------- | ------------------------------------------------------------------------------------------------ | ---------------- |
| `event_id`        | `INT`         | Surrogate identifier automatically generated for each staging record. It is the primary key of the staging table and was created for database management purposes. | Ordinal Number |
| `year`            | `INT`         | Year in which the event occurred.                                                                | Calendar year    |
| `country_iso3`    | `VARCHAR(3)`  | ISO 3166-1 alpha-3 identifier of the country or aggregate associated with the event.             | ISO3 code        |
| `country_name`    | `VARCHAR(15)` | Country/entity name corresponding to `country_iso3`.                                             | Text             |
| `event`           | `TEXT`        | Narrative description of the historical event.                                                   | Free text        |
| `category`        | `VARCHAR`     | Classification of the event by historical domain.                                                | Categorical text |
| `economic_impact` | `VARCHAR`     | Concise description of the principal economic or socioeconomic effect associated with the event. | Descriptive text |

## Geographic Coverage

The dataset contains:

**15 countries + 1 European Union aggregate = 16 entities**

The country/event distribution is highly uneven. Portugal contains **125 of the 387 records**, while the other entities contain substantially fewer events.

The European Union (`EUU`) is represented separately from individual countries.

## Temporal Coverage

The overall span is **1900–2025**, but the distribution is not continuous.

Relevant coverage characteristics:

* Most countries have events beginning in 1900.
* Czechia begins in 1918.
* EU events begin in 1957.
* Most non-Portuguese entities end in 2020.
* Portugal extends to 2025.
* There are 110 distinct years represented across the 387 events.
* Multiple events can occur in the same country and year.

## Categories

The dataset includes categories such as:

* Political
* Economy
* Integration
* War
* Financial
* Infrastructure
* Industry
* Geopolitical
* Social
* Colonial

Some records contain **compound categories**, such as `War/Health`, `War/Industry`, `Integration/Industry`, `Infrastructure/Economy`, and `Integration/Security`.

## Missing Values and Data Quality

The supplied dataset contains **no missing values** in its six source columns.

## Relevant Particularities

* Unlike Maddison and WDI, this is an **event-based dataset**, not a regular time series.
* `year + country_iso3` is **not unique**, because multiple events may occur in the same country during the same year.
* A source `event_id` is **not present** in the CSV. An `event_id` was generated during staging, it should be treated as a technical surrogate key.
* `event` is free-text qualitative information, while `category` and `economic_impact` provide structured contextual attributes.
* The number of events per country is highly uneven, with Portugal strongly represented.
* The dataset is intended to provide **historical context for quantitative indicators**, rather than measurements that can be aggregated like GDP or population.
