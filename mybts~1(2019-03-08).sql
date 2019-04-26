-- mybts

CREATE TABLE tbl_user(
    userid CHAR(5) PRIMARY KEY,
    username nVARCHAR2(20),
    tel nVARCHAR2(20)
    
);
DROP TABLE tbl_board;

CREATE TABLE tbl_board(
    id NUMBER PRIMARY KEY,
    b_userid nVARCHAR2(20) NOT NULL,
    b_date nVARCHAR2(20),
    b_time VARCHAR2(10),
    b_subject nVARCHAR2(50),
    b_content nVARCHAR2(1000),
    b_hit NUMBER
);
DELETE FROM tbl_board WHERE id BETWEEN 2000 AND 20000;
SELECT COUNT(*) FROM tbl_board;
UPDATE tbl_board SET b_hit = 0 WHERE b_hit IS null;

ALTER TABLE tbl_board ADD b_image nVARCHAR2(250) ;


commit;
CREATE SEQUENCE SEQ_MEMO
START WITH 1
INCREMENT BY 1;

DESC tbl_memo;
DESC tbl_member;
SELECT * FROM tbl_member;
SELECT * FROM tbl_memo;

CREATE TABLE tbl_hobby(

    id NUMBER PRIMARY KEY,
    userid CHAR(5),
    hobby nVARCHAR2(20)
    
);

-- tbl_user�� tbl_hobby�� ����
-- tbl_user table���� userid�� �ߺ����� ������
-- �Ѱ��� �����ϴ� ���̴�.

-- tbl_hobby table���� userid�� �������� �����Ͱ� ������ ������
-- userid Į���� �������� tbl_user�� 1:���� ���踦 ���´�.

-- tbl_user�� tbl_hobby�� 1:�� ���踦 FK�� �����Ѵ�.

-- FK�� �����Ҷ��� ���� ��ġ�� �ִ� table�� �������� ALTER�� �����Ѵ�
ALTER TABLE tbl_hobby add FOREIGN KEY(userid) -- ���� ��ġ
REFERENCES tbl_user(userid) -- 1�� ��ġ
ON DELETE CASCADE ; -- �������� (USER ���̺��� userid�� �����ϸ� HOBBY ���̺��� userid�� ����)

-- FK ����
-- USER�� userid�� ������ HOBBY���� 0�� �̻��� userid�� ���� �� �ִ�.
-- USER�� userid�� ������ HOBBY���� ���� ���� �� ����. 