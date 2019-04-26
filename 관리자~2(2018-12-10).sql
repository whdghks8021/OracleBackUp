-- ����� ������ ȭ���Դϴ�.

-- ����� ����
CREATE USER user2 IDENTIFIED BY 1234
DEFAULT TABLESPACE myTs;

-- ���� ���� �ο�
GRANT CREATE SESSION TO user2;
-- TABLESPACE ��� ����
GRANT RESOURCE TO user2;
-- TABLE �����Ҽ��ִ� ���� �ο�
GRANT CREATE TABLE TO user2;

-- ����������� TABLESPACE�� �ٽ� ����
-- �⺻����� ������ �����ϸ�
-- ����ڴ� default tablespace�� 
--         SYSTEM(����Ŭ �⺻) tablespace�� �����Ѵ�.
-- �� SYSTEM ts�� DBA ������ ���� ����ڸ� ������ �����ؼ�
-- �⺻������ CREATE TABLE ���� ���� �����δ� TABLE�� �����ϱⰡ ��ƴ�.
-- �׷��� ������ ����ڿ� TABLESPACE�� �����ϰ�
-- �̹� ������ ����ڸ� ���� ���� TABLESPACE�� ������ �ִ°��� ����.
-- ��Ģ�� TS�� ���� �����ϰ�, ����ڸ� �����ؼ�
-- DEFAULT TABLE SPACE �� �����ϴ� ���� ������
-- ����ڸ� ���� ����ϰ� �Ǹ� ���߿� �ٽ� ������ �ؼ�
-- ����� TS�� ���� �� �� �ִ�.
-- DCL ��ɾ�� DREATE DROP �� �Բ� ����Ҽ� �ִ�
-- ALTER ����� �̿��ؼ� ������ �����Ѵ�.
ALTER USER user2 DEFAULT TABLESPACE myts;

-- ��й�ȣ ����
ALTER USER user2 IDENTIFIED BY 1111 ;