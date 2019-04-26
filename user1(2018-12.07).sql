-- �̰��� user1���� ������ ȭ���Դϴ�.
-- tbl_addr�� �ϴ� ����
DROP TABLE tbl_addr;

-- ���� tbl_addr�� ����
CREATE TABLE tbl_addr(
    id NUMBER PRIMARY KEY, -- �⺻Ű, PK
    st_name CHAR(50) NOT NULL, -- �̸��� ���� ��ĭ����.
    st_age NUMBER(3),
    st_addr VARCHAR2(125)
);
INSERT INTO tbl_addr
VALUES(0,'ȫ�浿',12,'�����');
INSERT INTO tbl_addr
VALUES(1,'ȫ�浿',12,'�����');
INSERT INTO tbl_addr
VALUES(2,'�̸���',16,'������');
-- �����͸� �߰��ϸ鼭 0�� �׸�� 1�� �׸��� 
-- �߸� Ȯ���Ͽ�, ���� �������ΰ����� �ν��ϰ� 
-- INSERT ó���� �ع��ȴ�.

SELECT * FROM tbl_addr;
-- SELECT�� DATA�� Ȯ�� �ߴ���, �� ���� �����Ͱ�
-- �ѻ���� DATA�� �ߺ� �� ���� Ȯ�εǾ���.
-- �ٽ� ���� ������ �ô���
-- �ι�° ȫ�浿�� �ּҰ� �����̾ƴ� �λ��� ������ Ȯ�� ���.
-- �׷���, �ι�° ȫ�浿�� �ּҸ� �λ����� �����Ϸ��� �Ѵ�.
-- �ٽ��ѹ� SELECT �ؼ� ȫ�浿�� �����͸� Ȯ���غ���.
SELECT * FROM tbl_addr
WHERE st_name = 'ȫ�浿' ; -- st_name Į���� ���� ȫ�浿�� ��츸 ������ (���ǰ˻�)

-- ������ ���� ����
UPDATE tbl_addr 
SET st_addr = '�λ��'
WHERE id = 1;

-- Ȯ��
SELECT * FROM tbl_addr;

-- �Ǽ��� �ߺ��Է��� �����͸� �����Ϸ����Ѵ�.
INSERT INTO tbl_addr
VALUES (3,'������',17,'�ͻ��');
INSERT INTO tbl_addr
VALUES (4,'������',17,'�ͻ��');

-- '������' �����͵��� Ȯ���غ��� �Ѵ�.
SELECT
    *
FROM tbl_addr
WHERE st_name = '������';

-- '������'�� 2��° �������� id�� 4�� �����͸� ����
DELETE FROM tbl_addr
WHERE id = 4 ;

SELECT * FROM tbl_addr;

-- DATABASE�� TABLE�� �����Ҷ�
-- ����ϰ��� �ϴ� Į���߿� UNIQUE�� �׸��� �ִٸ�
-- �� Į���� PRIMARY KEY = PK�� �����ϴ� ���� ����
-- �׷��� ������ ��� TABLE���� id��� Į���� ���� �߰��ؼ�
-- �ش� Į���� PK�� ���� �� �ִ°��� ����.

CREATE TABLE tbl_postno (
    postno CHAR(5) PRIMARY KEY , -- ��ü ���Ἲ �����
    street VARCHAR(125) NOT NULL UNIQUE, -- �����͸� ����ΰų� �̹� ���� ���� �Էµ�������,
                                         -- �ٽ� �Էµ��� �ʵ��� �ϴ� �ɼ�
    addr VARCHAR2(125)
);