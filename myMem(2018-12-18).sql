-- 여기는 myMem 입니다.

-- 오라클에서 $ 표시가 있는 table 들을 system dictionary 이라고 한다.
-- sys dic 라고 약칭하며 이 table은 시스템의 정보를 담고 있는 중요한 table들
-- 원래 sys dic 들은 관리자로 접속했을때 확인 할수 있는 table인데
-- myMem 사용자에게 dba권한을 부여했기 때문에, 확인이 가능 하다.
SELECT * FROM V$datafile;

SELECT * FROM dba_tablespaces;
SELECT * FROM dba_data_files;
SELECT * FROM v$controlfile;
SELECT USERNAME, EXPIRY_DATE, DEFAULT_TABLESPACE, PROFILE, AUTHENTICATION_TYPE FROM dba_users;
SELECT * FROM dba_sys_privs;
SELECT * FROM dba_tab_privs;