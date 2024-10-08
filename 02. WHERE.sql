-- CHAPTER 02. WHERE ��

-- [ WHERE �� �⺻ ��� ��� ]
-- 3. SELECT    ��ȸ�� �÷� ��, ......
-- 1. FROM      ��ȸ�� ���̺� ��
-- 2. WHERE     ��ȸ�� ���� �����ϱ� ���� ���ǽ�;

-- EMPLOYEE_ID �� 105�� ���� ������ ��ȸ
SELECT FIRST_NAME, EMAIL, PHONE_NUMBER
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 105;
 
--���ͷ�(Literal) �̶�?
--> �ҽ� �ڵ忡�� Ư���� �ڷ����� ���� ���� ǥ���ϴ� ����� ���Ѵ�.
--> �ҽ� �ڵ��� ������ ���� ǥ���ϴ� ǥ���

DESC EMPLOYEES;

-- [SQL���� ����ϴ� �ڷ��� ]
-- VARCHAR2(ũ��) : ������ ������ �ڷ���
--> ũ�� ��ŭ �Է� ������ �ִ� ������ ������, ������ ���ͷ��� ǥ�������� ''(��������ǥ)

-- NUMBER(P,S) : ������ �ڷ���
--> P�ڸ���ŭ �Է��� �ް�, S�ڸ���ŭ �Ҽ��� �Է¹޴´�!!
--> EX) NUMBER(3) -> 999, NUMBER(3,2) 9.99
--> ()������ �����ϴ� , ��üũ���� 38ũ�Ⱑ ����, ���������� ()�����ϰ� ���� ����Ѵ�.
--> NUMBER�� �Ǽ��� ���� ��� ǥ���� �����ϴ�.

-- DATE
--> ��¥ ���� �Է� �޴� ��¥�� �ڷ���

-- ���ͷ� �ǽ�
-- ABC��� ������ ���ͷ��� �Է��غ���!
SELECT SALARY, 1000, 'ABC'
  FROM EMPLOYEES;
  
-- ���������( +,-,*,/ )

-- �������̺��� ������ �̸��� �޿��� ������ ������ ���
-- ������ 'AnnSal'�� ��Ī�� ����ؼ� ���

SELECT FIRST_NAME, SALARY, SALARY*12 AS "AnnSal"
  FROM EMPLOYEES;
  
-- �񱳿�����
-- = : ����.
-- > : ���� ũ�� (�ʰ�)
-- >= : ���� ũ�ų� ���� (�̻�)
-- < : ���� �۴� (�̸�)
-- <= : ���� �۰ų� ���� (����)

-- ����1) �μ����̺��� �Ŵ��� ���̵� 100�� �μ��̸��� �μ�ID�� ���
SELECT DEPARTMENT_NAME, DEPARTMENT_ID, MANAGER_ID
  FROM DEPARTMENTS
 WHERE MANAGER_ID=100;
-- ����2) �������̺��� �޿��� 9000�� �޴� ������ �������̵�, �̸� �̸��� ���� ���
SELECT EMPLOYEE_ID, FIRST_NAME, EMAIL, SALARY
  FROM EMPLOYEES
 WHERE SALARY = 9000;
-- ����3) �޿��� 5000 ������ ������ �̸��� �޿� ������ ���
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY <=5000;

-- ����4) ������ 120000 �̻��� ������ �̸��� �޿� �׸��� ������ ������ ���
-- ������ ��Ī�� ����ؼ� ���
SELECT FIRST_NAME, SALARY, SALARY*12 AS "AnnSal"
  FROM EMPLOYEES
 WHERE SALARY*12 >= 120000;
 
-- ����5) ������ ������ IT_PROG�� ������ �� ����ΰ�?
--> ���� : 5��

SELECT JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID='IT_PROG';
 
--���� �� ������
-- !=, <>, ^! : �����ʴ�
 
-- �� �� ������
-- NOT A=B : ���� �ʴ�. > �ڿ� ���� ���ǿ� �ݴ�Ǵ� ����� �ǵ��� �ִ°��̴�.

-- ������ ������ IT_PROG�� �ƴ� ������ ���� ����ΰ�?
-- 102��

SELECT JOB_ID
  FROM EMPLOYEES
 WHERE NOT JOB_ID = 'IT_PROG';
 
 -- �޿��� 8000�� �ƴ� ���� �̸��� �޿� ���� ���
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY !=8000;
 
 -- �Ŵ���ID�� 100�� �ƴ� ������ �������̵�� �̸� ���
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID != 100;
 
 --(����)
-- ��������
--> �ΰ� �̻��� ������ �������ִ� �����ڴ�.

-- AND : ������ ��� �����ϴ� ��� TRUE
-- OR : �ϳ��� �����̶� �����ϴ� ��� TRUE �� ��ȯ (Ȥ��, ~�̰ų�)

-- ����1) �μ��� 90 �̰� �޿��� 5000�̻� �ް� �ִ� ������ ����ID�� �̸��� ��ȸ
SELECT EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID=90 AND SALARY >= 5000;

-- ����2) �μ��� 100�̰ų� �Ի����� 06�� 02�� 02�� ���Ŀ� �Ի��� ������ �̸��� �Ի��� ������ ��ȸ
SELECT FIRST_NAME, HIRE_DATE, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100 OR HIRE_DATE > '06/02/02';
 
-- �������� �켱����
-- AND > OR

-- ������ �̸��� �μ����̵� �׸��� �޿��� ������ �˰� �ʹ�.
-- ������ �μ��� 50�̰ų� 90�� �Ҽӵ� ���� �߿���
-- �޿��� 7000 �̻��� �޾ƾ��Ѵ�.

SELECT FIRST_NAME, DEPARTMENT_ID, SALARY
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID =50 OR DEPARTMENT_ID =90) AND SALARY >= 7000;
 
-- �μ� ID�� 100�̰ų� 90�� �����߿���
-- ���� ID�� 101�� ������ �������̵�, �̸�, ����

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY*12 AS "AnnSal"
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID =100 OR DEPARTMENT_ID=90)AND EMPLOYEE_ID = 101;
 
-- NULL ���� ������
--> IS NULL : ������ ���� NULL�� ���� ��ȸ
--> IS NOT NULL : ������ ���� NULL�� �ƴ� ���� ��ȸ

SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID, COMMISSION_PCT
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL;
 
-- �μ��� ���� ������ �̸��� �����ϱ��?
-- ��������? >>

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NULL;
 
-- ���ӻ���� ���� ������� ������ ��ȸ
SELECT *
  FROM EMPLOYEES
 WHERE MANAGER_ID IS NULL;
 
-- SQL ������
--> SQL������ ����� �� �ִ� �������̴�.
-- IN, BETWEEN, LIKE

-- �μ�ID�� 30�̰ų� 50�̰ų� 90�� ������ �̸��� �μ�ID�� ���
SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID =30 OR DEPARTMENT_ID =50 OR DEPARTMENT_ID =90;
 
-- IN ������
-- Ư�� �÷��� ���Ե� �����͸� ���� �� ��ȸ�� �� ����ϴ� ������
--> = + OR ��� ��
--> IN �����ڴ� NULL���� �����ϴ� Ư���� ������ �־��!!

-- IN ������ Ȱ��
SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN(30,50,NULL);
 
-- �������̺��� ��å�� IT_PROG�̰ų� ST_MAN�� ������ �̸��� ��å������ ��ȸ
SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID IN('IT_PROG','ST_MAN');
 
-- ��ȭ��ȣ�� 650.127.1634, 603.123.6666, 515.123.5555 �� ������
-- �̸��� �Ի��� ���� ��ȸ

SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE PHONE_NUMBER IN('650.127.1634', '603.123.6666', '515.123.5555');
 
-- NOT IN : IN �ڿ� ���ǿ� �ش����� �ʴ� �����͸� ���
-- != + AND

--�μ����̵� 30,50,100�� �ش����� �ʴ� ������ �̸��� �μ� ���̵� ���
SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID NOT IN(30,50,100);
 
--BETWEEN A AND B (A�̻� B������ ���� ���)
--> ���� ���� ���� �����͸� ��ȸ�� �� ���
--> BETWEEN �ּҰ� AND �ִ밪 : �ּҰ� �̻� �ִ밪 ����
--> Ư�� �� ���� �ּ�, �ְ� ������ �����Ͽ� �ش� ���� ���� �����͸� ��ȸ�ϴ� ��

-- �޿��� 10000�̻� 20000������ ���� ������ �ް� �ִ� ������ �̸��� �޿� ���� ��ȸ
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 10000 AND 20000; --BETWEEN A AND B ==> �ּڰ� �̻� �ִ밪 ����
 
-- LIKE ������
--> �Ϻ� ���ڿ��� ���Ե� �����͸� ��ȸ�Ҷ� ���
--> %,_ ��� ���ϵ� ī�带 �̿��ؼ� ��Ī ������ �����Ѵ�.

-- % : ���̿� ������� ��� �����͸� �ǹ�
-- _ : � ���̵� ������� �Ѱ��� ���� �����͸� �ǹ�

-- �������̺��� �ڵ��� ��ȣ�� 650���� �����ϴ� �ڵ��� ��ȣ ã��

SELECT PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE'650%'; 
 
-- FIRST_NAME�� �빮�� S�����ϰ� n ���� ������ ������ �̸� ã��
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE'S%n';
 
-- FIRST_NAME�� it ���� �P���� �� 4������ ������ �̸� ã��
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '__it';
-- �̸��� �ι�° ���ڰ� e�� ������ �̸� ã��
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '_e%';
-- �������̺��� 01���� �Ի��� ����ã��
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE LIKE '__/01%';

SELECT *
  FROM EMP
 WHERE ENAME LIKE'%S';