--SQL Homework - Employee Database: A Mystery in Two Parts
--Date Modeling/Engineering
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;

--Table 1:
--Creating the Departments table:
CREATE TABLE departments (
	dept_no VARCHAR(255) NOT NULL,
	dept_name VARCHAR(225) NOT NULL,
	PRIMARY KEY(dept_no) 	
);
SELECT * FROM departments;
--Table 2:
--Creating the Titles table for employees and their titles:
CREATE TABLE titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR(255) NOT NULL,
	PRIMARY KEY (title_id) 
);
SELECT * FROM titles;
--Table 3:
--Creating the Empolyees table that has list of employees information:
CREATE TABLE employees (
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR(255) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	sex CHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);
SELECT * FROM employees;
----Table 4:
--Creating the Department Employees table which holds employees and their department number:
CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(255) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)	
);
SELECT * FROM dept_emp;
--Table 5:
--Creating the Department Managers table that has a list of all managers and their department numbers:
CREATE TABLE dept_manager (
	dept_no VARCHAR(255) NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),	
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
SELECT * FROM dept_manager;
--Table 6:
--Creating the Salaries table which contains employees and salary details:
CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	salary BIGINT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
SELECT * FROM salaries;

--Assigning Foreign Keys and Primary Keys:
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");
----------------------------------------------------------------------------------------------------
