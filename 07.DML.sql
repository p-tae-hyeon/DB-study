-- CHAPTER 07.DML (Data Manipulation Language)

-- DML�̶�?
-- ������ ���۾�� ���̺� �����͸� ��ȸ, �߰�, ����, ������ �� ����ϴ� ���Ǿ��̴�.
-- ���̺� ���ϴ� �����͸� �Է�, ����, ����

-- [DML�� ����] - ���ξ���
-- SELECT : ������ ��ȸ
-- INSERT : ������ �߰�
-- UPDATE : ������ ����
-- DELETE : ������ ����

-- ������ �߰� �����
-- INSERT INTO ���̺� �� (�÷�LIST..)
-- VALUES ( ��...)
--> * INSERT INTO�� �Է��� �÷��� VALUES�� �Է��� ���� ������ �ڷ����� �¾ƾ� �ȴ�!!

SELECT * FROM DEPT;

-- DDL_DEPT

INSERT INTO DDL_DEPT (DEPTNO, DNAME, LOC)
VALUES (10,'ACCOUNTING','NEW YORK');

INSERT INTO DDL_DEPT (DEPTNO, DNAME, LOC)
VALUES (20,'RESEARCH','DALLAS');

-- NULL �� �Է��ϱ�
INSERT INTO DDL_DEPT (DEPTNO, DNAME, LOC)
VALUES (30,'SALES','NULL'); -- ���� ����

-- NULL �� �Է��ϱ� 2��° ���
-- NULL ���� �Ͻ������� �Է��� �ߴ�.
INSERT INTO DDL_DEPT(DEPTNO, DNAME)
VALUES (40, 'OPERATION');
SELECT * FROM DDL_DEPT;

INSERT INTO DDL_DEPT (DEPTNO, DNAME, LOC)
VALUES (50,'����',NULL); -- NULL�� �Է�

-- UPDATE : ���̺� �����͸� �����ϰ� ���� �� ���
-- UPDATE ���̺� ��
-- SET ������ �÷� = ������, ......
-- WHERE �����͸� ������ ��� ���� �����ϱ� ���� ����;
-- *** WHERE �������� ������ ��� ���̺� �� ����� ��� �÷��� �����Ͱ� ������ �ȴ�.

SELECT * FROM DDL_DEPT;

-- DEPTNO�� 40�� LOC�� '����'�� �ٲ���
UPDATE DDL_DEPT
SET LOC = '����'
WHERE DEPTNO = 40;
-- DEPTNO�� 30�� LOC�� '����'�� �ٲ���
UPDATE DDL_DEPT
SET LOC = '����'
WHERE DEPTNO = 30;
-- �μ��̸��� ������ LOC�� ������ ������Ʈ �غ���!
UPDATE DDL_DEPT
SET LOC = '����'
WHERE DNAME = '����';

-- �μ����̵� 60�̰� �μ����� �����̰� LOC�� ������ �����͸� �߰��غ���!
INSERT INTO DDL_DEPT (DEPTNO, DNAME, LOC)
VALUES (60,'����','����');

-- LOC�� ������ ���������÷� UPDATE�� �ٲ��ּ���

-- �÷����� �ڷ����� �����ϱ� -- MODIFY
ALTER TABLE DDL_DEPT MODIFY LOC VARCHAR2(50);

UPDATE DDL_DEPT
SET LOC = '����������'
WHERE DEPTNO = '60';

-- DELETE : ������ ����
-- DELETE FROM ���̺��
-- WHERE ������ ��� ���� �����ϱ� ���� ���ǽ� ;
-- ** WHERE �������� ������ ��� ���̺��� ��� �����Ͱ� ������ �ȴ�!!

-- �μ����� �����̸鼭 LOC�� ������������ ������ ����
DELETE FROM DDL_DEPT
WHERE DNAME = '����' AND LOC = '����������';

-- DEPTNO�� 10�� �μ��� ����
DELETE FROM DDL_DEPT
WHERE DEPTNO = 10;

-- DNAME�� SALES �� �μ� ����
DELETE FROM DDL_DEPT
WHERE DNAME = 'SALES';


SELECT * FROM DDL_DEPT;