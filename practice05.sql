-- 문제1
SELECT first_name,
       manager_id,
       commission_pct,
       salary
  FROM employees
 WHERE manager_id IS NOT NULL
   AND commission_pct IS NULL
   AND salary > 3000;
   
-- 문제2
SELECT employee_id,
       first_name,
       salary,
       TO_CHAR(hire_date,'YYYY-MM-DD DAY'),
       REPLACE(phone_number,'.','-')
       department_id
  FROM employees
 WHERE (salary,department_id) IN (SELECT MAX(salary),
                                         department_id
                                    FROM employees
                                   GROUP BY department_id)
 ORDER BY salary DESC;
 
 -- 문제3
SELECT employee_id,
       first_name,
       av,
       mi,
       ma
  FROM employees e,(SELECT MAX(salary) ma,
                           MIN(salary) mi,
                           ROUND(AVG(salary)) av,
                           manager_id
                      FROM employees
                     WHERE hire_date >= '2005/01/01'
                     GROUP BY manager_id
                    HAVING AVG(salary) >= 5000
                     ORDER BY AVG(salary) DESC) e2
 WHERE e.employee_id = e2.manager_id;
 
-- 문제4
SELECT e.employee_id,
       e.first_name,
       d.department_name,
       m.first_name
  FROM employees e, employees m, departments d
 WHERE e.manager_id = m.employee_id(+)
   AND e.department_id = d.department_id;

-- 문제 5
SELECT employee_id,
       first_name,
       department_name,
       salary,
       hire_date
  FROM (SELECT ROWNUM rn,
               employee_id,
               first_name,
               department_name,
               salary,
               hire_date
          FROM (SELECT *
                  FROM employees e
                  JOIN departments d
                    ON e.department_id = d.department_id
                 WHERE hire_date >= '2005/01/01'
                 ORDER BY e.hire_date))
 WHERE rn BETWEEN 11 AND 20;
        
-- 문제6
SELECT first_name||' '||last_name 이름,
       salary,
       d.department_name,
       hire_date
  FROM employees e, departments d
 WHERE e.department_id = d.department_id
   AND hire_date = (SELECT MAX(hire_date)
                      FROM employees e);
                

-- 문제7
SELECT employee_id,
       first_name,
       last_name,
       j.job_title,
       salary
  FROM employees e, jobs j
 WHERE e.job_id = j.job_id
   AND e.department_id = (SELECT department_id
                            FROM employees
                           GROUP BY department_id
                          HAVING AVG(salary) = (SELECT MAX(AVG(salary))
                                                  FROM employees
                                                 GROUP BY department_id));
                                                 
-- 문제8
SELECT department_name
  FROM departments
 WHERE department_id = (SELECT department_id
                           FROM employees
                          GROUP BY department_id 
                         HAVING AVG(salary) = (SELECT MAX(AVG(salary))
                                                 FROM employees
                                                GROUP BY department_id));

-- 문제 9          
SELECT region_name
  FROM (SELECT ROWNUM rn,
               region_name
          FROM (SELECT r.region_name
                  FROM locations l, departments d, employees e, countries c,regions r
                 WHERE c.country_id = l.country_id
                   AND l.location_id = d.location_id
                   AND d.department_id = e.department_id
                   AND c.region_id = r.region_id
                 GROUP BY r.region_name
                 ORDER BY AVG(salary) DESC))
 WHERE rn = 1;
 
-- 문제 10

SELECT job_title
  FROM (SELECT ROWNUM rn,
               job_title
          FROM (SELECT job_title
                  FROM jobs j, employees e
                 WHERE j.job_id = e.job_id
                 GROUP BY job_title
                 ORDER BY AVG(salary) DESC))
WHERE rn = 1;
          