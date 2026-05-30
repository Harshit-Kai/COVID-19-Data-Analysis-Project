Select *
From [Portfolio Project]..CovidDeaths$
where continent is not null
Order By 3,4

--Select *
--From [Portfolio Project]..CovidVaccinations$
--Order By 3,4

--select data that we are going to be using
Select location, date, total_cases, total_deaths, new_cases, population
From [Portfolio Project]..CovidDeaths$
where continent is not null
Order By 1,2 

-- total cases vs total deaths
Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From [Portfolio Project]..CovidDeaths$
Where location like '%india%'
Order By 1,2 

--total cases vs population 
Select location, date, population, total_cases, (total_cases/population)*100 as PercentPopulationInfeccted
From [Portfolio Project]..CovidDeaths$
Where location like '%india%'
Order By 1,2 

--looking at countries with highest infection rate compared to population 
Select location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population)) as PercentPopulationInfeccted
From [Portfolio Project]..CovidDeaths$
--Where location like '%india%'
Group by location, population
Order By PercentPopulationInfeccted desc

--Highest death count per population 
Select location, MAX(cast(total_deaths as int)) as TotalDeathCount
From [Portfolio Project]..CovidDeaths$
--Where location like '%india%'
where continent is not null
Group by location
Order By TotalDeathCount desc

--let's break things down by continent 
--showing highet death count by continent
Select location, SUM(cast(total_deaths as int)) as TotalDeathCount
From [Portfolio Project]..CovidDeaths$
--Where location like '%india%'
where continent is null
and location not in ('World', 'European Union', 'International')
Group by location
Order By TotalDeathCount desc

--global numbers by date
Select date,SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
From [Portfolio Project]..CovidDeaths$
--Where location like '%india%'
where continent is not null
Group by date
Order By DeathPercentage desc

--global numbers 
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
From [Portfolio Project]..CovidDeaths$
--Where location like '%india%'
where continent is not null
--Group by total_cases, total_deaths
Order By 1,2 

--looking at total polpulation vs vaccinations

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location, dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/)
From [Portfolio Project]..CovidDeaths$ dea
Join [Portfolio Project]..CovidVaccinations$ vac
	On dea.location = vac.location
	and dea.date = vac.date
	where dea.continent is not null
	order by 2,3


--USE CTE

with Popvsvac (Continent, Location, Date, Population, new_vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location, dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/)
From [Portfolio Project]..CovidDeaths$ dea
Join [Portfolio Project]..CovidVaccinations$ vac
	On dea.location = vac.location
	and dea.date = vac.date
	where dea.continent is not null
	--order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100 as PercentageCount
From Popvsvac


--TEMP TABLE
DROP Table if exists #PercenPopulationVaccinated
Create Table #PercenPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
new_vaccination numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercenPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location, dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/)
From [Portfolio Project]..CovidDeaths$ dea
Join [Portfolio Project]..CovidVaccinations$ vac
	On dea.location = vac.location
	and dea.date = vac.date
	--where dea.continent is not null
	--order by 2,3

	Select *, (RollingPeopleVaccinated/Population)*100 as PercentageCount
From #PercenPopulationVaccinated



--Creating View to store data for visualizations

Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location, dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/)
From [Portfolio Project]..CovidDeaths$ dea
Join [Portfolio Project]..CovidVaccinations$ vac
	On dea.location = vac.location
	and dea.date = vac.date
	where dea.continent is not null
	--order by 2,3