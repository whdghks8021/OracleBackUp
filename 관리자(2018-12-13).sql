-- ����� ������ �Դϴ�.

CREATE USER myuser IDENTIFIED BY 1234;
GRANT DBA TO myuser ;
-- ���� tablespace�� �����ϱ�����
-- ����ڸ� ���� ����ϴ� ����
-- DEFAULT TABLESPACE�� �������� �ʾҴ�.
-- �̷���� DEFAULT TB�� SYSTEM ���������� �����Ǵµ�

CREATE TABLESPACE myTBL
DATAFILE 'D:/bizwork/ordata/myTBL.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 1M;


-- myuser ����ڿ��� TABLESPACE�� �������� �ʾҴ�.
-- ���� ���ο� tablespace�� ���������Ƿ�
-- myuser���� default tablespace�� �����ϰڴ�.
ALTER USER myuser DEFAULT TABLESPACE myTBL; -- � ���̺� �������� �������¿��� �ؾ���.