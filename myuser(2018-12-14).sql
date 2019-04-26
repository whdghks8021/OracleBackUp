-- ����� myuser �Դϴ�.
-- ���Ը������(����) ���Ͽ��� DATABASE�� �����͸� �ű��
-- DB��Ģ�� �°� �����ϴ� ����

CREATE TABLE tbl_iolist(
    id	NUMBER	PRIMARY KEY,
    io_date	    CHAR(10) NOT NULL,	
    io_cname	nVARCHAR2(50) NOT NULL,
    io_dname	nVARCHAR2(30) NOT NULL,	
    io_deco	    nVARCHAR2(20),	
    io_inout	nVARCHAR2(5),		
    io_quan	    NUMBER,
    io_price	NUMBER,
    io_total	NUMBER		
);

SELECT * FROM tbl_iolist;
SELECT COUNT(*) FROM tbl_iolist;

DELETE FROM tbl_iolist;

SELECT * FROM tbl_iolist
WHERE io_date BETWEEN '2018-02-01' AND '2018-02-28'
AND io_inout = '����';

SELECT * FROM tbl_iolist
WHERE io_date BETWEEN '2018-02-01' AND '2018-02-28'
ORDER BY io_date ;

SELECT SUM (io_total) AS ����, COUNT(*) AS �Ѱ��� 
FROM tbl_iolist ;

-- ����Լ��� �̿��ؼ� ������ �հ踦 ���ϴµ�
-- �����հ�, �����հ踦 ���� ����ϰ� �ʹ�.
-- 1.���԰� ������ �����ϴ� Į�� : io_inout 
SELECT io_inout, COUNT(*), SUM(io_total)
FROM tbl_iolist
GROUP BY io_inout ;

-- ������ �հ���
-- ���� : ��¥���� ������ �ο��ؼ� ������ �հ� ���
-- 1. ��¥�� �����ϴ� Į�� : io_date
SELECT io_date, COUNT(*), SUM(io_total)
FROM tbl_iolist
GROUP BY io_date
ORDER BY io_date;

-- ���� : ��¥���� ����, �ٽ� ���� ����� �����Ͽ� ������ �հ� ���
-- 1. ��¥�� �����ϴ� Į�� : io_date
-- 2. ���� ������ �����ϴ� Į�� : io_inout
SELECT io_date, io_inout, COUNT(*), SUM(io_total)
FROM tbl_iolist
GROUP BY io_date, io_inout
ORDER BY io_date;

-- ���а� ��¥ ������ �ٲپ ...
SELECT io_inout, io_date, COUNT(*), SUM(io_total)
FROM tbl_iolist
GROUP BY io_inout, io_date
ORDER BY io_date;

-- ��¥ ������ �߰�
SELECT io_inout, io_date, COUNT(*), SUM(io_total)
FROM tbl_iolist
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY io_inout, io_date
ORDER BY io_date;

-- �հ� �ݾ��� 50���� �̻��� �׸� ǥ��
-- ����Լ��� ����ϴ°��
-- ����Լ� ����� ���� �����ϴ� LIST�� ���� �ϰ� ������
-- (�ʿ��� ������ ���� ���� ������)
-- WHERE�� ������ �ο��ϸ� �ȵȴ�.
-- �̶��� HAVING �̶�� Ű���带 ����Ѵ�
-- HAVING�� �켱 ��� ���� ������ ������ ����Ŀ�
-- ������ �����ϱ⶧���� �ð��� ���� �ҿ�ȴ�.
-- �׷��� ������ WHERE���� �˻��� �ؾ��Ѵ�.
SELECT io_inout, io_date, COUNT(*), SUM(io_total) 
FROM tbl_iolist
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY io_inout, io_date
HAVING SUM(io_total) >= 500000
ORDER BY io_date;




