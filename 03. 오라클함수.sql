-- CHAPTER 03 . ����Ŭ �Լ�

-- �Լ��� (Funtion) �̶�?
-- �Է� ���� �־ Ư���� ����� ���� ��� ���� ���

-- ����� �����Լ� : ����ڰ� �ʿ信 ���ؼ� ���� ������ �Լ�
-- �����Լ� : ����Ŭ���� �̸� ����� ���� �Լ�, �ʿ��Ҷ����� ȣ���ؼ� ���
-- �����Լ��� ������, ������, ��¥��, ��ȯ��, NULLó���Լ�, �����Լ��� �ִ�.

-- �Լ��̸�()
-- �Լ��� �����Ҷ� ����ϴ� �Է°� : ���� ��

-- [ ������ �Լ� ]
-- UPPER() : ��ȣ �� ���� �����͸� ��� �빮�ڷ� ��ȯ�Ͽ� ���
-- LOWER() : ��ȣ �� ���� �����͸� ��� �ҹ��ڷ� ��ȯ�Ͽ� ���

-- DUAL���̺��̶�?
-- ����Ŭ �ְ������(SYS)������ ���̺�
--> �ӽ� �����̳� �Լ��� ��� �� Ȯ�� �뵵�� ����ϴ� �׽�Ʈ�� ���̺��̴�!!

-- ������ �̸�(FIRST_NAME)�� EMAIL ������ ���
-- �ٸ� FIRST_NAME�� ��� �빮�ڷ�, EMAIL������ ��� �ҹ��ڷ� ���

SELECT UPPER(FIRST_NAME), LOWER(EMAIL)
  FROM EMPLOYEES;
  
-- LENGTH() : ��ȭ �� ���� �������� ���̸� ���ϴ� �Լ��̴�.

SELECT LENGTH('HELLO WORLD')
  FROM DUAL;
  
-- ������ �̸��� �̸��� ���̸� ��ȸ.

SELECT FIRST_NAME, LENGTH(FIRST_NAME)
  FROM EMPLOYEES;
 
-- ������ �̸��� ���̰� 5 �̻��� �����鸸 ��ȸ.
SELECT FIRST_NAME,LENGTH(FIRST_NAME)
  FROM EMPLOYEES
 WHERE LENGTH(FIRST_NAME) >=5;
 
-- SUBSTR() : ���ڿ��� �����ϴ� �Լ�
--1) SUBSTR(�Է°�, ������ġ, �������)
--> ���ڿ� �������� ������ġ���� ���� ���̸�ŭ ���
--2) SUBSTR(�Է°�, ������ġ)
--> ������� ���� �� ���ڿ� �������� ������ġ���� ������ ���

SELECT SUBSTR('������ �м�����', 1,4) AS "������"
     , SUBSTR('������ �м�����', 6,5) AS "�м�����"
     , SUBSTR('������ �м�����', 8) AS "����"
     , SUBSTR('������ �м�����', 3) AS "���� �м�����"
  FROM DUAL;
  
SELECT HIRE_DATE FROM EMPLOYEES;

-- �Ի糯¥���� ����, ��, �� ���� ���
-- �� �÷����� ����, ��, ���̶�� ��Ī�� ����ؼ� ���

SELECT SUBSTR(HIRE_DATE,1,2) AS "����"
     , SUBSTR(HIRE_DATE,4,2) AS "��"
     , SUBSTR(HIRE_DATE,7) AS "��"
  FROM EMPLOYEES;
  
-- REPLACE() : Ư�� ���ڸ� �ٸ� ���ڷ� �ٲپ� �ִ� �Լ�
-- 1) REPLACE(���ڿ� ������, �ٲٰ� ���� ����, �ٲ�� �� ����)
-- 2) REPLACE(���ڿ� ������, �ٲٰ� ���� ����)
--> �ٲ�� �� ���ڸ� ������ �ٲٰ� ���� ���ڴ� ���ڿ� �����Ϳ��� ������ �ȴ�!!

SELECT REPLACE('������# �ױ���!','#', '_')
     , REPLACE('������# �ױ���!','#')
  FROM DUAL;
  
-- �������̺��� �Ի糯¥�� ����ϵ�
-- /�� ���ڿ� -(������) ���� �ٲ㼭 ���
-- /�� �����Ͽ� ���

SELECT REPLACE(HIRE_DATE,'/','-') AS "USE -"
     , REPLACE(HIRE_DATE,'/') AS "DELETE /"
  FROM EMPLOYEES;
  
-- CONCAT() : �� ���ڿ� �����͸� ��ġ�� �Լ�
--> ���ڰ����� 2���� ���� �ְ�, 2���� ���ڿ��� ��ġ�� �Լ��̴�.
--> �ռ������� '||' �� �̿��ϸ� ���Ѵ�� ���ڿ� ������ �����ϴ�.

SELECT CONCAT('������', '�ױ���'||' ��ȭ��վ��'||' �̷����Ǵµ�?'||'!!!!!!!!')
  FROM DUAL;
  
-- TRIM() : �Է� ���� ������ �������� �� ���� ������ �����Ѵ�.

SELECT REPLACE('�������� �߿��� ����Դϴ�!        ',' ')
  FROM DUAL;
  
-- [ ������ �Լ� ]

-- RODUN() : Ư�� ��ġ���� �ݿø� �ϴ� �Լ�
-- 1) ROUND(�ݿø� �� ����, �ݿø� ��ġ)
-- 2) ROUND(�ݿø� �� ����)
--> �ݿø� ��ġ ������ ������ ù��° �ڸ����� �ݿø� ����

SELECT ROUND(1234.56789,-2)
  FROM DUAL;
  
-- MOD() : ���ڸ� ���� ������ ���� ���ϴ� �Լ�
--> Ȧ��, ¦���� ������ �� ����Ѵ�.
-- MOD(���̽�����, ������ ����)

SELECT MOD(10,2)
     , MOD(10,3) AS "1"
     , MOD(15,6) AS "3"
  FROM DUAL;
  
-- [ ��¥�� �Լ� ]
-- SYSDATE : ���� ��¥�� �ð��� ������ִ� �Լ�
--> �Է½� �ٷ� ����� �Ǹ�, ���� �ð��� �� �������� ����� �����ϴ�!!
--> ��¥�� �����ʹ� ������ �����ϴ�.
--> ��¥ �����ͳ����� ������ �Ұ����ϴ�!!

SELECT SYSDATE
  FROM DUAL;

-- ��¥���� ����
-- ���� > ȯ�漳�� > �����ͺ��̽� > NLS > ��¥���� > YYYY-MM-DD HH24:MI:SS

SELECT SYSDATE AS "NOW"
     , SYSDATE + 1 AS "TOMORROW"
     , SYSDATE - 1 AS "YESTERDAY"
  FROM DUAL;
  
-- ��¥������ Ȱ��(�ǹ�)
SELECT SYSDATE AS "����"
     , SYSDATE +1 AS �Ϸ����
     , SYSDATE +1/24 AS �ѽð�����
     , SYSDATE +1/24/60 AS �Ϻд���
     , SYSDATE +1/24/60/60 AS ���ʴ���
--   , SYSDATE + SYSDATE --> ��¥ �����ͳ����� ������ �Ұ����ϴ�!!
  FROM DUAL;
  
-- ADD_MONTHS() : ��� ���� ��¥�� ���ϴ� �Լ�
-- ADD_MONTHS(��¥������, ���ϰų� �� ������)

SELECT ADD_MONTHS(SYSDATE,-1)
     , ADD_MONTHS(SYSDATE, +6)
  FROM DUAL;
  
-- { ��ȯ �� �Լ� }

-- ����ȯ ������ ����
-- �Ͻ��� ����ȯ : �����ͺ��̽��� �ڵ����� ����ȯ�� ���ִ� ��
SELECT 123+'100'
  FROM DUAL;
  
-- ����� ����ȯ : ������ ��ȯ�� �Լ��� ����ؼ� ����ڰ� ���� �ڷ����� ���� ���ִ� ��
--SELECT '123,00'+100
--  FROM DUAL;

-- TO_CHAR() : ��¥, ���� �����͸� ���� �����ͷ� ��ȯ ���ִ� �Լ�
-- TO_CHER(��ȯ �� ������, �����������)

SELECT SALARY
     , TO_CHAR(SALARY, 'L999,999')
  FROM EMPLOYEES;
  
SELECT TO_CHAR(SYSDATE,'YY/MM/DD/DAY')
  FROM DUAL;
  
-- TO_NUMBER() : ���� �����͸� ���� �����ͷ� ��ȯ �ϴ� �Լ�
-- TO_NUMBER(���ڿ�������, �ν� �� ��������)

SELECT TO_NUMBER('1,000','9,999') + 500
  FROM DUAL;
  
-- TO_DATE() : ���� �����͸� ��¥ �����ͷ� ��ȯ �ϴ� �Լ�
-- TO_DATE(���ڿ� ������, �ν� �� ��¥ ����)

SELECT TO_DATE('20240812','YYYY/MM/DD')
  FROM DUAL;
  
--(NULL�� ó���ϴ� �Լ�)

-- NVL / NVL2 : NULL ���� ��ü �� �� �ִ� �Լ�
-- 1) NVL(NULL���� ���θ� �˻��� ������, NULL�� ��� ��ȯ�� ������)
-- 2) NVL2(NULL���� ���θ� �˻��� ������, NULL�� �ƴҰ�� ��ȯ�� ������, NULL�ϰ�� ��ȯ�� ������)

SELECT FIRST_NAME, DEPARTMENT_ID
     , NVL(DEPARTMENT_ID, '0')
  FROM EMPLOYEES;

SELECT FIRST_NAME, DEPARTMENT_ID, NVL2(DEPARTMENT_ID,'1','0')
  FROM EMPLOYEES;
  
-- �������̺��� ���ʽ�(COMMISSION_PCT)�� ���� ������ ���� 0���� ��ü�ؼ� ���
SELECT FIRST_NAME, NVL(COMMISSION_PCT, '0')
  FROM EMPLOYEES;
-- �������̺��� ����ID, FIRST_NAME, MANAGER_ID�� ���
-- �Ŵ����� �ִ� ������ '����' ���� ���
-- �Ŵ����� ���� ������ '��ǥ' �� �����Ͽ� ���
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID, NVL2(MANAGER_ID, '����', '��ǥ')
  FROM EMPLOYEES;
  
-- [ ���� �Լ� ]
-- DECODE() : ��Ȳ�� ���� �ٸ� �����ͷ� ��ȯ�ϴ� �Լ�
--> �˻� ���� ���ؼ� ������ ���� ��ȯ

-- DECODE(�˻����� �� �÷� �Ǵ� ������<����>, �� ��<2>, ��ġ�� ��ȯ �� ��<3>
--        , ����ġ�� ��ȯ �� ��<4>)
SELECT FIRST_NAME, DEPARTMENT_ID
     , DECODE(DEPARTMENT_ID, NULL, '�μ�����','�μ�����')
  FROM EMPLOYEES;
  
-- �������̺��� ����ID, FIRST_NAME, MANAGER_ID�� ��� (DECODE �Լ���)
-- �Ŵ����� �ִ� ������ '����' ���� ���
-- �Ŵ����� ���� ������ '��ǥ' �� �����Ͽ� ���
-- �Ŵ������̵� 100�̸鼭 �������̵� 101�� ������ �����̻�� ����
-- �������̵� 102�� ������ ���̻�� ����
-- �������̵� 103�� ������ �������� ����
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , DECODE(EMPLOYEE_ID, 100, '��ǥ', 101, '�����̻�', 102, '���̻�', 103,'����','����')
  FROM EMPLOYEES;
  

