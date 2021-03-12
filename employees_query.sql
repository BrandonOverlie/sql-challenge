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

create table dept_emp (
    emp_no int,
    dept_no varchar,
	primary key (emp_no, dept_no),
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no)
);

select * from dept_emp;

create table dept_manager (
    dept_no varchar,
	emp_no int,
	primary key (emp_no, dept_no),
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no)
);

select * from dept_manager;

create table salaries (
    emp_no int primary key not null,
    salary money,
	foreign key (emp_no) references employees (emp_no)
);

select * from salaries;

create table titles (
    title_id varchar primary key,
    title varchar
);

select * from titles;

create table departments (
    dept_no varchar primary key not null,
    dept_name varchar
);

select * from departments;

