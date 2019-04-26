-- 여기는 BBS 입니다.

SELECT * FROM TBL_BBS_MAIN;

INSERT INTO tbl_bbs_main
VALUES (3, '2019-01-02', '홍길동', '기해년 새해', '새해 복 많이받으세요');

-- DCL 명령중에 COMMIT과 ROLLBACK 명령이 있는데
-- 현재 위에서 실행한 INSERT 문으로 데이터를 추가 했는데
-- 아직은 메모리상에 데이터가 존재를 하고,
-- 실제적으로 물리적 DB에는 저장이 안된 상태이다
-- 그래서 현재 화면이 아닌 다른 곳(JAV 등)에서 DB에 연결해서
-- 데이터를 조회하면 데이터가 보이지 않는다.

-- COMMIT 명령
-- 현재 메모리에 있는 데이터를 물리적 DB에 저장하도록 하는 명령
COMMIT;

-- ROLLBACK 명령
-- 데이터를 INSERT, UPDATE, DELETE를 수행한 다음에
-- 해당되는 명령을 취소하고자 할때 사용하는 명령

-- SQLDeveloper와 JAVA를 동시에 연동해서
-- 테스트를 할때에는 SQL에서 데이터를 추가, 변경, 삭제한 후에는
-- COMMIT을 해준다.

DESC tbl_bbs_main;

CREATE TABLE tbl_bbs_main2 (
    B_ID      NUMBER PRIMARY KEY,     
    B_DATE    CHAR(10) NOT NULL,       
    B_AUTH    NVARCHAR2(20) NOT NULL,  
    B_SUBJECT NVARCHAR2(50) NOT NULL,  
    B_TEXT    NVARCHAR2(255) NOT NULL
);
DROP TABLE tbl_bbs_main;

ALTER TABLE tbl_bbs_main2 RENAME TO tbl_bbs_main ;
    
INSERT INTO tbl_bbs_main
    VALUES (SEQ_BBS_MAIN.nextval , '2019-01-02', '홍길동', '신년입니다.', '새해 복 많이 받으세요.');
INSERT INTO tbl_bbs_main
    VALUES (SEQ_BBS_MAIN.nextval , '2019-01-02', '임꺽정', '신년입니다.', '기해년 행운이 깃들길 빕니다.');
INSERT INTO tbl_bbs_main
    VALUES (SEQ_BBS_MAIN.nextval , '2019-01-02', '이종환', '안녕하세요.', '반갑습니다.');    
    
CREATE USER gradeUser IDENTIFIED BY 1234;
GRANT dba TO 