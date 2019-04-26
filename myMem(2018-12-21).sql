-- 여기는 myMem 입니다.

-- 어떤 조건을 설정하기가 마땅하지 않을때
-- 그냥 몇개의 개수만 제한해서(10개, 100개 등등) 조회하고자 할때
-- 오라클 전용 SQL 키워드중에
-- 칼럼명으로 ROWNUM 이라는 칼럼이 있다.
--      이 칼럼은 저장된 데이터의 ROW순번을 가상으로 표시하는 오라클 DUMMY 칼럼
--      ROWNUM칼럼을 이용하면 데이터 리스트중에서 몇개만 제한적으로 조회를 할수 있다.
SELECT ROWNUM, IO_DATE, IO_CNAME
FROM TBL_IOLIST
WHERE ROWNUM <= 100;

-- 10번째부터 20번째까지 데이터 조회
SELECT ROWNUM, IO_DATE, IO_CNAME
FROM TBL_IOLIST
WHERE ROWNUM BETWEEN 1 AND 100;

-- MYSQL
-- SELECT * FROM TBL_IOLIST LIMIT 10;

SELECT * FROM TBL_IOLIST
WHERE ROWNUM < 10;

-- IOLIST로부터 상품정보를 분리
-- 1. 상품정보를 GROUPING 하여 묶은 리스트 조회
-- 2. 엑셀로 복사
-- 3. CODE값 부여
-- 4. 테이블 생성
-- 5. 임포트
-- 6. IOLIST에 PCODE칼럼 생성
-- 7. 상품정보 테이블에서 IOLIST의 DCODE칼럼에 UPDATE

SELECT IO_CNAME FROM TBL_IOLIST
GROUP BY IO_CNAME -- 상품명 중복값을 안보기위해 GROUP BY 키워드 사용
ORDER BY IO_CNAME;

SELECT IO_CNAME, IO_INOUT, IO_PRICE
FROM TBL_IOLIST;

-- 현재 조회된 데이터에서 IO_INOUT이 '매입' 이면 IO_PRICE는 '매입단가' 일 것이고
-- '매출' 아면 '매출단가'일 것으로 생각이 된다.]
-- 그래서 IO_INOUT 에 따라 단가를 다르게 표시 해 보자
SELECT IO_CNAME,
    AVG(DECODE(IO_INOUT, '매입', IO_PRICE)) 매입단가,
    AVG(DECODE(IO_INOUT, '매출', IO_PRICE)) 매출단가
FROM TBL_IOLIST
GROUP BY IO_CNAME
ORDER BY IO_CNAME;

CREATE TABLE TBL_PRODUCT (
    P_CODE	CHAR(9)		PRIMARY KEY,
    P_NAME	nVARCHAR2(50)	NOT NULL,	
    P_IPRICE	NUMBER		,
    P_OPRICE	NUMBER		
);

SELECT COUNT(*) FROM TBL_PRODUCT;

ALTER TABLE TBL_IOLIST ADD IO_PCODE2 CHAR(9);

UPDATE TBL_IOLIST I
SET IO_PCODE2
    = (SELECT P.P_CODE FROM TBL_PRODUCT P
       WHERE P.P_NAME = I.IO_CNAME);

-- 업데이트후에 검증
-- JOIN을 이용해서 검증
SELECT I.IO_CNAME, I.IO_PCODE2, P.P_CODE, p.p_name 
FROM TBL_IOLIST I
    LEFT JOIN TBL_PRODUCT P
        ON i.io_pcode2 = p.p_code
ORDER BY io_pcode2;

-- 상품명 칼럼을 삭제
ALTER TABLE TBL_IOLIST DROP COLUMN IO_CNAME;
DESC TBL_IOLIST;

SELECT * FROM TBL_IOLIST
WHERE ROWNUM < 10;

-- TBL_IOLIST는 제2정규화 과정이 완료되었다.
-- 매입매출명세를 보면서 상품명과 거래처명을 같이 확인하고 싶다.

-- 1.매입매출명세와 상품명 같이 보기
SELECT I.IO_DATE, i.io_pcode2, p.p_name, i.io_inout, i.io_price, i.io_quan
FROM TBL_IOLIST I
    LEFT JOIN TBL_PRODUCT P
        ON I.IO_PCODE2 = P.P_CODE;

-- 2.매입매출명세와 거래처정보를 같이 보기
SELECT I.IO_DATE, i.io_dcode, d.d_name, i.io_pcode2, i.io_inout, i.io_price, i.io_quan
FROM TBL_IOLIST I
    LEFT JOIN TBL_DEPT D
        ON I.IO_DCODE = d.d_code;
        
-- 3.매입매출명세를 보면서 상품정보, 거래처정보를 같이보기
SELECT I.IO_DATE, i.io_pcode2,d.d_name, p.p_name, i.io_inout, i.io_price, i.io_quan, i.io_price * i.io_quan AS 합계
FROM TBL_IOLIST I
    LEFT JOIN TBL_PRODUCT P -- 상품정보와 JOIN
        ON I.IO_PCODE2 = p.p_code
        
    LEFT JOIN TBL_DEPT D -- 거래처정보와 JOIN
        ON i.io_dcode = d.d_code;
        
-- 매입매출명세와 상품정보, 거래처정보를 JOIN해서 보는데 너무 복잡하다.
-- 근데 자주 사용할것 같다.
-- 이럴땐 SQL을 VIEW로 생성해 두어라
CREATE VIEW IO_DEPT_PRODUCT_VIEW
AS
SELECT I.IO_DATE, i.io_pcode2,d.d_name, p.p_name, i.io_inout, i.io_price, i.io_quan, i.io_price * i.io_quan AS 합계
FROM TBL_IOLIST I
    LEFT JOIN TBL_PRODUCT P -- 상품정보와 JOIN
        ON I.IO_PCODE2 = p.p_code
        
    LEFT JOIN TBL_DEPT D -- 거래처정보와 JOIN
        ON i.io_dcode = d.d_code;

SELECT * FROM io_dept_product_view;        

-- 거래일자가 2018-03-01 ~ 2018-03-31 이며 매입인 항목의 개수와 총 매입 합계금액을 조회
SELECT IO_INOUT, COUNT(*) AS 개수, SUM(IO_TOTAL) AS 합계
FROM TBL_IOLIST
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31' AND IO_INOUT = '매입'
GROUP BY IO_INOUT;

    

       