-- CHAPTER 05.JOIN

-- JOIN 이란 : 여러 테이블에서 필요한 데이터를 한번에 가져오는 기술

-- 비등가조인(Non EQUI JOIN)
--> 두개의 테이블 간에 서로 정확하게 일치하지 않는 경우 활용하는 조인
--> 등가연산자(=) 가 아닌 연산자들을 사용한 조인을 의미(>, >=, <, <=, BETWEEN)

-- 등가조인(EQUI JOIN)
-- 두개의 테이블 간에 서로 정확하게 일치하는 경우 활용하는 조인
--> 등가 연산자(=)를 사용해서 조인을 의미(=)
--> 가장 많이 사용하는 조인의 형태

-- 등가조인의 사용방법
-- SELECT 테이블1.컬럼 테이블2.컬럼 --> (DOT)-> 경로를 통해서 원하는 테이블의 컬럼 조회
--   FROM 테이블1, 테이블2 -- 테이블1과 테이블2를 JOIN 하겠다.
--  WHERE 테이블1.칼럼 = 테이블2.컬럼; --> 조인 조건은 WHERE절에 작성

-- 직원테이블의 직원이름과 부서테이블의 부서이름을 출력

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

-- SELECT 테이블1.컬럼, 테이블2.컬럼
--   FROM 테이블1, 테이블2
--  WHERE 테이블1.컬럼 = 테이블2.컬럼;

-- 직원테이블에 직원 이름과 해당 직원에 해당하는 부서이름도 출력해와라.
-- 1. 조인할 대상 테이블의 정보를 확인
-- 2. FROM절에 조인할 테이블들을 ,(콤마)를 이용해서 작성
-- 3. 조인 조건이 되는 특정 컬럼을 확인하여, WHERE 조건절에 조인 조건을 작성
-- 조인 조건이 되는 특정 컬럼을 확인하여, WHERE 조건절에 조인 조건을 작성
-- 조인 조건이 되는 컬럼은 거의 PK와 FK관계로 이루어져 있다
-- 다만 다 그런것은 아니고 논리적인 관계로 조인하는 경우도 있다.
-- 4. SELECT절에 .(경로)를 통해서 테이블에 접근해서 원하는 컬럼을 조회
SELECT EMPLOYEES.FIRST_NAME, DEPARTMENTS.DEPARTMENT_NAME
  FROM EMPLOYEES, DEPARTMENTS
 WHERE EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID
 ORDER BY EMPLOYEES.DEPARTMENT_ID DESC;
 
-- 직원ID, FIRST_NAME, 부서명을 출력

SELECT EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.FIRST_NAME, DEPARTMENTS.DEPARTMENT_NAME
  FROM EMPLOYEES, DEPARTMENTS
 WHERE EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID
ORDER BY EMPLOYEES.DEPARTMENT_ID DESC;

-- 별칭 사용해서 출력

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
ORDER BY E.DEPARTMENT_ID DESC;

-- ANSI 조인 문법 : 미국 표준협회에서 만든 모든 DBMS에서 사용 가능한 문법이다.

-- INNER JOIN : 내부조인이라고 하며 조인 조건에서 동일한 값이 있는 행만 반환. == EQUI 조인과 동일한 개념이다.

-- INNER JOIN 사용방법
-- SELECT 테이블1.컬럼, 테이블2.컬럼
-- FROM 테이블1 INNER JOIN 테이블2
-- ON (테이블1.컬럼 = 테이블2.컬럼);
-- WHERE 일반 조건을 작성

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID AND D.DEPARTMENT_NAME = 'Sales';

-- INNER JOIN을 활용해서 작성 해보세요.
-- 부서명이 SALES인 직원만 출력해보세요.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D 
    ON(E.DEPARTMENT_ID=D.DEPARTMENT_ID)
 WHERE D.DEPARTMENT_NAME = 'Sales';
 
-- CROSS JOIN : 조인 조건절을 적지 않고 테이블의 모든 데이터를 가지고 오는 방법
-- 조건 조건이 없는 경우 생길 수 있는 모든 데이터의 조합을 조회
--> 카티션 곱이라고 부른다
--> 카티션 곱 : 모든 경우의 수가 발생하는 것

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME, E.DEPARTMENT_ID
  FROM EMPlOyEES E CROSS JOIN DEPARTMENTS D;

--> 직원테이블의 행의 갯수 (107) x 부서테이블의 행의 객수(27) = 2889의 행이 나온다.

-- OUTER JOIN : 외부 조인이라고 하며, 두개의 테이블 간의 교집합을 조회하고
-- 한쪽 테이블에만 있는 데이터도 포함시켜서 조회하고 싶을때 사용하는 조인 문법
--> 한쪽데이터의 NULL값도 출력하고 싶을때 사용

SELECT * FROM EMPLOYEES;
SELECT * FROM JOBS;

-- 직원테이블의 직원ID, 이름과 직책별 그리고 직업테이블의 직책내용

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE
  FROM EMPLOYEES E,JOBS J
 WHERE E.JOB_ID = J.JOB_ID
ORDER BY E.EMPLOYEE_ID;

SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, J.JOB_TITLE
  FROM EMPLOYEES E INNER JOIN JOBS J
    ON E.JOB_ID = J.JOB_ID
ORDER BY E.EMPLOYEE_ID;

-- PK 와 FK 관계가 아닌 논리적인 관계로 조인을 하는 경우도 있어요!!

-- 셀프조인
-- 같은 테이블에서 의미있는 정보가 있으면 조인하는 기술
-- 반드시 테이블의 별칭을 사용해서 사용해야한다.

SELECT * FROM EMPLOYEES;

-- 각 직원의 상사 이름을 출력
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.MANAGER_ID, B.FIRST_NAME
  FROM EMPLOYEES A, EMPLOYEES B
 WHERE A.MANAGER_ID = B.EMPLOYEE_ID
ORDER BY A.EMPLOYEE_ID;

SELECT * FROM DEPARTMENTS;

-- 각 부서별 부서장 이름을 조회

SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.EMPLOYEE_ID = D.MANAGER_ID
ORDER BY D.MANAGER_ID;

-- ANSI 조인 문법으로 INNER JOIN을 활용하여 풀어보세요!

SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON (E.EMPLOYEE_ID = D.MANAGER_ID)
ORDER BY D.MANAGER_ID;

-- RIGHT OUTER JOIN 
-- 오른쪽 테이블을 기준으로 NULL값도 포함하여 출력
-- 오라클 문법 조인시 : 조인 조건절에 반대인 왼쪽컬럼에 (+)기호를 작성
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON (E.EMPLOYEE_ID = D.MANAGER_ID)
ORDER BY D.MANAGER_ID;

-- 오라클 문법 적용 시
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON (E.EMPLOYEE_ID = D.MANAGER_ID)
ORDER BY D.MANAGER_ID;


-- LEFT OUTER JOIN
-- 왼쪽 테이블을 기준으로 NULL값도 포함하여 출력
-- 오라클 문법 조인시 : 조인 조건절의 반대인 오른쪽 컬럼에 (+);

SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D LEFT JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID)
ORDER BY D.MANAGER_ID;

-- 오라클 문법시
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D ,EMPLOYEES E
 WHERE D.MANAGER_ID = E.EMPLOYEE_ID(+)
ORDER BY D.MANAGER_ID;

-- FULL OUTER JOIN
--> 양쪽의 NULL값도 포함하여 출력
--> 오라클 문법에선 지원안함

SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D FULL JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID)
ORDER BY D.MANAGER_ID;

--국제표준
SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME
  FROM COUNTRIES C INNER JOIN LOCATIONS L 
    ON (C.COUNTRY_ID= L.COUNTRY_ID) INNER JOIN DEPARTMENTS D ON (L.LOCATION_ID=D.LOCATION_ID);
 
--오라클식   
SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME
  FROM COUNTRIES C , LOCATIONS L , DEPARTMENTS D
 WHERE C.COUNTRY_ID= L.COUNTRY_ID AND L.LOCATION_ID=D.LOCATION_ID;    
 
-- 복습

-- 조인 사용방법
-- SELECT   테이블1.컬럼명, 테이블2.컬럼 -> 원하는 컬럼을 조회
-- FROM     테이블1, 테이블2 --> 테이블1과 테이블2를 조인하겠다.
-- WHERE    테이블1.컬럼 = 테이블2.컬럼 --> 조인조건 기술

SELECT 수강생정보.학생ID, 수강생정보.학생이름, 성적표.과목, 성적표.성적
  FROM 수강생정보, 성적표 -- CROSS JOIN
 WHERE 수강생정보.학생ID = 성적표.학생ID;
 
SELECT A.학생ID, A.학생이름, B.과목, B.성적
  FROM 수강생정보 A, 성적표 B
 WHERE A.학생ID = B.학생ID;
 
-- ANSI JOIN 문법 -- INNER JOIN
SELECT A.학생ID, A.학생이름, B.과목, B.성적
  FROM 수강생정보 A JOIN 성적표 B
    ON A.학생ID = B.학생ID;
    
SELECT A.학생ID, A.학생이름, B.과목, B.성적
  FROM 수강생정보 A JOIN 성적표 B
    ON A.학생ID = B.학생ID AND A.학생이름 IN('조준용','박병관');    
    
SELECT A.학생ID, A.학생이름, B.과목, B.성적
  FROM 수강생정보 A, 성적표 B
 WHERE A.학생ID = B.학생ID AND A.학생이름 IN('조준용','박병관');
       
-- 각 부서의 매니저 직원들의 부서이름, 매니저아이디, 이름 출력

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
 