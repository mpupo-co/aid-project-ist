# Data Warehouse – Design Justification

### 1. Why three separate fact tables?

The warehouse uses three fact tables because the measures represent distinct analytical subjects with different grains. `FACT_ECONOMY` and `FACT_SOCIETY` both have a grain of one observation per country per year, but contain different measures: economic performance and trade in `FACT_ECONOMY`, and population, income and wellbeing in `FACT_SOCIETY`. `FACT_SECTOR` has a finer grain of one observation per country, year and sector, as its measures describe economic structure through sectoral value added and employment.

Keeping these grains separate ensures that each measure is stored at its natural and well-defined level of detail, avoiding the incorrect repetition or aggregation of country-year measures across multiple sector observations. The three fact tables share the conformed `DIM_COUNTRY` and `DIM_TIME` dimensions, allowing the different subjects to be analysed consistently across countries and over time.

---

### 2. Why `DIM_SECTOR` only applies to `FACT_SECTOR`?

`DIM_SECTOR` is associated exclusively with `FACT_SECTOR` because sector is part of its grain: each fact represents a specific combination of country, year and sector. Its attributes, `sector_name` and `broad_sector`, provide the hierarchy required to analyse sectoral measures at different levels, from Primary/Secondary/Tertiary (broad sectors) to Agriculture/Industry & Manufacturing/Services (sector names).

In contrast, `FACT_ECONOMY` and `FACT_SOCIETY` are defined at the country-year grain and contain no sector-specific measures. Associating `DIM_SECTOR` with these facts would therefore introduce an artificial dimension that is not part of their grain and could incorrectly imply that their measures vary by sector.

---

### 3. Historical events data integration

Historical events were integrated using Option 2: a bridge table (`BRIDGE_EVENT`) linked to `DIM_COUNTRY` and `DIM_TIME`. This approach was selected because each event is an individual occurrence associated with a country and a year, rather than a country-year measure. The bridge preserves the event-level detail and attributes, while linking each event to the same conformed country and time dimensions used by the fact tables. This allows events to be analysed in their geographical and temporal context without changing the grain of the quantitative facts.

Option 1, a standalone reference table joined by year, was not selected because a year-only relationship does not adequately preserve the country context of each event when relating events to country-specific measures. Option 3, a `DIM_EVENT` dimension, was also not selected because events represent individual occurrences rather than descriptive attributes of a stable analytical entity. Modelling them as a dimension would therefore be less consistent with their event-level nature.

Option 2 was therefore selected because it preserves the original event granularity while providing direct links to the conformed country and time dimensions, enabling integrated temporal and geographical analysis without compromising the grain of the fact tables.
