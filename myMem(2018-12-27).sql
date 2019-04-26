-- ����� myMem �Դϴ�.

DROP TABLE tbl_score;

CREATE TABLE tbl_score (
    g_id	NUMBER		PRIMARY KEY,
    g_stname	nVARCHAR2(50)	NOT NULL,	
    g_subject	nVARCHAR2(10)	NOT NULL,	
    g_score	NUMBER		
);

SELECT COUNT(*) FROM tbl_score;

-- SQL���� SELECT�� for ��ɰ� ���� ����
SELECT g_stname, SUM(g_stname)
FROM tbl_score;

-- SUM �Լ��� �ݵ�� ������ Į���� �Ű������� ����Ҽ� �ִ�
SELECT SUM(g_stname)
FROM tbl_score;

-- �Լ�() = method()
-- Ű���� = ��ɾ�

-- SQL���� �Լ�() �� ���� ��ΰ� �Ű������� �ݵ�� �ʿ�� �Ѵ�.
-- ��ü ����Ʈ�� ���� Į���� �� �հ踦 ���϶�
SELECT SUM(g_score) AS intSum
FROM tbl_score;

-- ������ ���ϴµ�
-- �л����� ���϶�
-- �л����� = �л��� �����ϴ� Į��(g_stname)�� �׷����� �����
SELECT g_stname,SUM(g_score) AS ����
FROM tbl_score
GROUP BY g_stname
ORDER BY g_stname;

-- �л����� ������ ���ٿ� �����ϴ� SQL�� �ۼ�
-- �̸�   ����   ����   ���� ....

-- 1. �л��� = �л��̸� Į������ �׷��� �����
SELECT g_stname
FROM tbl_score
GROUP BY g_stname;

-- 2. ������ ���ٿ� ����
SELECT g_stname,����,����,����,����,����
FROM tbl_score
GROUP BY g_stname;
-- ���� SQL���� ����,����,���� �� ������ Į���� ������ tbl_score�� ����.
-- ������ ��𿡼��� ������ ����ؼ� ����(Į��)�� �����ϴ� �κ��� �ʿ��ϴ�.
-- ������ ����ϴ� �ڵ� ����Ŭ�� �Լ��� �̿��ؼ� �ۼ��Ѵ�.

SELECT g_subject, 
    DECODE(g_subject,'����',g_score,0) AS ����,
    DECODE(g_subject,'����',g_score,0) AS ����,
    DECODE(g_subject,'����',g_score,0) AS ����,
    DECODE(g_subject,'����',g_score,0) AS ����,
    DECODE(g_subject,'�̼�',g_score,0) AS �̼�,
    DECODE(g_subject,'����',g_score,0) AS ����
FROM tbl_score
WHERE ROWNUM < 20;

SELECT g_subject, 
    SUM(DECODE(g_subject,'����',g_score,0)) AS ����,
    SUM(DECODE(g_subject,'����',g_score,0)) AS ����,
    SUM(DECODE(g_subject,'����',g_score,0)) AS ����,
    SUM(DECODE(g_subject,'����',g_score,0)) AS ����,
    SUM(DECODE(g_subject,'�̼�',g_score,0)) AS �̼�,
    SUM(DECODE(g_subject,'����',g_score,0)) AS ����
FROM tbl_score
WHERE ROWNUM < 20
GROUP BY g_subject;


SELECT g_stname, 
    SUM(DECODE(g_subject,'����',g_score,0)) AS ����,
    SUM(DECODE(g_subject,'����',g_score,0)) AS ����,
    SUM(DECODE(g_subject,'����',g_score,0)) AS ����,
    SUM(DECODE(g_subject,'����',g_score,0)) AS ����,
    SUM(DECODE(g_subject,'�̼�',g_score,0)) AS �̼�,
    SUM(DECODE(g_subject,'����',g_score,0)) AS ����
FROM tbl_score
GROUP BY g_stname;

CREATE VIEW �����϶�ǥ
AS
SELECT g_stname, 
    SUM(DECODE(g_subject,'����',g_score,0)) AS ����,
    SUM(DECODE(g_subject,'����',g_score,0)) AS ����,
    SUM(DECODE(g_subject,'����',g_score,0)) AS ����,
    SUM(DECODE(g_subject,'����',g_score,0)) AS ����,
    SUM(DECODE(g_subject,'�̼�',g_score,0)) AS �̼�,
    SUM(DECODE(g_subject,'����',g_score,0)) AS ����
FROM tbl_score
GROUP BY g_stname;

SELECT * FROM �����϶�ǥ;

SELECT * FROM tbl_iolist
WHERE ROWNUM < 10;

SELECT *
FROM tbl_iolist I
    LEFT JOIN tbl_dept D
        ON I.io_dcode = D.d_code;

-- �ŷ�ó���� �ŷ��ݾ��� ���ΰ� �˰� �ʹ�.
SELECT I.io_dcode, D.d_name, D.d_ceo,
    SUM(I.io_price * I.io_quan) �ŷ��ݾ�
   
FROM tbl_iolist I
    LEFT JOIN tbl_dept D
        ON I.io_dcode = D.d_code
GROUP BY I.io_dcode, D.d_name, D.d_ceo;        
-- �� SQL�� �ŷ�ó���� �ܼ��� �ŷ��ݾ��� �ջ� �� �����

-- �ŷ�ó���� ���Աݾְ� ����ݾ��� ������ �˰� �ʹ�.
SELECT I.io_dcode, D.d_name, D.d_ceo,
    SUM(DECODE(I.io_inout,'����', I.io_price * I.io_quan,0)) ���Աݾ�,
    SUM(DECODE(I.io_inout,'����', I.io_price * I.io_quan,0)) ����ݾ�
FROM tbl_iolist I
    LEFT JOIN tbl_dept D
        ON I.io_dcode = D.d_code
GROUP BY I.io_dcode, D.d_name, D.d_ceo; 


SELECT g_stname FROM tbl_score
GROUP BY g_stname ;


CREATE TABLE tbl_student (
    st_num	CHAR(5)		PRIMARY KEY,
    st_name	nVARCHAR2(50)	NOT NULL	
);


SELECT SC.g_stname, ST.st_name
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.g_stname = ST.st_name ;
        
ALTER TABLE tbl_score ADD g_stnum CHAR(5);
        
UPDATE tbl_score SC
SET SC.g_stnum = (
    SELECT ST.st_num FROM tbl_student ST
    WHERE Sc.g_stname = ST.st_name 
 );
 
 -- ������Ʈ �� ����
 SELECT SC.g_stnum, ST.st_name, SC.g_stname,ST.st_name
 FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.g_stnum = St.st_num
WHERE ST.st_name IS NULL;        

-- tbl_score�� ���� �л��̸� Į���� ����
ALTER TABLE tbl_score DROP COLUMN g_stname ;


 -- ���� �� ����
 SELECT SC.g_stnum, ST.st_name
 FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.g_stnum = St.st_num;
        
DESC tbl_score;        


CREATE TABLE tbl_subject (
    sb_code	CHAR(5)		PRIMARY KEY,
    sb_name	nVARCHAR2(50)	NOT NULL	
);

INSERT INTO tbl_subject VALUES('B0001','����');
INSERT INTO tbl_subject VALUES('B0002','����');
INSERT INTO tbl_subject VALUES('B0003','����');
INSERT INTO tbl_subject VALUES('B0004','����');
INSERT INTO tbl_subject VALUES('B0005','����');
INSERT INTO tbl_subject VALUES('B0006','�̼�');

-- ������� ����ȭ �ϱ� ���ؼ� �����ڵ� Į���� tbl_score�� �߰�
ALTER TABLE tbl_score ADD g_sbcode CHAR(5);

UPDATE tbl_score SC
SET g_sbcode = 
    (
        SELECT sb_code FROM tbl_subject SB
        WHERE SC.g_subject = SB.sb_name
    );

-- ������Ʈ �� ����
SELECT SC.g_sbcode, SB.sb_code, SC.g_subject, SB.sb_name
FROM tbl_score SC
    LEFT JOIN tbl_subject SB
        ON SC.g_sbcode = SB.sb_code
WHERE SB.sb_name IS NULL        
