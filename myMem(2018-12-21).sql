-- ����� myMem �Դϴ�.

-- � ������ �����ϱⰡ �������� ������
-- �׳� ��� ������ �����ؼ�(10��, 100�� ���) ��ȸ�ϰ��� �Ҷ�
-- ����Ŭ ���� SQL Ű�����߿�
-- Į�������� ROWNUM �̶�� Į���� �ִ�.
--      �� Į���� ����� �������� ROW������ �������� ǥ���ϴ� ����Ŭ DUMMY Į��
--      ROWNUMĮ���� �̿��ϸ� ������ ����Ʈ�߿��� ��� ���������� ��ȸ�� �Ҽ� �ִ�.
SELECT ROWNUM, IO_DATE, IO_CNAME
FROM TBL_IOLIST
WHERE ROWNUM <= 100;

-- 10��°���� 20��°���� ������ ��ȸ
SELECT ROWNUM, IO_DATE, IO_CNAME
FROM TBL_IOLIST
WHERE ROWNUM BETWEEN 1 AND 100;

-- MYSQL
-- SELECT * FROM TBL_IOLIST LIMIT 10;

SELECT * FROM TBL_IOLIST
WHERE ROWNUM < 10;

-- IOLIST�κ��� ��ǰ������ �и�
-- 1. ��ǰ������ GROUPING �Ͽ� ���� ����Ʈ ��ȸ
-- 2. ������ ����
-- 3. CODE�� �ο�
-- 4. ���̺� ����
-- 5. ����Ʈ
-- 6. IOLIST�� PCODEĮ�� ����
-- 7. ��ǰ���� ���̺��� IOLIST�� DCODEĮ���� UPDATE

SELECT IO_CNAME FROM TBL_IOLIST
GROUP BY IO_CNAME -- ��ǰ�� �ߺ����� �Ⱥ������� GROUP BY Ű���� ���
ORDER BY IO_CNAME;

SELECT IO_CNAME, IO_INOUT, IO_PRICE
FROM TBL_IOLIST;

-- ���� ��ȸ�� �����Ϳ��� IO_INOUT�� '����' �̸� IO_PRICE�� '���Դܰ�' �� ���̰�
-- '����' �Ƹ� '����ܰ�'�� ������ ������ �ȴ�.]
-- �׷��� IO_INOUT �� ���� �ܰ��� �ٸ��� ǥ�� �� ����
SELECT IO_CNAME,
    AVG(DECODE(IO_INOUT, '����', IO_PRICE)) ���Դܰ�,
    AVG(DECODE(IO_INOUT, '����', IO_PRICE)) ����ܰ�
FROM TBL_IOLIST
GROUP BY IO_CNAME
ORDER BY IO_CNAME;

CREATE TABLE TBL_PRODUCT (
    P_CODE	CHAR(9)		PRIMARY KEY,
    P_NAME	nVARCHAR2(50)	NOT NULL,	
    P_IPRICE	NUMBER		,
    P_OPRICE	NUMBER		
);

SELECT COUNT(*) FROM TBL_PRODUCT;

ALTER TABLE TBL_IOLIST ADD IO_PCODE2 CHAR(9);

UPDATE TBL_IOLIST I
SET IO_PCODE2
    = (SELECT P.P_CODE FROM TBL_PRODUCT P
       WHERE P.P_NAME = I.IO_CNAME);

-- ������Ʈ�Ŀ� ����
-- JOIN�� �̿��ؼ� ����
SELECT I.IO_CNAME, I.IO_PCODE2, P.P_CODE, p.p_name 
FROM TBL_IOLIST I
    LEFT JOIN TBL_PRODUCT P
        ON i.io_pcode2 = p.p_code
ORDER BY io_pcode2;

-- ��ǰ�� Į���� ����
ALTER TABLE TBL_IOLIST DROP COLUMN IO_CNAME;
DESC TBL_IOLIST;

SELECT * FROM TBL_IOLIST
WHERE ROWNUM < 10;

-- TBL_IOLIST�� ��2����ȭ ������ �Ϸ�Ǿ���.
-- ���Ը������ ���鼭 ��ǰ��� �ŷ�ó���� ���� Ȯ���ϰ� �ʹ�.

-- 1.���Ը������ ��ǰ�� ���� ����
SELECT I.IO_DATE, i.io_pcode2, p.p_name, i.io_inout, i.io_price, i.io_quan
FROM TBL_IOLIST I
    LEFT JOIN TBL_PRODUCT P
        ON I.IO_PCODE2 = P.P_CODE;

-- 2.���Ը������ �ŷ�ó������ ���� ����
SELECT I.IO_DATE, i.io_dcode, d.d_name, i.io_pcode2, i.io_inout, i.io_price, i.io_quan
FROM TBL_IOLIST I
    LEFT JOIN TBL_DEPT D
        ON I.IO_DCODE = d.d_code;
        
-- 3.���Ը������ ���鼭 ��ǰ����, �ŷ�ó������ ���̺���
SELECT I.IO_DATE, i.io_pcode2,d.d_name, p.p_name, i.io_inout, i.io_price, i.io_quan, i.io_price * i.io_quan AS �հ�
FROM TBL_IOLIST I
    LEFT JOIN TBL_PRODUCT P -- ��ǰ������ JOIN
        ON I.IO_PCODE2 = p.p_code
        
    LEFT JOIN TBL_DEPT D -- �ŷ�ó������ JOIN
        ON i.io_dcode = d.d_code;
        
-- ���Ը������ ��ǰ����, �ŷ�ó������ JOIN�ؼ� ���µ� �ʹ� �����ϴ�.
-- �ٵ� ���� ����Ұ� ����.
-- �̷��� SQL�� VIEW�� ������ �ξ��
CREATE VIEW IO_DEPT_PRODUCT_VIEW
AS
SELECT I.IO_DATE, i.io_pcode2,d.d_name, p.p_name, i.io_inout, i.io_price, i.io_quan, i.io_price * i.io_quan AS �հ�
FROM TBL_IOLIST I
    LEFT JOIN TBL_PRODUCT P -- ��ǰ������ JOIN
        ON I.IO_PCODE2 = p.p_code
        
    LEFT JOIN TBL_DEPT D -- �ŷ�ó������ JOIN
        ON i.io_dcode = d.d_code;

SELECT * FROM io_dept_product_view;        

-- �ŷ����ڰ� 2018-03-01 ~ 2018-03-31 �̸� ������ �׸��� ������ �� ���� �հ�ݾ��� ��ȸ
SELECT IO_INOUT, COUNT(*) AS ����, SUM(IO_TOTAL) AS �հ�
FROM TBL_IOLIST
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31' AND IO_INOUT = '����'
GROUP BY IO_INOUT;

    

       