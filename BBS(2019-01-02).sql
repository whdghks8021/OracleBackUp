-- ����� BBS �Դϴ�.

SELECT * FROM TBL_BBS_MAIN;

INSERT INTO tbl_bbs_main
VALUES (3, '2019-01-02', 'ȫ�浿', '���س� ����', '���� �� ���̹�������');

-- DCL ����߿� COMMIT�� ROLLBACK ����� �ִµ�
-- ���� ������ ������ INSERT ������ �����͸� �߰� �ߴµ�
-- ������ �޸𸮻� �����Ͱ� ���縦 �ϰ�,
-- ���������� ������ DB���� ������ �ȵ� �����̴�
-- �׷��� ���� ȭ���� �ƴ� �ٸ� ��(JAV ��)���� DB�� �����ؼ�
-- �����͸� ��ȸ�ϸ� �����Ͱ� ������ �ʴ´�.

-- COMMIT ���
-- ���� �޸𸮿� �ִ� �����͸� ������ DB�� �����ϵ��� �ϴ� ���
COMMIT;

-- ROLLBACK ���
-- �����͸� INSERT, UPDATE, DELETE�� ������ ������
-- �ش�Ǵ� ����� ����ϰ��� �Ҷ� ����ϴ� ���

-- SQLDeveloper�� JAVA�� ���ÿ� �����ؼ�
-- �׽�Ʈ�� �Ҷ����� SQL���� �����͸� �߰�, ����, ������ �Ŀ���
-- COMMIT�� ���ش�.

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
    VALUES (SEQ_BBS_MAIN.nextval , '2019-01-02', 'ȫ�浿', '�ų��Դϴ�.', '���� �� ���� ��������.');
INSERT INTO tbl_bbs_main
    VALUES (SEQ_BBS_MAIN.nextval , '2019-01-02', '�Ӳ���', '�ų��Դϴ�.', '���س� ����� ���� ���ϴ�.');
INSERT INTO tbl_bbs_main
    VALUES (SEQ_BBS_MAIN.nextval , '2019-01-02', '����ȯ', '�ȳ��ϼ���.', '�ݰ����ϴ�.');    
    
CREATE USER gradeUser IDENTIFIED BY 1234;
GRANT dba TO 