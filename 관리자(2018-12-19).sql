-- 여기는 관리자 입니다.

CREATE USER myuser1 IDENTIFIED BY 1111;

GRANT CREATE TABLE TO myuser1;
GRANT SELECT, INSERT, UPDATE ON [table] TO myuser1;

CREATE TABLESPACE mytsA
DATAFILE 'd:/bizwork/ordata/mytsA.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 100K;

-- 사용자 등록을 실행한 후 테이블 스페이스를 만들지 않고
-- TABLE 등을 생성하면 생성된 TABLE들은 SYSTEM TS에 생성되어
-- 나중에 테이블스페이스를 만든 후 옮기려면 많은 문제가 발생한다.
-- 따라서, 사용자를 생성하고 테이블을 만들기 전에 테이블스페이스를 반드시 생성하고
-- 그리고 사용자의 DEFAULT TABLESPACE를 지정해 주어야 한다.
ALTER USER myuser1 DEFAULT TABLESPACE mytsA;

CREATE TABLE EMP_TABLE (
    EMPNO CHAR(6) PRIMARY KEY,
    EMPNAME nVARCHAR2(20) NOT NULL,
    EMPBIRTH CHAR(8),
    DEPTNO CHAR(3) NOT NULL,
    HREDATE CHAR(10) NOT NULL
);

INSERT INTO EMP_TABLE
VALUES ('170001','홍길동','880212','001','20120405');
INSERT INTO EMP_TABLE
VALUES ('170002','이몽룡','770215','003','20101101');
INSERT INTO EMP_TABLE
VALUES ('170003','성춘향','820513','003','20130105');
INSERT INTO EMP_TABLE
VALUES ('170004','장보고','941102','004','20170617');
INSERT INTO EMP_TABLE
VALUES ('170005','임꺽정','800212','001','20101101');

SELECT * FROM EMP_TABLE;

-- 한 사원의 정보를 변경할때는 그 사원의 데이터를 본후
-- 사원번호(PK)를 조건으로 데이터를 변경해야한다.
-- 사원이름으로 데이터를 변경할경우 동명이인이 있을수 있으니,
-- 데이터 무결성을 해치는 매우 위험한 방법이다.
SELECT * FROM EMP_TABLE WHERE EMPNAME = '장보고';
UPDATE EMP_TABLE SET HREDATE = '20180301'
WHERE EMPNO = '170004';


