-- ����� �������Դϴ�.

-- �ڹ� ���ø����̼ǿ��� ����� tablespace�� ����ڸ� ����

CREATE TABLESPACE bbsTS
DATAFILE 'D:/bizwork/ordata/BBSTS.DBF'
SIZE 100M
AUTOEXTEND ON NEXT 100K;

CREATE USER bbsUSER IDENTIFIED BY 1234
DEFAULT TABLESPACE bbsTS;

GRANT DBA TO bbsUSER;
