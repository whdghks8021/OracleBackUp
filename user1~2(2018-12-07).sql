-- ����� user1���� ������ ȭ���Դϴ�.
-- �̸�(o_name)
-- ��ȭ��ȣ(0_tel)
-- �ּ�(o_addr)
-- ȸ��(o_comp) 
-- �μ�(o_dept) Į���� ����
-- tbl_office ���̺��� �����Ͻÿ�

CREATE TABLE tbl_office(
     id NUMBER PRIMARY KEY,
     o_name CHAR(10) NOT NULL,
     o_tel CHAR(20),
     o_addr nVARCHAR2(100),
     o_comp nVARCHAR2(100),
     o_dept nVARCHAR2(100)
    
);

SELECT * FROM tbl_office;