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

-- Display the first and last names in all lowercase of all the actors.

use sakila;

select lower(concat(first_name,' ',last_name)) as names

from actor;

-- You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query you could use to obtain this information?

select actor_id, first_name, last_name
from actor
where first_name = "Joe";

-- Find all actors whose last name contain the letters "gen":

select concat(first_name,' ',last_name) as names

from actor

where last_name like "%gen%";

-- Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order.

select first_name, last_name

from actor

where last_name like "%li%"

order by last_name, first_name;

-- Using IN, display the country_id and country columns for the following countries: Afghanistan, Bangladesh, and China:

select country_id, country
from country
where country in('Afghanistan', 'Bangladesh','China');

-- List the last names of all the actors, as well as how many actors have that last name.

select last_name, count(*)
from actor
group by last_name;


-- List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors

select last_name, count(*)
from actor
group by last_name
having count(*) > 1;

-- You cannot locate the schema of the address table. Which query would you use to re-create it?

CREATE TABLE `address` (
  `address_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(50) NOT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `district` varchar(20) NOT NULL,
  `city_id` smallint(5) unsigned NOT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `location` geometry NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `idx_fk_city_id` (`city_id`),
  SPATIAL KEY `idx_location` (`location`),
  CONSTRAINT `fk_address_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8;


-- Use JOIN to display the first and last names, as well as the address, of each staff member.

select staff.first_name, staff.last_name, a.address

from staff

join store
on staff.store_id=store.store_id

join address as a
on a.address_id=store.address_id;

-- Use JOIN to display the total amount rung up by each staff member in August of 2005.

select s.first_name, s.last_name, sum(p.amount)

from staff as s

join payment as p
on s.staff_id=p.staff_id

where p.payment_date like '2005-08-%'

group by s.first_name, s.last_name;

-- List each film and the number of actors who are listed for that film.

select title, count(actor_id)

from film as f

join film_actor as fa
on f.film_id=fa.film_id

group by title;

-- How many copies of the film Hunchback Impossible exist in the inventory system?

select count(i.film_id)

from film as f

join inventory as i
on f.film_id=i.film_id

where f.title = "Hunchback Impossible";
 

-- The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.

select title 

from film
where (title like 'k%' or title like 'q%') and language_id in(
																select language_id
																from language
																where name = "english");
-- Use subqueries to display all actors who appear in the film Alone Trip.

select first_name, last_name

from actor

where actor_id in(
					select actor_id
					from film
					where title = 'Alone Trip');

-- You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers.

select email

from customer

where last_update in (
						select last_update 
						from country
						where country = "canada");
									
								

-- Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films.
select title
from film
where film_id in( 
					select film_id
					from film_category
					where category_id in(
											select category_id 
											from category
											where name = 'family'
					
										)

				);

-- Write a query to display how much business, in dollars, each store brought in.

select s.store_id, sum(amount)

from store as s

join staff as st
on s.store_id=st.store_id

join payment as p
on st.staff_id=p.staff_id

group by s.store_id;

-- Write a query to display for each store its store ID, city, and country.

select st.store_id, ci.city, co.country

from city as ci

join country as co
on ci.country_id=co.country_id

join address as a
on ci.city_id=a.city_id

join store as st
on st.address_id = a.address_id

group by st.store_id;

-- List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)

select c.name, sum(p.amount)

from category as c

join film_category as fc
on fc.category_id=c.category_id

join inventory as i
on i.film_id=fc.film_id

join rental as r
on i.inventory_id=r.inventory_id

join payment as p
on p.rental_id=r.rental_id

group by c.name

order by sum(p.amount) desc

limit 5;

-- SELECT statements
-- Select all columns from the actor table.

select * from actor;

-- Select only the last_name column from the actor table.

select last_name from actor;

-- Select only the following columns from the film table.

select title, description from film;

-- DISTINCT operator
-- Select all distinct (different) last names from the actor table.

select distinct last_name from actor;
	
-- Select all distinct (different) postal codes from the address table.

select distinct postal_code from address;

-- Select all distinct (different) ratings from the film table.

select distinct rating from film;

-- WHERE clause
-- Select the title, description, rating, movie length columns from the films table that last 3 hours or longer.

select title, description, rating, length
from film
where length/60 > 3;

































