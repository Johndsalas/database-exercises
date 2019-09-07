-- Employees Database
-- How much do the current managers of each department get paid, relative to the average salary for the department? Is there any department where the department manager gets paid less than the average salary?
-- World Database
-- Use the world database for the questions below.

--  What languages are spoken in Santa Monica?

-- How many different countries are in each region?

-- What is the population for each region?

What is the population for each continent?

What is the average life expectancy globally?

What is the average life expectancy for each region, each continent? Sort the results from shortest to longest

Bonus
Find all the countries whose local name is different from the official name
How many countries have a life expectancy less than x?
What state is city x located in?
What region of the world is city x located in?
What country (use the human readable name) city x located in?
What is the life expectancy in city x?

Sakila Database
Display the first and last names in all lowercase of all the actors.
You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you could use to obtain this information?
Find all actors whose last name contain the letters "gen":
Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order.
Using IN, display the country_id and country columns for the following countries: Afghanistan, Bangladesh, and China:
List the last names of all the actors, as well as how many actors have that last name.
List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
You cannot locate the schema of the address table. Which query would you use to re-create it?
Use JOIN to display the first and last names, as well as the address, of each staff member.
Use JOIN to display the total amount rung up by each staff member in August of 2005.
List each film and the number of actors who are listed for that film.
How many copies of the film Hunchback Impossible exist in the inventory system?
The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
Use subqueries to display all actors who appear in the film Alone Trip.
You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers.
Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films.
Write a query to display how much business, in dollars, each store brought in.
Write a query to display for each store its store ID, city, and country.
List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)

SELECT statements

Select all columns from the actor table.
Select only the last_name column from the actor table.
Select only the following columns from the film table.
DISTINCT operator

Select all distinct (different) last names from the actor table.
Select all distinct (different) postal codes from the address table.
Select all distinct (different) ratings from the film table.
WHERE clause

Select the title, description, rating, movie length columns from the films table that last 3 hours or longer.
Select the payment id, amount, and payment date columns from the payments table for payments made on or after 05/27/2005.
Select the primary key, amount, and payment date columns from the payment table for payments made on 05/27/2005.
Select all columns from the customer table for rows that have a last names beginning with S and a first names ending with N.
Select all columns from the customer table for rows where the customer is inactive or has a last name beginning with "M".
Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either C, S or T.
Select all columns minus the password column from the staff table for rows that contain a password.
Select all columns minus the password column from the staff table for rows that do not contain a password.
IN operator

Select the phone and district columns from the address table for addresses in California, England, Taipei, or West Java.
Select the payment id, amount, and payment date columns from the payment table for payments made on 05/25/2005, 05/27/2005, and 05/29/2005. (Use the IN operator and the DATE function, instead of the AND operator as in previous exercises.)
Select all columns from the film table for films rated G, PG-13 or NC-17.
BETWEEN operator

Select all columns from the payment table for payments made between midnight 05/25/2005 and 1 second before midnight 05/26/2005.
Select the following columns from the film table for films where the length of the description is between 100 and 120.
Hint: total_rental_cost = rental_duration * rental_rate

LIKE operator

Select the following columns from the film table for rows where the description begins with "A Thoughtful".
Select the following columns from the film table for rows where the description ends with the word "Boat".
Select the following columns from the film table where the description contains the word "Database" and the length of the film is greater than 3 hours.
LIMIT Operator

Select all columns from the payment table and only include the first 20 rows.
Select the payment date and amount columns from the payment table for rows where the payment amount is greater than 5, and only select rows whose zero-based index in the result set is between 1000-2000.
Select all columns from the customer table, limiting results to those where the zero-based index is between 101-200.
ORDER BY statement

Select all columns from the film table and order rows by the length field in ascending order.
Select all distinct ratings from the film table ordered by rating in descending order.
Select the payment date and amount columns from the payment table for the first 20 payments ordered by payment amount in descending order.
Select the title, description, special features, length, and rental duration columns from the film table for the first 10 films with behind the scenes footage under 2 hours in length and a rental duration between 5 and 7 days, ordered by length in descending order.
JOINs

Select customer first_name/last_name and actor first_name/last_name columns from performing a left join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
Label customer first_name/last_name columns as customer_first_name/customer_last_name
Label actor first_name/last_name columns in a similar fashion.
returns correct number of records: 599
Select the customer first_name/last_name and actor first_name/last_name columns from performing a /right join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
returns correct number of records: 200
Select the customer first_name/last_name and actor first_name/last_name columns from performing an inner join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
returns correct number of records: 43
Select the city name and country name columns from the city table, performing a left join with the country table to get the country name column.
Returns correct records: 600
Select the title, description, release year, and language name columns from the film table, performing a left join with the language table to get the "language" column.
Label the language.name column as "language"
Returns 1000 rows
Select the first_name, last_name, address, address2, city name, district, and postal code columns from the staff table, performing 2 left joins with the address table then the city table to get the address and city related columns.
returns correct number of rows: 2

What is the average replacement cost of a film? Does this change depending on the rating of the film?

How many different films of each genre are in the database?

What are the 5 frequently rented films?

What are the most most profitable films (in terms of gross revenue)?

Who is the best customer?

Who are the most popular actors (that have appeared in the most films)?

What are the sales for each store for each month in 2005?

-- Bonus: Find the film title, customer name, customer phone number, and customer address for all the outstanding DVDs.


