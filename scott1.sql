-- ���� ��� --

/* �̸� (name) varchar2(10)
   �ֹι�ȣ (jumin) char (15)
   ��ȭ��ȣ (tel) varchar2(20)
   ���� (gender) varchar2(10)
   ���� (age) number (3)
   ����� (home) varchar2(20)
*/

CREATE TABLE info_tab
(
    name varchar2(10),
    jumin char(15),
    tel varchar2(20),
    gender varchar2(10),
    age NUMBER (3),
    home varchar2(20)
);

-- ���̺� ���� Ȯ��
DESC info_tab;

-- ���̺� �� ������ Ȯ�� 
SELECT *FROM info_tab;

CREATE TABLE student_score
( 
  id char(4),
  hname varchar2(20),
  kor number (3),
  eng number (3),
  total number, -- �⺻ (10) ����
  avg number (5,2) -- �Ҽ��� �� �ڸ����� �ڸ��ڴ� / ���ڸ��� ��ü �ڸ��� 
);

DESC student_score;

DROP TABLE student_score;

CREATE TABLE student_score
( 
  id char(4),
  hname varchar2(20),
  kor number (3),
  eng number (3),
  total number, -- �⺻ (10) ����
  avg number (5,2) -- �Ҽ��� �� �ڸ����� �ڸ��ڴ� / ���ڸ��� ��ü �ڸ��� 
);

DESC student_score;

-- ���� �÷� �߰�
AlTER TABLE student_score ADD math number(3);

DESC student_score;

-- ���� �÷� ���� �� ��� �÷����� �Ҽ��� 1�ڷ� ���� 

ALTER TABLE student_score DELETE total;

ALTER TABLE student_score;

DESC student_score;

ALTER TABLE student_score DROP (total);

ALTER TABLE student_score MODIFY (avg number (4,1));

DESC student_score;


-- ������ �Է�
INSERT INTO student_score (id, name, kor, eng ) VALUES ('0001', 'ȫ�浿', 50,80);

SELECT * FROM student_score;

INSERT INTO student_score (id, hname, kor, eng) VALUES ('2000', 'ȫ����', 60, 90);

INSERT INTO student_score (id, hname, kor, eng ) VALUES ('0001', 'ȫ�浿', 50,80);
SELECT * FROM student_score;

commit;

-- rollback (Ŀ���ϱ� �������� �ڷΰ��� ����)

INSERT INTO student_score (id, name, kor, eng ) VALUES ('1000', 'ȫ���',0,0);

INSERT INTO student_score (id, hname) VALUES ('1000', 'ȫ���');

SELECT * FROM student_score;

DELETE FROM  student_score WHERE hname = 'ȫ���';

DESC student_score;

SELECT * FROM student_score;


-- UPDATE table_name SET column=value WHERE condition;

UPDATE student_score SET kor = VALUE WHERE kor = 100;

UPDATE student_score SET kor = 100 WHERE id = '0001';

SELECT * FROM student_score;

commit;

-- UPDATE table_name SET column=value WHERE condition;

UPDATE student_score SET math = 90 WHERE id = '2000';

SELECT * FROM student_score;

UPDATE student_score SET avg = (kor+eng+nvl(math,0))/3;

SELECT * FROM student_score;

SELECT * FROM student_score;

CREATE TABLE emp_copy AS SELECT * FROM emp;

DESC emp_copy;

SELECT * FROM emp_copy;

--1
UPDATE emp_copy SET job = 90 WHERE EMPNO = '7788';

--2
UPDATE emp_copy SET ENAME = 'ȫ���' WHERE EMPNO = '7782';
UPDATE emp_copy SET SAL = 3500 WHERE EMPNO = '7782';

--3
UPDATE emp_copy SET COMM  =  NVL(COMM,0)+300;

--4  7499
DELETE FROM  emp_copy WHERE EMPNO = '7499';

--5 81/6�� ���� ���� ���� 
DELETE FROM  emp_copy WHERE EMPNO = '7499';

SELECT * FROM emp_copy;
rollback;
rollback;
rollback;

DELETE FROM  emp_copy WHERE EMPNO = '7499';

DELETE FROM  emp_copy WHERE HIREDATE < '81/06/01';

SELECT * FROM emp_copy;

truncate table emp_copy;

rollback;

-- 8000�� ������� <���� �̸�>�� �޿� 10000�� ����
INSERT INTO emp (empno, ename, sal) VALUES (8000, ������, 10000);

SELECT * FROM emp;




















