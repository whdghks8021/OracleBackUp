-- iolist

DROP TABLE tbl_product;
CREATE TABLE tbl_product (
    p_code	CHAR(13)		PRIMARY KEY,
    p_name	nVARCHAR2(125)	NOT NULL,
    p_tax	CHAR(1) DEFAULT '1',		
    p_iprice	NUMBER,		
    p_oprice	NUMBER		
);

CREATE SEQUENCE seq_iolist
START WITH 1 
INCREMENT BY 1;

DROP TABLE tbl_iolist;
CREATE TABLE tbl_iolist (
    io_id	NUMBER		PRIMARY KEY,
    io_date	CHAR(10)	NOT NULL,	
    io_pcode	CHAR(13)	NOT NULL,
    io_dcode	CHAR(5)	NOT NULL,	
    io_inout	CHAR(1)	NOT NULL,
    io_tax CHAR(1) DEFAULT '1',
    io_quan	NUMBER,		
    io_price	NUMBER,		
    io_total	NUMBER,		
    io_tax_total	NUMBER		
);

DROP TABLE tbl_dept;
CREATE TABLE tbl_dept (
    d_code	CHAR(5)		PRIMARY KEY,
    d_name	nVARCHAR2(125)	NOT NULL,	
    d_ceo	nVARCHAR2(50),		
    d_tel	nVARCHAR2(20),		
    d_addr	nVARCHAR2(125)		
);
SELECT * FROM tbl_iolist;
SELECT * FROM tbl_dept;
SELECT * FROM tbl_product;
commit;

-- 거래처 정보에서 가장 마지막 코드값(큰값) 1개를 추출
SELECT M.d_code FROM
(SELECT ROW_NUMBER() OVER (ORDER BY d_code DESC) R, d_code
FROM tbl_dept) M
WHERE M.R = 1;

SELECT * FROM tbl_iolist I
    LEFT JOIN tbl_product P
        ON I.io_pcode = P.p_code
    LEFT JOIN tbl_dept D
        ON I.io_dcode = D.d_code;
    