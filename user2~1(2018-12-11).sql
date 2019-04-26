-- ����� user2 ȭ���Դϴ�.

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
        

-- ���� �Էµ� �����Ͱ� ��¼�� ���� �й� ������ �ڼ���
-- �Է��� �Ǿ� �ִ�. �� �����͸� �й� ������ ����ʹ�.

SELECT * FROM tbl_grade
ORDER BY str_num ; -- �����ϱ�

SELECT * FROM tbl_users
ORDER BY str_name ; -- �����ϱ�

SELECT * FROM tbl_users
ORDER BY str_name DESC; -- �������� ����

-- SUM , AVG �Լ��� �������
SELECT SUM(int_kor), SUM(int_eng), SUM(int_math)
FROM tbl_grade;

-- ����Լ��� Į������ ��� ����� �����ϴ� �Լ����̴�.

-- �� �л��� ������ ����غ���
SELECT str_num, int_kor, int_eng, int_math,
    (int_kor + int_eng + int_math) AS ����
FROM tbl_grade;
-- �� �л��� ��յ� ����غ���
SELECT str_num, int_kor, int_eng, int_math,
    (int_kor + int_eng + int_math) AS ����,
    (int_kor + int_eng + int_math)/3 AS ���
FROM tbl_grade ORDER BY str_num;

-- tbl_grade�� �����͸� ��ü ����
DELETE FROM tbl_grade ;

-- ���������� ���� ������ �߰�
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

-- str_num ������ ����
SELECT * FROM tbl_grade
ORDER BY str_num ;

-- ����, ��� ����� �����ο�
SELECT str_num, int_kor, int_eng, int_math,
    (int_kor + int_eng + int_math) AS ����,
    ROUND((int_kor + int_eng + int_math)/3 ,2) AS ���,
    RANK() OVER(ORDER BY (int_kor + int_eng + int_math) DESC) AS ����
FROM tbl_grade ORDER BY int_kor DESC;

-- ����� 70�� �̻��� �л��� ����Ʈ
SELECT str_num, int_kor, int_eng, int_math,
    (int_kor + int_eng + int_math) AS ����,
    ROUND((int_kor + int_eng + int_math)/3 ,2) AS ���
FROM tbl_grade WHERE ROUND((int_kor + int_eng + int_math)/3 ,2) >= 70 ;