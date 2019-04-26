-- 여기는 gradeUser 로 접속한 화면 입니다.

-- 학생리스트
-- 00001:에이미:010-8694-3742:대구 서구 이현동
-- 학생리스트 테이블 생성

CREATE TABLE tbl_student (
    st_num CHAR(5) PRIMARY KEY,
    st_name nVARCHAR2(30) NOT NULL,
    st_tel nVARCHAR2(20),
    st_addr nVARCHAR2(50)
);

SELECT * FROM tbl_student ;
DELETE FROM tbl_student ;
COMMIT ;

-- SELECT를 수행할때
-- (특별히 문자열일 경우) 값의 전체를 알지 못하고
-- 일부만을 알고 있을때, 부분 문자열 검색
-- 부분문자열 검색은 DB의 SQL 명령문중에
-- 가장 성능이 떨어지는 실행
-- 따라서 특별한 경우가 아니면 가급적 사용하지 않는 것이 좋다.
SELECT *
FROM tbl_student
WHERE st_name LIKE '김%';

-- st_name 칼럼에 정 이라는 문자열이 포함된 데이터
SELECT *
FROM tbl_student
WHERE st_name LIKE '%정%';

SELECT *
FROM tbl_student
WHERE st_name LIKE '%윤'
    OR st_name LIKE '%정%'
    OR st_name LIKE '%철%';
    
ALTER TABLE tbl_student MODIFY st_num CHAR(7) ; 

--  private String sc_code;
--	private int sc_kor;
--	private int sc_eng;
--	private int sc_math;

CREATE TABLE tbl_score (
    sc_num CHAR(5) PRIMARY KEY,
    sc_kor NUMBER(3),
    sc_eng NUMBER(3),
    sc_math NUMBER(3)
);