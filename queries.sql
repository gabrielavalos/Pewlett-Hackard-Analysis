--RETIREMENT ELIGIBILITY
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--RETIREMENT ELIGIBILITY INTO TABLE
SELECT first_name, last_name
INTO retirement_info --new table created
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--RETIREMENT ELIGIBILITY INTO TABLE BY DEPARTMENT
SELECT emp_no, first_name, last_name
INTO retirement_info --new table created
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--INNER JOIN 
SELECT departments.dept_name, 
		managers.emp_no, 
		managers.from_date, 
		managers.to_date
FROM managers 
INNER JOIN departments
ON managers.dept_no = departments.dept_no;


--LIST OF EMPLOYEES RETIRING FROM SALES & DEV DEPT
SELECT ri.emp_no,
		ri.first_name,
		ri.last_name,
		d.dept_no
INTO sales_dev_retirement
FROM retirement_info as ri
LEFT JOIN employee_department as d
ON (ri.emp_no = d.emp_no)
WHERE d.dept_no IN ('d007', 'd005');

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
--INTO manager_info
FROM managers AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);


SELECT emp_no,
    	first_name,
		last_name,
    	gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');