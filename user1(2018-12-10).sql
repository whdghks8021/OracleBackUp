-- ����� user1 �Դϴ�.
-- user1�� dba������ ������ �ִ�.

-- table ����
-- TABLE �̸� : tbl_std
-- st_num, st_name, st_tel, st_addr, int_age, int_grade Į���� ������������
-- st_num�� PK�� �����Ǿ��ְ�, st_name�� ��ĭ�� ���� 
--         ��������� �����Ǿ� �ִ�.
CREATE TABLE tbl_std(
    st_num CHAR(3) PRIMARY KEY,
    st_name nVARCHAR2(10) NOT NULL,
    st_tel nVARCHAR2(15),
    st_addr nVARCHAR2(50),
    int_age NUMBER(3),
    int_grade NUMBER(3)
);

-- ȫ�浿, �̸��� , ������ , �Ӳ��� , ���� �̸���
-- ������ �׸��� �����Ӱ� �����Ͽ� �����͸� �߰��Ͻÿ�.

INSERT INTO tbl_std
VALUES ('1','ȫ�浿','010-1111-1111','����',15,100);
INSERT INTO tbl_std
VALUES ('2','�̸���','010-1111-1111','����',14,100);
INSERT INTO tbl_std
VALUES ('3','������','010-1111-1111','����',13,100);
INSERT INTO tbl_std
VALUES ('4','�Ӳ���','010-1111-1111','����',12,100);
INSERT INTO tbl_std
VALUES ('5','����','010-1111-1111','����',11,100);


