--  GROUP BY / HAVING 

-- 내장함수의 종류
-- 단일행 함수 : 입력된 하나의 행당 결과가 하나씩 나오는 함수
-- 다중행 함수 : 여러 행을 입력받아 하나의 결과 값으로 출력이 되는 함수
-- > 다중행 함수를 집계함수라고 부른다.

-- 다중행함수(집계함수)의 특징
-- 1. 집계함수는 NULL값을 제외하는 특성을 가지고 있다.
-- 2. 집계함수는 그룹화(GROUP BY)가 되어 있는 상태에서만 사용이 가능하다.

-- 집계 함수의 종류
-- COUNT : 지정한 데이터의 개수 반환
-- SUM : 지정한 데이터의 합 반환
-- MAX : 지정한 데이터 중 최대값 반환
-- MIN : 지정한 데이터 중 최소값 반환
-- AVG : 지정한 데이터의 평균값 반환

-- COUNT 함수 : 지정한 데이터의 개수를 반환
-- COUNT(데이터)


-- 직원테이블에서 직원ID의 행의 개수를 조회 ( 총 직원수 )
SELECT * FROM EMPLOYEES;


-- 출력하고자 하는 행의 갯수가 맞지 않아서 에러가 남
SELECT EMPLOYEE_ID -- 107개
     , COUNT(EMPLOYEE_ID) -- 1개
  FROM EMPLOYEES;


-- 직원테이블을 하나의 그룹으로 묶은 걸로 인식을 해서 집계함수가 실행이 된다.
SELECT COUNT(EMPLOYEE_ID)
  FROM EMPLOYEES
GROUP BY(); -- 사실 이 키워드가 숨겨져 있는겁니다. 소괄호 안에 데이터가 없는 상태


-- COUNT 함수는 *(아스타리스크) 를 사용할수 있습니다.
-- 다른 집계 함수는 사용못해요 
-- * 아스타리스크를 사용하면 NULL값까지 포함해서 출력을 해준다!

SELECT COUNT(*)
  FROM EMPLOYEES;

-- 풀어볼까요?  
-- 직원테이블에서 부서ID의 행의 개수를 출력

SELECT COUNT(DEPARTMENT_ID)
  FROM EMPLOYEES;  -- 106개 가 나옴 , 직원중에 한명이 NULL값

-- 카운트 함수에 인자값을 아스타리스크를 사용하는거랑 컬럼값을 입력하는 것이랑 차이점 알수있죠?

-- 퀴즈!

-- 학생들에게 카톡으로 배포 
-- 문제1) 직원테이블에서 급여의 총 합계를 출력 (SUM 함수사용)
-- 문제2) 직원테이블에서 직원들의 최대 급여와 최소 급여를 출력 (MAX/MIN 함수)
-- 문제3) 직원테이블에서 부서ID가 100인 직원의 평균 급여를 출력 (AVG 함수)
--        * 결과값은 소수점 1의 자리까지 반올림

-- 문제1) 직원테이블에서 급여의 총 합계를 출력 (SUM 함수사용)
SELECT SUM(SALARY) AS RESULT_SUM
  FROM EMPLOYEES;

-- 문제2) 직원테이블에서 직원들의 최대 급여와 최소 급여를 출력 (MAX/MIN 함수)
SELECT MAX(SALARY) AS RESULT_MAX
     , MIN(SALARY) AS RESULT_MIN
  FROM EMPLOYEES;
-- 너무 차이가 심하네요 안다녀..

-- 문제3) 직원테이블에서 부서ID가 100인 직원의 평균 급여를 출력 (AVG 함수)
--        * 결과값은 소수점 1의 자리까지 반올림

SELECT ROUND(AVG(SALARY) , 1) AS RESULT_AVG
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100;
 
-- 테스트 쿼리 생성
-- 테스트 테이블 조회

SELECT * FROM 수강생정보;
SELECT * FROM 성적표;

-- GROUP BY : 특정 컬럼을 기준으로 그룹화 (묶음)

-- 수강생정보 테이블에서 소속반 별(GROUP BY) 학생의 인원수를 조회.
-- 먼저 수강생정보 테이블 확인

SELECT 소속반,COUNT(학생이름)
  FROM 수강생정보
GROUP BY 소속반 ;
 
-- 집계함수 사용시 유의사항
-- 이것만 알고있으면 여러분들 GROUP BY 사용하는데 있어서 별 무리없이 사용하실수 있으실 겁니다.

-- 학생들에게 문제 카톡에 전달
-- 문제1) 성적표 테이블에서 과목별로 최고 성적과 최저 성적을 출력
-- 문제2) 성적표 테이블에서 학생별로 평균 점수 출력
--       단, 소수점 1자리까지만 출력

-- 문제1) 성적표 테이블에서 과목별(GROUP BY)로 최고 성적과 최저 성적을 출력
SELECT 과목
     , MAX(성적)
     , MIN(성적)
  FROM 성적표
GROUP BY 과목 ;

-- 문제2) 성적표 테이블에서 학생별(GROUP BY)로 평균 점수 출력
--       단, 소수점 1자리까지만 출력

SELECT 학생ID
     , ROUND(AVG(성적),1)
  FROM 성적표
GROUP BY 학생ID ;


--문제3) 성적표테이블에서 학생별(GROUP BY)로 JAVA와 DATABASE과목의 성적의 합을 출력

SELECT * FROM 성적표;

SELECT 학생ID
     , SUM(성적)
  FROM 성적표
WHERE 과목 IN ('JAVA' , 'DATABASE')
GROUP BY 학생ID ;

-- 선별하는 작업은 어디서해주나요?
-- 1차적으로 WHERE절에서 원하는 행을 선별하는 작업을 해준겁니다.
-- 여기까지 해서 GROUP BY절까지 배워봤구요

--실행순서 -- SQLD에서 최소 10문제는 맞췄스니다.

-- HAVING 절 : GROUP BY절이 존재 할 때만 사용이 가능합니다.
--> 집계가 완료된 대상을 조건을 통해 필터링 하는 문법이다.
-- 조건이 참인 결과만 출력된다는 점에서는 WHERE절과 비슷하지만,
-- HAVING절은 그룹화된 대상에서 출력이 된다는 점에서 다르다.

-- 문제) 성적표테이블에서 학생별 평균성적을 구하고,
--       평균 성적이 75 이하인 학생들만 출력

SELECT 학생ID, ROUND(AVG(성적),1)
  FROM 성적표
GROUP BY 학생ID
HAVING ROUND(AVG(성적),1) <= 74;


-- SQL 실행순서에 의거하여 WHERE절은 GROUP BY절보다 먼저 실행이 되기 때문에 
-- GROUP BY가 되어있지 않는 상태이기 때문에 에러가 난다.
SELECT 학생ID, ROUND(AVG(성적),1)
  FROM 성적표
WHERE ROUND(AVG(성적),1) < 75
GROUP BY 학생ID ;

--WHERE절과 HAVING절의 차이점 설명
-- 자 여기까지 이해하셨으면 그룹바이 헤빙절은 마스터 하신겁니다 여러분 축하드립니다!!

-- 학생들 카톡에 보내줄 문제
--문제1) 수강생정보 테이블에서 반별 인원수가 3명 이상인 반만 출력
--문제2) 직원테이블에서 부서별 최고 연봉이 100000 이상인 부서만 출력
--문제3) 성적표 테이블에서 학생별 평균성적을 출력하되,
--      NULL이 아닌 값만 출력, 단 성적의 소수점 1의 자리까지만 출력


--문제1) 수강생정보 테이블에서 소속반별 인원수가 3명 이상인 반만 출력
SELECT 소속반
     , COUNT(소속반)
  FROM 수강생정보
GROUP BY 소속반
HAVING COUNT(소속반) >= 3;

--문제2) 직원테이블에서 부서별 최고 연봉이 100000 이상인 부서만 출력
SELECT DEPARTMENT_ID, MAX(SALARY * 12)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY * 12) >= 100000;


--문제3) 성적표 테이블에서 학생별 평균성적을 출력하되,
--      NULL이 아닌 값만 출력, 단 성적의 소수점 1의 자리까지만 출력

SELECT 학생ID
     , ROUND(AVG(성적),1)
  FROM 성적표
 GROUP BY 학생ID
HAVING ROUND(AVG(성적),1) IS NOT NULL;

-- 문제) 수강생 정보 테이블에서 소속반별 인원수가 3명 이상인 반만 조회
SELECT * FROM 수강생정보;

SELECT 소속반, COUNT(소속반)
  FROM 수강생정보
GROUP BY 소속반
HAVING COUNT(소속반) >=3;

-- 성적표 테이블에서 과목별 최고 성적과 최저성적을 출력
SELECT 과목, MAX(성적), MIN(성적)
  FROM 성적표
GROUP BY 과목;

-- 성적표 테이블에서 학생별 평균 점수를 출력 단 소숫점 1의 자리까지만 출력
SELECT 학생ID, ROUND(AVG(성적),1)
  FROM 성적표
GROUP BY 학생ID;

-- 성적표 테이블에서 학생별로 JAVA와 DATABASE 과목의 성적의 합만 출력

SELECT  학생ID, SUM(성적)
  FROM 성적표
 WHERE 과목 != 'PYTHON'
GROUP BY 학생ID;

-- 수강생 정보 테이블에서 소속반별 인원수가 3명 이상인 반만 출력

SELECT 소속반, COUNT(소속반)
  FROM 수강생정보
GROUP BY 소속반
HAVING COUNT(소속반) >=3;

-- 직원테이블에서 부서별(GROUP BY) 최고 연봉이 100000 이상인 부서만 조회.

SELECT DEPARTMENT_ID, MAX(SALARY*12)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY*12) >=100000;
















