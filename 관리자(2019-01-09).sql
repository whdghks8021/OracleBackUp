-- 여기는 관리자 화면입니다.

-- TABLE SPACE 생성
-- 이름 : myBTs
-- DataFile : d:/bizwork/ordata/myBTS.dbf
-- 시작크기 100M
-- 자동증가 : 100K

CREATE TABLESPACE myBTS
DATAFILE 'd:/bizwork/ordata/myBTS.dbf'
SIZE 100M AUTOEXTEND ON NEXT 100K;

-- 새로운 사용자 등록
-- 이름 : mybts
-- 비밀번호 : 1234
-- Default TableSpace : myBTs
-- DBA 권한을 부여

CREATE USER mybts IDENTIFIED BY 1234
DEFAULT TABLESPACE myBTs;
GRANT DBA TO mybts ;
