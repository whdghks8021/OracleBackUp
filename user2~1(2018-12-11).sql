-- 여기는 user2 화면입니다.

CREATE TABLE tbl_grade (
    str_num CHAR(3) PRIMARY KEY,
    int_kor NUMBER(3),
    int_eng NUMBER(3),
    int_math NUMBER(3)
);

INSERT INTO tbl_grade(str_num, int_kor, int_eng, int_math)
VALUES ('001', 80, 90, 95) ;
INSERT INTO tbl_grade(str_num, int_kor, int_eng, int_math)
VALUES ('002', 80, 90, 95) ;
INSERT INTO tbl_grade(str_num, int_kor, int_eng, int_math)
VALUES ('003', 80, 90, 95) ;
INSERT INTO tbl_grade(str_num, int_kor, int_eng, int_math)
VALUES ('004', 80, 90, 95) ;
INSERT INTO tbl_grade(str_num, int_kor, int_eng, int_math)
VALUES ('005', 80, 90, 95) ;
        

-- 현재 입력된 데이터가 어쩌다 보니 학번 순서가 뒤섞여
-- 입력이 되어 있다. 이 데이터를 학번 순으로 보고싶다.

SELECT * FROM tbl_grade
ORDER BY str_num ; -- 정렬하기

SELECT * FROM tbl_users
ORDER BY str_name ; -- 정렬하기

SELECT * FROM tbl_users
ORDER BY str_name DESC; -- 역순으로 정렬

-- SUM , AVG 함수를 사용하자
SELECT SUM(int_kor), SUM(int_eng), SUM(int_math)
FROM tbl_grade;

-- 통계함수는 칼럼별로 묶어서 계산을 실행하는 함수들이다.

-- 각 학생의 총점을 계산해보자
SELECT str_num, int_kor, int_eng, int_math,
    (int_kor + int_eng + int_math) AS 총점
FROM tbl_grade;
-- 각 학생의 평균도 계산해보자
SELECT str_num, int_kor, int_eng, int_math,
    (int_kor + int_eng + int_math) AS 총점,
    (int_kor + int_eng + int_math)/3 AS 평균
FROM tbl_grade ORDER BY str_num;

-- tbl_grade의 데이터를 전체 삭제
DELETE FROM tbl_grade ;

-- 랜덤점수를 가진 데이터 추가
INSERT INTO tbl_grade(str_num, int_kor, int_eng, int_math)
VALUES ('001',
        ROUND(DBMS_RANDOM.VALUE (50,100),0),
        ROUND(DBMS_RANDOM.VALUE (50,100),0),
        ROUND(DBMS_RANDOM.VALUE (50,100),0));
INSERT INTO tbl_grade(str_num, int_kor, int_eng, int_math)
VALUES ('002',
        ROUND(DBMS_RANDOM.VALUE (50,100),0),
        ROUND(DBMS_RANDOM.VALUE (50,100),0),
        ROUND(DBMS_RANDOM.VALUE (50,100),0));
INSERT INTO tbl_grade(str_num, int_kor, int_eng, int_math)
VALUES ('003',
        ROUND(DBMS_RANDOM.VALUE (50,100),0),
        ROUND(DBMS_RANDOM.VALUE (50,100),0),
        ROUND(DBMS_RANDOM.VALUE (50,100),0));
INSERT INTO tbl_grade(str_num, int_kor, int_eng, int_math)
VALUES ('004',
        ROUND(DBMS_RANDOM.VALUE (50,100),0),
        ROUND(DBMS_RANDOM.VALUE (50,100),0),
        ROUND(DBMS_RANDOM.VALUE (50,100),0));
INSERT INTO tbl_grade(str_num, int_kor, int_eng, int_math)
VALUES ('005',
        ROUND(DBMS_RANDOM.VALUE (50,100),0),
        ROUND(DBMS_RANDOM.VALUE (50,100),0),
        ROUND(DBMS_RANDOM.VALUE (50,100),0));
INSERT INTO tbl_grade(str_num, int_kor, int_eng, int_math)
VALUES ('006',
        ROUND(DBMS_RANDOM.VALUE (50,100),0),
        ROUND(DBMS_RANDOM.VALUE (50,100),0),
        ROUND(DBMS_RANDOM.VALUE (50,100),0));
INSERT INTO tbl_grade(str_num, int_kor, int_eng, int_math)
VALUES ('007',
        ROUND(DBMS_RANDOM.VALUE (50,100),0),
        ROUND(DBMS_RANDOM.VALUE (50,100),0),
        ROUND(DBMS_RANDOM.VALUE (50,100),0));
        
INSERT INTO tbl_grade(str_num, int_kor, int_eng, int_math)
VALUES (ROUND(DBMS_RANDOM.VALUE (0,999),0),
        ROUND(DBMS_RANDOM.VALUE (50,100),0),
        ROUND(DBMS_RANDOM.VALUE (50,100),0),
        ROUND(DBMS_RANDOM.VALUE (50,100),0));        

-- str_num 순으로 정렬
SELECT * FROM tbl_grade
ORDER BY str_num ;

-- 총점, 평균 계산후 순위부여
SELECT str_num, int_kor, int_eng, int_math,
    (int_kor + int_eng + int_math) AS 총점,
    ROUND((int_kor + int_eng + int_math)/3 ,2) AS 평균,
    RANK() OVER(ORDER BY (int_kor + int_eng + int_math) DESC) AS 순위
FROM tbl_grade ORDER BY int_kor DESC;

-- 평균이 70점 이상인 학생만 리스트
SELECT str_num, int_kor, int_eng, int_math,
    (int_kor + int_eng + int_math) AS 총점,
    ROUND((int_kor + int_eng + int_math)/3 ,2) AS 평균
FROM tbl_grade WHERE ROUND((int_kor + int_eng + int_math)/3 ,2) >= 70 ;