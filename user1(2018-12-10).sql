-- 여기는 user1 입니다.
-- user1은 dba권한을 가지고 있다.

-- table 생성
-- TABLE 이름 : tbl_std
-- st_num, st_name, st_tel, st_addr, int_age, int_grade 칼럼을 가지고있으며
-- st_num는 PK로 설정되어있고, st_name은 빈칸이 없는 
--         제약사항이 설정되어 있다.
CREATE TABLE tbl_std(
    st_num CHAR(3) PRIMARY KEY,
    st_name nVARCHAR2(10) NOT NULL,
    st_tel nVARCHAR2(15),
    st_addr nVARCHAR2(50),
    int_age NUMBER(3),
    int_grade NUMBER(3)
);

-- 홍길동, 이몽룡 , 성춘향 , 임꺽정 , 장길산 이름을
-- 나머지 항목을 자유롭게 설정하여 데이터를 추가하시오.

INSERT INTO tbl_std
VALUES ('1','홍길동','010-1111-1111','광주',15,100);
INSERT INTO tbl_std
VALUES ('2','이몽룡','010-1111-1111','광주',14,100);
INSERT INTO tbl_std
VALUES ('3','성춘향','010-1111-1111','광주',13,100);
INSERT INTO tbl_std
VALUES ('4','임꺽정','010-1111-1111','광주',12,100);
INSERT INTO tbl_std
VALUES ('5','장길산','010-1111-1111','광주',11,100);


