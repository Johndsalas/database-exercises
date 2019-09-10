-- Select the payment id, amount, and payment date columns from the payments table for payments made on or after 05/27/2005.

select payment_id, amount, payment_date
from payment
where payment_date >= '2005-05-27';

-- Select the primary key, amount, and payment date columns from the payment table for payments made on 05/27/2005.

select payment_id, amount, payment_date
from payment
where payment_date >= '2005-05-27';

-- Select all columns from the customer table for rows that have a last names beginning with S and a first names ending with N.

select *
from customer
where last_name like "s%" and first_name like "%n";

-- Select all columns from the customer table for rows where the customer is inactive or has a last name beginning with "M".

select *
from customer
where last_name like "m%" and active = 0;

-- Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either C, S or T.

select *
from category
where (category_id > 4) and (name like 'c%' or name like 's%' or name like 't%');

-- Select all columns minus the password column from the staff table for rows that contain a password.

select staff_id, first_name, last_name, address_id, picture, email, active, username, last_update
from staff
where password is not null;

-- Select all columns minus the password column from the staff table for rows that do not contain a password.

select staff_id, first_name, last_name, address_id, picture, email, active, username, last_update
from staff
where password is null;

-- IN operator
-- Select the phone and district columns from the address table for addresses in California, England, Taipei, or West Java.

select phone, district
from address
where district in('California', 'England', 'Taipei', 'West Java');


-- Select the payment id, amount, and payment date columns from the payment table for payments made on 05/25/2005, 05/27/2005, and 05/29/2005. (Use the IN operator and the DATE function, instead of the AND operator as in previous exercises.)

select payment_id, amount, payment_date
from payment
where date(payment_date) in('2005-05-25', '2005-05-27', '2005-05-29');

-- Select all columns from the film table for films rated G, PG-13 or NC-17.

select *
from film
where rating in('G','pg-13','nc-17');

-- BETWEEN operator
-- Select all columns from the payment table for payments made between midnight 05/25/2005 and 1 second before midnight 05/26/2005. YYYY-MM-DD HH:MM:SS

select *
from payment
where payment_date between '2005-05-25 00:00:00' and '2005-05-25 23:59:59';


-- Select the following columns from the film table for films where the length of the description is between 100 and 120.
-- Hint: total_rental_cost = rental_duration * rental_rate

select *
from film
where len(description) between 100 and 200;

-- LIKE operator
-- Select the following columns from the film table for rows where the description begins with "A Thoughtful".

select *
from film
where description like "A Thoughtful%";

-- Select the following columns from the film table for rows where the description ends with the word "Boat".

select *
from film
where description like "%boat";


-- Select the following columns from the film table where the description contains the word "Database" and the length of the film is greater than 3 hours.

select *
from film
where description like "%database%";


-- LIMIT Operator

-- Select all columns from the payment table and only include the first 20 rows.

select *
from payment
limit 20;

-- Select the payment date and amount columns from the payment table for rows where the payment amount is greater than 5, and only select rows whose zero-based index in the result set is between 1000-2000.

select payment_date, amount
from payment
where amount > 5
limit 1000 offset 999; 


-- Select all columns from the customer table, limiting results to those where the zero-based index is between 101-200.

select *
from customer
limit 100 offset 100;

-- ORDER BY statement
-- Select all columns from the film table and order rows by the length field in ascending order.

select *
from film
order by length asc; 

-- Select all distinct ratings from the film table ordered by rating in descending order.

select distinct rating
from film
order by rating desc;

-- Select the payment date and amount columns from the payment table for the first 20 payments ordered by payment amount in descending order.

select payment_date, amount
from payment
order by amount desc
limit 20;

-- Select the title, description, special features, length, and rental duration columns from the film table for the first 10 films with behind the scenes footage, under 2 hours in length, and a     rental duration between 5 and 7 days, ordered by length in descending order.

Select title, description, special_features, length, rental_duration
from film
where special_features like "%behind the scenes"; 




















