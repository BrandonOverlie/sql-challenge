-- Create departments table and show it
create table departments (
    dept_no varchar primary key not null,
    dept_name varchar
);

select * from departments;

-- Create titles table and show it
create table titles (
    title_id varchar primary key,
    title varchar
);

select * from titles;

-- Create employees table, set the foreign key references and show it
create table employees (
    emp_no int primary key not null,
    emp_title_id varchar,
	birth_date date,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date date,
	foreign key (emp_title_id) references titles (title_id)
);

select * from employees;

-- Create dept_emp table, set the foreign key references and show it
create table dept_emp (
    emp_no int,
    dept_no varchar,
	primary key (emp_no, dept_no),
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no)
);

select * from dept_emp;

-- Create dept_manager table, set the foreign key references and show it
create table dept_manager (
    dept_no varchar,
	emp_no int,
	primary key (emp_no, dept_no),
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no)
);

select * from dept_manager;

-- Create salaries table, set the foreign key references and show it
create table salaries (
    emp_no int primary key not null,
    salary money,
	foreign key (emp_no) references employees (emp_no)
);

select * from salaries;

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
select 