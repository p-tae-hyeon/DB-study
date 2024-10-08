-- CHAPTER 06.DDL (Data Difinition Language)

-- DDL�̶�?
--> ������ ���Ǿ�� ���̺� ���� ����� ��ü�� ����ų� �����Ѵ�.

-- (DDL�� ��ɾ� ����)
-- CREATE : ���̺� ���� ��ü�� �����ϴ� ��ɾ�
-- ALTER : ���̺� ���� ��ü�� �����ϴ� ��ɾ�
-- RENAME : ���̺��� �̸��� �����ϴ� ��ɾ�
-- TRUNCATE : ���̺��� �����͸� �����ϴ� ��ɾ�
-- DROP : ���̺� ���� ��ü�� �����ϴ� ��ɾ�

-- [ ���̺� ������ ���� ����ϴ� �ڷ��� ]
-- VARCHAR2(N) : ������ ������, Nũ�⸸ŭ �Է��� �ްڴ�.
-- NUMBER(P.S) : ������ �ڷ���, ������ ���� P�ڸ���ŭ �Է¹ް� S�ڸ���ŭ �Ҽ��� �Է¹���
--> ����Ŭ �����ͺ��̽������� �Ǽ��� ���� ��� ǥ���� �����ϴ�.
--> �Ұ�ȣ�� �����ϰ� �Ǹ� �ִ밪�� 38ũ�Ⱑ ����.
-- DATE : ���� ��¥ ���� �Է¹���

SELECT * FROM EMP;
-- EMP �ش� ���̺��� �巡�׷� ������ SHIFT + F4�� ������ ���̺��� ������ Ȯ�� �� �� �ִ�.

CREATE TABLE DDL_EMP(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2)
);

SELECT * FROM DEPT;

CREATE TABLE DDL_DEPT(
    DEPTNO NUMBER(2),
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
);

-- ���������̶�?
-- ���̺� �Է� ������ �����͸� �������� �����ϴ� ��
-- �������� ��Ȯ���� �����ϱ� ���� �������� ���ȴ�.
-- ���� ���� ���� ��Ŀ� ���� �������� �����̳� ���� ���ο� ������ �޽��ϴ�.

-- [ ���� ���� ���� ]
-- PRIMARY KEY (PK) : �⺻Ű, NOT_NULL + UNIQUE --> NULL�� �Ұ� + �ߺ� �Ұ�
-- UNIQUE KEY (UK)  : ����Ű, NULL�� �Է� ���� �� �ߺ��� �Ұ�
-- NOT NULL         : NULL�� �Ұ���, �ݵ�� �ԷµǾ�� �ϴ� �������̴� �Ҷ� ���� ��
-- CHECK            : TRUE OR FALSE�� ���� �� �ִ� ������ ����, �����͸� �Է� ����
-- FOREIGN KEY (FK) : �ܷ�Ű, ���̺��� �����ϴ� Ű

-- [�̹� ������ ���̺� ���������� ����]
-- ALTER TABLE ���̺� �� ADD CONSTRAINT �������� �̸� ��������(�÷���);

-- ���̺� PK�������� �����ϱ�
SELECT * FROM DDL_EMP;
ALTER TABLE DDL_EMP ADD CONSTRAINT EMPNO_PK PRIMARY KEY(EMPNO);

-- DDL_DEPT�� DEPTNO �÷��� PK�� �������ֱ�
ALTER TABLE DDL_DEPT ADD CONSTRAINT DEPTNO_PK PRIMARY KEY(DEPTNO);

-- UK�������� �����ϱ� MGR_UK ��� �������Ǹ����� MGR�÷��� UNIQUE �������� �����ϱ�
ALTER TABLE DDL_EMP ADD CONSTRAINT MGR_UK UNIQUE(MGR);

-- FK���������� �����ϱ�
-- �����
-- ALTER TABLE ���̺�� ADD CONSTRAINT �������� �� ��������(�÷���)
-- REFERENCES �������̺�(�����÷���);

DESC DDL_EMP;
ALTER TABLE DDL_EMP ADD CONSTRAINT DEPTNO_FK FOREIGN KEY(DEPTNO)
REFERENCES DDL_DEPT(DEPTNO);

-- ���̺� ���� ��� 1)
CREATE TABLE TB_TEST1(
    PK�׽�Ʈ NUMBER PRIMARY KEY,
    UK�׽�Ʈ NUMBER UNIQUE,
    NL�׽�Ʈ NUMBER NOT NULL,
    CK�׽�Ʈ NUMBER CHECK(LENGTH(CK�׽�Ʈ) > 5 )
);

CREATE TABLE TB_TEST2(
    PK�׽�Ʈ NUMBER,
    UK�׽�Ʈ NUMBER,
    NL�׽�Ʈ NUMBER NOT NULL,
    CK�׽�Ʈ NUMBER,
    FK�׽�Ʈ NUMBER,
    -- ���������� �߰�
    -- CONSTRAINT �������Ǹ� ��������(�÷�)
    CONSTRAINT PK�׽�Ʈ_PK PRIMARY KEY (PK�׽�Ʈ),
    CONSTRAINT UK�׽�Ʈ_UK UNIQUE(UK�׽�Ʈ),
    CONSTRAINT CK�׽�Ʈ_CK CHECK(CK�׽�Ʈ > 0),
    CONSTRAINT FK�׽�Ʈ_FK FOREIGN KEY(FK�׽�Ʈ) REFERENCES TB_TEST1(PK�׽�Ʈ)
);

-- ���� ���� �����ϱ�
-- ALTER TABLE ���̺�� MODIFTYY �÷��� �ٲ� ��������(����);
ALTER TABLE DDL_EMP MODIFY ENAME NOT NULL;

-- ���� ���� �����ϱ�
-- ALTER TABLE ���̺�� DROP CONSTRAINT �������� �̸�;
ALTER TABLE DDL_EMP DROP CONSTRAINT MGR_UK;

DESC DDL_EMP;

-- ���̺� �÷� �߰��ϱ�
SELECT * FROM DDL_EMP;
-- PHONE_NUMBER ��� �÷� �߰����ֱ�

ALTER TABLE DDL_EMP ADD PHONENUMBER VARCHAR2(10);

-- ���̺��� Į�� �̸� �����ϱ�
-- MGR �÷��� MANAGER_ID��� �÷�
ALTER TABLE DDL_EMP RENAME COLUMN MGR TO MANAGER_ID;

-- Ư�� �÷��� �����ϱ�
-- HIREDATE �÷��� �����ϱ�
ALTER TABLE DDL_EMP DROP COLUMN HIREDATE;

-- ���̺��� �̸� �����ϱ�
-- EMPLOYEES ���̺��� �̸����� ����
RENAME DDL_EMP TO EMPLOYEES;

SELECT * FROM EMPLOYEES;

-- ���̺� ����
-- DROP TABLE ���̺��;
DROP TABLE EMPLOYEES;

-- TRUNCATE : ���̺��� �����͸� ���� ����

-- ���̺� ���� ������
-- ���̺� ���� �� �������Ǳ����� ���簡 ���� �ʴ´� ���븸 ���簡 �ȴ�!
CREATE TABLE TEMP_EMP AS SELECT * FROM EMP;

SELECT * FROM TEMP_EMP;

-- DELETE : ���̺� ����
DELETE FROM TEMP_EMP;

ROLLBACK; -- �ǵ����� ��ɾ�;

TRUNCATE TABLE TEMP_EMP;

ROLLBACK;