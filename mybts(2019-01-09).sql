-- 여기는 mybts 입니다.

-- 새로운 TABLE 생성
CREATE TABLE tbl_student (
    st_num CHAR(5) PRIMARY KEY,
    st_name nVARCHAR2(20) NOT NULL,
    st_grade CHAR(2),
    st_tel nVARCHAR2(20)
);

INSERT INTO tbl_student
VALUES ('1','홍길동','1','010-1231-1233');

UPDATE tbl_student SET
    st_num = '00001'
WHERE st_num = '1';

commit;
SELECT * FROM tbl_student;

CREATE TABLE tbl_score (
    id NUMBER PRIMARY KEY,
    st_num CHAR(5) NOT NULL,
    sc_sb_code CHAR(3) NOT NULL,
    sc_score NUMBER
);

CREATE SEQUENCE SEQ_SCORE
    START WITH 1
    INCREMENT BY 1 
    NOMAXVALUE ;
    
INSERT INTO tbl_score
VALUES (SEQ_SCORE.NEXTVAL, '00001', '001', 87);
INSERT INTO tbl_score
VALUES (SEQ_SCORE.NEXTVAL, '00001', '002', 95);
INSERT INTO tbl_score
VALUES (SEQ_SCORE.NEXTVAL, '00001', '003', 97);

SELECT * FROM tbl_score ;


