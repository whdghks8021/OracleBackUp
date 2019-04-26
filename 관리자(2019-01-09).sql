-- ����� ������ ȭ���Դϴ�.

-- TABLE SPACE ����
-- �̸� : myBTs
-- DataFile : d:/bizwork/ordata/myBTS.dbf
-- ����ũ�� 100M
-- �ڵ����� : 100K

CREATE TABLESPACE myBTS
DATAFILE 'd:/bizwork/ordata/myBTS.dbf'
SIZE 100M AUTOEXTEND ON NEXT 100K;

-- ���ο� ����� ���
-- �̸� : mybts
-- ��й�ȣ : 1234
-- Default TableSpace : myBTs
-- DBA ������ �ο�

CREATE USER mybts IDENTIFIED BY 1234
DEFAULT TABLESPACE myBTs;
GRANT DBA TO mybts ;
