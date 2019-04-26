-- gradeUser�� ������ ����ó�� ȭ���Դϴ�.
SELECT * FROM tbl_student;
DROP TABLE tbl_score;

CREATE TABLE tbl_student
(	
    ST_NUM CHAR(5),
	ST_NAME NVARCHAR2(30), 
	ST_TEL NVARCHAR2(20), 
	ST_ADDR NVARCHAR2(50)
);

SELECT * FROM tbl_score;
--ID	�й�	����	����
CREATE TABLE tbl_score (
    sc_id NUMBER PRIMARY KEY,
    sc_st_num VARCHAR2(5) NOT NULL,
    sc_subject VARCHAR2(3) NOT NULL,
    sc_score NUMBER(3)
);
SELECT COUNT(*) FROM tbl_score;

-- �������̺� ����
-- �����ȣ ����� ��米��
CREATE TABLE tbl_subject (
    su_num VARCHAR2(3) PRIMARY KEY,
    su_name nVARCHAR2(20) NOT NULL,
    su_pro nVARCHAR2(30)
);
INSERT INTO tbl_subject
VALUES('001', '����', 'ȫ�浿');

-- �ʿ��� �Ϻ� Į������ �����͸� �������
INSERT INTO tbl_subject(su_num, su_name)
VALUES('002', '����');

-- ���̺��� ������ ����� Į�� ������ �𸣰ų� 
-- ��Ȯ�� Į���� ��ġ�ǵ��� �����͸� �ۼ��ϴ� ���
INSERT INTO tbl_subject(su_name, su_num, su_pro)
VALUES('����', '003', '������');

INSERT INTO tbl_subject(su_num, su_name)
VALUES('004', '����');
INSERT INTO tbl_subject(su_num, su_name)
VALUES('005', '����');
INSERT INTO tbl_subject(su_num, su_name)
VALUES('006', '����');

SELECT * FROM tbl_subject;
-- �����͸� Ȯ���� ���� ���ǵ����Ͱ� 2���� ����
-- �����ȣ 006�� �����̾ƴϰ� �����̴�.
-- �ش絥���͸� �����Ϸ��� �Ѵ�.

UPDATE tbl_subject SET su_name = '����'
WHERE su_num = '006';

INSERT INTO tbl_subject(su_num, su_name)
VALUES('900','��������');

-- �����͸� Ȯ���غ��� �����ȣ 900�� �߸��Էµ� �������̴�.
-- �� �����͸� �����ϰ� ���Է� �Ϸ��� �Ѵ�.
DELETE FROM tbl_subject WHERE su_num = '900';

-- �������̺��� �����͸� Ȯ���ϴµ�
-- ����Į���� �����͵��� ������� �ƴϰ�, ���� ��ȣ�� �Ǿ��ִ�.
-- �׷��� �������̺�� �������̺��� join�� �����ؼ� ��ȸ�� �Ϸ��� �Ѵ�.
SELECT SC.sc_st_num, SC.sc_subject, su.su_name, SC.sc_score
FROM tbl_score SC -- Ȯ���ϰ��� �ϴ� �� ���̺�
LEFT JOIN tbl_subject SU --�� ���̺� ��ȸ�� �����ִ� ���� ���̺�
ON SC.sc_subject = SU.su_num; -- �� ���̺��� �����ϱ� ���� ���ǹ�
 
-- ������ȸ�� �ϴµ� �л����� ��� ������ �������� Ȯ���ϱⰡ ��ƴ�.
-- �л����̺�� join�� �����ؼ� ��ȸ�� �Ϸ��� �Ѵ�.
SELECT ST.st_num, st.st_name, sc.sc_score
FROM tbl_score SC -- Ȯ���ϰ��� �ϴ� �� ���̺�
LEFT JOIN tbl_student ST --�� ���̺� ��ȸ�� �����ִ� ���� ���̺�
ON SC.sc_st_num = ST.st_num; -- �� ���̺��� �����ϱ� ���� ���ǹ�

-- �������̺�� �л����̺��� �й� Į���� type�� �޶�
-- JOIN�� ������� �ʴ´�.
-- Į���� ����
ALTER TABLE tbl_student MODIFY st_num CHAR(5) ;
ALTER TABLE tbl_score MODIFY sc_st_num CHAR(5); 

-- �л����̺�� �������̺��� �������̺� ���ÿ� join�� �����ؼ� view�ϱ�
-- ��ȸ�� ����� view�� �����Ϸ��� AS�� ����� �־�� �Ѵ�.
CREATE VIEW view_score
AS
SELECT SC.sc_st_num AS �й�, ST.st_name AS �л��̸�, SC.sc_subject AS �����ȣ,
        SU.su_name AS �����̸�, SC.sc_score AS ����
FROM tbl_score SC

LEFT JOIN tbl_student ST
ON SC.sc_st_num = ST.st_num

LEFT JOIN tbl_subject SU
ON SC.sc_subject = SU.su_num 
ORDER BY SC.sc_st_num ; -- �й������� ����

SELECT * FROM view_score;

-- ���ڿ� �ռ�
SELECT 'KOREA' || '�� �츮����' FROM DUAL;

SELECT RPAD('3',5,'0') FROM DUAL;
SELECT LPAD('3',5,'0') FROM DUAL;

-- view_score�� �������̺�, �л����̺�, �������̺��� ���ε� view�̴�
SELECT * FROM view_score;

-- view_score�� ����ؼ� SELECT ����
-- �й� �̸� ���� ������ view ����
SELECT �й�, �л��̸�, SUM(����), AVG(����)
FROM view_score
GROUP BY �й�, �л��̸�
ORDER BY �й� ;

-- �й� �̸� ���� ���� ���� ���� ���� ���� ����
-- �� �л��� ������ �������� ���ڵ忡 ������ �ΰ�
-- view�� �Ҷ� �϶�ǥ ó�� ���̴� SQL
SELECT �й�, �л��̸�, 
    SUM(DECODE(�����ȣ,'001',����)) AS ����,
    SUM(DECODE(�����ȣ,'002',����)) AS ����,
    SUM(DECODE(�����ȣ,'003',����)) AS ����,
    SUM(DECODE(�����ȣ,'004',����)) AS ����,
    SUM(DECODE(�����ȣ,'005',����)) AS ����,
    SUM(����) AS ����,
    AVG(����) AS ���,
    RANK() OVER(ORDER BY AVG(����) DESC) AS ����
FROM view_score
GROUP BY �й�, �л��̸�
ORDER BY �й�;