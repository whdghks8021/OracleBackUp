-- 여기는 myQuiz 입니다.

CREATE TABLE tbl_cbt (
    cb_num NUMBER PRIMARY KEY,
    cb_problem nVARCHAR2(255) NOT NULL,
    cb_answer nVARCHAR2(255) NOT NULL,
    cb_nanswer1 nVARCHAR2(255) NOT NULL,
    cb_nanswer2 nVARCHAR2(255) NOT NULL,
    cb_nanswer3 nVARCHAR2(255) NOT NULL,
    cb_nanswer4 nVARCHAR2(255) NOT NULL
);

DROP TABLE tbl_cbt ;

SELECT * FROM tbl_cbt ;