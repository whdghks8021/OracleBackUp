-- mybts 접속화면

CREATE TABLE tbl_dept (
    d_code VARCHAR2(5) PRIMARY KEY,
    d_name nVARCHAR2(50) NOT NULL,
    d_CEO nVARCHAR2(50)
);


SELECT * FROM tbl_dept;
commit;