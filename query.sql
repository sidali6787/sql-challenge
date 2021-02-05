-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM employees e
JOIN salaries s
USING (emp_no);

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT
    first_name,
    last_name,
    hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT
    d.dept_no,
    d.dept_name,
    dm.emp_no,
    e.last_name,
    e.first_name
FROM dept_manager dm  
JOIN departments d
USING (dept_no)
JOIN employees e
USING (emp_no);

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM dept_manager dm  
JOIN departments d
USING (dept_no)
JOIN employees e
USING (emp_no);

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT 
    first_name,
    last_name,
    sex
FROM employees 
WHERE first_name = 'Hercules' and last_name Like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employees e
JOIN dept_emp 
USING (emp_no)
JOIN departments d
USING (dept_no);

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employees e
JOIN dept_emp 
USING (emp_no)
JOIN departments d
USING (dept_no)
WHERE d.dept_name IN ('Sales', 'Development');

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
    last_name,
    COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;