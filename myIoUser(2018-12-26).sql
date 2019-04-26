-- 여기는 myIoUser 입니다.

CREATE TABLE tbl_iolist (
    io_id	CHAR(3)		PRIMARY KEY,
    io_date	CHAR(10)	NOT NULL	,
    io_cname	nVARCHAR2(50)	NOT NULL	,
    io_dname	nVARCHAR2(50)	NOT NULL	,
    io_dceo	nVARCHAR2(50)		,
    io_inout	nVARCHAR2(2)	NOT NULL	,
    io_quan	NUMBER		,
    io_price	NUMBER	,	
    io_total	NUMBER		
);

SELECT COUNT(*) FROM tbl_iolist;
SELECT * FROM tbl_iolist;

SELECT io_dname, io_dceo FROM tbl_iolist
GROUP BY io_dname, io_dceo;

CREATE TABLE tbl_dept (
    d_code	CHAR(5)		PRIMARY KEY,
    d_name	nVARCHAR2(50)	NOT NULL,	
    d_ceo	nVARCHAR2(50)	NOT NULL	
);
ALTER TABLE tbl_iolist ADD io_dcode CHAR(5) ;

SELECT I.io_dname, I.io_dceo, d.d_code, d.d_name FROM tbl_iolist I, tbl_dept D
WHERE I.io_dname = d.d_name AND i.io_dceo = d.d_ceo ;

SELECT I.io_dname, I.io_dceo, d.d_code, d.d_name FROM tbl_iolist I
    LEFT JOIN tbl_dept D
        ON d.d_name = i.io_dname AND i.io_dceo = d.d_ceo;
-- 위 SQL문으로 확인한 LIST는 모든 상품매입매출 목록이 나타나서
-- 잘못된 데이터가 있는지 확인하기 어렵다.

-- 만약 위의 SQL문을 실행했을때, iolist에는 데이터가 있는데
-- dept에는 데이터가 없을 경우에 d.d_name 과 d.d_ceo는 null 값으로 나타 날 것이다.
-- 이 성질을 이용해서 d.d_name 이나 d.d_ceo가 null 인것만
-- 찾아 보면 더 쉽게 확인이 가능하다.

SELECT I.io_dname, D.d_name, d.d_ceo, i.io_dceo FROM tbl_iolist I
    LEFT JOIN tbl_dept D
        ON d.d_name = i.io_dname AND i.io_dceo = d.d_ceo
WHERE D.d_name IS NULL OR D.d_ceo IS NULL;
-- 위의 SQL을 실행했을때 LIST가 하나도 없어야 정상적으로
-- 거래처정보 TABLE이 완성 된 것이다.

-- 숫자칼럼이 0인 것은 0이라는 값을 INSERT, UPDATE 실행 한 것
SELECT io_price
FROM tbl_iolist
WHERE io_price = 0;
-- 숫자칼럼이 NULL인 것은 처음부터 아예 값을 INSERT하지 않은 것
SELECT io_price
FROM tbl_iolist
WHERE io_price IS NULL ;

SELECT I.io_dname, I.io_dceo,
    (SELECT D.d_code FROM tbl_dept D
     WHERE I.io_dname = D.d_name AND
           I.io_dceo = D.d_ceo) 
FROM tbl_ioList I
GROUP BY i.io_dname, i.io_dceo;

UPDATE tbl_iolist I
SET io_dcode = (SELECT D.d_code FROM tbl_dept D
     WHERE I.io_dname = D.d_name AND
           I.io_dceo = D.d_ceo) ;

SELECT io_dcode , io_dname , io_dceo
FROM tbl_iolist
ORDER BY io_dcode;

