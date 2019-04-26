-- mybts ������

-- ����Ŭ������ ���� ������ŭ�� �����͸� �����Ҷ�
-- ���ٸ� Ű���峪 ��ɵ��� ���
-- ROWNUM ��� Ű����� Į���� �����
-- ROWNUM ������ �����͸� �߶� SELECT�� �����Ѵ�.

-- �׷���, ���� �����͸� ORDER BY�� ������ ���� ��쿡��
-- ROWNUM�� �����ϰ� �ο��Ǿ�
-- ���ϴ� �����͸� ������ �� ����.
SELECT ROWNUM, b_userid, b_date, b_time, b_subject
FROM tbl_board
WHERE ROWNUM BETWEEN 1 AND 10
ORDER BY b_date DESC, b_time DESC;


-- ���Ͱ��� ISSUE�� �־
-- ����Ŭ������ SUB QUERY�� ����Ѵ�.
-- 1. �ϴ� ��ü�����͸� ���ϴ� Į������ ������ �����ϰ�
-- 2. ���ĵ� �����͸� ������ ���̺�� ���
-- 3. �� ���̺�� ���� SELECT�� �����ϸ鼭
-- 4. ROWNUM Į���� �����Ͽ�
-- 5. ������ �����Ѵ�.
-- ���������� ����ؼ� ����
SELECT ROWNUM, M.* FROM
(SELECT * FROM tbl_board ORDER BY b_date DESC, b_time DESC) M
WHERE ROWNUM BETWEEN 1 AND 20;

SELECT * FROM 
(SELECT ROWNUM R, B.* FROM tbl_board B WHERE b_date > '0000-00-00') M 
WHERE R BETWEEN 1 AND 10;

SELECT * FROM
(SELECT ROWNUM R, B.* FROM tbl_board B WHERE b_date > '0000-00-00') M
WHERE R BETWEEN 11 AND 202;

-- INDEX ���� ���ڵ��ȣ 1 ������ 10 ������ ����Ʈ�� SELECT
SELECT M.* FROM
(SELECT ROW_NUMBER() OVER (ORDER BY B_DATE DESC, B_TIME DESC) R, B.*
FROM tbl_board B) M 
WHERE M.R BETWEEN 1 AND 10;

-- ���������� �ۼ��Ͽ� ������ �����ϸ� ��ü �����͸� �����ϴ� �������� �ӵ����ϰ� �߻��Ѵ�.
-- �����̳��� ���� ������ ���ؼ� INDEX��� ���� Ȱ���� ����.


CREATE INDEX idx_board ON tbl_board(b_date DESC, b_time DESC); -- ����Į�� �ε���
CREATE INDEX idx_board_subject ON tbl_board(b_subject); -- ����Į�� �ε���

-- INDEX
-- ���̺��� Į���߿� ����ϰ� SELECT ����, ORDER BY ���ǿ� ���Ǵ�
-- Į���� INDEX��� ������ ������ �� �д�.
-- �⺻ TABLE�� ������ �˻�Į���� ���� ������ REC �ּҸ��� ����
-- ������ �ý��� ���̺� �̴�.
-- INDEX�� �׻� �˻�Į���� �������� ������ �Ǿ� �ִ�.
-- �׷��� INDEX�� �Ǿ� �ִ� Į���� �������� �˻��� �ϸ�
-- �׷��� ���� Į���� �˻��Ҷ� ���� ��û�� �ӵ������ �����ش�.

-- ��, INSERT UPDATE DELETE�� �̷��������
-- ���� table�� INDEX�� ���ÿ� �����ؾ� �ϰ�
-- INDEX�� ���� �۾����� �����ؾ� �ϱ� ������
-- ����� �ӵ����ϰ� �߻��� �� �ִ�.

-- PK�� �ڵ����� �⺻ INDEX�� ������ �ȴ�.
-- PK NOT NULL �̸� UNIQUE �̸� INDEX�� �⺻ �����̴�.

CREATE TABLE tbl_bbs_files (
    id NUMBER PRIMARY KEY,
    parent_id NUMBER NOT NULL,
    file_name nVARCHAR2(125),
    save_file_name nVARCHAR2(125)
);

ALTER TABLE tbl_bbs_files
ADD CONSTRAINT fk_bbs_files FOREIGN KEY (PARENT_ID)
REFERENCES tbl_board(id)