-- TCL(Transaction Control Language) : 트랜잭션 제어어

-- 트랜잭션이란?
--> 데이터베이스의 상태를 변화시키기 위해서 수행하는 최소 수행단위.
--> 즉 업무를 처리하기 위한 최소 수행 단위이다.

-- 트랜잭션의 4가지 특성 - ACID
-- Automicity (원자성) : ALL OR NOTTING, 모두 실행되거나, 실행되지 않거나
-- Consistency (일관성) : 언제나 일관성 있는 상태로 유지하는 것
-- Isolation (고립성) : 트랙잭션 실행 시 다른 트랜잭션의 영향을 받지 않는 것
-- Durability (지속성) : 성공적으로 수행된 트랜잭션은 영원히 반영되는 것
-- AC..ID 까먹었네..


-- TCL의 명령어
-- COMMIT : DB에 영구적으로 저장, 마지막 COMMIT 시점 이후의 트랜잭션 결과를 저장
-- ROLLBACK : 트랜잭션을 취소, 마지막 COMMIT 시점까지만 복구가능
-- SAVEPOINT : 하나의 트랜잭션을 작게 분할해서 저장하는 기능을 수행하는 명령어

-- 테이블 복사
-- AS 앞에 오는 SELECT 문장에 대한 내용만 복사가 된다.
-- ** 제약조건은 복사가 되지 않는다!
CREATE TABLE TEMP_수강생정보 AS SELECT * FROM 수강생정보;
SELECT * FROM TEMP_수강생정보;

-- DML 복습
-- SMHRD10 학생 아이디를 가진 여러분들의 정보를 수가해보세요 소속반은 D반으로

INSERT INTO TEMP_수강생정보 (학생ID, 학생이름, 소속반)
VALUES ('SMHRD10','신진화','D');

SELECT * FROM TEMP_수강생정보;
ROLLBACK;
COMMIT;

-- 세션(SESSION) 이란?
--> 데이터베이스 접속을 시작으로 여러 데이터베이스에서 관련 작업을 수행한 후
-- 접속을 종료하기 전까지의 전체 기간을 의미
-- 즉 세션이 여러 개 있다는 말은 오라클 데이터베이스에 접속하여 사용중인 연결이 여러개 있다는 뜻이다.

-- 세션1: 오라클 SQL DEVELOPER (HR)
-- 세션2: RUN SQL COMMAND (HR)
