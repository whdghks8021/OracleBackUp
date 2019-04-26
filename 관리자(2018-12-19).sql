-- ����� ������ �Դϴ�.

CREATE USER myuser1 IDENTIFIED BY 1111;

GRANT CREATE TABLE TO myuser1;
GRANT SELECT, INSERT, UPDATE ON [table] TO myuser1;

CREATE TABLESPACE mytsA
DATAFILE 'd:/bizwork/ordata/mytsA.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 100K;

-- ����� ����� ������ �� ���̺� �����̽��� ������ �ʰ�
-- TABLE ���� �����ϸ� ������ TABLE���� SYSTEM TS�� �����Ǿ�
-- ���߿� ���̺����̽��� ���� �� �ű���� ���� ������ �߻��Ѵ�.
-- ����, ����ڸ� �����ϰ� ���̺��� ����� ���� ���̺����̽��� �ݵ�� �����ϰ�
-- �׸��� ������� DEFAULT TABLESPACE�� ������ �־�� �Ѵ�.
ALTER USER myuser1 DEFAULT TABLESPACE mytsA;

CREATE TABLE EMP_TABLE (
    EMPNO CHAR(6) PRIMARY KEY,
    EMPNAME nVARCHAR2(20) NOT NULL,
    EMPBIRTH CHAR(8),
    DEPTNO CHAR(3) NOT NULL,
    HREDATE CHAR(10) NOT NULL
);

INSERT INTO EMP_TABLE
VALUES ('170001','ȫ�浿','880212','001','20120405');
INSERT INTO EMP_TABLE
VALUES ('170002','�̸���','770215','003','20101101');
INSERT INTO EMP_TABLE
VALUES ('170003','������','820513','003','20130105');
INSERT INTO EMP_TABLE
VALUES ('170004','�庸��','941102','004','20170617');
INSERT INTO EMP_TABLE
VALUES ('170005','�Ӳ���','800212','001','20101101');

SELECT * FROM EMP_TABLE;

-- �� ����� ������ �����Ҷ��� �� ����� �����͸� ����
-- �����ȣ(PK)�� �������� �����͸� �����ؾ��Ѵ�.
-- ����̸����� �����͸� �����Ұ�� ���������� ������ ������,
-- ������ ���Ἲ�� ��ġ�� �ſ� ������ ����̴�.
SELECT * FROM EMP_TABLE WHERE EMPNAME = '�庸��';
UPDATE EMP_TABLE SET HREDATE = '20180301'
WHERE EMPNO = '170004';


