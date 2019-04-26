-- 여기는 user1으로 접속한 화면입니다.
-- 이름(o_name)
-- 전화번호(0_tel)
-- 주소(o_addr)
-- 회사(o_comp) 
-- 부서(o_dept) 칼럼을 갖는
-- tbl_office 테이블을 생성하시오

CREATE TABLE tbl_office(
     id NUMBER PRIMARY KEY,
     o_name CHAR(10) NOT NULL,
     o_tel CHAR(20),
     o_addr nVARCHAR2(100),
     o_comp nVARCHAR2(100),
     o_dept nVARCHAR2(100)
    
);

SELECT * FROM tbl_office;