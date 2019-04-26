-- 여기는 관리자 화면입니다

-- TableSpace 생성
CREATE TABLESPACE gradeTS
DATAFILE 'd:/bizwork/ordata/gradeTS.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 100K;

-- 사용자 등록
CREATE USER gradeUser IDENTIFIED BY 1234
DEFAULT TABLESPACE gradeTS;

-- 사용자 권한 부여
GRANT DBA TO gradeUser;