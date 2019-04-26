-- ����� myMem �Դϴ�.

CREATE TABLE tbl_iolist (
    io_id	    NUMBER		PRIMARY KEY,
    io_date	    CHAR(10)	NOT NULL,	
    io_cname	nVARCHAR2(30)	NOT NULL,	
    io_dname	nVARCHAR2(30)	NOT NULL,	
    io_ceo  	nVARCHAR2(10),		
    io_inout	nVARCHAR2(3),		
    io_quan	    NUMBER,		
    io_price	NUMBER,		
    io_total	NUMBER

);
SELECT * FROM tbl_iolist;
SELECT COUNT(*) FROM tbl_iolist;

SELECT io_inout AS ����, io_date AS ��¥, COUNT(*) AS ����, SUM(io_total) AS ����
FROM tbl_iolist 
GROUP BY io_inout , io_date
ORDER BY io_date;

-- ���ڿ� �Լ� ���
SELECT 'KOREA' FROM DUAL ;
SELECT 'Republic Of Korea' FROM DUAL ;

-- ���ڿ��� �빮�ڷ� ��ȯ
SELECT UPPER('korea') FROM DUAL ;
-- ���ڿ��� �ҹ��ڷ� ��ȯ
SELECT LOWER('KOREA') FROM DUAL ;
-- �ܾ��� ù����(�̴ϼ�)�� �빮�ڷ� ����
SELECT INITCAP('republic of korea') FROM DUAL;
-- �ܾ��� ���� ���� Ȯ��
SELECT LENGTH('repubic of korea') FROM DUAL;
-- LENGTH �Լ��� ����Ҷ� ��Ȥ �ѱ��� ������ *2�� ������ �˷��ִ� ��찡�ִµ�,
-- �̶��� ���ڿ� �տ� N�̶�� ��ȣ�� �־��ָ� �ȴ�.
SELECT LENGTH(N'���ѹα�') FROM DUAL;
-- �������� ����뷮�� Byte ������ �����ֱ�
SELECT LENGTHB('���ѹα�����') FROM DUAL;
-- of�� ���ڿ� �߿� ���° ��ġ�� �ִ°� ?
SELECT INSTR('Republic of Korea','of') FROM DUAL;
-- ���� ���ڿ��� 4��° �ڸ����� 3����
-- ����Ŭ�� ù������ ��ġ�� 0�̾ƴ� 1���� �����Ѵ�.
SELECT SUBSTR('Republic of Korea','4','3')FROM DUAL;


-- ǥ��SQL���� ���ʺ��� 3��° ��ġ�� ����
SELECT LEFT('Republic of Korea',3)FROM DUAL;
-- 3��°���� 2����
SELECT MID('Republic of Korea',3,2)FROM DUAL;
-- ��ü ���ڼ��� 20�ڸ��� �����, ���� ������ 0���� ä����.
-- �ڸ����� �����ϰ� ����� �ϴ� ��쿡 ���
SELECT LPAD('KOREA', 20,'0') FROM DUAL; -- ����
SELECT RPAD('KOREA', 20,'0') FROM DUAL; -- ������
INSERT test(t_num) VALUES(LPAD(1,3,'0') ; -- INSERT���� ����� ����

-- ������ ����
SELECT LTRIM(' KOREA ���ѹα� ') FROM DUAL;
SELECT RTRIM(' KOREA ���ѹα� ') FROM DUAL;
SELECT TRIM(' KOREA ') FROM DUAL;
-- TRIM�Լ��� Ư���� ���
-- ���ڿ� �յڿ� ���� a ���ڵ��� ��� �����϶�.
SELECT TRIM ('a' FROM 'aaaabbbborennnnaaaa') FROM DUAL;


-- ���ں��� �ŷ� ���п� ���� ������ �հ踦 Ȯ��
SELECT io_date, io_inout, COUNT(io_total), SUM(io_total)
FROM tbl_iolist
GROUP BY io_date, io_inout
ORDER BY io_date;

-- ���ں��� �ŷ� ���п� ���� ������ �հ踦 Ȯ��
-- ��, 2018-03-01 ~ 2018-03-31 ������ data�� ����
SELECT io_date, io_inout, COUNT(io_total), SUM(io_total)
FROM tbl_iolist
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY io_date, io_inout
ORDER BY io_date;

-- ������ �Ǵ� �⵵���� �հ踦 ����ؼ� ���� ������.
SELECT SUBSTR(io_date,1,7) AS ����,
    io_inout, COUNT(io_total), SUM(io_total)
FROM tbl_iolist
GROUP BY SUBSTR(io_date,1,7), io_inout
ORDER BY SUBSTR(io_date,1,7);

CREATE VIEW ������� 
AS
SELECT SUBSTR(io_date,1,7) AS ����,
    io_inout AS ����, COUNT(io_total) AS ����, SUM(io_total) AS �հ�
FROM tbl_iolist
GROUP BY SUBSTR(io_date,1,7), io_inout
ORDER BY SUBSTR(io_date,1,7);

SELECT * FROM ������� 
WHERE ���� BETWEEN '2018-03' AND '2018-06';

SELECT io_dname AS �ŷ�ó, io_inout AS ����, io_quan AS ����, SUM(io_total) AS ����
FROM tbl_iolist 
GROUP BY io_dname, io_inout ,  io_quan
ORDER BY io_dname;

SELECT io_cname AS ��ǰ��, SUBSTR(io_date,1,7) AS ����, io_inout AS ����, io_quan AS ����, SUM(io_total) AS ����
FROM tbl_iolist 
GROUP BY io_cname, SUBSTR(io_date,1,7), io_inout , io_quan
ORDER BY SUBSTR(io_date,1,7);
