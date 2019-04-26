-- ����� ������ ȭ���Դϴ�.
-- ���ο� ����� ���
-- �ϴ� ���� ����� user2 ����
DROP USER user2;
DROP USER user2 CASCADE ; -- user2�� Ȱ���ߴ� ��� ������ ����

-- �ٽ� user2�� ����
CREATE USER user2 IDENTIFIED BY 1234
DEFAULT TABLESPACE myTs;

-- user2���� CRUD������ �ο�
-- CRUD������ �ο��Ϸ���, ���� table�� �����Ǿ� �־�� �Ѵ�.

-- 1. ������ ���� �ο�
GRANT SELECT ON tbl_test TO user2;
GRANT INSERT ON tbl_test TO user2;

-- 2. CRUD �ϰ� ���� �ο�
GRANT SELECT , INSERT, UPDATE, DELETE ON tbl_test TO user2;

-- ���� ������� user2�� �����ϰ�, CRUD ������ �ο�
-- ���� ���� ������ �ο����� �ʾҴ�.
-- CONNECT ���ӱ����� DB ������ ���� ���� ������ �ſ� �ٸ���.
-- 11gEX������ ����� ���� ������ �ȴ�.
-- ���� CONNECT ������ �Ϲ����� ��� ������� �ʰ�
GRANT CONNECT TO user2 ;

-- ���� ������ �ο��ϱ� ���ؼ��� CREATE SESSION ������ �ο��Ѵ�.
GRANT CREATE SESSION TO user2;
REVOKE CREATE TABLE FROM user2;
GRANT CREATE TABLE TO user2;

-- user2�� ����� TABLE SPACE�� �ϳ� ����
CREATE TABLESPACE myTs -- myTs��� �̸����� DB���� ���� ����
DATAFILE 'D:/bizwork/ordata/myts.dbf' -- ���� ������ġ�� ����
SIZE 100M AUTOEXTEND ON NEXT 1M -- ���� Ȯ���뷮��, �ڵ�Ȯ�� �뷮
MAXSIZE UNLIMITED ; -- �ִ�뷮 ���Ѿ���.

-- TABLESPACE�� �����ϰ�, ��� ������ ����
DROP TABLESPACE myTs 
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

DEFAULT TABLESPACE 

