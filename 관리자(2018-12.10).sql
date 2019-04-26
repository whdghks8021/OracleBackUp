-- ����� ������ ȭ���Դϴ�.

-- ���ο� ����� user2 ����
CREATE USER user2 IDENTIFIED BY 1234;

-- ���� user2 ����ڴ� �ƹ��� ������ ���� ����.
-- �������� user1���� DBA��� ���� ������ �ο��ߴ�.
-- ���� �ǹ������� DBA������ �ƹ����Գ� �Ժη� �ο����� �ʴ´�.
-- �� ������ DBA������ �ְ������ sysdba ���ѿ� ���ϴ�
-- ����� ���� �����̾ �Ժη� �ο��ϸ� ������ ����ų �� �ִ�.

-- �ְ���� 
-- ����Ŭ : sysdba
-- mysql : root
-- mssql : sa
-- etc : administor , root

-- user2 ���� �������� ������ �ο��ϴ� ����� ���� 
-- 1. user2���� CRUD�� ������ �� �ִ� ������ �ο�
-- �ӽ÷� TABLE �� �ϳ� ����
CREATE TABLE tbl_test(
    st_name CHAR(20),
    st_addr nVARCHAR2(125)
);

-- user2���� tbl_test2 ���̺��� ���� ���� �ִ� ������ �ְڴ�.
GRANT SELECT ON tbl_test TO user2;
GRANT INSERT ON tbl_test TO user2; -- INSERT(�߰�) ���� �ο�

GRANT SELECT, INSERT, UPDATE, DELETE on tbl_test TO user2;

-- Ư������ڿ� �ο��� ������ ��ȸ�ϴ� PL/SQL(����Ŭ SQL)
SELECT * FROM USER_TAB_PRIVS_MADE
WHERE GRANTEE = 'USER2' ; -- �����ID�� �빮�ڷ�