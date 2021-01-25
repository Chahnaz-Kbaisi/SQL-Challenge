# SQL - Employee Database: A Mystery in Two Parts

![sql.png](sql.png)

## Background

This is a research project on employees of the corporation from the 1980s and 1990s, all that remains of the database of employees from that period are six CSV files.

I designed tables to hold data in the CSVs, imported the CSVs into a SQL database, and answered questions about the data. In other words, I performed:

1. Data Engineering

3. Data Analysis

#### [Data Modeling](https://github.com/Chahnaz-Kbaisi/SQL-Employee-Database/tree/main/ERD)

Inspected the CSVs and sketched out an ERD of the tables. The [http://www.quickdatabasediagrams.com](http://www.quickdatabasediagrams.com) was used.

#### [Data Engineering](https://github.com/Chahnaz-Kbaisi/SQL-Employee-Database/blob/main/Analysis/Employees_Data_Engineering.sql)

* Information was used to create a table schema for each of the six CSV files. Data types were specified, primary keys, foreign keys, and other constraints.

  * For the primary keys I checked to see if the column is unique, otherwise I created a [composite key](https://en.wikipedia.org/wiki/Compound_key). 
  * Table were createed in the correct order to handle foreign keys.

* CSV file were imported into the corresponding SQL table. 

#### [Data Analysis](https://github.com/Chahnaz-Kbaisi/SQL-Employee-Database/blob/main/Analysis/Employees_Data_Analysis.sql)

The completed database contained the following analysis:

1. A detailed list of each employee: employee number, last name, first name, sex, and salary.

2. A list of the first name, last name, and hire date for employees who were hired in 1986.

3. A list of the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

4. A list of the department of each employee with the following information: employee number, last name, first name, and department name.

5. A list of the first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

6. A list of all employees in the Sales department, including their employee number, last name, first name, and department name.

7. A list of all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. In descending order, a list of the frequency count of employee last names, i.e., how many employees share each last name.

## [Bonus](https://github.com/Chahnaz-Kbaisi/SQL-Employee-Database/tree/main/Bonus)

The following steps were taken to generate a visualization of the data:

1. A [jupyter notebook](https://github.com/Chahnaz-Kbaisi/SQL-Employee-Database/blob/main/Bonus/Bonus_Analysis.ipynb) was created to import SQL database into Pandas. The code below was used to start:

   ```sql
   from sqlalchemy import create_engine
   engine = create_engine('postgresql://localhost:5432/<your_db_name>')
   connection = engine.connect()
   ```
2. A [histogram](https://github.com/Chahnaz-Kbaisi/SQL-Employee-Database/blob/main/Bonus/Images/Range%20of%20Salaries%20for%20Employees.png) was created to visualize the most common salary ranges for employees.

3. A [bar chart](https://github.com/Chahnaz-Kbaisi/SQL-Employee-Database/blob/main/Bonus/Images/Average%20Salary%20By%20Position.png) was created of average salary by title.


