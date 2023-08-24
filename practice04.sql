-- 문제1
SELECT COUNT(*)
  FROM employees
 WHERE salary < (SELECT AVG(salary)
                   FROM employees);

-- 문제2
SELECT employee_id,
       first_name,
       salary
  FROM employees, (SELECT AVG(salary) av,
                          MAX(salary) ma
                         FROM employees)
 WHERE salary BETWEEN av AND ma;
                   
-- 문제3
SELECT l.location_id,
       l.street_address,
       l.postal_code,
       l.city,
       l.state_province,
       l.country_id
  FROM departments d
  JOIN locations l
    ON d.location_id = l.location_id
 WHERE department_id = (SELECT department_id
                          FROM employees
                         WHERE first_name = 'Steven'
                           AND last_name = 'King');
                           
-- 문제 4
SELECT employee_id,
       first_name,
       salary
  FROM employees
 WHERE salary <ANY (SELECT salary
                      FROM employees
                     WHERE job_id LIKE 'ST_MAN');
                     
-- 문제 5 - 1
SELECT employee_id,
       first_name,
       salary,
       e.department_id
  FROM employees e
 WHERE salary = (SELECT MAX(salary)
                   FROM employees e2
                  WHERE e2.department_id = e.department_id 
                  GROUP BY department_id)
 ORDER BY salary DESC;
 
-- 문제 5 - 2
SELECT e.employee_id,
       e.first_name,
       e.salary,
       e.department_id
  FROM employees e,
       (SELECT MAX(salary) salary,
               department_id
          FROM employees
         GROUP BY department_id) e2
 WHERE e.department_id = e2.department_id
   AND e.salary = e2.salary
 ORDER BY salary DESC;
 
 -- 문제 6
 SELECT e.salary, j.job_title
   FROM jobs j,
        (SELECT MAX(salary) salary,
                job_id
           FROM employees
          GROUP BY job_id) e
  WHERE j.job_id = e.job_id
  ORDER BY e.salary DESC;
  
-- 문제 7
SELECT employee_id,
       first_name,
       salary
  FROM employees e
 WHERE salary > (SELECT AVG(salary)
                   FROM employees e2
                  WHERE e.department_id = e2.department_id
                  GROUP BY department_id);
                  
-- 문제 8
SELECT employee_id,
       first_name,
       salary,
       hire_date
  FROM (SELECT ROWNUM rn,
               employee_id,
               first_name,
               salary,
               hire_date
          FROM (SELECT *
                  FROM employees
                 ORDER BY hire_date))
 WHERE rn BETWEEN 11 AND 15;
 
          