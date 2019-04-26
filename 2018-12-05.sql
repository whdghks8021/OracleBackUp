-- 여기는 관리자 화면입니다.
-- SQL의 주석문
-- ctrl + / : 주석설정 및 해제
-- 우리나라
-- 대한민국
-- ctrl + s : 저장 

SELECT 30+30 FROM DUAL;
SELECT '대한민국' FROM DUAL;
SELECT 30*30 FROM DUAL;

-- SELECT : 데이터를 조회(읽기)를 수행하는 keyword
--          간단한 연산(4칙연산)등을 수행할때도 사용할수 있다.
--          간단한 연산을 수행할때 표준(보편적인) DBMS에서는
--          SELECT 30 * 40; 이라고 입력하면 수행이 되나,
--          오라클에서는 SELECT 30*40 FROM DUAL; 이라고 입력해야 수행이 완료된다.
