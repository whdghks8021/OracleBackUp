-- ����� ������ ȭ���Դϴ�.

-- 1. tablespalce ����
CREATE TABLESPACE myts1
DATAFILE 'D:/bizwork/ordata/myts1.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 1M;

-- 2. ���ο� ����� ���
CREATE USER user3 IDENTIFIED BY 1234
DEFAULT TABLESPACE myts1;

-- 3. ����� ����(login) ���� �ο�
GRANT CREATE SESSION TO user3;

-- 4. tablespace ������ �ο�
GRANT RESOURCE TO user3;

-- 5. CREATE TABLE ���� �ο�
GRANT CREATE TABLE TO user3;

-- 6. ����� TABLE�� �����ϰ�
-- 7. CRUD ���� �ο�
GRANT SELECT, INSERT, UPDATE, DELETE TO [table] user3;

-- 4,5,6,7�� ��Ÿ ������ �ο��ϴ� �������
-- TESTȯ�濡����
GRANT DBA TO user3;