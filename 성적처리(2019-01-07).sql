-- �̰��� gradeUser �Դϴ�.

SELECT * FROM tbl_student;

DESC tbl_student;

-- 20�� �л��� ������ ��ȸ
SELECT * FROM tbl_student
WHERE st_num = '00020';

DELETE FROM tbl_student 
WHERE st_num = '00051' ;

commit;