-- ����� myMem �Դϴ�.

-- ���̺� ����
DROP TABLE tbl_iolist;

-- ������ ���Ը��� ������ ����Ŭ�� ����Ʈ �ϰ�
-- ���Ը���DB�κ��� ��2����ȭ�� �����ؼ� �ŷ�ó ������ �и�

CREATE TABLE tbl_iolist (
    io_id	NUMBER		PRIMARY KEY,
    io_date	CHAR(10)	NOT NULL,	
    io_cname	nVARCHAR2(50)	NOT NULL	,
    io_dname	nVARCHAR2(50)	NOT NULL	,
    io_dceo	nVARCHAR2(50)		,
    io_inout	nVARCHAR2(5)	NOT NULL	,
    io_quan	NUMBER		,
    io_price	NUMBER	,	
    io_total	NUMBER		
);
-- ������ ����Ʈ Ȯ��
SELECT COUNT(*) FROM tbl_iolist;

SELECT io_inout, COUNT(*) FROM tbl_iolist
GROUP BY io_inout;

-- ���Ը��� �������� �ŷ�ó������ �ٸ� table�� �и��ؼ� ��2����ȭ������ ����
-- 1. ���Ը��� �������� �ŷ�ó������ ����
-- ��. �ŷ�ó��� ��ǥ���� �׷����� ���� ����Ʈ�� ����
SELECT io_dname, io_dceo FROM tbl_iolist
GROUP BY io_dname, io_dceo
ORDER BY IO_DNAME;

-- ��. �������� ������ �ŷ�ó������ ����Ʈ �ϱ����ؼ� TABLE ����
CREATE TABLE TBL_DEPT (
    D_CODE	CHAR(6)		PRIMARY KEY,
    D_NAME	nVARCHAR2(50)	NOT NULL,	
    D_CEO	nVARCHAR2(50)		
);

-- ��. �����κ��� �ŷ�ó������ ����Ʈ�� Ȯ��
SELECT COUNT(*) FROM TBL_DEPT;

-- 2. TBL_IOLIST�� TBL_DEPT�� ������ Į���� �߰��ϰ�
-- TBL_DEPT�� ���� �����۾��� ����

-- ��. Į���߰�
ALTER TABLE TBL_IOLIST ADD IO_DCODE CHAR(6);
-- ��. �߰��� Į�� Ȯ��
DESC TBL_IOLIST;

-- SUB QUERY
-- DML���ο� �ٸ� SELECT���� �ִ� SQL�� ���Ѵ�.
SELECT IO_DNAME, IO_DCEO, IO_DCODE
FROM TBL_IOLIST ;

-- ���� SQL�� SUB QUERY�� �߰��ؼ�
-- DEPT ���̺�κ��� IO_DCODE�� ��ȸ�� ����
SELECT IO_DNAME, IO_DCEO,
    (SELECT D_CODE FROM TBL_DEPT D
        WHERE D.D_NAME = TBL_IOLIST.IO_DNAME AND
              D.D_CEO = TBL_IOLIST.IO_DCEO)
FROM TBL_IOLIST;

-- SUB QUERY�� ����ؼ� TBL_DEPT�� ����
-- TBL_IOLIST�� �ŷ�ó �ڵ带 ������Ʈ �ϴ� �ڵ�
UPDATE TBL_IOLIST I
SET IO_DCODE
    = (SELECT D_CODE FROM TBL_DEPT D
        WHERE D.D_NAME = I.IO_DNAME AND
              D.D_CEO = I.IO_DCEO);

SELECT IO_DCODE, IO_DNAME, IO_DCEO
FROM TBL_IOLIST 
ORDER BY IO_DCODE;

-- TBL_IOLIST�� IO_DNAME�� IO_DCEO Į���� ����
ALTER TABLE TBL_IOLIST DROP COLUMN IO_DNAME;
ALTER TABLE TBL_IOLIST DROP COLUMN IO_DCEO;
DESC TBL_IOLIST;

-- IOLIST�� DEPT���̺��� JOIN�ؼ� ��ȸ�ϴ� SQL
SELECT I.IO_DATE, I.IO_CNAME, I.IO_DCODE, D.D_NAME, D.D_CEO
FROM TBL_IOLIST I, TBL_DEPT D
WHERE I.IO_DCODE = D.D_CODE;
-- �� JOIN�� EQ JOIN �̶�� �ϸ�,
-- TBL_IOLIST ���̺��� TBL_DEPT ���̺� ���� IO_DCODE��
-- ���� �������� �ʴ´ٴ� ������ ������ ������ ����� �����ش�.
-- ���� ��Ȳ������ TBL_DEPT�� ���� �ڵ尡 TBL_IOLIST�� ���� �� �� �ִ�.

-- �׽�Ʈ �����͸� ����� ���ؼ�
-- ���� �������� IO_DCODE�� ���� �� ����
SELECT * FROM TBL_IOLIST
WHERE IO_DCODE = 'D00100';
UPDATE TBL_IOLIST
SET IO_DCODE = 'D00500'
WHERE IO_ID = 306 ;
SELECT I.IO_ID,I.IO_DATE, I.IO_CNAME, I.IO_DCODE, D.D_NAME, D.D_CEO
FROM TBL_IOLIST I, TBL_DEPT D
WHERE I.IO_DCODE = D.D_CODE
    AND IO_ID BETWEEN 300 AND 310
ORDER BY I.IO_ID ;

-- JOIN ���� ���� ���·� ���Ը��� ���о��� �հ�ݾ��� ���
SELECT COUNT(*), SUM(IO_TOTAL)
FROM TBL_IOLIST WHERE IO_ID BETWEEN 300 AND 310;

-- EQ JOIN���� �հ�ݾ� ���
-- ���� �հ� �ݾװ� ������ ���̰� ����.
SELECT COUNT(*), SUM(IO_TOTAL)
FROM TBL_IOLIST I, TBL_DEPT D WHERE I.IO_DCODE = D.D_CODE AND IO_ID BETWEEN 300 AND 310;

-- LEFT JOIN���� ���Ը��ⱸ�о��� �հ�ݾ��� ���
SELECT COUNT(*), SUM(IO_TOTAL)
FROM TBL_IOLIST I 
    LEFT JOIN TBL_DEPT D
        ON I.IO_DCODE = D.D_CODE
WHERE IO_ID BETWEEN 300 AND 310;
-- LEFT JOIN�� 
--      ���� TABLE�� �����ʹ� ��� �����ְ�
--      ���� TABLE�� Ű(IO_DCODE)�� ��ġ�ϴ� �����Ͱ�
--      ������ TABLE�� ������ �����ְ�, ������ NULL ǥ���϶�
-- ������ TABLE�� ��ġ�ϴ� �����Ͱ� ��� ���� �������� �Ϻΰ� �����Ǿ�
--      ��谡 �߸��Ǵ� ��츦 Ȯ���ϰų�
--      ���� ��Ȳ���� ����� ������ JOIN�̴�.
SELECT I.IO_DCODE, D.D_NAME, D.D_CEO
FROM TBL_IOLIST I
    LEFT JOIN TBL_DEPT D
        ON I.IO_DCODE = D.D_CODE
WHERE I.IO_ID BETWEEN 300 AND 310;

-- IOLIST�κ��� ��ǰ������ �и�
-- 1. ��ǰ������ GROUPING �Ͽ� ���� ����Ʈ ��ȸ
-- 2. ������ ����
-- 3. CODE�� �ο�
-- 4. ���̺� ����
-- 5. ����Ʈ
-- 6. IOLIST�� PCODEĮ�� ����
-- 7. ��ǰ���� ���̺��� IOLIST�� DCODEĮ���� UPDATE

SELECT DISTINCT IO_CNAME FROM TBL_IOLIST -- ��ǰ�� �ߺ����� �Ⱥ������� DISTINCT Ű���� ���
ORDER BY IO_CNAME;

CREATE TABLE TBL_CNAME (
    C_PCODE	CHAR(6)		PRIMARY KEY,
    C_NAME	nVARCHAR2(50)	NOT NULL	
);
SELECT COUNT(*) FROM TBL_CNAME;

ALTER TABLE TBL_IOLIST ADD IO_PCODE CHAR(6);

UPDATE TBL_IOLIST I
SET IO_PCODE
    = (SELECT C_PCODE FROM TBL_CNAME C
       WHERE C.C_NAME = I.IO_CNAME);
       
SELECT IO_CNAME, IO_PCODE FROM TBL_IOLIST
ORDER BY io_pcode;