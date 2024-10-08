-- CHAPTER 09. DCL (Data Control Language)

-- DCL이란?
-- 데이터베이스에 접근을 하거나 객체에 권한을 주는 등의 역할을 하는 언어이다.

-- [ DCL의 명령어 종류 ]
-- GRANT : 권한을 부여하는 명령어
-- REVOKE : 권한을 회수하는 명령어
-- ROLE : 권한을 묶어서 부여할때 사용하는 명령어

-- 사용자란?
--> 데이터베이스에 접속하여 데이터를 관리하는 '계정'을 사용자(USER)라고 한다.

-- SHOW USER;

-- [ 사용자 생성하는 방법 ]
-- CREATE USER 사용자 이름
-- IDENTIFIED BY 패스워드;

-- [ 권한 부여 ]
-- GRANT 시스템 권한
-- TO 사용자;
-- WITH ADMIN OPTION(선택사항)
--> 현재 GRANT 문을 통해 부여받은 권한을 다른사람에게 부여할 수 있는 권한도 함께 부여 받는것

-- 권한 회수
-- REVOKE 시스템 권한
-- FROM 사용자;

-- [ DDL 복습 ]
-- DDL_TABLE이라는 테이블을 생성
-- 컬럼은 ID 유형은 VARCHAR2(20)

CREATE TABLE DDL_TABLE(
    ID VARCHAR2(20)
);

-- ORA-01031: insufficient privileges -- 권한이 불충분하다!!

-- ROLE : 권한을 묶어서 주는 명령어

-- ROLE의 종류
-- CONNECT : 데이터베이스에 접속에 필요한 권한
-- RESOURCE : 테이블, 시퀀스 등 객체 생성 권한
-- DBA : 데이터베이스를 관리하는 대부분의 시스템 권한

-- 현업에서 업무 시작시 주는 ROLL 명령어
-- GRANT CONNECT, RESOURCE TO 사용자(USER)