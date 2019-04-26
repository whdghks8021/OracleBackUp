-- ����� gradeUser �� ������ ȭ�� �Դϴ�.

-- �л�����Ʈ
-- 00001:���̹�:010-8694-3742:�뱸 ���� ������
-- �л�����Ʈ ���̺� ����

CREATE TABLE tbl_student (
    st_num CHAR(5) PRIMARY KEY,
    st_name nVARCHAR2(30) NOT NULL,
    st_tel nVARCHAR2(20),
    st_addr nVARCHAR2(50)
);

SELECT * FROM tbl_student ;
DELETE FROM tbl_student ;
COMMIT ;

-- SELECT�� �����Ҷ�
-- (Ư���� ���ڿ��� ���) ���� ��ü�� ���� ���ϰ�
-- �Ϻθ��� �˰� ������, �κ� ���ڿ� �˻�
-- �κй��ڿ� �˻��� DB�� SQL ��ɹ��߿�
-- ���� ������ �������� ����
-- ���� Ư���� ��찡 �ƴϸ� ������ ������� �ʴ� ���� ����.
SELECT *
FROM tbl_student
WHERE st_name LIKE '��%';

-- st_name Į���� �� �̶�� ���ڿ��� ���Ե� ������
SELECT *
FROM tbl_student
WHERE st_name LIKE '%��%';

SELECT *
FROM tbl_student
WHERE st_name LIKE '%��'
    OR st_name LIKE '%��%'
    OR st_name LIKE '%ö%';
    
ALTER TABLE tbl_student MODIFY st_num CHAR(7) ; 

--  private String sc_code;
--	private int sc_kor;
--	private int sc_eng;
--	private int sc_math;

CREATE TABLE tbl_score (
    sc_num CHAR(5) PRIMARY KEY,
    sc_kor NUMBER(3),
    sc_eng NUMBER(3),
    sc_math NUMBER(3)
);