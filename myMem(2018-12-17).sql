-- 여기는 myMem 입니다.

CREATE TABLE tbl_iolist (
    io_id	    NUMBER		PRIMARY KEY,
    io_date	    CHAR(10)	NOT NULL,	
    io_cname	nVARCHAR2(30)	NOT NULL,	
    io_dname	nVARCHAR2(30)	NOT NULL,	
    io_ceo  	nVARCHAR2(10),		
    io_inout	nVARCHAR2(3),		
    io_quan	    NUMBER,		
    io_price	NUMBER,		
    io_total	NUMBER

);
SELECT * FROM tbl_iolist;
SELECT COUNT(*) FROM tbl_iolist;

SELECT io_inout AS 구분, io_date AS 날짜, COUNT(*) AS 개수, SUM(io_total) AS 총합
FROM tbl_iolist 
GROUP BY io_inout , io_date
ORDER BY io_date;

-- 문자열 함수 몇가지
SELECT 'KOREA' FROM DUAL ;
SELECT 'Republic Of Korea' FROM DUAL ;

-- 문자열을 대문자로 변환
SELECT UPPER('korea') FROM DUAL ;
-- 문자열을 소문자로 변환
SELECT LOWER('KOREA') FROM DUAL ;
-- 단어의 첫글자(이니셜)을 대문자로 변경
SELECT INITCAP('republic of korea') FROM DUAL;
-- 단어의 문자 개수 확인
SELECT LENGTH('repubic of korea') FROM DUAL;
-- LENGTH 함수를 사용할때 간혹 한글의 개수를 *2의 값으로 알려주는 경우가있는데,
-- 이때는 문자열 앞에 N이라는 기호를 넣어주면 된다.
SELECT LENGTH(N'대한민국') FROM DUAL;
-- 데이터의 저장용량을 Byte 단위로 보여주기
SELECT LENGTHB('대한민국만세') FROM DUAL;
-- of가 문자열 중에 몇번째 위치에 있는가 ?
SELECT INSTR('Republic of Korea','of') FROM DUAL;
-- 앞의 문자열을 4번째 자리부터 3글자
-- 오라클은 첫글자의 위치가 0이아닌 1부터 시작한다.
SELECT SUBSTR('Republic of Korea','4','3')FROM DUAL;


-- 표준SQL에서 왼쪽부터 3번째 위치의 글자
SELECT LEFT('Republic of Korea',3)FROM DUAL;
-- 3번째부터 2글자
SELECT MID('Republic of Korea',3,2)FROM DUAL;
-- 전체 글자수를 20자리로 만들고, 남은 공간은 0으로 채워라.
-- 자릿수를 일정하게 맞춰야 하는 경우에 사용
SELECT LPAD('KOREA', 20,'0') FROM DUAL; -- 왼쪽
SELECT RPAD('KOREA', 20,'0') FROM DUAL; -- 오른쪽
INSERT test(t_num) VALUES(LPAD(1,3,'0') ; -- INSERT에도 사용이 가능

-- 공백을 제거
SELECT LTRIM(' KOREA 대한민국 ') FROM DUAL;
SELECT RTRIM(' KOREA 대한민국 ') FROM DUAL;
SELECT TRIM(' KOREA ') FROM DUAL;
-- TRIM함수의 특이한 사용
-- 문자열 앞뒤에 붙은 a 문자들을 모두 삭제하라.
SELECT TRIM ('a' FROM 'aaaabbbborennnnaaaa') FROM DUAL;


-- 일자별로 거래 구분에 따른 개수와 합계를 확인
SELECT io_date, io_inout, COUNT(io_total), SUM(io_total)
FROM tbl_iolist
GROUP BY io_date, io_inout
ORDER BY io_date;

-- 일자별로 거래 구분에 따른 개수와 합계를 확인
-- 단, 2018-03-01 ~ 2018-03-31 까지의 data로 한정
SELECT io_date, io_inout, COUNT(io_total), SUM(io_total)
FROM tbl_iolist
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY io_date, io_inout
ORDER BY io_date;

-- 월별로 또는 년도별로 합계를 계산해서 보고 싶을때.
SELECT SUBSTR(io_date,1,7) AS 월별,
    io_inout, COUNT(io_total), SUM(io_total)
FROM tbl_iolist
GROUP BY SUBSTR(io_date,1,7), io_inout
ORDER BY SUBSTR(io_date,1,7);

CREATE VIEW 월별통계 
AS
SELECT SUBSTR(io_date,1,7) AS 월별,
    io_inout AS 구분, COUNT(io_total) AS 개수, SUM(io_total) AS 합계
FROM tbl_iolist
GROUP BY SUBSTR(io_date,1,7), io_inout
ORDER BY SUBSTR(io_date,1,7);

SELECT * FROM 월별통계 
WHERE 월별 BETWEEN '2018-03' AND '2018-06';

SELECT io_dname AS 거래처, io_inout AS 구분, io_quan AS 개수, SUM(io_total) AS 총합
FROM tbl_iolist 
GROUP BY io_dname, io_inout ,  io_quan
ORDER BY io_dname;

SELECT io_cname AS 상품명, SUBSTR(io_date,1,7) AS 월별, io_inout AS 구분, io_quan AS 개수, SUM(io_total) AS 총합
FROM tbl_iolist 
GROUP BY io_cname, SUBSTR(io_date,1,7), io_inout , io_quan
ORDER BY SUBSTR(io_date,1,7);
