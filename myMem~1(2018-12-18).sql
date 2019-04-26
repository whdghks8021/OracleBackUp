-- 여기는 myMem 입니다.

SELECT * FROM tbl_iolist;

-- 거래처 롯데유통의 자료만 확인하고 싶을때
SELECT * FROM tbl_iolist
WHERE io_dname = '(주)동양엔지니어링(광주남구롯데)';

-- 지금 현재 tbl_iolist는 상품이름과, 거래처명, 거래처대표명을 직접 가지고 있기 때문에
-- 만약 상품이름이나 거래처명, 거래처대표명을 변경,삭제 하려고하면 
-- 다수(2개 이상)의 데이터가 변경되는 상황이다.
-- 다수의 데이터를 변경 하는것은 DB사용환경, 규칙 입장에서는 매우 바람직 하지 않다.
-- 그래서, 현재의 io_list 테이블을 분리 작업하여
-- 데이터 변경이 다수 발생하지 않도록 조치를 취해야 한다.
-- 이론적으로 제2정규화(2NF) 라고 한다.

-- 1. 거래처명과 거래처대표 이름을 분리
-- 가. tbl_iolist로 부터 거래처명과 거래처대표명을 묶어서 모아보자
-- 거래처명 : io_dname , 거래처대표명 : io_ceo

-- 거래처명과 거래처대표명 리스트 확인
SELECT io_dname , io_ceo
FROM tbl_iolist
ORDER BY io_dname;

-- 거래처명과 대표명을 묶어서 확인
-- tbl_iolist 에서 거래처명과 대표명을 1개씩만 추출한 SQL
SELECT io_dname, io_ceo
FROM tbl_iolist
GROUP BY io_dname, io_ceo
ORDER BY io_dname;
-- 나. 여기에서 생성된 리스트를 엑셀로 복사하여 데이터 작업

-- 다. 거래처 테이블 생성
CREATE TABLE tbl_dept (
    d_code	CHAR(4)		PRIMARY KEY,
    d_name	nVARCHAR2(50)	NOT NULL,	
    d_ceo	nVARCHAR2(20)	NOT NULL,	
    d_tel	nVARCHAR2(20),		
    d_addr	nVARCHAR2(50),		
    d_fax	nVARCHAR2(20),		
    d_sid	CHAR(14)		
);

-- 라. 거래처 테이블 데이터 임포트 / 확인
SELECT COUNT(*) FROM tbl_dept;
SELECT * FROM tbl_dept;

-- 마. iolist 테이블 에서 거래처명, 대표자명을 제거하고, 거래처 코드칼럼으로 대체

-- a. iolist와 dept 테이블을 join 해서 혹시 잘못 연결된 데이터가 없는가 확인
SELECT I.io_dname, D.d_name, D.d_code
FROM tbl_iolist I, tbl_dept D
WHERE I.io_dname = D.d_name;

-- b. iolist에는 있는데 혹시 dept 테이블에 데이터 없는 것이 있는가 확인.
SELECT I.io_dname, D.d_name, D.d_code
FROM tbl_iolist I
LEFT JOIN tbl_dept D
ON I.io_dname = D.d_name;

-- c. iolist에 dept 테이블의 d_code와 연결할 칼럼을 추가
ALTER TABLE tbl_iolist ADD io_dcode CHAR(4);
DESC tbl_iolist;

-- SUB QUERY
SELECT io_dname, 
    (SELECT d_name FROM tbl_dept WHERE d_name = io_dname AND d_ceo = io_ceo)
FROM tbl_iolist
ORDER BY io_dname;

-- 중복 데이터가 있는가 검사하는 SQL
SELECT d_name, COUNT(*)
FROM tbl_dept
GROUP BY d_name
HAVING count(*) > 1;

SELECT * FROM tbl_dept WHERE d_name = '우리냉동';

-- d. 이제 SUB QUERY를 이용해서
-- dept table에서 d_code를 iolist에 update 실행한다.
UPDATE tbl_iolist I
SET io_dcode = 
    (SELECT d_code FROM tbl_dept D WHERE I.io_dname = D.d_name AND I.io_ceo = D.d_ceo);

SELECT io_dcode, io_dname, io_ceo FROM tbl_iolist;

-- e. iolist와 dept 테이블을 join해서 거래처명과 대표명을 같이 조회하는 SQL
SELECT I.io_dcode, D.d_name, D.d_ceo, I.io_cname
FROM tbl_iolist I
    LEFT JOIN tbl_dept D
        ON I.io_dcode = D.d_code;

-- f. iolist에서 io_dname, io_ceo 칼럼을 삭제해도 된다.
ALTER TABLE tbl_iolist DROP COLUMN io_ceo;
ALTER TABLE tbl_iolist DROP COLUMN io_dname;

DESC tbl_iolist;
-- 제2정규화 완료.







