-- �̰��� user1 2

-- DDL CREATE TABLE��
-- DML INSERT SELECT UPDATE DELETE�� ���������� �ѹ� �ô�.
-- �ɼǵ��� �߰��ؼ� ��ɵ��� �н�

CREATE TABLE tbl_student (
    st_num CHAR(7) PRIMARY KEY ,
    st_name nVARCHAR2(20) NOT NULL,
    st_tel nVARCHAR2(15),
    st_age NUMBER(3)
 );
 SELECT * FROM tbl_student;
 
 INSERT INTO tbl_student
 VALUES ('001','�̸���','010-1111-1234',19);
 
 -- �̹� �����ϰ� �����Ͱ� �߰��� tbl_student��
 -- �ּ� Į���� �����Ȱ��� �߰��ߴ�.
 -- �׷��� tbl_student TABLE�� �ּ� Į���� �߰��Ϸ��� �Ѵ�.
 -- DDL ��� ü��
 -- ���� : CREATE USER, TABLE, INDEX
 -- ���� : DROP USER, TABLE, INDEX
 -- ���� : ALTER USER, TABLE
 
ALTER TABLE tbl_student ADD st_addr nVARCHAR2(125);

SELECT * FROM tbl_student;

INSERT INTO tbl_student
VALUES('002','������','010-2222-3333',16,'�ͻ��');
-- ���� ���̺� ������ �Է��Ҷ�
-- �й�, �̸�, ��ȭ��ȣ, ����, �ּ� ������ �߰��� �ؾ��Ѵ�.
-- �׷��� ������ �й�, �̸�, ����, �ּ�, ��ȭ��ȣ ������ �ۼ��Ǿ��ִ�.
-- �׷��ٺ��� �ڲ� �Է½Ǽ��� �ϰԵȴ�.
-- �׷���, INSERT���� �ɼ��� ����ؼ� ������ �ٲٰ��� �Ѵ�.
INSERT INTO tbl_student(st_num, st_name, st_age, st_addr, st_tel)
VALUES('003','ȫ�浿',12,'�����','010-3333-4444');

-- INSERT�� �����Ҷ� TABLE(Į������Ʈ) �������� �ۼ��� �ϸ�
-- ���� TABLE�� Į�� ������ �����ϰ� ������ �߰��� �Ҽ� �ִ�.

CREATE TABLE tbl_score(
    st_num CHAR(7) PRIMARY KEY,
    st_kor NUMBER(3),
    st_eng NUMBER(3),
    st_math NUMBER(3)
);

INSERT INTO tbl_score(st_num) VALUES('001');
INSERT INTO tbl_score(st_num) VALUES('002');
INSERT INTO tbl_score(st_num) VALUES('003');
INSERT INTO tbl_score(st_num) VALUES('004');
INSERT INTO tbl_score(st_num) VALUES('005');
INSERT INTO tbl_score(st_num) VALUES('006');
INSERT INTO tbl_score(st_num) VALUES('007');

SELECT * FROM tbl_score;

UPDATE tbl_score SET st_kor = 90, st_eng = 80, st_math = 30
WHERE st_num = '001';
UPDATE tbl_score SET st_kor = 93, st_eng = 10, st_math = 40
WHERE st_num = '002';
UPDATE tbl_score SET st_kor = 96, st_eng = 20, st_math = 50
WHERE st_num = '003';
UPDATE tbl_score SET st_kor = 92, st_eng = 30, st_math = 60
WHERE st_num = '004';
UPDATE tbl_score SET st_kor = 80, st_eng = 40, st_math = 70
WHERE st_num = '005';
UPDATE tbl_score SET st_kor = 85, st_eng = 50, st_math = 80
WHERE st_num = '006';
UPDATE tbl_score SET st_kor = 87, st_eng = 60, st_math = 90
WHERE st_num = '007';

SELECT st_kor, st_eng, st_math, st_kor + st_eng + st_math AS ���� 
FROM tbl_score;

SELECT st_kor AS ��������,
        st_eng AS ��������,
        st_math AS ��������,
        (st_kor + st_eng + st_math) AS ����,
        (st_kor + st_eng + st_math) / 3 AS ���
FROM tbl_score ;

-- �� Į���� ���� ������ ����Ҷ���
-- SUM(Į��)������ �Լ��� ����Ѵ�
SELECT SUM(st_kor) AS ��������,
        SUM(st_eng) AS ��������,
        SUM(st_math) AS ��������
FROM tbl_score ;

SELECT SUM(st_kor)/7 AS ��������,
        SUM(st_eng)/7 AS ��������,
        SUM(st_math)/7 AS ��������
FROM tbl_score ;        

SELECT * FROM tbl_score;

-- SQL������ ����(��)�� ���������Ͽ�
-- �˻����� ����� �� �ִ�.
-- �̶� �˻� ������ ������ Į���� ����� ���ڿ���
-- ���ڿ� ���̰� ��� �����ؾ� �Ѵ�.
-- ���� �׷��� Į���� CHAR������ �����ϴ°��� ����.
SELECT * FROM tbl_score
WHERE st_num >= '003' AND st_num <= '005' ; -- ���ڿ��� �ڸ����� ���ƾ���



SELECT st_kor AS ��������,
        st_eng AS ��������,
        st_math AS ��������,
        (st_kor + st_eng + st_math) AS ����,
        ROUND((st_kor + st_eng + st_math) / 3 ,2) AS ���
FROM tbl_score ;
-- ROUND �Լ��� ROUND(��, �Ҽ��ڸ���) �����̸�
-- �Ҽ��ڸ��� + 1 ���� �ݿø��Ͽ� �Ҽ��ڸ��� ���� ǥ��
-- ��) ROUND(3.24243232 , 2) >> 3.24
-- ��) ROUND(3.24759293 , 2) >> 3.25

-- ORACLE �����Լ�
-- 1~45������ ���� �߻�
SELECT ROUND(DBMS_RANDOM.VALUE(1,45),0) FROM DUAL;

-- DUAL TABLE
-- ������ ������ ����غ��ų�
-- ���� �Լ����� �׽�Ʈ �غ��� �Ҷ� ����ϴ� DUMMY TABLE
SELECT * FROM DUAL;
SELECT 30 * 40 FROM DUAL ;

SELECT ROUND(DBMS_RANDOM.VALUE(50,100),0) AS ���� FROM DUAL;
SELECT ROUND(DBMS_RANDOM.VALUE(50,100),0) AS ���� FROM DUAL;

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = 001; 

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = 002;

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = 003;

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = 004;

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = 005;

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = 006;

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = 007;

SELECT * FROM tbl_score;