--RETIREMENT TITLES
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		ts.title,
		ts.from_date,
		ts.to_date
INTO deliverable_1
FROM employees as e
INNER JOIN titles as ts
ON e.emp_no = ts.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

--UNIQUE TITLES
SELECT DISTINCT ON (emp_no)
		rt.emp_no,
		rt.first_name,
		rt.last_name,
		rt.title
INTO UniqueTitles
FROM retirement_titles AS rt
ORDER BY rt.emp_no ASC, rt.to_date DESC;

--RETIRING TITLES
SELECT COUNT (title), title
INTO Retiring_Titles
FROM UniqueTitles
GROUP BY title
ORDER BY COUNT (title) DESC;