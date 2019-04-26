-- mybts

-- 파일업로드를 하기위한 파일정보를 저장할 테이블
CREATE TABLE tbl_files (
    id NUMBER PRIMARY KEY,
    parent_id NUMBER NOT NULL,
    file_name nVARCHAR2(125),
    save_file_name nVARCHAR2(125)
);
DROP TABLE tbl_files;
CREATE SEQUENCE SEQ_FILE
START WITH 1
INCREMENT BY 1;

-- tbl_files 테이블과 tbl_memo 테이블을 서로 Relation
ALTER TABLE tbl_files
ADD CONSTRAINT memo_files FOREIGN KEY (parent_id)
REFERENCES tbl_memo(id)
ON DELETE CASCADE;
 