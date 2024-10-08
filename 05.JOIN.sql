-- CHAPTER 05.JOIN

-- JOIN �̶� : ���� ���̺��� �ʿ��� �����͸� �ѹ��� �������� ���

-- ������(Non EQUI JOIN)
--> �ΰ��� ���̺� ���� ���� ��Ȯ�ϰ� ��ġ���� �ʴ� ��� Ȱ���ϴ� ����
--> �������(=) �� �ƴ� �����ڵ��� ����� ������ �ǹ�(>, >=, <, <=, BETWEEN)

-- �����(EQUI JOIN)
-- �ΰ��� ���̺� ���� ���� ��Ȯ�ϰ� ��ġ�ϴ� ��� Ȱ���ϴ� ����
--> � ������(=)�� ����ؼ� ������ �ǹ�(=)
--> ���� ���� ����ϴ� ������ ����

-- ������� �����
-- SELECT ���̺�1.�÷� ���̺�2.�÷� --> (DOT)-> ��θ� ���ؼ� ���ϴ� ���̺��� �÷� ��ȸ
--   FROM ���̺�1, ���̺�2 -- ���̺�1�� ���̺�2�� JOIN �ϰڴ�.
--  WHERE ���̺�1.Į�� = ���̺�2.�÷�; --> ���� ������ WHERE���� �ۼ�

-- �������̺��� �����̸��� �μ����̺��� �μ��̸��� ���

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

-- SELECT ���̺�1.�÷�, ���̺�2.�÷�
--   FROM ���̺�1, ���̺�2
--  WHERE ���̺�1.�÷� = ���̺�2.�÷�;

-- �������̺� ���� �̸��� �ش� ������ �ش��ϴ� �μ��̸��� ����ؿͶ�.
-- 1. ������ ��� ���̺��� ������ Ȯ��
-- 2. FROM���� ������ ���̺���� ,(�޸�)�� �̿��ؼ� �ۼ�
-- 3. ���� ������ �Ǵ� Ư�� �÷��� Ȯ���Ͽ�, WHERE �������� ���� ������ �ۼ�
-- ���� ������ �Ǵ� Ư�� �÷��� Ȯ���Ͽ�, WHERE �������� ���� ������ �ۼ�
-- ���� ������ �Ǵ� �÷��� ���� PK�� FK����� �̷���� �ִ�
-- �ٸ� �� �׷����� �ƴϰ� ������ ����� �����ϴ� ��쵵 �ִ�.
-- 4. SELECT���� .(���)�� ���ؼ� ���̺� �����ؼ� ���ϴ� �÷��� ��ȸ
SELECT EMPLOYEES.FIRST_NAME, DEPARTMENTS.DEPARTMENT_NAME
  FROM EMPLOYEES, DEPARTMENTS
 WHERE EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID
 ORDER BY EMPLOYEES.DEPARTMENT_ID DESC;
 
-- ����ID, FIRST_NAME, �μ����� ���

SELECT EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.FIRST_NAME, DEPARTMENTS.DEPARTMENT_NAME
  FROM EMPLOYEES, DEPARTMENTS
 WHERE EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID
ORDER BY EMPLOYEES.DEPARTMENT_ID DESC;

-- ��Ī ����ؼ� ���

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
ORDER BY E.DEPARTMENT_ID DESC;

-- ANSI ���� ���� : �̱� ǥ����ȸ���� ���� ��� DBMS���� ��� ������ �����̴�.

-- INNER JOIN : ���������̶�� �ϸ� ���� ���ǿ��� ������ ���� �ִ� �ุ ��ȯ. == EQUI ���ΰ� ������ �����̴�.

-- INNER JOIN �����
-- SELECT ���̺�1.�÷�, ���̺�2.�÷�
-- FROM ���̺�1 INNER JOIN ���̺�2
-- ON (���̺�1.�÷� = ���̺�2.�÷�);
-- WHERE �Ϲ� ������ �ۼ�

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID AND D.DEPARTMENT_NAME = 'Sales';

-- INNER JOIN�� Ȱ���ؼ� �ۼ� �غ�����.
-- �μ����� SALES�� ������ ����غ�����.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D 
    ON(E.DEPARTMENT_ID=D.DEPARTMENT_ID)
 WHERE D.DEPARTMENT_NAME = 'Sales';
 
-- CROSS JOIN : ���� �������� ���� �ʰ� ���̺��� ��� �����͸� ������ ���� ���
-- ���� ������ ���� ��� ���� �� �ִ� ��� �������� ������ ��ȸ
--> īƼ�� ���̶�� �θ���
--> īƼ�� �� : ��� ����� ���� �߻��ϴ� ��

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME, E.DEPARTMENT_ID
  FROM EMPlOyEES E CROSS JOIN DEPARTMENTS D;

--> �������̺��� ���� ���� (107) x �μ����̺��� ���� ����(27) = 2889�� ���� ���´�.

-- OUTER JOIN : �ܺ� �����̶�� �ϸ�, �ΰ��� ���̺� ���� �������� ��ȸ�ϰ�
-- ���� ���̺��� �ִ� �����͵� ���Խ��Ѽ� ��ȸ�ϰ� ������ ����ϴ� ���� ����
--> ���ʵ������� NULL���� ����ϰ� ������ ���

SELECT * FROM EMPLOYEES;
SELECT * FROM JOBS;

-- �������̺��� ����ID, �̸��� ��å�� �׸��� �������̺��� ��å����

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE
  FROM EMPLOYEES E,JOBS J
 WHERE E.JOB_ID = J.JOB_ID
ORDER BY E.EMPLOYEE_ID;

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE
  FROM EMPLOYEES E INNER JOIN JOBS J
    ON E.JOB_ID = J.JOB_ID
ORDER BY E.EMPLOYEE_ID;

-- PK �� FK ���谡 �ƴ� ������ ����� ������ �ϴ� ��쵵 �־��!!

-- ��������
-- ���� ���̺��� �ǹ��ִ� ������ ������ �����ϴ� ���
-- �ݵ�� ���̺��� ��Ī�� ����ؼ� ����ؾ��Ѵ�.

SELECT * FROM EMPLOYEES;

-- �� ������ ��� �̸��� ���
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.MANAGER_ID, B.FIRST_NAME
  FROM EMPLOYEES A, EMPLOYEES B
 WHERE A.MANAGER_ID = B.EMPLOYEE_ID
ORDER BY A.EMPLOYEE_ID;

SELECT * FROM DEPARTMENTS;

-- �� �μ��� �μ��� �̸��� ��ȸ

SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.EMPLOYEE_ID = D.MANAGER_ID
ORDER BY D.MANAGER_ID;

-- ANSI ���� �������� INNER JOIN�� Ȱ���Ͽ� Ǯ�����!

SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON (E.EMPLOYEE_ID = D.MANAGER_ID)
ORDER BY D.MANAGER_ID;

-- RIGHT OUTER JOIN 
-- ������ ���̺��� �������� NULL���� �����Ͽ� ���
-- ����Ŭ ���� ���ν� : ���� �������� �ݴ��� �����÷��� (+)��ȣ�� �ۼ�
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON (E.EMPLOYEE_ID = D.MANAGER_ID)
ORDER BY D.MANAGER_ID;

-- ����Ŭ ���� ���� ��
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON (E.EMPLOYEE_ID = D.MANAGER_ID)
ORDER BY D.MANAGER_ID;


-- LEFT OUTER JOIN
-- ���� ���̺��� �������� NULL���� �����Ͽ� ���
-- ����Ŭ ���� ���ν� : ���� �������� �ݴ��� ������ �÷��� (+);

SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D LEFT JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID)
ORDER BY D.MANAGER_ID;

-- ����Ŭ ������
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D ,EMPLOYEES E
 WHERE D.MANAGER_ID = E.EMPLOYEE_ID(+)
ORDER BY D.MANAGER_ID;

-- FULL OUTER JOIN
--> ������ NULL���� �����Ͽ� ���
--> ����Ŭ �������� ��������

SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D FULL JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID)
ORDER BY D.MANAGER_ID;

--����ǥ��
SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME
  FROM COUNTRIES C INNER JOIN LOCATIONS L 
    ON (C.COUNTRY_ID= L.COUNTRY_ID) INNER JOIN DEPARTMENTS D ON (L.LOCATION_ID=D.LOCATION_ID);
 
--����Ŭ��   
SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME
  FROM COUNTRIES C , LOCATIONS L , DEPARTMENTS D
 WHERE C.COUNTRY_ID= L.COUNTRY_ID AND L.LOCATION_ID=D.LOCATION_ID;    
 
-- ����

-- ���� �����
-- SELECT   ���̺�1.�÷���, ���̺�2.�÷� -> ���ϴ� �÷��� ��ȸ
-- FROM     ���̺�1, ���̺�2 --> ���̺�1�� ���̺�2�� �����ϰڴ�.
-- WHERE    ���̺�1.�÷� = ���̺�2.�÷� --> �������� ���

SELECT ����������.�л�ID, ����������.�л��̸�, ����ǥ.����, ����ǥ.����
  FROM ����������, ����ǥ -- CROSS JOIN
 WHERE ����������.�л�ID = ����ǥ.�л�ID;
 
SELECT A.�л�ID, A.�л��̸�, B.����, B.����
  FROM ���������� A, ����ǥ B
 WHERE A.�л�ID = B.�л�ID;
 
-- ANSI JOIN ���� -- INNER JOIN
SELECT A.�л�ID, A.�л��̸�, B.����, B.����
  FROM ���������� A JOIN ����ǥ B
    ON A.�л�ID = B.�л�ID;
    
SELECT A.�л�ID, A.�л��̸�, B.����, B.����
  FROM ���������� A JOIN ����ǥ B
    ON A.�л�ID = B.�л�ID AND A.�л��̸� IN('���ؿ�','�ں���');    
    
SELECT A.�л�ID, A.�л��̸�, B.����, B.����
  FROM ���������� A, ����ǥ B
 WHERE A.�л�ID = B.�л�ID AND A.�л��̸� IN('���ؿ�','�ں���');
       
-- �� �μ��� �Ŵ��� �������� �μ��̸�, �Ŵ������̵�, �̸� ���

SELECT * FROM DEPARTMENTS;

SELECT D.DEPARTMENT_NAME, E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE D.MANAGER_ID = E.EMPLOYEE_ID;
 
SELECT D.DEPARTMENT_NAME, E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME
  FROM DEPARTMENTS D JOIN EMPLOYEES E
    ON D.MANAGER_ID = E.EMPLOYEE_ID;
    
SELECT D.DEPARTMENT_NAME, E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE D.MANAGER_ID = E.EMPLOYEE_ID(+);
 
SELECT D.DEPARTMENT_NAME, E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME
  FROM DEPARTMENTS D LEFT JOIN EMPLOYEES E
    ON D.MANAGER_ID = E.EMPLOYEE_ID;
 