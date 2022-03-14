use portofolioproject

select*from Covid_Death

--Total cases In Indonesia until February 10 2022
Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from Covid_Death
where location = 'indonesia' 
order by DeathPercentage desc

--Highest new cases per day in Indonesia

select date , location, new_cases 
from covid_death2 
where location ='indonesia'
order by new_cases desc


--show columns from covid_vaccine
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'covid_vaccine'
ORDER BY ORDINAL_POSITION


--Country with the highest total deaths count

select location, max(cast (total_deaths as int)) as total_deaths_count
from Covid_Death
where continent is not null
group by location
order by total_deaths_count desc

--Total percentage of deaths in Indonesia
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
from Covid_Death
where location ='indonesia'
order by 1, 2


--Total of people who got vaccinated until today
select death.location , death.date , death.population , vac.people_vaccinated ,vac.new_vaccinations, vac.total_vaccinations 
from Covid_Death2 death
join Covid_Vaccine vac
on death.location= vac.location
and death.date = vac.date
where 
death.location ='indonesia'
order by date desc

