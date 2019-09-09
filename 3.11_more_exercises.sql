-- Employees Database

use employees;

-- How much do the current managers of each department get paid, relative to the average salary for the department? Is there any department where the department manager gets paid less than the average salary?

SELECT dept_name as dertment_name, concat(first_name, ' ', last_name) as full_name, salary as manager_salary, a.avg_salary as a_sal

FROM departments as d

JOIN dept_manager as dm
ON d.dept_no = dm.dept_no

JOIN titles as t
ON dm.emp_no = t.emp_no

JOIN employees as e
ON e.emp_no = t.emp_no

JOIN salaries as s
ON s.emp_no = t.emp_no

join(select avg(salary) as avg_salary from salaries) as a 

WHERE t.title = 'Manager' and dm.to_date > now() and s.to_date > now()

ORDER BY d.dept_name asc;

-- World Database

use world;
describe countrylanguage;
-- Use the world database for the questions below.
-- What languages are spoken in Santa Monica?

select cl.language, cl.percentage
 
from countrylanguage as cl

join city as c
on c.countrycode = cl.countrycode

where c.name = 'santa monica'

order by cl.percentage;

-- How many different countries are in each region?

select region, count(*) as num_countries

from country

group by region

order by count(*);

-- What is the population for each region?

select distinct region, sum(population) as population

from country

group by region

order by sum(population) desc;

-- What is the population for each continent?

select continent, sum(Population) as population

from country

group by continent

order by sum(population) desc;

-- What is the average life expectancy globally?

select avg(lifeExpectancy) from country;

-- What is the average life expectancy for each region, each continent? Sort the results from shortest to longest

select continent, avg(LifeExpectancy)

from country

group by continent

order by avg(LifeExpectancy);

select region, avg(LifeExpectancy)

from country

group by region

order by avg(LifeExpectancy);







