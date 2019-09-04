-- Copy the order by exercise and save it as 3.6_functions_exercises.sql.

use employees;
select * from employees;
select * from employees where first_name in('Irena', 'Vidya', 'Maya');
select * from employees where first_name in('Irena', 'Vidya', 'Maya') and gender = "M";
select * from employees where last_name like 'E%';
select * from employees where hire_date between '1990-01-01' and '1999-12-31';
select * from employees where birth_date like '%-12-25';
select * from employees where last_name like '%q%';
select * from employees where first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya';
select * from employees where last_name like '%E' or last_name like 'E%';
select * from employees where last_name like '%E' and last_name like 'E%';
select * from employees where hire_date between '1990-01-01' and '1999-12-31' and birth_date like '%-12-25';
select * from employees where last_name like '%q%' and last_name not like '%qu%';

-- Create a new file named 3.5.2_order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.
-- Modify your first query to order by first name. The first result should be Irena Reutenauer and the last result should be Vidya Simmen.

select * from employees where first_name in('Irena', 'Vidya', 'Maya') order by first_name;

-- Update the query to order by first name and then last name. The first result should now be Irena Acton and the last should be Vidya Zweizig.

select * from employees where first_name in('Irena', 'Vidya', 'Maya') order by first_name, last_name;

-- Change the order by clause so that you order by last name before first name. Your first result should still be Irena Acton but now the last result should be Maya Zyda.

select * from employees where first_name in('Irena', 'Vidya', 'Maya') order by last_name, first_name;

-- Update your queries for employees with 'E' in their last name to sort the results by their employee number. Your results should not change!

select * from employees where last_name like '%E' or last_name like 'E%' order by emp_no;
select * from employees where last_name like '%E' and last_name like 'E%' order by emp_no;

-- Now reverse the sort order for both queries.

select * from employees where last_name like '%E' or last_name like 'E%' order by emp_no desc;
select * from employees where last_name like '%E' and last_name like 'E%' order by emp_no desc;

-- Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who was hired last. It should be Khun Bernini.

select * from employees where hire_date between '1990-01-01' and '1999-12-31' and birth_date like '%-12-25' order by birth_date asc , hire_date desc;

-- Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first and last name together as a single column named full_name.

select concat(first_name, " ", last_name) as full_name from employees where last_name like '%E' and last_name like 'E%' order by emp_no desc;


-- Convert the names produced in your last query to all uppercase.

select concat(upper(first_name), " ", upper(last_name)) as full_name from employees where last_name like '%E' and last_name like 'E%' order by emp_no desc;

-- For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE())

select datediff(now(),hire_date) as days_worked from employees where hire_date between '1990-01-01' and '1999-12-31' and birth_date like '%-12-25' order by birth_date asc , hire_date desc;

-- Find the smallest and largest salary from the salaries table.

select min(salary), max(salary) from salaries;

-- Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born.

select lower(concat(substr(first_name,1,1),substr(last_name,1,4),"_",substr(birth_date,6,2),substr(birth_date,3,2))) as username,first_name,last_name,birth_date from employees;

