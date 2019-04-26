ALTER TABLE tbl_cbt
rename column "id" to "cb_num" ;

CREATE SEQUENCE seq_cbt
START WITH 1
INCREMENT BY 1 
NOMAXVALUE ;

ALTER TABLE tbl_cbt
ADD cb_nanswer4 nVARCHAR2(255) NOT NULL;

DESC tbl_cbt ;

SELECT seq_cbt.nextval FROM DUAL;

DROP SEQUENCE seq_cbt ;

commit ;

INSERT INTO tbl_cbt
VALUES (seq_cbt.nextval, 'dddd', 'dddd', 'aaaa', 'ssss', 'dddd', 'ffff');

SELECT * FROM tbl_cbt;

ALTER TABLE tbl_cbt
RENAME COLUMN CB_NUM TO CB_NUM ;