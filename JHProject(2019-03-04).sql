-- mybts JHProject

CREATE SEQUENCE commu_seq
START WITH 2
INCREMENT BY 1 MAXVALUE 99999 CYCLE;

DELETE FROM tbl_place ;
ALTER TABLE tbl_place MODIFY p_map nVARCHAR2(2000);
DESC tbl_place;
CREATE TABLE tbl_place (
    P_NUM NUMBER(5) PRIMARY KEY,
    P_NAME nVARCHAR2(30) NOT NULL,
    P_IMAGE nVARCHAR2(255) NOT NULL,
    P_IMAGE2 nVARCHAR2(255) NOT NULL,
    P_MAP nVARCHAR2(255),
    P_STAR nVARCHAR2(5),
    P_CITY nVARCHAR2(10),
    P_ADDR nVARCHAR2(30),
    P_TEL nVARCHAR2(30),
    P_CATE nVARCHAR2(10)

);
SELECT * FROM tbl_place ;
SELECT * FROM tbl_place WHERE p_city LIKE '%경기%' ;
UPDATE tbl_place SET p_star = '70';
INSERT INTO tbl_place 
VALUES (1,'테스트','images/image_place/Japanese.jpg','images/image_place/Japanese2.jpg','https://map.naver.com/?elng=7fd79dbb4f8aceb19dee74a5541afe35&eelat=bab5d6fcd61613e6b86bf605d0576e62&elat=0e0833afeea0e2f4bac166bd7daa4ed5&eText=%EC%B1%84%EC%84%A0%EB%8B%B9+%EC%9A%A9%EB%B4%89%EC%A0%90&eelng=d989d90d2152a352332a018609125b4e',
        '70%','경기 수원시','권선구 무슨동','010-9142-3123','Park');

CREATE TABLE tbl_commu (
    C_NUM NUMBER(5) PRIMARY KEY,
    C_USERID nVARCHAR2(30) NOT NULL,
    C_TITLE nVARCHAR2(50) NOT NULL,
    C_IMAGE nVARCHAR2(255),
    C_TEXT nVARCHAR2(255),
    C_TIME nVARCHAR2(30)
);
DELETE FROM tbl_commu WHERE c_num = 16 ;

DROP TABLE tbl_commu;

INSERT INTO tbl_commu 
VALUES (1,'test','겨울 강아지 산책','/images/image_community/겨울_강아지_산책_10.jpg',
        '내용입니다','2019-03-06');
        
SELECT * FROM tbl_commu WHERE c_title = '큐트한 내세끼 !!' ;

SELECT * FROM tbl_commu ;
    
CREATE TABLE tbl_jhmember (        
    M_USERID VARCHAR2(30) PRIMARY KEY,  
    M_PASSWORD NVARCHAR2(125) NOT NULL,
    M_NAME     NVARCHAR2(125) NOT NULL,
    M_TEL      NVARCHAR2(20)  ,
    M_ADDR     NVARCHAR2(125)
);
ALTER TABLE tbl_jhmember
ADD (M_ROLE nVARCHAR2(125));

SELECT * FROM tbl_jhmember;

INSERT INTO tbl_jhmember
VALUES ('admin','1234','관리자','010','광주','ADMIN');

commit;