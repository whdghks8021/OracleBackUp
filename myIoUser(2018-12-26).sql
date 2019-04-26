-- ����� myIoUser �Դϴ�.

CREATE TABLE tbl_iolist (
    io_id	CHAR(3)		PRIMARY KEY,
    io_date	CHAR(10)	NOT NULL	,
    io_cname	nVARCHAR2(50)	NOT NULL	,
    io_dname	nVARCHAR2(50)	NOT NULL	,
    io_dceo	nVARCHAR2(50)		,
    io_inout	nVARCHAR2(2)	NOT NULL	,
    io_quan	NUMBER		,
    io_price	NUMBER	,	
    io_total	NUMBER		
);

SELECT COUNT(*) FROM tbl_iolist;
SELECT * FROM tbl_iolist;

SELECT io_dname, io_dceo FROM tbl_iolist
GROUP BY io_dname, io_dceo;

CREATE TABLE tbl_dept (
    d_code	CHAR(5)		PRIMARY KEY,
    d_name	nVARCHAR2(50)	NOT NULL,	
    d_ceo	nVARCHAR2(50)	NOT NULL	
);
ALTER TABLE tbl_iolist ADD io_dcode CHAR(5) ;

SELECT I.io_dname, I.io_dceo, d.d_code, d.d_name FROM tbl_iolist I, tbl_dept D
WHERE I.io_dname = d.d_name AND i.io_dceo = d.d_ceo ;

SELECT I.io_dname, I.io_dceo, d.d_code, d.d_name FROM tbl_iolist I
    LEFT JOIN tbl_dept D
        ON d.d_name = i.io_dname AND i.io_dceo = d.d_ceo;
-- �� SQL������ Ȯ���� LIST�� ��� ��ǰ���Ը��� ����� ��Ÿ����
-- �߸��� �����Ͱ� �ִ��� Ȯ���ϱ� ��ƴ�.

-- ���� ���� SQL���� ����������, iolist���� �����Ͱ� �ִµ�
-- dept���� �����Ͱ� ���� ��쿡 d.d_name �� d.d_ceo�� null ������ ��Ÿ �� ���̴�.
-- �� ������ �̿��ؼ� d.d_name �̳� d.d_ceo�� null �ΰ͸�
-- ã�� ���� �� ���� Ȯ���� �����ϴ�.

SELECT I.io_dname, D.d_name, d.d_ceo, i.io_dceo FROM tbl_iolist I
    LEFT JOIN tbl_dept D
        ON d.d_name = i.io_dname AND i.io_dceo = d.d_ceo
WHERE D.d_name IS NULL OR D.d_ceo IS NULL;
-- ���� SQL�� ���������� LIST�� �ϳ��� ����� ����������
-- �ŷ�ó���� TABLE�� �ϼ� �� ���̴�.

-- ����Į���� 0�� ���� 0�̶�� ���� INSERT, UPDATE ���� �� ��
SELECT io_price
FROM tbl_iolist
WHERE io_price = 0;
-- ����Į���� NULL�� ���� ó������ �ƿ� ���� INSERT���� ���� ��
SELECT io_price
FROM tbl_iolist
WHERE io_price IS NULL ;

SELECT I.io_dname, I.io_dceo,
    (SELECT D.d_code FROM tbl_dept D
     WHERE I.io_dname = D.d_name AND
           I.io_dceo = D.d_ceo) 
FROM tbl_ioList I
GROUP BY i.io_dname, i.io_dceo;

UPDATE tbl_iolist I
SET io_dcode = (SELECT D.d_code FROM tbl_dept D
     WHERE I.io_dname = D.d_name AND
           I.io_dceo = D.d_ceo) ;

SELECT io_dcode , io_dname , io_dceo
FROM tbl_iolist
ORDER BY io_dcode;

