-- create database
-- create database employee_management;

use employee_management;
-- drop existing tables
drop table if exists projects,employees,departments;

-- start transaction
start transaction;
-- Table 1
create table departments (
	department_id int primary key auto_increment,
    department_name varchar(100) not null unique,
    location varchar(100));

-- Table 2 
create table employees (
employee_id int primary key auto_increment,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    email varchar(30) not null unique,
    job_title varchar(100) ,
    department_id int not null,
	foreign key (department_id)
       references departments(department_id)
);	

-- Table 3
create table projects (
	project_id int primary key auto_increment,
	project_name varchar(50),
     department_id INT NOT NULL,
     foreign key (department_id)
       references departments(department_id)
       );
       
-- Insert data into Departments
insert into departments (department_name, location)
values
    ('IT', 'New York'),
    ('Human Resources', 'Chicago'),
    ('Finance', 'Dallas');
    
insert into employees
    (first_name, last_name, email, job_title, department_id)
values
    ('John', 'Smith', 'john@example.com', 'Developer', 1),
    ('Mary', 'Johnson', 'mary@example.com', 'HR Manager', 2);
    
-- Insert data into Projects
insert into Projects (project_name , department_id)
values
    ('Website Development', 1),
    ('Employee Training', 2),
    ('Budget Planning', 3);
    

-- commit the transaction
commit;
  
select * from departments;
select * from employees;
select * from projects;



 