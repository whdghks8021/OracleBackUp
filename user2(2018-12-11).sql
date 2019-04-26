-- ����� user2 ȭ���Դϴ�.

CREATE TABLE tbl_users (
    str_userid CHAR(12) PRIMARY KEY ,
    str_name nVARCHAR2(50) NOT NULL ,
    str_tel nVARCHAR2(15),
    str_addr nVARCHAR2(50)
);

INSERT INTO tbl_users
VALUES ('001','ȫ�浿','010-1111-1111','���ֱ�����');
INSERT INTO tbl_users
VALUES ('002','�̸���','010-2222-3333','������');
INSERT INTO tbl_users
VALUES ('003','������','010-3333-3333','���ֽ�');
INSERT INTO tbl_users
VALUES ('004','�̼���','010-4444-4444','�����');
INSERT INTO tbl_users
VALUES ('005','�庸��','010-5555-5555','���ֽ�');

-- ���� �ۼ��� tbl_users ���̺� str_userid�� 12�ڸ��� ������ �ߴµ�,
-- �Է��� �ϴ� ���� �ʹ� ���� �ڸ��� �����Ѵ�.
-- �׷��� ���� �Է����� id ������ 3���� ũ�⸦ �ٲ� ������ �Ѵ�.
-- �̹� ������ ���̺��� Į�� ������ ����
-- DDL ����� ALTER ����� ����Ѵ�
ALTER TABLE tbl_users MODIFY str_userid CHAR(3);
-- CHAR�� �����ʹ� ���̴� �����Ϳ� �޸� ���� ũ�⸸ŭ ���� ������ ä���� �־
-- ũ�⸦ ���̱Ⱑ �ȵȴ�.
-- nVARCHAR2 �� �����ʹ� ���̴� �������� ���� ���̰� �� ������ ��ŭ��
-- ũ�⸦ ���ϼ� �ִ�.
ALTER TABLE tbl_users MODIFY str_name nVARCHAR2(5);

-- INSERT�� �����Ҷ� ��üĮ���� �ƴ� Ư��Į���� ���� �ִ°��
INSERT INTO tbl_users (str_userid, str_name)
VALUES ('006','�Ӳ���');
INSERT INTO tbl_users (str_userid, str_name)
VALUES ('007','�䳢');
INSERT INTO tbl_users (str_userid, str_name)
VALUES ('008','�ź���');
INSERT INTO tbl_users (str_userid, str_name)
VALUES ('009','�η��');
INSERT INTO tbl_users (str_userid, str_name)
VALUES ('010','������');

SELECT * FROM tbl_users ;
-- SELECT�� �����Ҷ� Ư���� Į���鸸 �����ؼ� ������ �Ҷ�
-- Į������Ʈ : Projection
SELECT str_name, str_tel FROM tbl_users ;

SELECT * FROM tbl_users WHERE str_addr = '���ֽ�' ;
SELECT * FROM tbl_users WHERE str_name = 'ȫ�浿' AND str_addr = '���ֱ�����' ;

SELECT * FROM tbl_users WHERE str_userid >= '003' AND str_userid <= '006' ;

SELECT * FROM tbl_users WHERE str_userid BETWEEN '003' AND '006' ;
 
-- ����Լ�
-- ���� tbl_users�� ����� ������ ������ ��� ? 
-- SUM, COUNT, AVG, MIN, MAX
-- Į���� ���δ� �Լ�
SELECT COUNT(*) FROM tbl_users;
SELECT MIN(str_userid) FROM tbl_users;
SELECT MAX(str_userid) FROM tbl_users;
SELECT COUNT(*) AS ����,
    MIN(str_userid) AS ������,
    MAX(str_userid) AS ū��
FROM tbl_users;