-- mybts

CREATE TABLE tbl_user(
    userid CHAR(5) PRIMARY KEY,
    username nVARCHAR2(20),
    tel nVARCHAR2(20)
    
);
DROP TABLE tbl_board;

CREATE TABLE tbl_board(
    id NUMBER PRIMARY KEY,
    b_userid nVARCHAR2(20) NOT NULL,
    b_date nVARCHAR2(20),
    b_time VARCHAR2(10),
    b_subject nVARCHAR2(50),
    b_content nVARCHAR2(1000),
    b_hit NUMBER
);
DELETE FROM tbl_board WHERE id BETWEEN 2000 AND 20000;
SELECT COUNT(*) FROM tbl_board;
UPDATE tbl_board SET b_hit = 0 WHERE b_hit IS null;

ALTER TABLE tbl_board ADD b_image nVARCHAR2(250) ;


commit;
CREATE SEQUENCE SEQ_MEMO
START WITH 1
INCREMENT BY 1;

DESC tbl_memo;
DESC tbl_member;
SELECT * FROM tbl_member;
SELECT * FROM tbl_memo;

CREATE TABLE tbl_hobby(

    id NUMBER PRIMARY KEY,
    userid CHAR(5),
    hobby nVARCHAR2(20)
    
);

-- tbl_user와 tbl_hobby의 관계
-- tbl_user table에서 userid는 중복되지 않으며
-- 한개만 존재하는 값이다.

-- tbl_hobby table에서 userid는 여러개의 데이터가 있을수 있으며
-- userid 칼럼을 기준으로 tbl_user와 1:다의 관계를 갖는다.

-- tbl_user와 tbl_hobby의 1:다 관계를 FK로 설정한다.

-- FK를 설정할때는 다의 위치에 있는 table을 기준으로 ALTER를 실행한다
ALTER TABLE tbl_hobby add FOREIGN KEY(userid) -- 다의 위치
REFERENCES tbl_user(userid) -- 1의 위치
ON DELETE CASCADE ; -- 제약조건 (USER 테이블의 userid를 삭제하면 HOBBY 테이블의 userid도 삭제)

-- FK 조건
-- USER에 userid가 있으면 HOBBY에는 0개 이상의 userid가 있을 수 있다.
-- USER에 userid가 없으면 HOBBY에는 절대 있을 수 없다. 