-- mybatis 접속화면

CREATE TABLE tbl_menu (
    MENU_ID CHAR(10) PRIMARY KEY,
    MENU_P_ID CHAR(10) DEFAULT NULL,
    MENU_TITLE nVARCHAR2(255),
    MENU_HREF nVARCHAR2(255)

);

SELECT * FROM tbl_menu;
commit;

DESC tbl_memo;
DESC tbl_member;

SELECT * FROM tbl_member;
