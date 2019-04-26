-- 여기는 myBts 입니다.

DROP TABLE tbl_score ;

-- FOREIGN KEY 설정
-- 만약 tbl_score 테이블에 데이터를 입력하는데
-- tbl_student 테이블에 st_num 와 일치하지 않는 값을
-- 입력하면 오류가 발생해서
-- 잘못 입력되는 데이터가 없도록 설정하는 것

-- 참조 무결성 보장
CREATE TABLE tbl_score (
    id NUMBER PRIMARY KEY,
    st_num VARCHAR2(5) NOT NULL, -- CHAR >> VARCHAR2
    sc_sb_code VARCHAR2(3) NOT NULL, -- CHAR >> VARCHAR2
    sc_score NUMBER(3),
    CONSTRAINT FK_st_num FOREIGN KEY (st_num)
    REFERENCES tbl_student(st_num) 
);

CREATE TABLE tbl_student (
    st_num VARCHAR2(5) PRIMARY KEY, -- CHAR >> VARCHAR2
    st_name nVARCHAR2(20) NOT NULL,
    st_grade CHAR(2),
    st_tel nVARCHAR2(20)
) ;

-- 초기에 대량의 데이터를 입력하려고 하는데
-- FK가 설정 되어있으면
-- tbl_student 데이터가 모두 완성되기 전까지
-- tbl_score 데이터를 추가 할수 없게된다.
-- 따라서 초기에는 일단 FK를 제거 또는 만들지 않고
-- 데이터를 입력 하고
-- 데이터가 거의 완성되면 FK를 설정하는 것이 좋다.

-- FK 삭제
ALTER TABLE tbl_score
DROP CONSTRAINT FK_st_num ;

-- FK 추가
ALTER TABLE tbl_score
ADD CONSTRAINT FK_st_num FOREIGN KEY(st_num)
REFERENCES tbl_student(st_num);

-- 만약 데이터를 모두 입력한 후
-- FK를 선언(추가)하는데 오류가 발생하면
-- tbl_score에 잘못된 st_num가 존재한다는 것이다.
-- 이럴때는 Join을 통해서 데이터를 확인해야 한다.
SELECT SC.st_num, ST.st_num, ST.st_name
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.st_num = ST.st_num
WHERE ST.st_num = '';

SELECT * FROM tbl_student ;
INSERT INTO tbl_student
VALUES ('00001', '홍길동', '1' , '010-1234-1234');

INSERT INTO tbl_score -- 입력가능
VALUES (63451, '00001', '001', 100);

INSERT INTO tbl_score -- 입력불가능 / tbl_student 에는 001학번이 존재하지 않기때문에 오류발생
VALUES (2353, '001', '001', 100);

SELECT SC.st_num, ST.st_name, SC.sc_sb_code, sc_score
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.st_num = ST.st_num ;
        
-- 00001 학번은 이미 tbl_score에 입력된 데이터가 있기 때문에
-- tbl_student에서 삭제가 불가능하다
-- 결국 이 두 테이블은 st_num를 기준으로 JOIN 등을 실행했을때
-- 참조관계가 명확해져서 완전JOIN을 실행해도 문제가 없다.
DELETE FROM tbl_student WHERE st_num = '00001' ;

ALTER TABLE tbl_score
DROP CONSTRAINT FK_st_num ;

ALTER TABLE tbl_score
ADD CONSTRAINT FK_st_num
FOREIGN KEY (st_num)
REFERENCES tbl_student (st_num)
ON DELETE CASCADE ; -- tbl_score에 입력된 데이터가 있어도 DELETE를 실행하게 되면
                    -- tbl_score와 tbl_student 둘다 데이터를 삭제되게 하도록 한다.
                    
ALTER TABLE tbl_score
ADD CONSTRAINT FK_st_num
FOREIGN KEY (st_num)
REFERENCES tbl_student (st_num)
ON DELETE SET NULL ; -- st_num 을 NOT NULL로 선언했기때문에 무의미
