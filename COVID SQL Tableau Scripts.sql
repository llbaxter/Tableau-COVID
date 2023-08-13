/*
Queries used for Tableau Project
*/

-- 1. 
SELECT SUM(new_cases) AS total_cases, SUM(cast(new_deaths AS INT)) AS total_deaths, SUM(cast(new_deaths AS INT))/SUM(New_Cases)*100 AS DeathPercentage
FROM Porfolio..CovidDeaths
WHERE continent IS NOT NULL 
ORDER BY 1,2

-- 2.
SELECT location, SUM(cast(new_deaths AS INT)) AS TotalDeathCount
FROM Porfolio..CovidDeaths
WHERE continent IS NULL 
AND location NOT IN ('World', 'European Union', 'International')
GROUP BY location
ORDER BY TotalDeathCount DESC

-- 3.
SELECT Location, Population, MAX(total_cases) AS HighestInfectionCount,  MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM Porfolio..CovidDeaths
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC

-- 4.
SELECT Location, Population, date, MAX(total_cases) AS HighestInfectionCount,  MAX((total_cases/population))*100 AS PercentPopulationInfected
FROM Porfolio..CovidDeaths
GROUP BY Location, Population, date
ORDER BY PercentPopulationInfected DESC