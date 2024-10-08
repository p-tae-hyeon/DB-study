--CHAPTER 01. SELECT

-- 주석 기호

-- 글짜 크기 키우기 : 도구 > 환경설정 > 코드편집기 > 글꼴
-- 주석 샐깔 바꾸기 : 도구 > 환경설정 > 코드편집기 > PL/SQL주석

-- 주석형태(2) : /**/ --> 여러줄을 한번엔 주석처리 할수있는 주석 기호

/*
1. SQL문장에는 대소문자를 구분하지 않는다. 
2. 띄어쓰기나 줄바꿈 또한 명령어 수행에 영향을 주지 않는다.
3. SQL 문장 끝에는 꼭 세미콜론(;)을 찍어줘야 한다!.
4. SQL 실행 단축키는 : CTRL + ENTER, F9
*/
SELECT FIRST_NAME
  FROM EMPLOYEES;
-- 직원테이블에서 직원ID, 직원이름(FIRST_NAME, LAST_NAME), 급여(SALARY)의 정보를 조회.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
  FROM EMPLOYEES;  
-- 부서테이블의 부서아이디, 부서이름을 조회
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
  FROM DEPARTMENTS;
  
-- [ SELECT 절 기본 사용 방법 ]
-- SELECT 조회할 컬럼 명1,... 조회할 컬럼명N
-- FORM 조회 할 테이블 명

DESC EMPLOYEES;

-- DESC(Describe) : SQL에서 사용되는 데이터베이스 테이블의 구조를 확인하는 명령어!!

DESC DEPARTMENTS;

-- * (전체조회) : 아스타리스크 라고 읽는다.

-- 직원 테이블의 전체 정보 출력하기
SELECT *
  FROM EMPLOYEES;
-- 부서 테이블의 전체 정보 출력
SELECT *
  FROM DEPARTMENTS;
-- 직업 테이블의 전체 정보 출력
SELECT *
  FROM JOBS;
-- 직원 테이블에서 직원아이디, 이메일, 매니저아이디, 부서아이디, 이름(FIRST_NAME) 순서대로 출력
SELECT EMPLOYEE_ID, EMAIL, MANAGER_ID, DEPARTMENT_ID, FIRST_NAME
  FROM EMPLOYEES;
  
-- 직원 테이블에서 부서아이디를 조회.
SELECT DEPARTMENT_ID
  FROM EMPLOYEES;
  
--DISTINCT : 데이터 중복 제거

-- SELECT[ALL(DEFAULT값) / DISTINCT] 조회할 컬럼명

SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES;
  
-- 직원테이블에서 직업ID의 중복을 제거하여 직업은 총 몇개가 있는지 확인해주세요
SELECT DISTINCT JOB_ID
  FROM EMPLOYEES; -- 19개
  
-- 직원테이블에서 JOB_ID와 부서ID를 중복을 제거하여 출력
SELECT DISTINCT JOB_ID, DEPARTMENT_ID
  FROM EMPLOYEES;

-- 한쪽 컬럼에 중복이 있어도 다른 쪽 컬럼의 값이 다르면 다르게 취급해요.

-- * TIP ) 컬럼의 유형이 숫자형이거나 날짜형이면 숫자연산이 가능하다.(+, -, *, /)
DESC EMPLOYEES;

SELECT FIRST_NAME, SALARY
     , SALARY * 12  
  FROM EMPLOYEES;
  
-- 별칭 사용하기
-- ALIAS 라고 하며 한눈에 보기 좋게 설정 할수 있다.
-- AS 키워드를 사용하여 별칭을 지정한다.

-- 별칭 사용 방법 4가지
-- 1. SELECT 컬럼명 별칭
-- 2. SELECT 컬럼명 "별칭"
-- 3. SELECT 컬럼명 AS 별칭
-- 4. SELECT 컬럼명 AS "별칭"

-- #_$는 사용가능

SELECT FIRST_NAME AS 이름, SALARY AS 급여,SALARY * 12 AS 연봉
  FROM EMPLOYEES;
  
SELECT * FROM EMPLOYEES;

-- 직원테이블에서 입사일(HIRE_DATE) 출력, 입사일 다음날도 출력
SELECT HIRE_DATE AS 입사일, HIRE_DATE+1 AS "입사일 다음날"
  FROM EMPLOYEES;
  
-- ORDER BY 절
--> 특정 컬럼을 기준으로 정렬된 상태로 출력하고자 할때 사용한다ㅓ
--> SQL실행순서에서 가장 마지막에 실행 된다.
--> 별도로 정렬 방식을 지정하지 않으면 기본적으로 오름차순이 적용 된다.

-- ASC(ASCENDING) : 오름차순 정렬 (1,2,3,4,5,.....) 기본값
-- DESC (DESENDING) : 내림차순 정렬 (5,4,3,2,1,.....)

-- 직원 테이블에서 모든 직원의 정보를 조회
-- 단 급여 기준으로 오름차순으로 정렬하여 조회.
SELECT *
  FROM EMPLOYEES
ORDER BY SALARY ASC;

-- 최근에 입사한 날짜를 기준으로 직원의 이름과 입사날짜를 조회
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;

-- 직원테이블에서 직원아이디, 부서아이디, 이름(FIRST_NAME), 급여 순으로 출력
-- 단 부서아이디는 오름차순으로, 급여는 내림차순으로 정렬
SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC;

-- 부서아이디를 먼저 오름차순으로 정렬후 급여를 내림차순으로 정렬을 시킨것
-- 같은 부서에서 근무하고 있는 직원들끼리 급여가 높은 직원과 낮은 직원을 구분해서 출력

-- NULL이란?
-- NULL값이란 데이터의 값이 완전히 비어 있는 상태를 말한다.
-- 값이 존재하지 않거나 정해지지 않은 것을 의미한다.
-- 숫자0과 공백문열 ' '은 NULL값이 아니다.
-- ** NULL값과 산술연산을 하게 되면 무조건 NULL값이 나온다.
-- ** NULL값과 비교연산을 하게 되면 무조건 FALSE가 나온다.

-- 직원 테이블에서 직원의 아이디와 이름과 급여와 보너스 정보를 조회

SELECT * FROM EMPLOYEES;

DESC EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT
     , COMMISSION_PCT * 2
  FROM EMPLOYEES;
  
-- 왜 이렇게 출력이 됬는지 설명을

-- NULL값은 존재하지 않는 값이기 때문에 숫자와 산술 연산을 할수없다. (내 답)
-- NULL값은 산술 연산이 적용이 안되기 때문에 무조건 NULL값이 나온다.(쌤 답)
-- NULL값은 완전 비어있는 상태 이기 때문에, 존재하지 않는 값이다.(쌤 답)
-- 숫자 0이랑 ' '는 NULL값이 아니다!(쌤 답)
-- NULL값은 비교연산도 안되기 때문에 결과 값이 무조건 FALSE가 나온다.(쌤 답)
