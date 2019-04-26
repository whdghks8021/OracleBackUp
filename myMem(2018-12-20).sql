-- 여기는 myMem 입니다.

-- 테이블 삭제
DROP TABLE tbl_iolist;

-- 엑셀의 매입매출 정보를 오라클로 임포트 하고
-- 매입매출DB로부터 제2정규화를 실행해서 거래처 정보를 분리

CREATE TABLE tbl_iolist (
    io_id	NUMBER		PRIMARY KEY,
    io_date	CHAR(10)	NOT NULL,	
    io_cname	nVARCHAR2(50)	NOT NULL	,
    io_dname	nVARCHAR2(50)	NOT NULL	,
    io_dceo	nVARCHAR2(50)		,
    io_inout	nVARCHAR2(5)	NOT NULL	,
    io_quan	NUMBER		,
    io_price	NUMBER	,	
    io_total	NUMBER		
);
-- 데이터 임포트 확인
SELECT COUNT(*) FROM tbl_iolist;

SELECT io_inout, COUNT(*) FROM tbl_iolist
GROUP BY io_inout;

-- 매입매출 정보에서 거래처정보를 다른 table로 분리해서 제2정규화과정을 수행
-- 1. 매입매출 정보에서 거래처정보를 추출
-- 가. 거래처명과 대표명을 그룹으로 묶어 리스트를 추출
SELECT io_dname, io_dceo FROM tbl_iolist
GROUP BY io_dname, io_dceo
ORDER BY IO_DNAME;

-- 나. 엑셀에서 정리된 거래처정보를 임포트 하기위해서 TABLE 생성
CREATE TABLE TBL_DEPT (
    D_CODE	CHAR(6)		PRIMARY KEY,
    D_NAME	nVARCHAR2(50)	NOT NULL,	
    D_CEO	nVARCHAR2(50)		
);

-- 다. 엑셀로부터 거래처정보를 임포트후 확인
SELECT COUNT(*) FROM TBL_DEPT;

-- 2. TBL_IOLIST에 TBL_DEPT와 연결할 칼럼을 추가하고
-- TBL_DEPT로 부터 연결작업을 수행

-- 가. 칼럼추가
ALTER TABLE TBL_IOLIST ADD IO_DCODE CHAR(6);
-- 나. 추가된 칼럼 확인
DESC TBL_IOLIST;

-- SUB QUERY
-- DML내부에 다른 SELECT문이 있는 SQL을 말한다.
SELECT IO_DNAME, IO_DCEO, IO_DCODE
FROM TBL_IOLIST ;

-- 위의 SQL의 SUB QUERY를 추가해서
-- DEPT 테이블로부터 IO_DCODE를 조회해 보자
SELECT IO_DNAME, IO_DCEO,
    (SELECT D_CODE FROM TBL_DEPT D
        WHERE D.D_NAME = TBL_IOLIST.IO_DNAME AND
              D.D_CEO = TBL_IOLIST.IO_DCEO)
FROM TBL_IOLIST;

-- SUB QUERY를 사용해서 TBL_DEPT로 부터
-- TBL_IOLIST에 거래처 코드를 업데이트 하는 코드
UPDATE TBL_IOLIST I
SET IO_DCODE
    = (SELECT D_CODE FROM TBL_DEPT D
        WHERE D.D_NAME = I.IO_DNAME AND
              D.D_CEO = I.IO_DCEO);

SELECT IO_DCODE, IO_DNAME, IO_DCEO
FROM TBL_IOLIST 
ORDER BY IO_DCODE;

-- TBL_IOLIST의 IO_DNAME과 IO_DCEO 칼럼을 삭제
ALTER TABLE TBL_IOLIST DROP COLUMN IO_DNAME;
ALTER TABLE TBL_IOLIST DROP COLUMN IO_DCEO;
DESC TBL_IOLIST;

-- IOLIST와 DEPT테이블을 JOIN해서 조회하는 SQL
SELECT I.IO_DATE, I.IO_CNAME, I.IO_DCODE, D.D_NAME, D.D_CEO
FROM TBL_IOLIST I, TBL_DEPT D
WHERE I.IO_DCODE = D.D_CODE;
-- 이 JOIN은 EQ JOIN 이라고 하며,
-- TBL_IOLIST 테이블에는 TBL_DEPT 테이블에 없는 IO_DCODE는
-- 절대 존재하지 않는다는 보장이 있을때 완전한 결과를 보여준다.
-- 실제 상황에서는 TBL_DEPT에 없는 코드가 TBL_IOLIST에 존재 할 수 있다.

-- 테스트 데이터를 만들기 위해서
-- 임의 데이터의 IO_DCODE를 변경 할 예정
SELECT * FROM TBL_IOLIST
WHERE IO_DCODE = 'D00100';
UPDATE TBL_IOLIST
SET IO_DCODE = 'D00500'
WHERE IO_ID = 306 ;
SELECT I.IO_ID,I.IO_DATE, I.IO_CNAME, I.IO_DCODE, D.D_NAME, D.D_CEO
FROM TBL_IOLIST I, TBL_DEPT D
WHERE I.IO_DCODE = D.D_CODE
    AND IO_ID BETWEEN 300 AND 310
ORDER BY I.IO_ID ;

-- JOIN 하지 않은 상태로 매입매출 구분없이 합계금액을 계산
SELECT COUNT(*), SUM(IO_TOTAL)
FROM TBL_IOLIST WHERE IO_ID BETWEEN 300 AND 310;

-- EQ JOIN으로 합계금액 계산
-- 실제 합계 금액과 개수가 차이가 난다.
SELECT COUNT(*), SUM(IO_TOTAL)
FROM TBL_IOLIST I, TBL_DEPT D WHERE I.IO_DCODE = D.D_CODE AND IO_ID BETWEEN 300 AND 310;

-- LEFT JOIN으로 매입매출구분없이 합계금액을 계산
SELECT COUNT(*), SUM(IO_TOTAL)
FROM TBL_IOLIST I 
    LEFT JOIN TBL_DEPT D
        ON I.IO_DCODE = D.D_CODE
WHERE IO_ID BETWEEN 300 AND 310;
-- LEFT JOIN은 
--      왼쪽 TABLE의 데이터는 모두 보여주고
--      왼쪽 TABLE의 키(IO_DCODE)와 일치하는 데이터가
--      오른쪽 TABLE에 있으면 보여주고, 없으면 NULL 표시하라
-- 오른쪽 TABLE에 일치하는 데이터가 없어서 왼쪽 데이터의 일부가 누락되어
--      통계가 잘못되는 경우를 확인하거나
--      실제 상황에서 상당히 유용한 JOIN이다.
SELECT I.IO_DCODE, D.D_NAME, D.D_CEO
FROM TBL_IOLIST I
    LEFT JOIN TBL_DEPT D
        ON I.IO_DCODE = D.D_CODE
WHERE I.IO_ID BETWEEN 300 AND 310;

-- IOLIST로부터 상품정보를 분리
-- 1. 상품정보를 GROUPING 하여 묶은 리스트 조회
-- 2. 엑셀로 복사
-- 3. CODE값 부여
-- 4. 테이블 생성
-- 5. 임포트
-- 6. IOLIST에 PCODE칼럼 생성
-- 7. 상품정보 테이블에서 IOLIST의 DCODE칼럼에 UPDATE

SELECT DISTINCT IO_CNAME FROM TBL_IOLIST -- 상품명 중복값을 안보기위해 DISTINCT 키워드 사용
ORDER BY IO_CNAME;

CREATE TABLE TBL_CNAME (
    C_PCODE	CHAR(6)		PRIMARY KEY,
    C_NAME	nVARCHAR2(50)	NOT NULL	
);
SELECT COUNT(*) FROM TBL_CNAME;

ALTER TABLE TBL_IOLIST ADD IO_PCODE CHAR(6);

UPDATE TBL_IOLIST I
SET IO_PCODE
    = (SELECT C_PCODE FROM TBL_CNAME C
       WHERE C.C_NAME = I.IO_CNAME);
       
SELECT IO_CNAME, IO_PCODE FROM TBL_IOLIST
ORDER BY io_pcode;