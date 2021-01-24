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

SELECT DISTINCT ON (retirement_titles_table.emp_no) 
retirement_titles_table.emp_no, 
retirement_titles_table.first_name,
retirement_titles_table.last_name,
retirement_titles_table.title
INTO Unique_titles
FROM retirement_titles_table
ORDER BY retirement_titles_table.emp_no, retirement_titles_table.to_date DESC;
-- get number of titles
-- get number of titles
SELECT COUNT (title)
FROM Unique_titles;
-- answer 300024
SELECT DISTINCT ON (unique_titles.title, unique_titles.count) 
	unique_titles.count,
	unique_titles.title 
INTO Retiring_titles
	FROM Unique_titles
	GROUP BY unique_titles.title
	ORDER BY unique_titles.count DESC;
SELECT * FROM retiring_titles
-- Deliverable 2
-- Create Mentorship Eligibility Table
SELECT emp_no, first_name, last_name, birth_date
	FROM employees;
SELECT from_date, to_date
	FROM dept_emp;
SELECT title
	FROM titles;
-- JOIN tables
	SELECT employees.emp_no,
       employees.first_name,
       employees.last_name,
	   employees.birth_date,
	   dept_emp.from_date,
	   dept_emp.to_date
	INTO mentorship_eligibility
	FROM employees
	LEFT JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no;
SELECT employees.emp_no,
       employees.first_name,
       employees.last_name,
	   employees.birth_date,
	   titles.title
	INTO mentorship_eligibility2
	FROM employees
	LEFT JOIN titles
	ON employees.emp_no = titles.emp_no;

SELECT mentorship_eligibility.emp_no,
       mentorship_eligibility.first_name,
       mentorship_eligibility.last_name,
	   mentorship_eligibility.birth_date,
	   mentorship_eligibility.from_date,
	   mentorship_eligibility.to_date,
	   titles.title
	INTO mentorship_eligibility3
	FROM mentorship_eligibility
	LEFT JOIN titles
	ON mentorship_eligibility.emp_no = titles.emp_no;
-- JOIN tables
	SELECT mentorship_eligibility.emp_no,
       mentorship_eligibility.first_name,
       mentorship_eligibility.last_name,
	   mentorship_eligibility.birth_date,
	   mentorship_eligibility.from_date,
	   mentorship_eligibility.to_date,
	   titles.title
	INTO mentorship_eligibility3
	FROM mentorship_eligibility
	LEFT JOIN titles
	ON mentorship_eligibility.emp_no = titles.emp_no
	WHERE birth_date BETWEEN '1965-01-01' AND '1965-12-31'
	ORDER BY to_date DESC, emp_no ASC;
	SELECT * FROM mentorship_eligibility3

	
