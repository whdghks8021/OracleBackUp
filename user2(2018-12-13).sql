-- ����� user2 �Դϴ�

CREATE TABLE tbl_emploree (
    strEmpno CHAR(3) PRIMARY KEY,
    strName nVARCHAR2(20) NOT NULL,
    strJob nVARCHAR2(20),
    intSal NUMBER(5),
    strDeptNo nVARCHAR2(20)
);

ALTER TABLE tbl_emploree MODIFY intSal NUMBER(10);

INSERT INTO tbl_emploree
VALUES ('001', 'ȫ�浿', '�λ����', 2500000 , '�ѹ���');
INSERT INTO tbl_emploree
VALUES ('002', '�̸���', '�������', 2500000 , '������');
INSERT INTO tbl_emploree
VALUES ('003', '������', '�޿�����', 2500000 , '�ѹ���');
INSERT INTO tbl_emploree
VALUES ('004', '����', '�������', 2500000 , '�����');
INSERT INTO tbl_emploree
VALUES ('005', '�Ӳ���', 'ǰ������', 2500000 , '�����');

UPDATE tbl_emploree 

