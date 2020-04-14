--Droping the tables

DROP  TABLE IF EXISTS departments CASCADE;
DROP  TABLE IF EXISTS dept_emp CASCADE;
DROP  TABLE IF EXISTS dept_manager CASCADE;
DROP  TABLE IF EXISTS employees CASCADE;
DROP  TABLE IF EXISTS salaries CASCADE;
DROP  TABLE IF EXISTS titles CASCADE;

--Creating the tables

CREATE TABLE departments (
dept_no VARCHAR PRIMARY KEY,
dept_name VARCHAR);

CREATE TABLE employees(
emp_no INT PRIMARY KEY,
birth_date DATE,
first_name VARCHAR,
last_name VARCHAR,
gender VARCHAR,
hire_date DATE);

CREATE TABLE dept_emp(
emp_no INT,
dept_no VARCHAR,
from_date DATE,
to_date DATE,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no));

CREATE TABLE dept_manager(
dept_no VARCHAR, 
emp_no INT, 
from_date DATE,
to_date DATE,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

CREATE TABLE salaries(
emp_no INT,
salary INT,
from_date DATE,
to_date DATE,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

CREATE TABLE titles (
emp_no INT,
title VARCHAR,
from_date DATE,
to_date DATE,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
