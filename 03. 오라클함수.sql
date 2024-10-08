-- CHAPTER 03 . 오라클 함수

-- 함수란 (Funtion) 이란?
-- 입력 값을 넣어서 특정한 기능을 통해 결과 값을 출력

-- 사용자 정의함수 : 사용자가 필요에 의해서 직접 정의한 함수
-- 내장함수 : 오라클에서 미리 만들어 놓은 함수, 필요할때마다 호출해서 사용
-- 내장함수는 문자형, 숫자형, 날짜형, 변환형, NULL처리함수, 조건함수가 있다.

-- 함수이름()
-- 함수를 실행할때 사용하는 입력값 : 인자 값

-- [ 문자형 함수 ]
-- UPPER() : 괄호 안 문자 데이터를 모두 대문자로 변환하여 출력
-- LOWER() : 괄호 안 문자 데이터를 모두 소문자로 변환하여 출력

-- DUAL테이블이란?
-- 오라클 최고관리가(SYS)소유의 테이블
--> 임시 연산이나 함수의 결과 값 확인 용도로 사용하는 테스트용 테이블이다!!

-- 직원의 이름(FIRST_NAME)과 EMAIL 정보를 출력
-- 다만 FIRST_NAME은 모두 대문자로, EMAIL정보는 모두 소문자로 출력

SELECT UPPER(FIRST_NAME), LOWER(EMAIL)
  FROM EMPLOYEES;
  
-- LENGTH() : 골화 안 문자 데이터의 길이를 구하는 함수이다.

SELECT LENGTH('HELLO WORLD')
  FROM DUAL;
  
-- 직원의 이름과 이름의 길이를 조회.

SELECT FIRST_NAME, LENGTH(FIRST_NAME)
  FROM EMPLOYEES;
 
-- 직원의 이름의 길이가 5 이상의 직원들만 조회.
SELECT FIRST_NAME,LENGTH(FIRST_NAME)
  FROM EMPLOYEES
 WHERE LENGTH(FIRST_NAME) >=5;
 
-- SUBSTR() : 문자열을 추출하는 함수
--1) SUBSTR(입력값, 시작위치, 추출길이)
--> 문자열 데이터의 시작위치부터 추출 길이만큼 출력
--2) SUBSTR(입력값, 시작위치)
--> 추출길이 생략 시 문자열 데이터의 시작위치부터 끝까지 출력

SELECT SUBSTR('빅데이터 분석서비스', 1,4) AS "빅데이터"
     , SUBSTR('빅데이터 분석서비스', 6,5) AS "분석서비스"
     , SUBSTR('빅데이터 분석서비스', 8) AS "서비스"
     , SUBSTR('빅데이터 분석서비스', 3) AS "이터 분석서비스"
  FROM DUAL;
  
SELECT HIRE_DATE FROM EMPLOYEES;

-- 입사날짜에서 연도, 월, 일 별로 출력
-- 각 컬럼에는 연도, 월, 일이라는 별칭을 사용해서 출력

SELECT SUBSTR(HIRE_DATE,1,2) AS "연도"
     , SUBSTR(HIRE_DATE,4,2) AS "월"
     , SUBSTR(HIRE_DATE,7) AS "일"
  FROM EMPLOYEES;
  
-- REPLACE() : 특정 문자를 다른 문자로 바꾸어 주는 함수
-- 1) REPLACE(문자열 데이터, 바꾸고 싶은 문자, 바꿔야 할 문자)
-- 2) REPLACE(문자열 데이터, 바꾸고 싶은 문자)
--> 바꿔야 할 문자를 생략시 바꾸고 싶은 문자는 문자열 데이터에서 삭제가 된다!!

SELECT REPLACE('목포는# 항구다!','#', '_')
     , REPLACE('목포는# 항구다!','#')
  FROM DUAL;
  
-- 직원테이블에서 입사날짜를 출력하되
-- /를 문자열 -(하이픈) 으로 바꿔서 출력
-- /를 삭제하여 출력

SELECT REPLACE(HIRE_DATE,'/','-') AS "USE -"
     , REPLACE(HIRE_DATE,'/') AS "DELETE /"
  FROM EMPLOYEES;
  
-- CONCAT() : 두 문자열 데이터를 합치는 함수
--> 인자값으로 2개만 들어갈수 있고, 2개의 문자열만 합치는 함수이다.
--> 합성연산자 '||' 를 이용하면 무한대로 문자열 연결이 가능하다.

SELECT CONCAT('목포는', '항구다'||' 영화재밌어요'||' 이래도되는데?'||'!!!!!!!!')
  FROM DUAL;
  
-- TRIM() : 입력 받은 문자형 데이터의 양 끝의 공백을 제거한다.

SELECT REPLACE('여러분은 중요한 사람입니다!        ',' ')
  FROM DUAL;
  
-- [ 숫자형 함수 ]

-- RODUN() : 특정 위치에서 반올림 하는 함수
-- 1) ROUND(반올림 할 숫자, 반올림 위치)
-- 2) ROUND(반올림 할 숫자)
--> 반올림 위치 생략시 강제로 첫번째 자리에서 반올림 수행

SELECT ROUND(1234.56789,-2)
  FROM DUAL;
  
-- MOD() : 숫자를 나눈 나머지 값을 구하는 함수
--> 홀수, 짝수를 구분할 때 사용한다.
-- MOD(베이스숫자, 나눠줄 숫자)

SELECT MOD(10,2)
     , MOD(10,3) AS "1"
     , MOD(15,6) AS "3"
  FROM DUAL;
  
-- [ 날짜형 함수 ]
-- SYSDATE : 현재 날짜와 시간을 출력해주는 함수
--> 입력시 바로 출력이 되며, 현재 시간을 초 단위까지 출력이 가능하다!!
--> 날짜형 데이터는 연산이 가능하다.
--> 날짜 데이터끼리는 연산이 불가능하다!!

SELECT SYSDATE
  FROM DUAL;

-- 날짜형식 셋팅
-- 도구 > 환경설정 > 데이터베이스 > NLS > 날짜형식 > YYYY-MM-DD HH24:MI:SS

SELECT SYSDATE AS "NOW"
     , SYSDATE + 1 AS "TOMORROW"
     , SYSDATE - 1 AS "YESTERDAY"
  FROM DUAL;
  
-- 날짜데이터 활용(실무)
SELECT SYSDATE AS "현재"
     , SYSDATE +1 AS 하루더함
     , SYSDATE +1/24 AS 한시간더함
     , SYSDATE +1/24/60 AS 일분더함
     , SYSDATE +1/24/60/60 AS 일초더함
--   , SYSDATE + SYSDATE --> 날짜 데이터끼리는 연산이 불가능하다!!
  FROM DUAL;
  
-- ADD_MONTHS() : 몇개월 이후 날짜를 구하는 함수
-- ADD_MONTHS(날짜데이터, 더하거나 뺄 개월수)

SELECT ADD_MONTHS(SYSDATE,-1)
     , ADD_MONTHS(SYSDATE, +6)
  FROM DUAL;
  
-- { 변환 형 함수 }

-- 형변환 형태의 종류
-- 암시적 형변환 : 데이터베이스가 자동으로 형변환을 해주는 것
SELECT 123+'100'
  FROM DUAL;
  
-- 명시적 형변환 : 데이터 변환형 함수를 사용해서 사용자가 직접 자료형을 지정 해주는 것
--SELECT '123,00'+100
--  FROM DUAL;

-- TO_CHAR() : 날짜, 숫자 데이터를 문자 데이터로 변환 해주는 함수
-- TO_CHER(변환 할 데이터, 출력포맷형태)

SELECT SALARY
     , TO_CHAR(SALARY, 'L999,999')
  FROM EMPLOYEES;
  
SELECT TO_CHAR(SYSDATE,'YY/MM/DD/DAY')
  FROM DUAL;
  
-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환 하는 함수
-- TO_NUMBER(문자열데이터, 인식 될 숫자형태)

SELECT TO_NUMBER('1,000','9,999') + 500
  FROM DUAL;
  
-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환 하는 함수
-- TO_DATE(문자열 데이터, 인식 될 날짜 형태)

SELECT TO_DATE('20240812','YYYY/MM/DD')
  FROM DUAL;
  
--(NULL을 처리하는 함수)

-- NVL / NVL2 : NULL 값을 대체 할 수 있는 함수
-- 1) NVL(NULL인지 여부를 검사할 데이터, NULL일 경우 반환할 데이터)
-- 2) NVL2(NULL인지 여부를 검사할 데이터, NULL이 아닐경우 반환할 데이터, NULL일경우 반환할 데이터)

SELECT FIRST_NAME, DEPARTMENT_ID
     , NVL(DEPARTMENT_ID, '0')
  FROM EMPLOYEES;

SELECT FIRST_NAME, DEPARTMENT_ID, NVL2(DEPARTMENT_ID,'1','0')
  FROM EMPLOYEES;
  
-- 직원테이블에서 보너스(COMMISSION_PCT)가 없는 직원은 숫자 0으로 대체해서 출력
SELECT FIRST_NAME, NVL(COMMISSION_PCT, '0')
  FROM EMPLOYEES;
-- 직원테이블에서 직원ID, FIRST_NAME, MANAGER_ID를 출력
-- 매니저가 있는 직원은 '직원' 으로 출력
-- 매니저가 없는 직원은 '대표' 로 구분하여 출력
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID, NVL2(MANAGER_ID, '직원', '대표')
  FROM EMPLOYEES;
  
-- [ 조건 함수 ]
-- DECODE() : 상황에 따라서 다른 데이터로 반환하는 함수
--> 검사 대상과 비교해서 지정한 값을 반환

-- DECODE(검사대상이 될 컬럼 또는 데이터<기준>, 비교 값<2>, 일치시 반환 할 값<3>
--        , 불일치시 반환 할 값<4>)
SELECT FIRST_NAME, DEPARTMENT_ID
     , DECODE(DEPARTMENT_ID, NULL, '부서없음','부서있음')
  FROM EMPLOYEES;
  
-- 직원테이블에서 직원ID, FIRST_NAME, MANAGER_ID를 출력 (DECODE 함수로)
-- 매니저가 있는 직원은 '직원' 으로 출력
-- 매니저가 없는 직원은 '대표' 로 구분하여 출력
-- 매니저아이디가 100이면서 직원아이디가 101인 직원을 전무이사로 구분
-- 직원아이디가 102인 직원은 상무이사로 구분
-- 직원아이디가 103인 직원은 팀장으로 구분
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , DECODE(EMPLOYEE_ID, 100, '대표', 101, '전무이사', 102, '상무이사', 103,'팀장','직원')
  FROM EMPLOYEES;
  

