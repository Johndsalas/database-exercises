-- Bonus Find the names of all current employees, their department name, and their current manager's name.
use employees;

select concat(e.first_name, ' ', e.last_name) as employee_name, mn.dept_name as department_name, mn.dept_mgr as department_manager

from employees as e

join current_dept_emp as cde
on e.emp_no = cde.emp_no
and cde.to_date > now()

join departments as d
on d.dept_no = cde.dept_no

join 
(select concat(e.first_name, ' ', e.last_name) as dept_mgr, d.dept_no, d.dept_name

from employees as e

join dept_manager dm
on  e.emp_no = dm.emp_no
and dm.to_date > now()

join departments as d
on dm.dept_no = d.dept_no
) as mn

on d.dept_no = mn.dept_no

order by e.last_name, e.first_name;

 

-- Bonus Find the highest paid employee in each department.