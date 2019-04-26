-- 여기는 관리자 입니다.

CREATE USER myuser IDENTIFIED BY 1234;
GRANT DBA TO myuser ;
-- 아직 tablespace를 생성하기전에
-- 사용자를 먼저 등록하다 보니
-- DEFAULT TABLESPACE를 지정하지 않았다.
-- 이럴경우 DEFAULT TB는 SYSTEM 설정값으로 지정되는데

CREATE TABLESPACE myTBL
DATAFILE 'D:/bizwork/ordata/myTBL.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 1M;


-- myuser 사용자에게 TABLESPACE를 적용하지 않았다.
-- 이제 새로운 tablespace를 생성했으므로
-- myuser에세 default tablespace를 지정하겠다.
ALTER USER myuser DEFAULT TABLESPACE myTBL; -- 어떤 테이블도 생성하지 않은상태에서 해야함.