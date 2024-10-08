-- CHAPTER 02. WHERE 절

-- [ WHERE 절 기본 사용 방법 ]
-- 3. SELECT    조회할 컬럼 명, ......
-- 1. FROM      조회할 테이블 명
-- 2. WHERE     조회할 행을 선별하기 위한 조건식;

-- EMPLOYEE_ID 가 105인 직원 정보만 조회
SELECT FIRST_NAME, EMAIL, PHONE_NUMBER
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 105;
 
--리터럴(Literal) 이란?
--> 소스 코드에서 특정한 자료형의 값을 직접 표기하는 방식을 말한다.
--> 소스 코드의 고정된 값을 표기하는 표기법

DESC EMPLOYEES;

-- [SQL에서 사용하는 자료형 ]
-- VARCHAR2(크기) : 가변형 문자형 자료형
--> 크기 만큼 입력 받을수 있는 가변형 문자형, 문자형 리터럴의 표현형식은 ''(작은따옴표)

-- NUMBER(P,S) : 숫자형 자료형
--> P자리만큼 입력을 받고, S자리만큼 소수를 입력받는다!!
--> EX) NUMBER(3) -> 999, NUMBER(3,2) 9.99
--> ()생략이 가능하다 , 전체크기인 38크기가 들어간다, 현업에서는 ()생략하고 자주 사용한다.
--> NUMBER로 실수와 정수 모두 표현이 가능하다.

-- DATE
--> 날짜 값을 입력 받는 날짜형 자료형

-- 리터럴 실습
-- ABC라는 문자형 리터럴을 입력해보자!
SELECT SALARY, 1000, 'ABC'
  FROM EMPLOYEES;
  
-- 산술연산자( +,-,*,/ )

-- 직원테이블에서 직원의 이름과 급여와 연봉의 정보를 출력
-- 연봉은 'AnnSal'로 별칭을 사용해서 출력

SELECT FIRST_NAME, SALARY, SALARY*12 AS "AnnSal"
  FROM EMPLOYEES;
  
-- 비교연산자
-- = : 같다.
-- > : 보다 크다 (초과)
-- >= : 보다 크거나 같다 (이상)
-- < : 보다 작다 (미만)
-- <= : 보다 작거나 같다 (이하)

-- 문제1) 부서테이블에서 매니저 아이디가 100인 부서이름과 부서ID를 출력
SELECT DEPARTMENT_NAME, DEPARTMENT_ID, MANAGER_ID
  FROM DEPARTMENTS
 WHERE MANAGER_ID=100;
-- 문제2) 직원테이블에서 급여를 9000을 받는 직원의 직원아이디, 이름 이메일 정보 출력
SELECT EMPLOYEE_ID, FIRST_NAME, EMAIL, SALARY
  FROM EMPLOYEES
 WHERE SALARY = 9000;
-- 문제3) 급여가 5000 이하인 직원의 이름과 급여 정보를 출력
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY <=5000;

-- 문제4) 연봉이 120000 이상인 직원의 이름과 급여 그리고 연봉의 정보를 출력
-- 연봉은 별칭을 사용해서 출력
SELECT FIRST_NAME, SALARY, SALARY*12 AS "AnnSal"
  FROM EMPLOYEES
 WHERE SALARY*12 >= 120000;
 
-- 문제5) 직원의 직업이 IT_PROG인 직원은 총 몇명인가?
--> 정답 : 5명

SELECT JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID='IT_PROG';
 
--부정 비교 연산자
-- !=, <>, ^! : 같지않다
 
-- 논리 비교 연산자
-- NOT A=B : 같지 않다. > 뒤에 오는 조건에 반대되는 결과를 되돌려 주는것이다.

-- 직원의 직업이 IT_PROG가 아닌 직원의 수는 몇명인가?
-- 102명

SELECT JOB_ID
  FROM EMPLOYEES
 WHERE NOT JOB_ID = 'IT_PROG';
 
 -- 급여가 8000이 아닌 직원 이름과 급여 정보 출력
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY !=8000;
 
 -- 매니저ID가 100이 아닌 직원의 직원아이디와 이름 출력
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID != 100;
 
 --(오후)
-- 논리연산자
--> 두개 이상의 조건을 연결해주는 연산자다.

-- AND : 조건을 모두 만족하는 경우 TRUE
-- OR : 하나의 조건이라도 만족하는 경우 TRUE 값 반환 (혹은, ~이거나)

-- 문제1) 부서가 90 이고 급여가 5000이상 받고 있는 직원의 직원ID와 이름을 조회
SELECT EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID=90 AND SALARY >= 5000;

-- 문제2) 부서가 100이거나 입사일이 06년 02월 02일 이후에 입사한 직원의 이름과 입사일 정보를 조회
SELECT FIRST_NAME, HIRE_DATE, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100 OR HIRE_DATE > '06/02/02';
 
-- 연산자의 우선순위
-- AND > OR

-- 직원의 이름과 부서아이디 그리고 급여의 정보를 알고 싶다.
-- 조건은 부서가 50이거나 90에 소속된 직원 중에서
-- 급여는 7000 이상을 받아야한다.

SELECT FIRST_NAME, DEPARTMENT_ID, SALARY
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID =50 OR DEPARTMENT_ID =90) AND SALARY >= 7000;
 
-- 부서 ID가 100이거나 90인 직원중에서
-- 직원 ID가 101인 직원의 직원아이디, 이름, 연봉

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY*12 AS "AnnSal"
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID =100 OR DEPARTMENT_ID=90)AND EMPLOYEE_ID = 101;
 
-- NULL 관련 연산자
--> IS NULL : 데이터 값이 NULL인 값을 조회
--> IS NOT NULL : 데이터 값이 NULL이 아닌 값을 조회

SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID, COMMISSION_PCT
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL;
 
-- 부서가 없는 직원의 이름은 누구일까요?
-- 정답은요? >>

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NULL;
 
-- 직속상관이 없는 사장님의 정보를 조회
SELECT *
  FROM EMPLOYEES
 WHERE MANAGER_ID IS NULL;
 
-- SQL 연산자
--> SQL에서만 사용할 수 있는 연산자이다.
-- IN, BETWEEN, LIKE

-- 부서ID가 30이거나 50이거나 90인 직원의 이름과 부서ID를 출력
SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID =30 OR DEPARTMENT_ID =50 OR DEPARTMENT_ID =90;
 
-- IN 연산자
-- 특정 컬럼에 포함된 데이터를 여러 개 조회할 때 사용하는 연산자
--> = + OR 결과 값
--> IN 연산자는 NULL값을 제외하는 특성을 가지고 있어요!!

-- IN 연산자 활용
SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN(30,50,NULL);
 
-- 직원테이블에서 직책이 IT_PROG이거나 ST_MAN인 직원의 이름과 직책정보를 조회
SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID IN('IT_PROG','ST_MAN');
 
-- 전화번호가 650.127.1634, 603.123.6666, 515.123.5555 인 직원의
-- 이름과 입사일 정보 조회

SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE PHONE_NUMBER IN('650.127.1634', '603.123.6666', '515.123.5555');
 
-- NOT IN : IN 뒤에 조건에 해당하지 않는 데이터를 출력
-- != + AND

--부서아이디가 30,50,100에 해당하지 않는 직원의 이름과 부서 아이디를 출력
SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID NOT IN(30,50,100);
 
--BETWEEN A AND B (A이상 B이하의 값을 출력)
--> 일정 범위 내의 데이터를 조회할 때 사용
--> BETWEEN 최소값 AND 최대값 : 최소값 이상 최대값 이하
--> 특정 열 값의 최소, 최고 범위를 지정하여 해당 범위 내의 데이터만 조회하는 것

-- 급여가 10000이상 20000이하의 범위 내에서 받고 있는 직원의 이름과 급여 정보 조회
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 10000 AND 20000; --BETWEEN A AND B ==> 최솟값 이상 최대값 이하
 
-- LIKE 연산자
--> 일부 문자열이 포함된 데이터를 조회할때 사용
--> %,_ 라는 와일드 카드를 이용해서 매칭 연산을 진행한다.

-- % : 길이와 상관없이 모든 데이터를 의미
-- _ : 어떤 값이든 상관없이 한개의 문자 데이터를 의미

-- 직원테이블에서 핸드폰 번호가 650으로 시작하는 핸드폰 번호 찾기

SELECT PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE'650%'; 
 
-- FIRST_NAME이 대문자 S시작하고 n 으로 끝나는 직원의 이름 찾기
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE'S%n';
 
-- FIRST_NAME이 it 으로 긑나고 총 4글자인 직원의 이름 찾기
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '__it';
-- 이름의 두번째 글자가 e인 직원의 이름 찾기
SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '_e%';
-- 직원테이블에서 01월에 입사한 직원찾기
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE LIKE '__/01%';

SELECT *
  FROM EMP
 WHERE ENAME LIKE'%S';