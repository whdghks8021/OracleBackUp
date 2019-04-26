-- 이곳은 gradeUser 입니다.

SELECT * FROM tbl_student;

DESC tbl_student;

-- 20번 학생의 정보를 조회
SELECT * FROM tbl_student
WHERE st_num = '00020';

DELETE FROM tbl_student 
WHERE st_num = '00051' ;

commit;