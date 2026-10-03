# Data Analysis and Integration Project 26/27
## Portugal's Economic and Human Development: A Century of Transformation

# TASK 1 - Staging Database and Data Profiling

## 1.1 Staging Architecture 

An isolated staging schema, `DevelopmentDB`, was implemented as an untransformed and non-destructive landing layer between the source CSV files and the target dimensional data warehouse. 

The staging layer preserves the source structure and values as far as possible, while enforcing the physical constraints required for reliable loading. It also provides a controlled environment for profiling source coverage, identifying structural inconsistencies, and validating data before warehouse integration.

Data ingestion was orchestrated in Apache Hop through the load_staging.hpl pipeline. The pipeline uses metadata-driven transformations with the sequence: `CSV File Input → Select Values → Table Output`.

Three independent flows load the Maddison, World Development Indicators, and historical-events datasets into their respective staging table.


## 1.2. Physical Schema 

| Element | Choice | Justification |
|---|---|---|
| Primary key, indicator tables | Composite `(country_iso3, indicator_code, year)` | Unique in the data (verified in profiling), so no surrogate key is needed. Duplicate rows in a source file are rejected at load instead of staged. This combination represents the intended analytical grain for both `maddison_indicators` and `wdi_indicators`.|
| Primary key, events | Surrogate `event_id AUTO_INCREMENT` | `(country_iso3, year)` is not unique: 24 country-years have several events. Adding `event` makes it unique, but it is a text column, too long for a key. |
| `country_iso3` | `CHAR(3)` | Codes are always 3 letters. Fixed length fits the data; exceeding 3 characters is rejected at load. Code validity is checked in profiling against the expected country list. |
| `value` | `DECIMAL(24,6)` | Fixed-point storage avoids floating-point precision issues during numerical aggregation. The precision accommodates the largest observed monetary indicator values while retaining six decimal places. |
| `year` | `INT` | The source stores calendar years as four-digit integer values. INT represents this format directly and supports numerical operations |
| Text columns | `VARCHAR`, sized appropriate to the longest observed value | Variable-length fields reduce unnecessary storage while permitting the observed descriptions, labels, and event text. |
| `NOT NULL` | All source columns, except `value` | Enforces validity at load: a row with a missing value is rejected instead of staged. |
| `loaded_at` | `TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP` | Records when the current content was staged, so a warehouse value can be traced to the load that produced it. |


## 1.3 Load and validation

The Apache Hop pipeline load_staging.hpl contains three ingestion flows, one for each source dataset. Each flow reads its CSV file, applies column selection and type alignment, and writes records to the relevant staging table.

**Invalid historical_event record**
One invalidly structured source record was identified in the historical_events file for Ireland, in 1990. The record contains a comma in the event description.

The problematic raw structure was:

```txt
1990,IRL,Ireland,Celtic Tiger boom begins; strong FDI, IT and pharmaceuticals growth through the 1990s,Economy
```

Because the comma after `FDI` was not enclosed in quotation marks, the CSV parser interpreted it as a field delimiter. Consequently, the record was read as 7 fields rather than the expected 6 fields. A standard CSV load does not fail: it splits on every comma, shifts the columns and drops the last field, and the row count stays correct (387).
The issue was identified through the exploratory queries, when listing categories.

To solve the issues, it was created a corrected copy of the source file which was produced by enclosing the event description in double quotation marks. No other line was changed. The corrected file was the one loaded. The staging table was subsequently reloaded and validated.

## 1.4 Profiling findings

| Finding | Impact on the design |
|---|---|
| The European Union aggregate (EUU) exists in WDI and historical events but not in Maddison | WDI and events contain 16 entities, whereas Maddison contains 15; EUU is the only entity missing from Maddison.| The conformed entity dimension must include EUU as a supranational aggregate. Maddison-derived measures remain unavailable for this entity.|
| GDP per capita is not always accompanied by GDP and population| Romania has 17 observations of gdppc without corresponding gdp values, spanning 1901–1919. | GDP, GDP per capita, and population must be loaded independently. Derived values should only be calculated where all required source measures are available.|
| Maddison coverage is unbalanced | Czechia begins in 1970; Estonia, Lithuania, and Latvia begin in 1973; Ireland begins in 1913. Estonia, Hungary, Ireland, Lithuania, Latvia, Poland, and Romania also contain internal gaps.| The warehouse must retain missing observations as unavailable values. Missing years must not be zero-filled, and balanced-panel analysis requires a restricted period or missing-data strategy.   |
| Hungary and Poland have substantial internal Maddison gaps| Hungary has 23 missing years per Maddison indicator, while Poland has 34 missing years per indicator. | Longitudinal analysis should explicitly account for irregular coverage, particularly for historical comparisons involving these entities.|
| Romanian GDP and population have gaps not shared by GDP per capita | Romania has 17 missing years for gdp and pop, while gdppc remains available in 1901–1919.| The fact table cannot assume simultaneous availability of all Maddison indicators for a given entity-year.|
| WDI sectoral value-added series have unequal start dates| France begins in 1960; Italy and Romania begin in 1990; Germany and EUU begin in 1991; Czechia begins in 1993; the remaining entities begin in 1995.| Broad cross-entity sectoral analysis should generally use 1995 onward. Earlier analyses must account for changing country coverage.|
| WDI employment shares begin in 1991 | Agriculture, industry, and services employment series each contain 560 values, forming a complete 16-entity panel for 1991–2025. | Employment-based analysis must be restricted to 1991 onward.|
| Manufacturing employment is unavailable | No indicator code matching manufacturing employment exists in WDI.| Manufacturing-related employment measures should remain unavailable rather than inferred from industrial employment.|
| GDP growth includes valid negative values| The annual GDP-growth indicator ranges from -32.1% to 42.4%. | Negative values represent economic contraction and must be retained as valid observations.|
| Historical events are disproportionately concentrated in Portugal| Portugal contains 125 of 387 event records.|
| Historical events predate WDI coverage | Historical events span 1900–2025; 165 events occur before 1960, while WDI begins in 1960.| Pre-1960 events can be contextualised with Maddison indicators but cannot be directly linked to WDI observations.|
