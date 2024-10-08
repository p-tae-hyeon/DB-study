--CHAPTER 01. SELECT

-- �ּ� ��ȣ

-- ��¥ ũ�� Ű��� : ���� > ȯ�漳�� > �ڵ������� > �۲�
-- �ּ� ���� �ٲٱ� : ���� > ȯ�漳�� > �ڵ������� > PL/SQL�ּ�

-- �ּ�����(2) : /**/ --> �������� �ѹ��� �ּ�ó�� �Ҽ��ִ� �ּ� ��ȣ

/*
1. SQL���忡�� ��ҹ��ڸ� �������� �ʴ´�. 
2. ���⳪ �ٹٲ� ���� ��ɾ� ���࿡ ������ ���� �ʴ´�.
3. SQL ���� ������ �� �����ݷ�(;)�� ������ �Ѵ�!.
4. SQL ���� ����Ű�� : CTRL + ENTER, F9
*/
SELECT FIRST_NAME
  FROM EMPLOYEES;
-- �������̺��� ����ID, �����̸�(FIRST_NAME, LAST_NAME), �޿�(SALARY)�� ������ ��ȸ.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
  FROM EMPLOYEES;  
-- �μ����̺��� �μ����̵�, �μ��̸��� ��ȸ
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
  FROM DEPARTMENTS;
  
-- [ SELECT �� �⺻ ��� ��� ]
-- SELECT ��ȸ�� �÷� ��1,... ��ȸ�� �÷���N
-- FORM ��ȸ �� ���̺� ��

DESC EMPLOYEES;

-- DESC(Describe) : SQL���� ���Ǵ� �����ͺ��̽� ���̺��� ������ Ȯ���ϴ� ��ɾ�!!

DESC DEPARTMENTS;

-- * (��ü��ȸ) : �ƽ�Ÿ����ũ ��� �д´�.

-- ���� ���̺��� ��ü ���� ����ϱ�
SELECT *
  FROM EMPLOYEES;
-- �μ� ���̺��� ��ü ���� ���
SELECT *
  FROM DEPARTMENTS;
-- ���� ���̺��� ��ü ���� ���
SELECT *
  FROM JOBS;
-- ���� ���̺��� �������̵�, �̸���, �Ŵ������̵�, �μ����̵�, �̸�(FIRST_NAME) ������� ���
SELECT EMPLOYEE_ID, EMAIL, MANAGER_ID, DEPARTMENT_ID, FIRST_NAME
  FROM EMPLOYEES;
  
-- ���� ���̺��� �μ����̵� ��ȸ.
SELECT DEPARTMENT_ID
  FROM EMPLOYEES;
  
--DISTINCT : ������ �ߺ� ����

-- SELECT[ALL(DEFAULT��) / DISTINCT] ��ȸ�� �÷���

SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES;
  
-- �������̺��� ����ID�� �ߺ��� �����Ͽ� ������ �� ��� �ִ��� Ȯ�����ּ���
SELECT DISTINCT JOB_ID
  FROM EMPLOYEES; -- 19��
  
-- �������̺��� JOB_ID�� �μ�ID�� �ߺ��� �����Ͽ� ���
SELECT DISTINCT JOB_ID, DEPARTMENT_ID
  FROM EMPLOYEES;

-- ���� �÷��� �ߺ��� �־ �ٸ� �� �÷��� ���� �ٸ��� �ٸ��� ����ؿ�.

-- * TIP ) �÷��� ������ �������̰ų� ��¥���̸� ���ڿ����� �����ϴ�.(+, -, *, /)
DESC EMPLOYEES;

SELECT FIRST_NAME, SALARY
     , SALARY * 12  
  FROM EMPLOYEES;
  
-- ��Ī ����ϱ�
-- ALIAS ��� �ϸ� �Ѵ��� ���� ���� ���� �Ҽ� �ִ�.
-- AS Ű���带 ����Ͽ� ��Ī�� �����Ѵ�.

-- ��Ī ��� ��� 4����
-- 1. SELECT �÷��� ��Ī
-- 2. SELECT �÷��� "��Ī"
-- 3. SELECT �÷��� AS ��Ī
-- 4. SELECT �÷��� AS "��Ī"

-- #_$�� ��밡��

SELECT FIRST_NAME AS �̸�, SALARY AS �޿�,SALARY * 12 AS ����
  FROM EMPLOYEES;
  
SELECT * FROM EMPLOYEES;

-- �������̺��� �Ի���(HIRE_DATE) ���, �Ի��� �������� ���
SELECT HIRE_DATE AS �Ի���, HIRE_DATE+1 AS "�Ի��� ������"
  FROM EMPLOYEES;
  
-- ORDER BY ��
--> Ư�� �÷��� �������� ���ĵ� ���·� ����ϰ��� �Ҷ� ����Ѵ٤�
--> SQL����������� ���� �������� ���� �ȴ�.
--> ������ ���� ����� �������� ������ �⺻������ ���������� ���� �ȴ�.

-- ASC(ASCENDING) : �������� ���� (1,2,3,4,5,.....) �⺻��
-- DESC (DESENDING) : �������� ���� (5,4,3,2,1,.....)

-- ���� ���̺��� ��� ������ ������ ��ȸ
-- �� �޿� �������� ������������ �����Ͽ� ��ȸ.
SELECT *
  FROM EMPLOYEES
ORDER BY SALARY ASC;

-- �ֱٿ� �Ի��� ��¥�� �������� ������ �̸��� �Ի糯¥�� ��ȸ
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;

-- �������̺��� �������̵�, �μ����̵�, �̸�(FIRST_NAME), �޿� ������ ���
-- �� �μ����̵�� ������������, �޿��� ������������ ����
SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC;

-- �μ����̵� ���� ������������ ������ �޿��� ������������ ������ ��Ų��
-- ���� �μ����� �ٹ��ϰ� �ִ� �����鳢�� �޿��� ���� ������ ���� ������ �����ؼ� ���

-- NULL�̶�?
-- NULL���̶� �������� ���� ������ ��� �ִ� ���¸� ���Ѵ�.
-- ���� �������� �ʰų� �������� ���� ���� �ǹ��Ѵ�.
-- ����0�� ���鹮�� ' '�� NULL���� �ƴϴ�.
-- ** NULL���� ��������� �ϰ� �Ǹ� ������ NULL���� ���´�.
-- ** NULL���� �񱳿����� �ϰ� �Ǹ� ������ FALSE�� ���´�.

-- ���� ���̺��� ������ ���̵�� �̸��� �޿��� ���ʽ� ������ ��ȸ

SELECT * FROM EMPLOYEES;

DESC EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
     , COMMISSION_PCT * 2
  FROM EMPLOYEES;
  
-- �� �̷��� ����� ����� ������

-- NULL���� �������� �ʴ� ���̱� ������ ���ڿ� ��� ������ �Ҽ�����. (�� ��)
-- NULL���� ��� ������ ������ �ȵǱ� ������ ������ NULL���� ���´�.(�� ��)
-- NULL���� ���� ����ִ� ���� �̱� ������, �������� �ʴ� ���̴�.(�� ��)
-- ���� 0�̶� ' '�� NULL���� �ƴϴ�!(�� ��)
-- NULL���� �񱳿��굵 �ȵǱ� ������ ��� ���� ������ FALSE�� ���´�.(�� ��)
