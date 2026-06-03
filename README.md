# COVID-19 Global Data Analysis | SQL & Tableau

A data analytics project using SQL Server and Tableau to explore global COVID-19 trends — tracking infection rates, death counts, and vaccination progress across countries and continents.

---

## Project Overview

This project analyses one of the largest real-world public health datasets available — global COVID-19 case and vaccination data — to understand how the pandemic unfolded across different regions.

> *How did infection and death rates differ across countries and continents, and what did vaccination rollout look like over time?*

The project demonstrates a complete analytics workflow: raw data → SQL exploration → Tableau visualisation → insight communication.

---

## Project Objectives

- Track total cases, deaths, and death rates at global, continental, and country level
- Identify which countries had the highest infection rates relative to population
- Compare death counts across continents
- Analyse vaccination rollout progress over time
- Build a multi-panel Tableau dashboard that communicates the full story

---

## Tools Used

| Tool | Purpose |
|------|---------|
| SQL Server | Data exploration and analysis |
| Tableau | Interactive dashboard development |
| Microsoft Excel | Initial data inspection |

---

## Dataset

**Source:** Our World in Data — COVID-19 Public Dataset

### CovidDeaths Table
- Country, Date, Population, Total Cases, New Cases, Total Deaths, New Deaths

### CovidVaccinations Table
- Country, Date, New Vaccinations, Total Vaccinations, People Vaccinated

---

## Global Summary

| Metric | Value |
|--------|-------|
| Total Cases Analysed | 150.5 Million |
| Total Deaths | 3.18 Million |
| Global Death Rate | 2.11% |

---

## SQL Concepts Demonstrated

This project covers the following SQL techniques:

- `JOIN` — combining Deaths and Vaccinations tables
- `GROUP BY` / `ORDER BY` — aggregating by country, continent, date
- **Aggregate Functions** — SUM, MAX, AVG for totals and rates
- **CTEs (Common Table Expressions)** — for multi-step calculations like rolling vaccination totals
- **Window Functions** — rolling SUM with PARTITION BY for vaccination progress
- **Views** — storing reusable queries for Tableau connection
- **Calculated columns** — death percentage, infection rate vs population

---

## Key Insights

**1. Europe recorded the highest cumulative death count of any continent.**
Despite not having the highest case numbers globally, Europe's death toll exceeded other continents — pointing to a combination of older demographics, early pandemic unpreparedness, and healthcare system strain.

**2. The global death rate of 2.11% masks extreme variation by country.**
Some countries recorded death rates several times higher than the global average, while others stayed well below 1%. This variance reflects differences in healthcare capacity, testing rates, age demographics, and reporting standards — not just virus severity.

**3. Infection rates relative to population varied dramatically.**
Countries with small populations but high case counts showed disproportionately high infection rates. This metric (cases/population) is more meaningful than raw case numbers alone for understanding true spread.

**4. Vaccination rollout was highly uneven across regions.**
Wealthier nations accelerated vaccination programmes significantly faster than lower-income countries, creating a visible gap in the time-series data. This disparity likely influenced the divergence in later wave death rates between regions.

**5. Multiple distinct infection waves are visible in the time-series.**
The trend analysis clearly shows repeated wave patterns globally, with peaks correlating with the emergence of new variants. The delta and omicron waves are visible as distinct spikes in the line chart.

---

## Dashboard Preview

### Dashboard Overview
![Dashboard](Images/dashboard_overview.png)

### KPI Summary
![KPI](Images/key_metrics.png)

### Geographic Analysis
![Map](Images/geographic_analysis.png)

### Global Cases Analysis
![Trend](Images/global_cases_analysis.png)

---

## 📊 Live Dashboard
> **[View on Tableau Public](https://public.tableau.com/app/profile/harshit.kaishwar/viz/CovidDashboardAnalysis_17798724661850/Dashboard1?publish=yes)** 

---

## Dashboard Features

- **Global KPI table** — total cases, deaths, death rate at a glance
- **Bar chart** — death count comparison by continent
- **Geographic map** — infection rate by country, colour-scaled by severity
- **Time-series line chart** — global case trend showing wave patterns
- **Multi-panel layout** — all four views in one cohesive story

---

## Repository Structure

```
COVID-19-Data-Analysis/
│
├── Data/
│   ├── CovidDeaths.xlsx
│   ├── CovidVaccinations.xlsx
│   └── Data_Dictionary.md
│
├── SQL/
│   ├── Covid_Exploration.sql
│   ├── Tableau_Visualization_Queries.sql
│   └── SQL_Insights.md
│
├── Dashboard/
│   ├── Covid Dashboard Analysis.twbx
│   └── Dashboard_Notes.md
│
├── Images/
│   ├── dashboard_overview.png
│   ├── key_metrics.png
│   ├── geographic_analysis.png
│   └── global_cases_analysis.png
│
├── Documentation/
│   ├── Project_Objective.md
│   ├── Data_Cleaning_Process.md
│   ├── Exploratory_Data_Analysis.md
│   └── Business_Insights.md
│
└── README.md
```

---

## What I Learned

This project was built while developing SQL skills — the queries were written with reference to learning resources and modified to fit this specific dataset. The focus was on understanding *why* each query works, not just making it run. Key learning areas: CTEs for multi-step logic, window functions for rolling calculations, and connecting SQL outputs directly to Tableau.

---

## Author

**Harshit Kaishwar**
📧 kaishwarsid@gmail.com
🔗 [LinkedIn](https://www.linkedin.com/in/harshit-kaishwar-7286112b9)
🐙 [GitHub](https://github.com/Harshit-Kai)
