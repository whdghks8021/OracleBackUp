-- ����� myMem �Դϴ�.

-- ����Ŭ���� $ ǥ�ð� �ִ� table ���� system dictionary �̶�� �Ѵ�.
-- sys dic ��� ��Ī�ϸ� �� table�� �ý����� ������ ��� �ִ� �߿��� table��
-- ���� sys dic ���� �����ڷ� ���������� Ȯ�� �Ҽ� �ִ� table�ε�
-- myMem ����ڿ��� dba������ �ο��߱� ������, Ȯ���� ���� �ϴ�.
SELECT * FROM V$datafile;

SELECT * FROM dba_tablespaces;
SELECT * FROM dba_data_files;
SELECT * FROM v$controlfile;
SELECT USERNAME, EXPIRY_DATE, DEFAULT_TABLESPACE, PROFILE, AUTHENTICATION_TYPE FROM dba_users;
SELECT * FROM dba_sys_privs;
SELECT * FROM dba_tab_privs;