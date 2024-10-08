-- CHAPTER 06.DDL (Data Difinition Language)

-- DDL이란?
--> 데이터 정의어로 테이블 같은 저장소 객체를 만들거나 수정한다.

-- (DDL의 명령어 종류)
-- CREATE : 테이블 같은 객체를 생성하는 명령어
-- ALTER : 테이블 같은 객체를 변경하는 명령어
-- RENAME : 테이블의 이름을 변경하는 명령어
-- TRUNCATE : 테이블의 데이터를 삭제하는 명령어
-- DROP : 테이블 같은 객체를 삭제하는 명령어

-- [ 테이블 생성시 자주 사용하는 자료형 ]
-- VARCHAR2(N) : 가변형 문자형, N크기만큼 입력을 받겠다.
-- NUMBER(P.S) : 숫자형 자료형, 숫자형 값을 P자리만큼 입력받고 S자리만큼 소수를 입력받음
--> 오라클 데이터베이스에서는 실수와 정수 모두 표현이 가능하다.
--> 소괄호를 생략하게 되면 최대값인 38크기가 들어간다.
-- DATE : 현재 날짜 값을 입력받음

SELECT * FROM EMP;
-- EMP 해당 테이블을 드래그로 감싼후 SHIFT + F4를 누르면 테이블의 정보를 확인 할 수 있다.

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

-- 제약조건이란?
-- 테이블에 입력 가능한 데이터를 조건으로 제약하는 것
-- 데이터의 정확성을 유지하기 위한 목적으로 사용된다.
-- 제약 조건 지정 방식에 따라서 데이터의 수정이나 삭제 여부에 영향을 받습니다.

-- [ 제약 조건 종류 ]
-- PRIMARY KEY (PK) : 기본키, NOT_NULL + UNIQUE --> NULL값 불가 + 중복 불가
-- UNIQUE KEY (UK)  : 고유키, NULL값 입력 가능 단 중복은 불가
-- NOT NULL         : NULL값 불가능, 반드시 입력되어야 하는 데이터이다 할때 설정 함
-- CHECK            : TRUE OR FALSE로 평가할 수 있는 논리식을 지정, 데이터만 입력 가능
-- FOREIGN KEY (FK) : 외래키, 테이블을 연결하는 키

-- [이미 생성된 테이블에 제약조건을 지정]
-- ALTER TABLE 테이블 명 ADD CONSTRAINT 제약조건 이름 제약조건(컬럼명);

-- 테이블 PK제약조건 지정하기
SELECT * FROM DDL_EMP;
ALTER TABLE DDL_EMP ADD CONSTRAINT EMPNO_PK PRIMARY KEY(EMPNO);

-- DDL_DEPT에 DEPTNO 컬럼에 PK를 지정해주기
ALTER TABLE DDL_DEPT ADD CONSTRAINT DEPTNO_PK PRIMARY KEY(DEPTNO);

-- UK제약조건 지정하기 MGR_UK 라는 제약조건명으로 MGR컬럼을 UNIQUE 제약조건 지정하기
ALTER TABLE DDL_EMP ADD CONSTRAINT MGR_UK UNIQUE(MGR);

-- FK제약조건을 지정하기
-- 사용방법
-- ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건 명 조약조건(컬럼명)
-- REFERENCES 참조테이블(참조컬럼명);

DESC DDL_EMP;
ALTER TABLE DDL_EMP ADD CONSTRAINT DEPTNO_FK FOREIGN KEY(DEPTNO)
REFERENCES DDL_DEPT(DEPTNO);

-- 테이블 생성 방법 1)
CREATE TABLE TB_TEST1(
    PK테스트 NUMBER PRIMARY KEY,
    UK테스트 NUMBER UNIQUE,
    NL테스트 NUMBER NOT NULL,
    CK테스트 NUMBER CHECK(LENGTH(CK테스트) > 5 )
);

CREATE TABLE TB_TEST2(
    PK테스트 NUMBER,
    UK테스트 NUMBER,
    NL테스트 NUMBER NOT NULL,
    CK테스트 NUMBER,
    FK테스트 NUMBER,
    -- 제약조건을 추가
    -- CONSTRAINT 제약조건명 제약조건(컬럼)
    CONSTRAINT PK테스트_PK PRIMARY KEY (PK테스트),
    CONSTRAINT UK테스트_UK UNIQUE(UK테스트),
    CONSTRAINT CK테스트_CK CHECK(CK테스트 > 0),
    CONSTRAINT FK테스트_FK FOREIGN KEY(FK테스트) REFERENCES TB_TEST1(PK테스트)
);

-- 제약 조건 변경하기
-- ALTER TABLE 테이블명 MODIFTYY 컬럼명 바꿀 제약조건(길이);
ALTER TABLE DDL_EMP MODIFY ENAME NOT NULL;

-- 제약 조건 삭제하기
-- ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건 이름;
ALTER TABLE DDL_EMP DROP CONSTRAINT MGR_UK;

DESC DDL_EMP;

-- 테이블에 컬럼 추가하기
SELECT * FROM DDL_EMP;
-- PHONE_NUMBER 라는 컬럼 추가해주기

ALTER TABLE DDL_EMP ADD PHONENUMBER VARCHAR2(10);

-- 테이블의 칼럼 이름 변경하기
-- MGR 컬럼을 MANAGER_ID라는 컬럼
ALTER TABLE DDL_EMP RENAME COLUMN MGR TO MANAGER_ID;

-- 특정 컬럼을 삭제하기
-- HIREDATE 컬럼을 삭제하기
ALTER TABLE DDL_EMP DROP COLUMN HIREDATE;

-- 테이블의 이름 변경하기
-- EMPLOYEES 테이블의 이름으로 변경
RENAME DDL_EMP TO EMPLOYEES;

SELECT * FROM EMPLOYEES;

-- 테이블 삭제
-- DROP TABLE 테이블명;
DROP TABLE EMPLOYEES;

-- TRUNCATE : 테이블의 데이터를 영구 삭제

-- 테이블 복사 쿼리문
-- 테이블 복사 시 제약조건까지는 복사가 되지 않는다 내용만 복사가 된다!
CREATE TABLE TEMP_EMP AS SELECT * FROM EMP;

SELECT * FROM TEMP_EMP;

-- DELETE : 테이블 삭제
DELETE FROM TEMP_EMP;

ROLLBACK; -- 되돌리는 명령어;

TRUNCATE TABLE TEMP_EMP;

ROLLBACK;