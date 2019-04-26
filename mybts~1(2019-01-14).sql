-- ����� myBts �Դϴ�.

DROP TABLE tbl_score ;

-- FOREIGN KEY ����
-- ���� tbl_score ���̺� �����͸� �Է��ϴµ�
-- tbl_student ���̺� st_num �� ��ġ���� �ʴ� ����
-- �Է��ϸ� ������ �߻��ؼ�
-- �߸� �ԷµǴ� �����Ͱ� ������ �����ϴ� ��

-- ���� ���Ἲ ����
CREATE TABLE tbl_score (
    id NUMBER PRIMARY KEY,
    st_num VARCHAR2(5) NOT NULL, -- CHAR >> VARCHAR2
    sc_sb_code VARCHAR2(3) NOT NULL, -- CHAR >> VARCHAR2
    sc_score NUMBER(3),
    CONSTRAINT FK_st_num FOREIGN KEY (st_num)
    REFERENCES tbl_student(st_num) 
);

CREATE TABLE tbl_student (
    st_num VARCHAR2(5) PRIMARY KEY, -- CHAR >> VARCHAR2
    st_name nVARCHAR2(20) NOT NULL,
    st_grade CHAR(2),
    st_tel nVARCHAR2(20)
) ;

-- �ʱ⿡ �뷮�� �����͸� �Է��Ϸ��� �ϴµ�
-- FK�� ���� �Ǿ�������
-- tbl_student �����Ͱ� ��� �ϼ��Ǳ� ������
-- tbl_score �����͸� �߰� �Ҽ� ���Եȴ�.
-- ���� �ʱ⿡�� �ϴ� FK�� ���� �Ǵ� ������ �ʰ�
-- �����͸� �Է� �ϰ�
-- �����Ͱ� ���� �ϼ��Ǹ� FK�� �����ϴ� ���� ����.

-- FK ����
ALTER TABLE tbl_score
DROP CONSTRAINT FK_st_num ;

-- FK �߰�
ALTER TABLE tbl_score
ADD CONSTRAINT FK_st_num FOREIGN KEY(st_num)
REFERENCES tbl_student(st_num);

-- ���� �����͸� ��� �Է��� ��
-- FK�� ����(�߰�)�ϴµ� ������ �߻��ϸ�
-- tbl_score�� �߸��� st_num�� �����Ѵٴ� ���̴�.
-- �̷����� Join�� ���ؼ� �����͸� Ȯ���ؾ� �Ѵ�.
SELECT SC.st_num, ST.st_num, ST.st_name
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.st_num = ST.st_num
WHERE ST.st_num = '';

SELECT * FROM tbl_student ;
INSERT INTO tbl_student
VALUES ('00001', 'ȫ�浿', '1' , '010-1234-1234');

INSERT INTO tbl_score -- �Է°���
VALUES (63451, '00001', '001', 100);

INSERT INTO tbl_score -- �ԷºҰ��� / tbl_student ���� 001�й��� �������� �ʱ⶧���� �����߻�
VALUES (2353, '001', '001', 100);

SELECT SC.st_num, ST.st_name, SC.sc_sb_code, sc_score
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.st_num = ST.st_num ;
        
-- 00001 �й��� �̹� tbl_score�� �Էµ� �����Ͱ� �ֱ� ������
-- tbl_student���� ������ �Ұ����ϴ�
-- �ᱹ �� �� ���̺��� st_num�� �������� JOIN ���� ����������
-- �������谡 ��Ȯ������ ����JOIN�� �����ص� ������ ����.
DELETE FROM tbl_student WHERE st_num = '00001' ;

ALTER TABLE tbl_score
DROP CONSTRAINT FK_st_num ;

ALTER TABLE tbl_score
ADD CONSTRAINT FK_st_num
FOREIGN KEY (st_num)
REFERENCES tbl_student (st_num)
ON DELETE CASCADE ; -- tbl_score�� �Էµ� �����Ͱ� �־ DELETE�� �����ϰ� �Ǹ�
                    -- tbl_score�� tbl_student �Ѵ� �����͸� �����ǰ� �ϵ��� �Ѵ�.
                    
ALTER TABLE tbl_score
ADD CONSTRAINT FK_st_num
FOREIGN KEY (st_num)
REFERENCES tbl_student (st_num)
ON DELETE SET NULL ; -- st_num �� NOT NULL�� �����߱⶧���� ���ǹ�
