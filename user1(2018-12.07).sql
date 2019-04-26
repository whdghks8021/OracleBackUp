-- 이곳은 user1으로 접속한 화면입니다.
-- tbl_addr을 일단 삭제
DROP TABLE tbl_addr;

-- 새로 tbl_addr을 생성
CREATE TABLE tbl_addr(
    id NUMBER PRIMARY KEY, -- 기본키, PK
    st_name CHAR(50) NOT NULL, -- 이름은 절때 빈칸금지.
    st_age NUMBER(3),
    st_addr VARCHAR2(125)
);
INSERT INTO tbl_addr
VALUES(0,'홍길동',12,'서울시');
INSERT INTO tbl_addr
VALUES(1,'홍길동',12,'서울시');
INSERT INTO tbl_addr
VALUES(2,'이몽룡',16,'남원시');
-- 데이터를 추가하면서 0번 항목과 1번 항목을 
-- 잘못 확인하여, 같은 데이터인것으로 인식하고 
-- INSERT 처리를 해버렸다.

SELECT * FROM tbl_addr;
-- SELECT로 DATA를 확인 했더니, 두 줄의 데이터가
-- 한사람의 DATA로 중복 된 것이 확인되었다.
-- 다시 원본 문서를 봤더니
-- 두번째 홍길동이 주소가 서울이아닌 부산인 것으로 확인 됬다.
-- 그래서, 두번째 홍길동의 주소를 부산으로 수정하려고 한다.
-- 다시한번 SELECT 해서 홍길동의 데이터를 확인해보자.
SELECT * FROM tbl_addr
WHERE st_name = '홍길동' ; -- st_name 칼럼의 값이 홍길동인 경우만 보여라 (조건검색)

-- 데이터 변경 실행
UPDATE tbl_addr 
SET st_addr = '부산시'
WHERE id = 1;

-- 확인
SELECT * FROM tbl_addr;

-- 실수로 중복입력한 데이터를 삭제하려고한다.
INSERT INTO tbl_addr
VALUES (3,'성춘향',17,'익산시');
INSERT INTO tbl_addr
VALUES (4,'성춘향',17,'익산시');

-- '성춘향' 데이터들을 확인해봐야 한다.
SELECT
    *
FROM tbl_addr
WHERE st_name = '성춘향';

-- '성춘향'의 2번째 데이터인 id가 4인 데이터를 삭제
DELETE FROM tbl_addr
WHERE id = 4 ;

SELECT * FROM tbl_addr;

-- DATABASE의 TABLE을 생성할때
-- 사용하고자 하는 칼럼중에 UNIQUE한 항목이 있다면
-- 그 칼럼을 PRIMARY KEY = PK로 설정하는 것이 좋고
-- 그렇지 않으면 모든 TABLE에는 id라는 칼럼을 임의 추가해서
-- 해당 칼럼을 PK로 선언 해 주는것이 좋다.

CREATE TABLE tbl_postno (
    postno CHAR(5) PRIMARY KEY , -- 개체 무결성 보장용
    street VARCHAR(125) NOT NULL UNIQUE, -- 데이터를 비워두거나 이미 같은 값이 입력되있으면,
                                         -- 다시 입력되지 않도록 하는 옵션
    addr VARCHAR2(125)
);