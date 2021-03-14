-- List employee number, last name, first name, sex and salary of each employee
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
join salaries
on employees.emp_no = salaries.emp_no;

-- List first name, last name and hire date for employees hired in 1986
select first_name, last_name, hire_date
from employees
where (hire_date between '1986-01-01' and '1986-12-31');

-- List the department number, department name, manager employee number, last name and first name for each manager
select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager
join departments
on dept_manager.dept_no = departments.dept_no
join employees
on dept_manager.emp_no = employees.emp_no;

-- List the employee number, last name, first name and department name of each employee
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
join employees
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no;

-- List the first name, last name and sex for employees with the first name Hercules and last name begins with B
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

-- List the employee number, last name, first name and department name of all employees in the Sales department
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
join employees
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales';

-- List the employee number, last name, first name adn department name of all employees in the Sales and Development departments
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
join employees
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';

-- List the frequency count of employee last names, in descending order
select last_name, count(last_name) as "employee last names count"
from employees
group by last_name
order by "employee last names count" desc;