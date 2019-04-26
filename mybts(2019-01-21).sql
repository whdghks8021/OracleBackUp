-- 여기는 mybts 접속화면입니다.

-- 주소록 table 생성
-- 학번, 이름, 전화번호, 주소

CREATE TABLE tbl_addr (
    ad_num VARCHAR2(5) PRIMARY KEY,
    ad_name nVARCHAR2(30) NOT NULL,
    ad_tel nVARCHAR2(15),
    ad_addr1 nVARCHAR2(20),
    ad_addr2 nVARCHAR2(50)
);
INSERT INTO tbl_addr(ad_num, ad_name, ad_tel)
VALUES('19001','홍길동','010-1231-1233');
INSERT INTO tbl_addr(ad_num, ad_name, ad_tel)
VALUES('19002','이몽룡','010-5432-8753');
INSERT INTO tbl_addr(ad_num, ad_name, ad_tel)
VALUES('19003','성춘향','010-8877-7987');
INSERT INTO tbl_addr(ad_num, ad_name, ad_tel)
VALUES('19004','장보고','010-4433-2222');

commit;

SELECT * FROM tbl_addr;