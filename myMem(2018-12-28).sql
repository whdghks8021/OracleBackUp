-- 여기는 myMEM으로 접속한 화면입니다

CREATE TABLE tbl_primary (
    p_id NUMBER PRIMARY KEY,
    p_name nVARCHAR2(50) NOT NULL,
    p_tel nVARCHAR2(20)
    
) ;    

-- 보통 테이블의 PK는 각 데이터(레코드)를 식별하는 어떤 요소로서 사용이 된다.
-- 그래서 정보(학생정보, 상품정보, 거래처정보, 부서정보)를 저장하는 테이블에서는
-- 임의 코드(D001, S001)를 생성해서 데이터를 추가(INSERT)할때 사용한다.

-- 하지만
-- 임의의 데이터가 다량으로 추가 되는 
-- work(상품매입매출, 성적처리) 테이블일 경우 코드 개념을 추가하기가 매우 어렵다.
-- 그래서 이런 테이블에는 임의로 id 칼럼을 하나 추가하고
-- 일정한 순서의 값(숫자가 증가되는 형태)을 만들어 저장을 한다.
-- mySQL같은 DB에서는 AUTO INCREMENT라는 옵션이 있어서
-- PK 칼럼에 해당 옵션을 지정해주면 INSERT를 실행할때
-- 자동으로 1씩 증가된 값을 생성하고 칼럼에 할당 해주도록 할수 있다.

-- 그런데,
-- 오라클(11 이하)에서는 AUTO INCREMENT 옵션이 없다.

-- 편번으로 오라클에 있는 SEQ(SEQUENCE)라는 객체를 활용해서
-- AUTO INCREMENT 효과를 얻을 수 있다.

-- 새로운 SEQ 객체를 생성
CREATE SEQUENCE PK_SEQ
START WITH 1 -- 시작값
INCREMENT BY 1 -- STEP(증가) 값
NOMAXVALUE -- 또는 MAXVALUE 1000
NOMINVALUE ; -- 또는 MINVALUE 0 

-- FROM DUAL : 오라클에 있는 테스트용(DUMY) 테이블을 이용해서
-- 간단한 계산식이나, 내장함수들의 연습을 하고자 할때 사용한다.
-- 다른 DB에서는 SELECT 30 * 40 이라고만 작성을 해도
-- DB 에서 값을 보여주지만, 오라클은 오류를 발생한다.
-- 그래서 만드시 FROM DUAL이라고 써 줘야 한다.
SELECT 30 * 40 FROM DUAL;


-- 위에서 생성한 PK_SEQ 시퀀스를 테스트 해 보자
SELECT PK_SEQ.NEXTVAL FROM DUAL;
-- SEQ 객체의 NEXTVAL 변수를 호출하면
-- 시퀀스는 내부적으로 값을 INCREMENT BY에 설정한 만큼 증가 시킨후
-- 그 값을 return 한다.


-- SEQ의 NEXTVAL 값을 INSERT 할때 PK로 선언된 ID에 저장하도록 하여
-- 마치 AUTO INCREMENT가 설정된 칼럼을 쓸때와 같이 사용가능하다.
INSERT INTO tbl_primary VALUES(1,'홍길동','0001') ;
INSERT INTO tbl_primary VALUES(PK_SEQ.NEXTVAL, '이몽룡','0005');

SELECT * FROM tbl_primary ;

-- INSERT를 실행한 후 현재 ID 값을 SEQ를 통해서 확인하는 방법
-- INSERT가 실행되지 않은 상태에서 조회를 하면 오류가 난다.
SELECT PK_SEQ.CURRVAL FROM DUAL;

-- INSERT가 실행되지 않아 오류가 발생하고 현재 ID값을 얻을 수 없을때
-- 오라클의 SYSTEM DB(시스템 데이터 사전)로 부터 값을 조회 할 수 있다.

SELECT *
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = 'PK_SEQ';


-- RANDOM 함수를 사용해서 PK를 만드는 방법
SELECT DBMS_RANDOM.VALUE FROM DUAL;
SELECT ROUND(DBMS_RANDOM.VALUE(100, 9999)) FROM DUAL; 

INSERT INTO tbl_primary 
VALUES( ROUND(DBMS_RANDOM.VALUE(100, 9999)), '성춘향','0007');
-- 난수를 이용해서 PK를 만들면, 중복된 값이 나타날 우려가 있고
-- id 값으로 정렬을 했을때 의미없는 정렬이 된다.

SELECT * FROM tbl_primary
ORDER BY p_id;

-- GUID(Global Unique Identifier, UUID(Universally Unique Indeitifer)
SELECT SYS_GUID() FROM DUAL;

-- SYS_GUID를 사용해서 PK를 선언할때는 CHAR(32) 이상의 값으로 설정한다.
-- SYS_GUID를 사용해서 PK를 선언할때 CHAR(32)에서 오류가 발생하는 경우가 있다.
--  그럴때는 CLOB, BLOB
INSERT INTO tbl_primary
VALUES( SYS_GUID(),'임꺽정','0000');

DROP SEQUENCE SEQ_TEST;

CREATE SEQUENCE SEQ_TEST
START WITH 1
INCREMENT BY 1
MAXVALUE 10 
NOCACHE
CYCLE;

SELECT SEQ_TEST.NEXTVAL FROM DUAL;

-- 시퀀스 변경
-- 시퀀스도 다른 객체처럼 ALTER를 사용해서 변경을 할수 있는데
-- START WITH는 변경 할수 없다.
-- START WITH를 변경하려면 DROP 한 후에 다시 생성해야 한다.
ALTER SEQUENCE SEQ_TEST
INCREMENT BY 2
MAXVALUE 20
NOCYCLE;

-- 시퀀스의 값을 역순으로 생성하고 싶을때가 있다.
-- 역순으로 지정할때는 MAXVALUE값을 반드시 START 값보다 큰 값으로 지정한다.
CREATE SEQUENCE ASC_SEQ
START WITH 99999
INCREMENT BY -1 
MAXVALUE 100000; -- NOMAXVALUE : 10의 27승까지
MINVALUE 0 -- NOMINVALUE : -1까지

CREATE SEQUENCE MY_SEQ
    START WITH 1
    INCREMENT BY 1 ;
    

CREATE TABLE tbl_mytable (
    p_id NUMBER PRIMARY KEY,
    p_name nVARCHAR2(50) NOT NULL,
    p_tel nVARCHAR2(50) NOT NULL,
    p_kor NUMBER(3), -- 점수를 저장하려고 만든 칼럼으로 예상이된다.
    p_eng NUMBER(3)  -- 이처럼 저장할 최대값이 예상이 될경우는 
                     -- 값의 크기를 지정 해주는 것이 좋다.
);

INSERT INTO tbl_mytable
VALUES( MY_SEQ.NEXTVAL,'홍길동','0001',
    ROUND(DBMS_RANDOM.VALUE(50,100)),
    ROUND(DBMS_RANDOM.VALUE(50,100)) ) ;

INSERT INTO tbl_mytable
VALUES( MY_SEQ.NEXTVAL,'이몽룡','0002',
    ROUND(DBMS_RANDOM.VALUE(50,100)),
    ROUND(DBMS_RANDOM.VALUE(50,100)) ) ;


SELECT p_id, p_name,p_tel, p_kor, p_eng, (p_kor + p_eng) AS 합계
FROM tbl_mytable;

