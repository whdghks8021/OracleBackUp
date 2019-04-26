-- 여기는 mybts 입니다.
-- 메모장 작성을 위한 테이블을 생성

CREATE TABLE tbl_memo(
    id NUMBER PRIMARY KEY,
    m_auth nVARCHAR2(30) NOT NULL,
    m_date CHAR(10),
    m_subject nVARCHAR2(50),
    m_text nVARCHAR2(255)
);

SELECT * FROM tbl_memo;
DELETE FROM tbl_memo 
WHERE id = 1;

CREATE SEQUENCE SEQ_MEMO 
START WITH 1 
INCREMENT BY 1;

commit;

--회원정보가 담길 table 생성
-- 	private long id ;
--	private String m_userid ;
--	private String m_password ;
--	private String m_re_password;
--	private String m_name ;
--	private String m_tel ;
--	private String m_city ;
--	private String m_addr ;
--	private String[] m_hobby ;

CREATE TABLE tbl_member(
    id NUMBER PRIMARY KEY,
    m_userid nVARCHAR2(30) NOT NULL,
    m_password nVARCHAR2(125) NOT NULL,
    m_name nVARCHAR2(125) NOT NUll,
    m_tel nVARCHAR2(20),
    m_city nVARCHAR2(20),
    m_addr nVARCHAR2(125),
    CONSTRAINT U_userid UNIQUE (m_userid) -- 테이블을 생성할때 유니크 지정
);
-- 회원정보에서 id 칼럼은 table 무결성을 보장하기 위한 값이고
-- 실제로 회원정보를 활용하기 위해서 주로 사용하는 칼럼은 m_userid 이다
-- 회원정보 table에서 m_userid는 중복되어서는 안된다.
-- 따라서 회원정보 table의 m_userid 칼럼을 UNIQUE로 설정을 해준다.
ALTER TABLE tbl_member ADD UNIQUE (m_userid) ;

CREATE TABLE tbl_hobby(
    id NUMBER PRIMARY KEY,
    m_userid nVARCHAR2(30) NOT NULL,
    m_hobby nVARCHAR2(20)
);

-- FOREIGN KEY를 생성
-- FK는 main table(tbl_member)의 어떤 칼럼과 연동을 시켜서
-- 만약 main table의 데이터를 삭제하면 sub table(tbl_hobby)의 데이터가
-- 의미없이 남아있는 것을 방지 하기 위한 설정이다.
ALTER TABLE tbl_hobby ADD CONSTRAINT F_userid FOREIGN KEY (m_userid)
REFERENCES tbl_member(m_userid) ON DELETE CASCADE;
-- FK로 설정하려면 main table의 칼럼이 PK로 설정되거나 유니크로 설정되어야 있어야 한다.

CREATE SEQUENCE SEQ_MEMBER 
START WITH 1 
INCREMENT BY 1;

SELECT * FROM tbl_member;

DELETE FROM tbl_member;
commit;