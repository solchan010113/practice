-- ���� 1
SELECT employee_id, first_name, last_name, hire_date
FROM employees;

-- ���� 2
SELECT employee_id, first_name, last_name, hire_date
FROM employees
ORDER BY employee_id;

-- ���� 3
SELECT employee_id, first_name, last_name, hire_date
FROM employees
ORDER BY hire_date DESC, employee_id;

-- ���� 4
SELECT first_name ||' '|| last_name "�� ��", phone_number, hire_date, salary, department_id
FROM employees;

-- ���� 5
SELECT first_name ||' '|| last_name "�� ��", phone_number, hire_date, salary, department_id
FROM employees
ORDER BY hire_date DESC;

-- ���� 6
SELECT first_name ||' '|| last_name "�� ��", phone_number, hire_date, salary, department_id
FROM employees
ORDER BY department_id;

-- ���� 7
SELECT first_name ||' '|| last_name "�� ��", phone_number, hire_date, salary, department_id
FROM employees
ORDER BY department_id, hire_date;

-- ���� 8
SELECT first_name ||' '|| last_name "�� ��", phone_number, hire_date, salary, nvl(department_id, 0)
FROM employees
ORDER BY department_id, hire_date;

-- ���� 9
SELECT first_name||' '||last_name "�̸�", salary "����", phone_number "��ȭ-��ȣ", hire_date "�Ի���"
FROM employees
ORDER BY hire_date;

-- ���� 10
SELECT last_name, salary
FROM employees
WHERE salary >= 12000;

-- ���� 11
SELECT last_name, salary
FROM employees
WHERE salary >= 12000
ORDER BY salary DESC;

-- ���� 12
SELECT last_name, salary
FROM employees
WHERE salary >= 12000
ORDER BY salary DESC, hire_date;

-- ���� 13
SELECT UPPER(first_name), UPPER(last_name), TO_CHAR(hire_date, 'DD-MM-YYYY')
FROM employees
WHERE hire_date > '2007-01-01';

-- ���� 14
SELECT employee_id, last_name, department_id
FROM employees
WHERE employee_id = 100;

-- ���� 15
SELECT employee_id, last_name, department_id
FROM employees
WHERE employee_id BETWEEN 100 AND 199;

-- ���� 16
SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;

-- ���� 17
SELECT last_name, TO_CHAR(hire_date,'YYYY-MM-DD')
FROM employees
WHERE hire_date between '2007-01-01' AND '2007-12-31'
ORDER BY hire_date DESC;

-- ���� 18
SELECT *
FROM employees
WHERE salary IN(2500,3500,7000);

-- ���� 19
SELECT *
FROM employees
WHERE salary NOT IN(2500,3500,7000);

-- ���� 20
SELECT *
FROM employees
WHERE salary NOT IN(2500,3500,7000)
AND job_id = 'SA_REP';

-- ���� 21
SELECT *
FROM employees
WHERE salary NOT IN(2500,3500,7000)
AND job_id IN('SA_REP','ST_CLERK');

-- ���� 22
SELECT last_name, department_id
FROM employees
WHERE department_id IN(20,50)
ORDER BY last_name;


-- ���� 23
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 5000 AND 12000;

-- ���� 24
SELECT first_name, employee_id
FROM employees
WHERE first_name LIKE'%a%' OR first_name LIKE'%e%';

-- ���� 25
SELECT first_name, employee_id
FROM employees
WHERE first_name LIKE'J%' AND first_name LIKE'%n';

-- ���� 26
SELECT first_name, employee_id, phone_number
FROM employees
WHERE first_name LIKE'J__n';

-- ���� 27
SELECT last_name, salary,commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;

-- ���� 28
SELECT last_name, job_id
FROM employees
WHERE manager_id IS NOT NULL;

-- ���� 30
SELECT employee_id "���",first_name "�̸�",salary "����", salary/12 "����", salary/12*0.033 "����", salary-salary/12*0.033 "�Ǽ��ɾ�"
FROM employees;

-- ���� 31
SELECT job_title, max_salary
FROM jobs
ORDER BY max_salary DESC;

-- ���� 32
SELECT first_name, manager_id, commission_pct, salary
FROM employees
WHERE manager_id IS NOT NULL 
AND commission_pct IS NULL;

-- ���� 33
SELECT job_title, max_salary
FROM jobs
WHERE max_salary >= 10000
ORDER BY max_salary DESC;

-- ���� 34
SELECT first_name, salary, commission_pct
FROM employees
WHERE salary BETWEEN 10000 AND 13999;

-- ���� 35
SELECT first_name, salary, TO_CHAR(hire_date,'YYYY-MM-DD HH:MI:SS')||' (��-��)', department_id
FROM employees
WHERE first_name LIKE'J__n';

-- ���� 36
SELECT first_name, salary
FROM employees
WHERE UPPER(first_name) LIKE '%S%';

-- ���� 37
SELECT *
FROM departments
ORDER BY LENGTH(department_name) DESC;

-- ���� 38
SELECT UPPER(country_name)
FROM countries
WHERE region_id IS NOT NULL
ORDER BY country_name;

-- ���� 39
SELECT first_name, salary, REPLACE(phone_number,'.','-'), hire_date
FROM employees
WHERE hire_date < '2003/12/03';
