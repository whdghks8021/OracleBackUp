-- ����� ������ ȭ���Դϴ�

-- TableSpace ����
CREATE TABLESPACE gradeTS
DATAFILE 'd:/bizwork/ordata/gradeTS.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 100K;

-- ����� ���
CREATE USER gradeUser IDENTIFIED BY 1234
DEFAULT TABLESPACE gradeTS;

-- ����� ���� �ο�
GRANT DBA TO gradeUser;