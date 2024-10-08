-- CHAPTER 07.DML (Data Manipulation Language)

-- DML이란?
-- 데이터 조작어로 테이블에 데이터를 조회, 추가, 수정, 삭제할 때 사용하는 질의어이다.
-- 테이블에 원하는 데이터를 입력, 수정, 삭제

-- [DML의 유형] - 세인업데
-- SELECT : 데이터 조회
-- INSERT : 데이터 추가
-- UPDATE : 데이터 수정
-- DELETE : 데이터 삭제

-- 데이터 추가 사용방법
-- INSERT INTO 테이블 명 (컬럼LIST..)
-- VALUES ( 값...)
--> * INSERT INTO에 입력한 컬럼과 VALUES에 입력한 값은 순서와 자료형이 맞아야 된다!!

SELECT * FROM DEPT;

-- DDL_DEPT

INSERT INTO DDL_DEPT (DEPTNO, DNAME, LOC)
VALUES (10,'ACCOUNTING','NEW YORK');

INSERT INTO DDL_DEPT (DEPTNO, DNAME, LOC)
VALUES (20,'RESEARCH','DALLAS');

-- NULL 값 입력하기
INSERT INTO DDL_DEPT (DEPTNO, DNAME, LOC)
VALUES (30,'SALES','NULL'); -- 오답 예시

-- NULL 값 입력하기 2번째 방법
-- NULL 값을 암시적으로 입력을 했다.
INSERT INTO DDL_DEPT(DEPTNO, DNAME)
VALUES (40, 'OPERATION');
SELECT * FROM DDL_DEPT;

INSERT INTO DDL_DEPT (DEPTNO, DNAME, LOC)
VALUES (50,'영업',NULL); -- NULL값 입력

-- UPDATE : 테이블에 데이터를 변경하고 싶을 때 사용
-- UPDATE 테이블 명
-- SET 변경할 컬럼 = 데이터, ......
-- WHERE 데이터를 변경할 대상 행을 선별하기 위한 조건;
-- *** WHERE 조건절을 생략할 경우 테이블 내 저장된 모든 컬럼의 데이터가 변경이 된다.

SELECT * FROM DDL_DEPT;

-- DEPTNO가 40인 LOC를 '서울'로 바꾸자
UPDATE DDL_DEPT
SET LOC = '서울'
WHERE DEPTNO = 40;
-- DEPTNO가 30인 LOC를 '광주'로 바꾸자
UPDATE DDL_DEPT
SET LOC = '광주'
WHERE DEPTNO = 30;
-- 부서이름이 영업의 LOC를 목포로 업데이트 해보자!
UPDATE DDL_DEPT
SET LOC = '목포'
WHERE DNAME = '영업';

-- 부서아이디가 60이고 부서명이 영업이고 LOC가 대전인 데이터를 추가해보자!
INSERT INTO DDL_DEPT (DEPTNO, DNAME, LOC)
VALUES (60,'영업','대전');

-- LOC가 대전을 대전광역시로 UPDATE로 바꿔주세요

-- 컬럼명의 자료형을 변경하기 -- MODIFY
ALTER TABLE DDL_DEPT MODIFY LOC VARCHAR2(50);

UPDATE DDL_DEPT
SET LOC = '대전광역시'
WHERE DEPTNO = '60';

-- DELETE : 데이터 삭제
-- DELETE FROM 테이블명
-- WHERE 삭제할 대상 행을 선별하기 위한 조건식 ;
-- ** WHERE 조건절을 생략할 경우 테이블의 모든 데이터가 삭제가 된다!!

-- 부서명이 영업이면서 LOC가 대전광역시인 데이터 삭제
DELETE FROM DDL_DEPT
WHERE DNAME = '영업' AND LOC = '대전광역시';

-- DEPTNO가 10인 부서를 삭제
DELETE FROM DDL_DEPT
WHERE DEPTNO = 10;

-- DNAME이 SALES 인 부서 삭제
DELETE FROM DDL_DEPT
WHERE DNAME = 'SALES';


SELECT * FROM DDL_DEPT;