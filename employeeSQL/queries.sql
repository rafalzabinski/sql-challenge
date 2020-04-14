-- Importing the data

COPY departments FROM '/Applications/PostgreSQL 12/temp-data/departments.csv' DELIMITER ',' CSV HEADER;
COPY employees FROM '/Applications/PostgreSQL 12/temp-data/employees.csv' DELIMITER ',' CSV HEADER;
COPY salaries FROM '/Applications/PostgreSQL 12/temp-data/salaries.csv' DELIMITER ',' CSV HEADER;
COPY titles FROM '/Applications/PostgreSQL 12/temp-data/titles.csv' DELIMITER ',' CSV HEADER;
COPY dept_emp FROM '/Applications/PostgreSQL 12/temp-data/dept_emp.csv' DELIMITER ',' CSV HEADER;
COPY dept_manager FROM '/Applications/PostgreSQL 12/temp-data/dept_manager.csv' DELIMITER ',' CSV HEADER;

-- Analysis --

--1. List the following details of each employee: employee number, last name, first name, 
--gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

--2. List employees who were hired in 1986.

SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

-- 3. List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name, and start and
--end employment dates.

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, 
employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM departments 
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_emp on dept_emp.emp_no = employees.emp_no
JOIN departments on departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_emp on dept_emp.emp_no = employees.emp_no
JOIN departments on departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e.,
--how many employees share each last name.

SELECT last_name, COUNT(*) AS "frequency_count"
FROM employees
GROUP BY last_name
ORDER BY frequency_count DESC;





