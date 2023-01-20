-- 1. Load the tables in the database and name them as hr.
CREATE DATABASE HR;
USE HR;

-- 2. Find the number of employees working in the ‘Sales’ department. (Use sub-query).
SELECT COUNT(*)
FROM employees_data
where DEPARTMENT_ID = 80;

-- 3. Join the 3 tables and find the country-id wise count of employees and the avg salary. 
-- Which country has the maximum number of employees and which country has the maximum average salary?
select l.COUNTRY_ID, COUNT(e.EMPLOYEE_ID) as Employee_count, AVG(e.SALARY) as Average_Salary
from employees_data e
join department_data d 
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
join locations_data_u l
on d.LOCATION_ID = l.LOCATION_ID
GROUP BY l.COUNTRY_ID
ORDER BY Employee_count DESC, Average_Salary;

-- US is having the maximum number of employees i.e. 68 Employees.
-- DE is having the highest average salary of 10000.

-- 4. Find the top 5 managers according to their salary.

SELECT DISTINCT MANAGER_ID from employees_data
WHERE MANAGER_ID in (SELECT EMPLOYEE_ID from employees_data)
order by SALARY desc 
limit 5;
 

-- 5. Find the department name-wise percentage of employees working under each department. 
-- Which department is having the maximum percentage of employees? 

SELECT DEPARTMENT_NAME, COUNT(EMPLOYEE_ID) as Employees, 
((COUNT(EMPLOYEE_ID)/(SELECT count(*) from employees_data))*100) as PCT
from employees_data e
join department_data d 
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_NAME
ORDER BY Employees DESC;

-- Additional Info : -
-- ----> Month wise no. of employees hired.
SELECT monthname(HIRE_DATE) as Month, COUNT(EMPLOYEE_ID) as No_of_Employees FROM employees_data
GROUP BY month(HIRE_DATE)

-- --->  


