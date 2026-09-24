select
    min(year) As starting_year,
    max(year) As ending_year,
    count(distinct country)As total_unique_country
from Owid_energy_data;

select country,round(AVG(biofuel_consumption),2)as avg_biofuel_cons
from Owid_energy_data;
where iso_code is not null and biofuel_consumption is not null
group by country
order by avg_biofuel_cons DESC
limit 10;


select year,population,gdp,biofuel_consumption
from Owid_energy_data;
Where country='India'and year >=2000
order by year ASC;



India's Biofuel consumption after the year 2000






Top 10 Biofuel consumption countries in the year 2022

select country,gdp,biofuel_consumption 
from Owid_energy_data;
where year = 2022 and gdp is not null and biofuel_consumption is not null
order by gdp desc
limit 10;



comparision of solar and wind energy in India


select year,
    round(solar_consumption,2) as solar_cons,
    round(wind_consumption,2)as wind_cons
from Owid_energy_data;
where country='India' and year>=2015
order by year ASC
limit 10;



Global leader in solar energy

select country,year,gdp,
round(solar_consumption,2)as total_solar
from Owid_energy_data;
where year>=2022 and
Iso_code is not null and gdp is not null and solar_consumption is not null
order by total_solar DESC
limit 10;



Total share of renewable vs GDP

select country,gdp,
round(solar_consumption + wind_consumption,2) as total_renewable_energy
from Owid_energy_data;
where year>=2021
and Iso_code is not null 
and solar_consumption is not null
and wind_consumption is not null
order by total_renewable_energy DESC
limit 10;



Year-over-Year (YOY) Solar_energy growth rate

with annual_solar as(
select country,year,solar_consumption as current_solar
from Owid_energy_data;
where Iso_code is not null and solar_consumption is not null  and year>=2015)
select t1.country,
t1.year as current_year,
round(t1.current_solar,2)as solar_this_year,
round(t2.current_solar,2) as solar_last_year,
round(((t1.current_solar-t2.current_solar)/t2.current_solar)*100,2)as YOY_solar_growth_percentage
from annual_solar t1
join annual_solar t2
    on t1.country=t2.country
    and t1.year=t2.year+1
    where t1.country='India'
    order by current_year DESC;



    Year-over-Year (YOY) wind_energy growth rate

with annual_wind as(
select country,year,wind_consumption as current_wind
from Owid_energy_data;
where Iso_code is not null and wind_consumption is not null  and year>=2015)
select t1.country,
t1.year as current_year,
round(t1.current_wind,2)as wind_this_year,
round(t2.current_wind,2) as wind_last_year,
round(((t1.current_wind-t2.current_wind)/t2.current_wind)*100,2)as YOY_wind_growth_percentage
from annual_wind t1
join annual_wind t2
    on t1.country=t2.country
    and t1.year=t2.year+1
    where t1.country='India'
    order by current_year DESC;


    Year-over-Year (YOY) biofuel growth rate¶

with annual_biofuel as(
select country,year,biofuel_consumption as current_biofuel
from Owid_energy_data;
where Iso_code is not null and biofuel_consumption is not null  and year>=2015)
select t1.country,
t1.year as current_year,
round(t1.current_biofuel,2)as biofuel_this_year,
round(t2.current_biofuel,2) as biofuel_last_year,
round(((t1.current_biofuel-t2.current_biofuel)/t2.current_biofuel)*100,2)as YOY_biofuel_growth_percentage
from annual_biofuel t1
join annual_biofuel t2
    on t1.country=t2.country
    and t1.year=t2.year+1
    where t1.country='India'
    order by current_year DESC;


    current year solar_global_average

select main.year,round(main.solar_consumption,2)as India_solar,
(select round(avg(sub.solar_consumption),2)
from Owid_energy_data;sub
where sub.year=main.year
and sub.Iso_code is not null)as global_solar_avg
from df main
where main.country='India'
and main.solar_consumption>(
select avg(sub.solar_consumption)
from df sub 
where sub.year = main.year
and sub.Iso_code is not null
)
order by main.year DESC;


current year wind_global_average


select main.year,round(main.wind_consumption,2)as India_wind,
(select round(avg(sub.wind_consumption),2)
from Owid_energy_data; sub
where sub.year=main.year
and sub.Iso_code is not null)as global_wind_avg
from df main
where main.country='India'
and main.wind_consumption>(
select avg(sub.wind_consumption)
from df sub 
where sub.year = main.year
and sub.Iso_code is not null
)
order by main.year DESC;


country by country solar_global_avg


WITH global_average AS (
    SELECT AVG(solar_consumption) AS true_avg
    from Owid_energy_data;
    WHERE year = 2023
      AND iso_code IS NOT NULL
      AND LENGTH(iso_code) = 3
      AND country NOT IN ('World', 'Asia', 'Europe', 'North America', 'European Union', 'High-income countries')
)
SELECT 
    main.country,
    main.year,
    ROUND(main.solar_consumption, 2) AS country_solar
from Owid_energy_data; main, global_average
WHERE main.year = 2023
  AND main.iso_code IS NOT NULL
  AND LENGTH(main.iso_code) = 3
  AND main.country NOT IN ('World', 'Asia', 'Europe', 'North America', 'European Union', 'High-income countries')
  AND main.solar_consumption > global_average.true_avg
ORDER BY country_solar DESC
LIMIT 10;


country by country Wind_global_avg


WITH global_average AS (
    SELECT AVG(wind_consumption) AS true_avg
   from Owid_energy_data;
    WHERE year = 2023
      AND iso_code IS NOT NULL
      AND LENGTH(iso_code) = 3
      AND country NOT IN ('World', 'Asia', 'Europe', 'North America', 'European Union', 'High-income countries')
)
SELECT 
    main.country,
    main.year,
    ROUND(main.wind_consumption, 2) AS country_wind
from Owid_energy_data; main, global_average
WHERE main.year = 2023
  AND main.iso_code IS NOT NULL
  AND LENGTH(main.iso_code) = 3
  AND main.country NOT IN ('World', 'Asia', 'Europe', 'North America', 'European Union', 'High-income countries')
  AND main.wind_consumption > global_average.true_avg
ORDER BY country_wind DESC
LIMIT 10;


country by country biofuel_global_avg


WITH global_average AS (
    SELECT AVG(biofuel_consumption) AS true_avg
    from Owid_energy_data;
    WHERE year = 2023
      AND iso_code IS NOT NULL
      AND LENGTH(iso_code) = 3
      AND country NOT IN ('World', 'Asia', 'Europe', 'North America', 'European Union', 'High-income countries')
)
SELECT 
    main.country,
    main.year,
    ROUND(main.biofuel_consumption, 2) AS country_solar
from Owid_energy_data;main, global_average
WHERE main.year = 2023
  AND main.iso_code IS NOT NULL
  AND LENGTH(main.iso_code) = 3
  AND main.country NOT IN ('World', 'Asia', 'Europe', 'North America', 'European Union', 'High-income countries')
  AND main.biofuel_consumption > global_average.true_avg
ORDER BY main.biofuel_consumption DESC
LIMIT 10;


SELECT main.country, main.year, ROUND(main.biofuel_consumption, 2) AS country_solar
    FROM df as main, global_average
    WHERE main.year = 2023
    AND main.iso_code IS NOT NULL
    AND LENGTH(main.iso_code) = 3
    AND main.country NOT IN ('World', 'Asia', 'Europe', 'North America', 'European Union', 'High-income countries')
    AND main.biofuel_consumption > global_average.true_avg
    ORDER BY country_solar DESC
    LIMIT 10;




