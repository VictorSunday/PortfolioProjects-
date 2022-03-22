Select Location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as Deathpercentage
from CovidDeath
where Location ='United kingdom'
order by 1,2
 
 --the above looks at the Total cases Vs Total Deaths in the United Kingdom 
 --likelihood of dying from covid in the United kingdom 

 --Looking at the Total cases vs poluation 
 --Shows the Percentage got Covid

 Select Location,date,Population,total_cases,(total_cases/Population)*100 as Deathpercentage
from CovidDeath
where Location ='United kingdom'
order by 1,2

--looking at Tocal cases vs Population 
--shows the percentage that got covid in nigeria

 Select Location,date,Population,total_cases,(total_cases/Population)*100 as Percentpopulationinfected
from CovidDeath
where Location ='Nigeria'
order by 1,2

_--Looking at country with the Highest Rates compared to population

 Select Location,Population,MAX(total_cases) as HighestinfectionCount, MAX((total_cases/population))*100 as Percentpopulationinfected
from CovidDeath
Group by Location,population
order by Percentpopulationinfected Desc

--showing countries with the Highest death count per Population

Select Population,Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
from CovidDeath
where continent is not null
Group by Location ,Population
order by TotalDeathCount Desc

--showing countries with the Highest death count per contient

 Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
from CovidDeath
where continent is not null
Group by continent
order by TotalDeathCount Desc


--GLOBAL NUMBERS


 Select date,SUM(new_cases) as total_cases , SUM(Cast(new_deaths as int)) as total_deaths, SUM(Cast(new_deaths as int))/SUM(New_cases)*100 as Deathpercentage
from CovidDeath
where continent is not null
Group by date
order by 1,2 


--total GLOAL FIGURES

Select SUM(new_cases) as total_cases , SUM(Cast(new_deaths as int)) as total_deaths, SUM(Cast(new_deaths as int))/SUM(New_cases)*100 as Deathpercentage
from CovidDeath
where continent is not null
--Group by date
order by 1,2


select *
from CovidVaccinations
where continent = 'Europe'
AND continent is not null
AND location = 'united kingdom'
AND total_tests is not null
AND new_tests > '10000'
order by 1,2


Select*
from CovidDeath dea
Join CovidVaccinations vac
 on dea.location = vac.location
 and dea.date = vac.date
 order by 1,2


 --Looking At Total Population Vs Vaccination 

 Select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations
from CovidDeath dea
Join CovidVaccinations vac
 on dea.location = vac.location
 and dea.date = vac.date
 where dea.continent is not null
 and vac.new_vaccinations is not null
 and dea.continent ='europe'
 order by 1,2,3 asc
