-- ����� mybts ����ȭ���Դϴ�.

-- �������� ������ ���� TABLE�� ����
CREATE TABLE tbl_books (
    id NUMBER PRIMARY KEY,
    tb_name nVARCHAR2(50) NOT NULL,
    tb_comp nVARCHAR2(50),
    tb_auth nVARCHAR2(50),
    tb_price NUMBER
);

CREATE SEQUENCE SEQ_BOOKS
START WITH 1
INCREMENT BY 1 ;

INSERT INTO tbl_books
VALUES (SEQ_BOOKS.NEXTVAL, '�����ڹ�', '�������̵��', '������', 30000 );
INSERT INTO tbl_books
VALUES (SEQ_BOOKS.NEXTVAL, '����� ��/��', '��������', '�ڼ���', 20000 );

commit;
SELECT * FROM tbl_books;

