-- 여기는 myuser 입니다.
-- 매입매출샘플(엑셀) 파일에서 DATABASE로 데이터를 옮기고
-- DB규칙에 맞게 적용하는 연습

CREATE TABLE tbl_iolist(
    id	NUMBER	PRIMARY KEY,
    io_date	    CHAR(10) NOT NULL,	
    io_cname	nVARCHAR2(50) NOT NULL,
    io_dname	nVARCHAR2(30) NOT NULL,	
    io_deco	    nVARCHAR2(20),	
    io_inout	nVARCHAR2(5),		
    io_quan	    NUMBER,
    io_price	NUMBER,
    io_total	NUMBER		
);

SELECT * FROM tbl_iolist;
SELECT COUNT(*) FROM tbl_iolist;

DELETE FROM tbl_iolist;

SELECT * FROM tbl_iolist
WHERE io_date BETWEEN '2018-02-01' AND '2018-02-28'
AND io_inout = '매입';

SELECT * FROM tbl_iolist
WHERE io_date BETWEEN '2018-02-01' AND '2018-02-28'
ORDER BY io_date ;

SELECT SUM (io_total) AS 총합, COUNT(*) AS 총개수 
FROM tbl_iolist ;

-- 통계함수를 이용해서 개수와 합계를 구하는데
-- 매입합계, 매출합계를 따로 계산하고 싶다.
-- 1.매입과 매출을 구분하는 칼럼 : io_inout 
SELECT io_inout, COUNT(*), SUM(io_total)
FROM tbl_iolist
GROUP BY io_inout ;

-- 개수와 합계계산
-- 조건 : 날짜별로 조건을 부여해서 개수와 합계 계산
-- 1. 날짜를 구분하는 칼럼 : io_date
SELECT io_date, COUNT(*), SUM(io_total)
FROM tbl_iolist
GROUP BY io_date
ORDER BY io_date;

-- 조건 : 날짜별로 묶고, 다시 매입 매출로 구분하여 개수와 합계 계산
-- 1. 날짜를 구분하는 칼럼 : io_date
-- 2. 매입 매출을 구분하는 칼럼 : io_inout
SELECT io_date, io_inout, COUNT(*), SUM(io_total)
FROM tbl_iolist
GROUP BY io_date, io_inout
ORDER BY io_date;

-- 구분과 날짜 순서를 바꾸어서 ...
SELECT io_inout, io_date, COUNT(*), SUM(io_total)
FROM tbl_iolist
GROUP BY io_inout, io_date
ORDER BY io_date;

-- 날짜 범위를 추가
SELECT io_inout, io_date, COUNT(*), SUM(io_total)
FROM tbl_iolist
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY io_inout, io_date
ORDER BY io_date;

-- 합계 금액이 50만원 이상인 항목만 표시
-- 통계함수를 사용하는경우
-- 통계함수 결과에 따라 추출하는 LIST를 제한 하고 싶을때
-- (필요한 범위의 값만 보고 싶을때)
-- WHERE에 조건을 부여하면 안된다.
-- 이때는 HAVING 이라는 키워드를 사용한다
-- HAVING은 우선 모든 값의 개수와 총합을 계산후에
-- 조건을 제한하기때문에 시간이 많이 소요된다.
-- 그래서 조건은 WHERE에서 검색을 해야한다.
SELECT io_inout, io_date, COUNT(*), SUM(io_total) 
FROM tbl_iolist
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY io_inout, io_date
HAVING SUM(io_total) >= 500000
ORDER BY io_date;




