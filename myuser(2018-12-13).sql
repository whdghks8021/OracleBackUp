-- 여기는 myuser 입니다.

CREATE TABLE tbl_employee (
    strEmpno CHAR(3) PRIMARY KEY,
    strName nVARCHAR2(20) NOT NULL,
    strJob nVARCHAR2(20),
    intSal NUMBER(10),
    strDeptNo nVARCHAR2(20)
);

INSERT INTO tbl_employee
VALUES ('001', '홍길동', '인사업무', 2500000, '총무부');
INSERT INTO tbl_employee
VALUES ('002', '이몽룡', '기술영업', 2500000, '영업부');
INSERT INTO tbl_employee
VALUES ('003', '성춘향', '급여관리', 2500000, '총무부');
INSERT INTO tbl_employee
VALUES ('004', '장길산', '생산관리', 2500000, '생산부');
INSERT INTO tbl_employee
VALUES ('005', '임꺽정', '품질관리', 2500000, '생산부');

SELECT * FROM tbl_employee;


-- strDeptNO 가 총무부인경우 인사관리부로 변경.
UPDATE tbl_employee
SET strDeptNo = '인사관리부'
WHERE strDeptNO = '총무부';

-- 신입사원이 입사.
-- 신입사원 정보를 추가
-- 이름 : 장록수 , 업무 : 인사보조 , 부서 : 인사관리부
INSERT INTO tbl_employee
VALUES ('006', '장록수', '인사보조', 1500000, '인사관리부');

-- 인사관리부를 인사부로 변경하려고 한다.
UPDATE tbl_employee
SET strDeptNo = '인사부'
WHERE strDeptNo = '인사관리부';

SELECT * FROM tbl_employee;

-- tbl_emp 테이블을 제2정규화(2NF)를 하기 위해
-- 1. 부서테이블을 생성하고
-- 2. 부서 정보를 추가해 놓는다.

CREATE TABLE tbl_dept(
    strDeptNo CHAR(3) PRIMARY KEY,
    strDeptName nVARCHAR2(20) NOT NULL,
    strDeptChief nVARCHAR2(20)
);

INSERT INTO tbl_dept
VALUES ('01','총무부','홍길동');
INSERT INTO tbl_dept
VALUES ('02','영업부','이몽룡');
INSERT INTO tbl_dept
VALUES ('03','생산부','장길산');
INSERT INTO tbl_dept
VALUES ('04','자재부','임꺽정');

SELECT * FROM tbl_dept;

ALTER TABLE tbl_employee RENAME COLUMN strDeptNo TO strDeptName;
SELECT * FROM tbl_employee ;

-- tbl_emp 테이블에 strDeptNo(3) 칼럼을 추가
-- 새로만든 부서 테이블의 부서번호(코드) 칼럼과 같은 형식으로
-- 새로운 칼럼을 등록

ALTER TABLE tbl_employee
ADD strDeptNo CHAR(3);

-- 테이블에서 칼럼을 추가, 변경, 삭제한 후에
-- 변경 정보를 보는 방법
DESCRIBE tbl_employee;

-- 기존 tbl_employee 테이블의 strdeptno 칼럼에
-- tbl_dept 정보를 참조하여 
UPDATE tbl_employee
SET strDeptNo = '01'
WHERE strDeptName = '인사부';
UPDATE tbl_employee
SET strDeptNo = '02'
WHERE strDeptName = '영업부';
UPDATE tbl_employee
SET strDeptNo = '03'
WHERE strDeptName = '생산부';
UPDATE tbl_employee
SET strDeptNo = '01'
WHERE strDeptName = '인사 관리부';

-- strDeptName 칼럼을 삭제한다.
-- 주의사항 모든 데이터의 strDeptNo가 정상적인지
-- 확인하는 과정을 반드시 거쳐야 한다.
ALTER TABLE tbl_employee DROP COLUMN strDeptName;
SELECT * FROM tbl_employee ;
SELECT * FROM tbl_Dept ;

SELECT E.strEmpNo , E.strName, E.strjob, E.strDeptNo, D.strDeptName
FROM tbl_employee E, tbl_dept D
WHERE E.strDeptNo = D.strDeptNo;

-- 기존의 총무부를 인사관리부로 변경
UPDATE tbl_dept
SET strDeptname = '인사관리부'
WHERE strDeptNo = '01' ;
-- 여기까지가 정규화제2과정 