-- 여기는 user1 입니다
SELECT 30*40 FROM DUAL;
SELECT '대한민국만세' FROM DUAL;

-- 현재는 DB저장소가 없는 상태
-- DB에서 어떤 일을 수행하기 전에 가장 먼저 저장소를 생성해야한다.
-- 저장소중에서 표준 DB에 대표 저장소인 TABLE을 생성
CREATE TABLE tbl_addr(
    name CHAR(50), // 50글자 범위에 글자를 저장
    age NUMBER(10,1), // 정수부  10글자 , 소수부 1글자
    addr CHAR(50)

);
DROP TABLE tbl_addr;

CREATE TABLE tbl_addr(
    name VARCHAR2(50), // 50글자 범위의 문자를 저장하되, 만약 글자수가 50글자가 안되면 남은공간 압축
    agr NUMBER, // 정수 38자리
    addr VARCHAR2(125)
);

-- TABLE을 설계할때
-- 검색하는 KEY로 사용될 가능성이 많은 항목(column)은
-- 공간 낭비를 감안하고라도 CHAR형으로 선언 하는 것이 효율 적이다.
-- 숫자가 저장되는 부분
-- NUMMBER라는 키워드만드로 설정이 가능하지만
-- 가급적 최대 자리수를 고려하여 값을 지정 해 주는것이 좋다
CREATE TABLE tbl_addr (
    st_name CHAR(10) NOT NULL,
    st_age NUMBER(3),
    st_addr VARCHAR2(255)
);
-- 제약조건 1
-- NOT NULL : 해당 칼럼에 데이터가 없으면 그 줄(ROW)의 데이터는 추가하지 마라.   

-- 데이터 추가 테스트
-- CRUD 중의 C(CREATE)
-- 이미 생성된 TABLE에 데이터를 1줄 추가하는 것
INSERT INTO tbl_addr
VALUES ('홍길동',12,'서울시 영등포구') ;

-- 추가된 데이터 확인 테스트
-- CRUD중의 R(READ)
-- TABLE에 저장된 데이터를 확인
SELECT st_name,st_age,st_addr
FROM tbl_addr ;

INSERT INTO tbl_addr
VALUES ('이몽룡',16,'전라북도 남원시') ;

SELECT st_name,st_age,st_addr
FROM tbl_addr ;

SELECT st_name
FROM tbl_addr ;

SELECT st_addr, st_name
FROM tbl_addr ;

-- * : 모든것
SELECT *
FROM tbl_addr ;

UPDATE tbl_addr SET st_name = '성춘향';

DELETE FROM tbl_addr ;

DROP TABLE tbl_addr ;

CREATE TABLE tbl_addr (
    id NUMBER PRIMARY KEY,
    st_name CHAR(50) NOT NULL,
    st_age NUMBER(3),
    st_addr VARCHAR2(255)
);

INSERT INTO tbl_addr VALUES (1,'홍길동',12,'서울시');
INSERT INTO tbl_addr VALUES (2,'이몽룡',12,'남원시');
INSERT INTO tbl_addr VALUES (3,'홍길동',12,'광주시');
INSERT INTO tbl_addr VALUES (4,'성춘향',12,'익산시');
INSERT INTO tbl_addr VALUES (5,'월매',12,'남원');

