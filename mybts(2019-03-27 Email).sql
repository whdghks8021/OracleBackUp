-- mybts email

CREATE TABLE tbl_emails (
    id NUMBER PRIMARY KEY,
    from_email nVARCHAR2(30) NOT NULL,
    to_email nVARCHAR2(30) NOT NULL,
    s_date nVARCHAR2(10),
    s_time nVARCHAR2(10),
    s_subject nVARCHAR2(125),
    s_content nVARCHAR2(2000),
    s_file1 nVARCHAR2(125),
    s_file2 nVARCHAR2(125)
);

SELECT * FROM tbl_emails;
SELECT * FROM tbl_board WHERE b_image = '';
DELETE FROM tbl_emails;
commit;