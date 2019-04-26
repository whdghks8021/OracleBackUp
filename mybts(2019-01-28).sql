-- ����� mybts �Դϴ�.
-- �޸��� �ۼ��� ���� ���̺��� ����

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

--ȸ�������� ��� table ����
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
    CONSTRAINT U_userid UNIQUE (m_userid) -- ���̺��� �����Ҷ� ����ũ ����
);
-- ȸ���������� id Į���� table ���Ἲ�� �����ϱ� ���� ���̰�
-- ������ ȸ�������� Ȱ���ϱ� ���ؼ� �ַ� ����ϴ� Į���� m_userid �̴�
-- ȸ������ table���� m_userid�� �ߺ��Ǿ�� �ȵȴ�.
-- ���� ȸ������ table�� m_userid Į���� UNIQUE�� ������ ���ش�.
ALTER TABLE tbl_member ADD UNIQUE (m_userid) ;

CREATE TABLE tbl_hobby(
    id NUMBER PRIMARY KEY,
    m_userid nVARCHAR2(30) NOT NULL,
    m_hobby nVARCHAR2(20)
);

-- FOREIGN KEY�� ����
-- FK�� main table(tbl_member)�� � Į���� ������ ���Ѽ�
-- ���� main table�� �����͸� �����ϸ� sub table(tbl_hobby)�� �����Ͱ�
-- �ǹ̾��� �����ִ� ���� ���� �ϱ� ���� �����̴�.
ALTER TABLE tbl_hobby ADD CONSTRAINT F_userid FOREIGN KEY (m_userid)
REFERENCES tbl_member(m_userid) ON DELETE CASCADE;
-- FK�� �����Ϸ��� main table�� Į���� PK�� �����ǰų� ����ũ�� �����Ǿ�� �־�� �Ѵ�.

CREATE SEQUENCE SEQ_MEMBER 
START WITH 1 
INCREMENT BY 1;

SELECT * FROM tbl_member;

DELETE FROM tbl_member;
commit;