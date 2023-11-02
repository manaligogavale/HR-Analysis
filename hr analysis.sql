create database project_HR;
use project_HR;
show databases;
show tables;
alter table humhr Rename hr;
select * from hr;
alter table hr change column ï»¿id emp_id varchar(20) null;
desc hr;
select birthdate from hr;

set sql_safe_updates=0;
update hr 
set birthdate = case
when birthdate Like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
when birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
else null
End;
	
alter table hr modify column birthdate date;

set sql_safe_updates=0;
update hr 
set hire_date = case
when hire_date Like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
when hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
else null
End;

select hire_date from hr;
alter table hr modify column hire_date date;

UPDATE hr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != ' ';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;
ALTER TABLE hr add column age int;

update hr set age=timestampdiff(year,birthdate,curdate());
select * from hr;

select min(Age) as yongest, max(age) as oldest from hr;

select count(*) from hr where age <18;