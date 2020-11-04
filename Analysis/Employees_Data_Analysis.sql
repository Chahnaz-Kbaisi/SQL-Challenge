--SQL Homework - Employee Database: A Mystery in Two Parts
--Data Analysis
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no AS "Employee Number", 
		e.last_name AS "Last Name", 
		e.first_name AS "First Name", 
		e.sex AS "Sex", 
		s.salary AS "Salary"
FROM employees AS e 
LEFT JOIN salaries AS s
ON s.emp_no = e.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, 
		last_name, 
		hire_date
FROM employees
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no "Manager Department Number", 
 		d.dept_name AS "Manager Department Name", 
		e.emp_no AS "Manager Employee Number", 
		e.first_name AS "Manager Last Name",
		e.last_name AS "Manager First Name"
FROM departments AS d
LEFT JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no
LEFT JOIN employees AS e
ON dm.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee Number",
		e.last_name AS "Employee Last Name",
		e.first_name AS "Employee First Name",
		d.dept_name AS "Employee Department Name"
FROM employees AS e
LEFT JOIN dept_emp AS de
ON de.emp_no = e.emp_no
RIGHT JOIN departments AS d
ON d.dept_no = de.dept_no; 

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, 
		last_name,
		sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee Number",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		d.dept_no AS "department Name"
FROM employees AS e
JOIN dept_emp As de
ON de.emp_no = e.emp_no
INNER JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee Number", 
		e.last_name AS "Employee Last Name",
		e.first_name AS "Employee First Name",
		d.dept_name AS "Department Name"
FROM employees As e
LEFT JOIN dept_emp AS de
ON de.emp_no = e.emp_no 
INNER JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE dept_name IN ('Sales', 'Development');

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name AS "Employee Last Name",
COUNT(last_name) AS "Frequency Count"
FROM employees 
GROUP BY last_name
ORDER BY "Frequency Count" DESC;
__________________________