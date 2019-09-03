use `employees`;

show tables;

show create table employees;

-- 5) int,varchar, enum, date, PRIMARYKEY
-- 6) salaries
-- 7) all except salaries
-- 8) all of themself

-- 9)
show create table departments;

show create table employees;
-- both use varchar variables
-- Linked through data link through a differint table
show create table dept_manager; 
/* 10)CREATE TABLE `dept_manager` (
  `emp_no` int(11) NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1
*/
