-- 구조 잡기 --

/* 이름 (name) varchar2(10)
   주민번호 (jumin) char (15)
   전화번호 (tel) varchar2(20)
   성별 (gender) varchar2(10)
   나이 (age) number (3)
   출신지 (home) varchar2(20)
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

-- 테이블 구조 확인
DESC info_tab;

-- 테이블 내 데이터 확인 
SELECT *FROM info_tab;

CREATE TABLE student_score
( 
  id char(4),
  hname varchar2(20),
  kor number (3),
  eng number (3),
  total number, -- 기본 (10) 제공
  avg number (5,2) -- 소수점 두 자리까지 자르겠다 / 앞자리가 전체 자리수 
);

DESC student_score;

DROP TABLE student_score;

CREATE TABLE student_score
( 
  id char(4),
  hname varchar2(20),
  kor number (3),
  eng number (3),
  total number, -- 기본 (10) 제공
  avg number (5,2) -- 소수점 두 자리까지 자르겠다 / 앞자리가 전체 자리수 
);

DESC student_score;

-- 수학 컬럼 추가
AlTER TABLE student_score ADD math number(3);

DESC student_score;

-- 총점 컬럼 삭제 후 평균 컬럼에서 소수점 1자로 변경 

ALTER TABLE student_score DELETE total;

ALTER TABLE student_score;

DESC student_score;

ALTER TABLE student_score DROP (total);

ALTER TABLE student_score MODIFY (avg number (4,1));

DESC student_score;


-- 데이터 입력
INSERT INTO student_score (id, name, kor, eng ) VALUES ('0001', '홍길동', 50,80);

SELECT * FROM student_score;

INSERT INTO student_score (id, hname, kor, eng) VALUES ('2000', '홍길자', 60, 90);

INSERT INTO student_score (id, hname, kor, eng ) VALUES ('0001', '홍길동', 50,80);
SELECT * FROM student_score;

commit;

-- rollback (커밋하기 전까지만 뒤로가기 가능)

INSERT INTO student_score (id, name, kor, eng ) VALUES ('1000', '홍길숙',0,0);

INSERT INTO student_score (id, hname) VALUES ('1000', '홍길숙');

SELECT * FROM student_score;

DELETE FROM  student_score WHERE hname = '홍길숙';

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
UPDATE emp_copy SET ENAME = '홍길숙' WHERE EMPNO = '7782';
UPDATE emp_copy SET SAL = 3500 WHERE EMPNO = '7782';

--3
UPDATE emp_copy SET COMM  =  NVL(COMM,0)+300;

--4  7499
DELETE FROM  emp_copy WHERE EMPNO = '7499';

--5 81/6원 이전 정보 삭제 
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

-- 8000번 사원으로 <본인 이름>과 급여 10000을 저장
INSERT INTO emp (empno, ename, sal) VALUES (8000, 최유인, 10000);

SELECT * FROM emp;




















