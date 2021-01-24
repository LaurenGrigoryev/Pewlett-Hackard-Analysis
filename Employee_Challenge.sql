-- Creating tables for Employee_DB
CREATE TABLE Employees (
     emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
	 first_name VARCHAR NOT NULL,
	 last_name VARCHAR NOT NULL,
	 gender VARCHAR NOT NULL,
	 hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
     );
CREATE TABLE Departments (
     dept_no VARCHAR NOT NULL,
	 dept_name VARCHAR NOT NULL,
     PRIMARY KEY (dept_no),
	 UNIQUE (dept_name)
     );
CREATE TABLE Dept_Emp (
     emp_no INT NOT NULL,
     dept_no VARCHAR NOT NULL,
	 from_date DATE NOT NULL,
	 to_date DATE NOT NULL,
     FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	 FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
     PRIMARY KEY (emp_no, dept_no)
     );	 
CREATE TABLE Dept_Manager (
dept_no VARCHAR NOT NULL,     
emp_no INT NOT NULL,
	 from_date DATE NOT NULL,
	 to_date DATE NOT NULL,
     FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	 FOREIGN KEY (dept_no) REFERENCES Departments (dept_no),
	 PRIMARY KEY (dept_no, emp_no, from_date, to_date)
     );
CREATE TABLE Salaries (
     emp_no INT NOT NULL,
     salary INT NOT NULL,
	 from_date DATE NOT NULL,
	 to_date DATE NOT NULL,
     FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	 PRIMARY KEY (emp_no)
     );
CREATE TABLE Titles (
     emp_no INT NOT NULL,
     title VARCHAR NOT NULL,
	 from_date DATE NOT NULL,
	 to_date DATE NOT NULL,
     FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	 PRIMARY KEY (emp_no, title, from_date)
     );
-- Select into new table

SELECT emp_no, first_name, last_name
	INTO retirement_info
	FROM employees;
SELECT title, from_date, to_date
	INTO retirement_info
	FROM titles;
-- JOIN tables
	SELECT retirement_titles.emp_no,
       retirement_titles.first_name,
       retirement_titles.last_name,
       titles.title,
       titles.from_date,
       titles.to_date
	INTO retirement_titles_table
	FROM retirement_titles
	LEFT JOIN titles
	ON retirement_titles.emp_no = titles.emp_no;
	SELECT * FROM retirement_titles_table
-- Filter on birth_date
SELECT * FROM employees 
	WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	ORDER BY employees.emp_no
-- Use Distinct with Orderby to remove duplicate rows
SELECT emp_no, first_name, last_name, title
	FROM retirement_titles_table
SELECT DISTINCT ON (retirement_titles_table.emp_no) retirement_titles_table.emp_no 
retirement_titles_table.first_name,
retirement_titles_table.last_name,
retirement_titles_table.title
INTO Unique_titles
FROM retirement_titles_table as r
ORDER BY r.emp_no, r.to_date DESC;

