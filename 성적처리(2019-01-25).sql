-- gradeUser로 접속한 성적처리 화면입니다.
SELECT * FROM tbl_student;
DROP TABLE tbl_score;

CREATE TABLE tbl_student
(	
    ST_NUM CHAR(5),
	ST_NAME NVARCHAR2(30), 
	ST_TEL NVARCHAR2(20), 
	ST_ADDR NVARCHAR2(50)
);

SELECT * FROM tbl_score;
--ID	학번	과목	점수
CREATE TABLE tbl_score (
    sc_id NUMBER PRIMARY KEY,
    sc_st_num VARCHAR2(5) NOT NULL,
    sc_subject VARCHAR2(3) NOT NULL,
    sc_score NUMBER(3)
);
SELECT COUNT(*) FROM tbl_score;

-- 과목테이블 생성
-- 과목번호 과목명 담당교수
CREATE TABLE tbl_subject (
    su_num VARCHAR2(3) PRIMARY KEY,
    su_name nVARCHAR2(20) NOT NULL,
    su_pro nVARCHAR2(30)
);
INSERT INTO tbl_subject
VALUES('001', '국어', '홍길동');

-- 필요한 일부 칼럼에만 데이터만 있을경우
INSERT INTO tbl_subject(su_num, su_name)
VALUES('002', '영어');

-- 테이블을 생성할 당시의 칼럼 순서를 모르거나 
-- 정확히 칼럼과 일치되도록 데이터를 작성하는 방법
INSERT INTO tbl_subject(su_name, su_num, su_pro)
VALUES('수학', '003', '성춘향');

INSERT INTO tbl_subject(su_num, su_name)
VALUES('004', '물리');
INSERT INTO tbl_subject(su_num, su_name)
VALUES('005', '음악');
INSERT INTO tbl_subject(su_num, su_name)
VALUES('006', '음악');

SELECT * FROM tbl_subject;
-- 데이터를 확인해 보니 음악데이터가 2개가 있음
-- 과목번호 006은 음악이아니고 무용이다.
-- 해당데이터를 수정하려고 한다.

UPDATE tbl_subject SET su_name = '무용'
WHERE su_num = '006';

INSERT INTO tbl_subject(su_num, su_name)
VALUES('900','국토지리');

-- 데이터를 확인해보니 과목번호 900은 잘못입력된 데이터이다.
-- 이 데이터를 삭제하고 재입력 하려고 한다.
DELETE FROM tbl_subject WHERE su_num = '900';

-- 성적테이블의 데이터를 확인하는데
-- 과목칼럼의 데이터들이 과목명이 아니고, 과목 번호로 되어있다.
-- 그래서 성적테이블과 과목테이블을 join을 실행해서 조회를 하려고 한다.
SELECT SC.sc_st_num, SC.sc_subject, su.su_name, SC.sc_score
FROM tbl_score SC -- 확인하고자 하는 주 테이블
LEFT JOIN tbl_subject SU --주 테이블에 조회를 도와주는 서브 테이블
ON SC.sc_subject = SU.su_num; -- 두 테이블을 연결하기 위한 조건문
 
-- 성적조회를 하는데 학생명이 없어서 누구의 점수인지 확인하기가 어렵다.
-- 학생테이블과 join을 실행해서 조회를 하려고 한다.
SELECT ST.st_num, st.st_name, sc.sc_score
FROM tbl_score SC -- 확인하고자 하는 주 테이블
LEFT JOIN tbl_student ST --주 테이블에 조회를 도와주는 서브 테이블
ON SC.sc_st_num = ST.st_num; -- 두 테이블을 연결하기 위한 조건문

-- 성적테이블과 학생테이블의 학번 칼럼이 type이 달라서
-- JOIN이 실행되지 않는다.
-- 칼럼을 변경
ALTER TABLE tbl_student MODIFY st_num CHAR(5) ;
ALTER TABLE tbl_score MODIFY sc_st_num CHAR(5); 

-- 학생테이블과 과목테이블을 점수테이블에 동시에 join을 실행해서 view하기
-- 조회된 결과를 view로 생성하려면 AS를 만들어 주어야 한다.
CREATE VIEW view_score
AS
SELECT SC.sc_st_num AS 학번, ST.st_name AS 학생이름, SC.sc_subject AS 과목번호,
        SU.su_name AS 과목이름, SC.sc_score AS 점수
FROM tbl_score SC

LEFT JOIN tbl_student ST
ON SC.sc_st_num = ST.st_num

LEFT JOIN tbl_subject SU
ON SC.sc_subject = SU.su_num 
ORDER BY SC.sc_st_num ; -- 학번순으로 정렬

SELECT * FROM view_score;

-- 문자열 합성
SELECT 'KOREA' || '는 우리나라' FROM DUAL;

SELECT RPAD('3',5,'0') FROM DUAL;
SELECT LPAD('3',5,'0') FROM DUAL;

-- view_score는 성적테이블, 학생테이블, 과목테이블이 조인된 view이다
SELECT * FROM view_score;

-- view_score를 사용해서 SELECT 연습
-- 학번 이름 총점 형식의 view 생성
SELECT 학번, 학생이름, SUM(점수), AVG(점수)
FROM view_score
GROUP BY 학번, 학생이름
ORDER BY 학번 ;

-- 학번 이름 국어 영어 수학 과학 음악 총점 형식
-- 한 학생의 점수를 여러개의 레코드에 저장해 두고
-- view를 할때 일람표 처럼 보이는 SQL
SELECT 학번, 학생이름, 
    SUM(DECODE(과목번호,'001',점수)) AS 국어,
    SUM(DECODE(과목번호,'002',점수)) AS 영어,
    SUM(DECODE(과목번호,'003',점수)) AS 수학,
    SUM(DECODE(과목번호,'004',점수)) AS 과학,
    SUM(DECODE(과목번호,'005',점수)) AS 음악,
    SUM(점수) AS 총점,
    AVG(점수) AS 평균,
    RANK() OVER(ORDER BY AVG(점수) DESC) AS 순위
FROM view_score
GROUP BY 학번, 학생이름
ORDER BY 학번;