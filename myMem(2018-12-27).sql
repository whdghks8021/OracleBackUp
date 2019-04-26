-- 여기는 myMem 입니다.

DROP TABLE tbl_score;

CREATE TABLE tbl_score (
    g_id	NUMBER		PRIMARY KEY,
    g_stname	nVARCHAR2(50)	NOT NULL,	
    g_subject	nVARCHAR2(10)	NOT NULL,	
    g_score	NUMBER		
);

SELECT COUNT(*) FROM tbl_score;

-- SQL에서 SELECT는 for 명령과 거의 유사
SELECT g_stname, SUM(g_stname)
FROM tbl_score;

-- SUM 함수는 반드시 숫자형 칼럼만 매개변수로 사용할수 있다
SELECT SUM(g_stname)
FROM tbl_score;

-- 함수() = method()
-- 키워드 = 명령어

-- SQL에서 함수() 는 거의 모두가 매개변수를 반드시 필요로 한다.
-- 전체 리스트의 점수 칼럼의 총 합계를 구하라
SELECT SUM(g_score) AS intSum
FROM tbl_score;

-- 총점을 구하는데
-- 학생별로 구하라
-- 학생별로 = 학생을 구분하는 칼럼(g_stname)을 그룹으로 묶어라
SELECT g_stname,SUM(g_score) AS 총점
FROM tbl_score
GROUP BY g_stname
ORDER BY g_stname;

-- 학생별로 점수를 한줄에 나열하는 SQL을 작성
-- 이름   국어   영어   수학 ....

-- 1. 학생별 = 학생이름 칼럼으로 그룹을 묶어라
SELECT g_stname
FROM tbl_score
GROUP BY g_stname;

-- 2. 점수를 한줄에 나열
SELECT g_stname,국어,영어,수학,과학,역사
FROM tbl_score
GROUP BY g_stname;
-- 위의 SQL에서 국어,영어,수학 등 점수의 칼럼은 실제로 tbl_score에 없다.
-- 때문에 어디에선가 점수를 계산해서 변수(칼럼)에 저장하는 부분이 필요하다.
-- 점수를 계산하는 코들 오라클의 함수를 이용해서 작성한다.

SELECT g_subject, 
    DECODE(g_subject,'국어',g_score,0) AS 국어,
    DECODE(g_subject,'수학',g_score,0) AS 수학,
    DECODE(g_subject,'영어',g_score,0) AS 영어,
    DECODE(g_subject,'과학',g_score,0) AS 과학,
    DECODE(g_subject,'미술',g_score,0) AS 미술,
    DECODE(g_subject,'국사',g_score,0) AS 국사
FROM tbl_score
WHERE ROWNUM < 20;

SELECT g_subject, 
    SUM(DECODE(g_subject,'국어',g_score,0)) AS 국어,
    SUM(DECODE(g_subject,'수학',g_score,0)) AS 수학,
    SUM(DECODE(g_subject,'영어',g_score,0)) AS 영어,
    SUM(DECODE(g_subject,'과학',g_score,0)) AS 과학,
    SUM(DECODE(g_subject,'미술',g_score,0)) AS 미술,
    SUM(DECODE(g_subject,'국사',g_score,0)) AS 국사
FROM tbl_score
WHERE ROWNUM < 20
GROUP BY g_subject;


SELECT g_stname, 
    SUM(DECODE(g_subject,'국어',g_score,0)) AS 국어,
    SUM(DECODE(g_subject,'수학',g_score,0)) AS 수학,
    SUM(DECODE(g_subject,'영어',g_score,0)) AS 영어,
    SUM(DECODE(g_subject,'과학',g_score,0)) AS 과학,
    SUM(DECODE(g_subject,'미술',g_score,0)) AS 미술,
    SUM(DECODE(g_subject,'국사',g_score,0)) AS 국사
FROM tbl_score
GROUP BY g_stname;

CREATE VIEW 성적일람표
AS
SELECT g_stname, 
    SUM(DECODE(g_subject,'국어',g_score,0)) AS 국어,
    SUM(DECODE(g_subject,'수학',g_score,0)) AS 수학,
    SUM(DECODE(g_subject,'영어',g_score,0)) AS 영어,
    SUM(DECODE(g_subject,'과학',g_score,0)) AS 과학,
    SUM(DECODE(g_subject,'미술',g_score,0)) AS 미술,
    SUM(DECODE(g_subject,'국사',g_score,0)) AS 국사
FROM tbl_score
GROUP BY g_stname;

SELECT * FROM 성적일람표;

SELECT * FROM tbl_iolist
WHERE ROWNUM < 10;

SELECT *
FROM tbl_iolist I
    LEFT JOIN tbl_dept D
        ON I.io_dcode = D.d_code;

-- 거래처별로 거래금액이 얼마인가 알고 싶다.
SELECT I.io_dcode, D.d_name, D.d_ceo,
    SUM(I.io_price * I.io_quan) 거래금액
   
FROM tbl_iolist I
    LEFT JOIN tbl_dept D
        ON I.io_dcode = D.d_code
GROUP BY I.io_dcode, D.d_name, D.d_ceo;        
-- 이 SQL은 거래처별로 단순히 거래금애을 합산 한 결과다

-- 거래처별로 매입금애과 매출금액이 얼마인지 알고 싶다.
SELECT I.io_dcode, D.d_name, D.d_ceo,
    SUM(DECODE(I.io_inout,'매입', I.io_price * I.io_quan,0)) 매입금액,
    SUM(DECODE(I.io_inout,'매출', I.io_price * I.io_quan,0)) 매출금액
FROM tbl_iolist I
    LEFT JOIN tbl_dept D
        ON I.io_dcode = D.d_code
GROUP BY I.io_dcode, D.d_name, D.d_ceo; 


SELECT g_stname FROM tbl_score
GROUP BY g_stname ;


CREATE TABLE tbl_student (
    st_num	CHAR(5)		PRIMARY KEY,
    st_name	nVARCHAR2(50)	NOT NULL	
);


SELECT SC.g_stname, ST.st_name
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.g_stname = ST.st_name ;
        
ALTER TABLE tbl_score ADD g_stnum CHAR(5);
        
UPDATE tbl_score SC
SET SC.g_stnum = (
    SELECT ST.st_num FROM tbl_student ST
    WHERE Sc.g_stname = ST.st_name 
 );
 
 -- 업데이트 후 검증
 SELECT SC.g_stnum, ST.st_name, SC.g_stname,ST.st_name
 FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.g_stnum = St.st_num
WHERE ST.st_name IS NULL;        

-- tbl_score로 부터 학생이름 칼럼을 삭제
ALTER TABLE tbl_score DROP COLUMN g_stname ;


 -- 삭제 후 검증
 SELECT SC.g_stnum, ST.st_name
 FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.g_stnum = St.st_num;
        
DESC tbl_score;        


CREATE TABLE tbl_subject (
    sb_code	CHAR(5)		PRIMARY KEY,
    sb_name	nVARCHAR2(50)	NOT NULL	
);

INSERT INTO tbl_subject VALUES('B0001','국어');
INSERT INTO tbl_subject VALUES('B0002','영어');
INSERT INTO tbl_subject VALUES('B0003','수학');
INSERT INTO tbl_subject VALUES('B0004','과학');
INSERT INTO tbl_subject VALUES('B0005','국사');
INSERT INTO tbl_subject VALUES('B0006','미술');

-- 과목명을 정규화 하기 위해서 과목코드 칼럼을 tbl_score에 추가
ALTER TABLE tbl_score ADD g_sbcode CHAR(5);

UPDATE tbl_score SC
SET g_sbcode = 
    (
        SELECT sb_code FROM tbl_subject SB
        WHERE SC.g_subject = SB.sb_name
    );

-- 업데이트 후 검증
SELECT SC.g_sbcode, SB.sb_code, SC.g_subject, SB.sb_name
FROM tbl_score SC
    LEFT JOIN tbl_subject SB
        ON SC.g_sbcode = SB.sb_code
WHERE SB.sb_name IS NULL        
