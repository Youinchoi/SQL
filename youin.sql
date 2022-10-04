CREATE TABLE dept AS SELECT * FROM scott.dept;
-- 이렇게 끌어오면 제약조건 복사는 안됨 

DESC dept;
DESC student;

select * from dept;

ALTER TABLE dept
ADD CONSTRAINT pk_dept_deptno PRIMARY KEY ( deptno );

-- 테이블 생성 및 제약조건 추가
CREATE TABLE student
(
    no char (4),
    name varchar2(30) not null,
    gender varchar2(10) check (gender IN ('남성','여성')),
    addr varchar2(30) DEFAULT N'서울',
    jumin  char (14) not null,
    deptno number(10),
    
    CONSTRAINT fk_student_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
);

 -- 제약조건 삭제
ALTER TABLE student MODIFY jumin varchar2 (14) null; 

drop table student;
select * from student;

-- 학번 컬럼에 기본키(primary key) 제약조건 추가
ALTER TABLE student ADD CONSTRAINT pk_student_no PRIMARY KEY ( no );

-- 레코드 입력 시 확인 
INSERT INTO student(no, name, gender, addr, jumin ) 
VALUES('1111', '김태희', '여성', '서울시 강남구', '801212-1234567' ); 

INSERT INTO student(no, name, jumin ) 
VALUES('2222', '송혜교', '881212-1234567');

INSERT INTO student(no, name, jumin ) 
VALUES('1111', '강동원', '881212-1234567');

INSERT INTO student(no, name, gender, jumin ) 
VALUES('3333', '하정우', '남자', '830303-1234567'); --x

INSERT INTO student(no, name, addr, jumin ) 
VALUES('4444', '김새론', '서울시 서초구', '990909-1234567');

INSERT INTO student(no, name, addr, deptno ) 
VALUES('8888', ‘이병헌', '서울시 한강', 50); -- x

---------------------------------------------------------------------------------

Create Table library (
rent_id number(5),
book_id varchar2(10)  not null,
hakbun char(4),

Constraint pk_library_rent_id PRIMARY KEY (rent_id),
Constraint fk_library_no FOREIGN KEY (hakbun) REFERENCES student (no)
);

--------------------------------------------------------------------------------------

Drop Table dept;

CREATE TABLE dept(

DEPTID NUMBER(5), 
DEPTNAME VARCHAR(50)
);

--------------------------------------------------------------------------------------

CREATE TABLE EMP(

EMPID NUMBER(5), 
NAME VARCHAR2(20), 
RESID CHAR(14), 
GENDER VARCHAR2(10), 
AGE NUMBER(5),
DEPTID NUMBER(5) 
);

--------------------------------------------------------------------------------------

CREATE TABLE DEPT(

DEPTID NUMBER(5)

, DEPTNAME VARCHAR(50)

, CONSTRAINT PK_DEPT_DEPTID PRIMARY KEY(DEPTID)

);

?

CREATE TABLE EMP(

EMPID NUMBER(5) 

, NAME VARCHAR2(20) 

, RESID CHAR(14) 

, GENDER VARCHAR2(10) 

, AGE NUMBER(5) 

, DEPTID NUMBER(5) NOT NULL

, CONSTRAINT PK_EMP_EMPID PRIMARY KEY (EMPID)

, CONSTRAINT UK_EMP_RESID UNIQUE (RESID)

, CONSTRAINT EMP_CK_GENDER CHECK (GENDER IN ('남성', '여성'))

, CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTID) 

REFERENCES DEPT(DEPTID) ON DELETE CASCADE

);




CREATE TABLE DEPT(

DEPTID NUMBER(5)

, DEPTNAME VARCHAR(50)

, CONSTRAINT PK_DEPT_DEPTID PRIMARY KEY(DEPTID)

);

?

CREATE TABLE EMP(

EMPID NUMBER(5) 
, NAME VARCHAR2(20) 
, RESID CHAR(14) 
, GENDER VARCHAR2(10) 
, AGE NUMBER(5) 
, DEPTID NUMBER(5) 

, CONSTRAINT PK_EMP_EMPID PRIMARY KEY (EMPID)
, CONSTRAINT UK_EMP_RESID UNIQUE (RESID)
, CONSTRAINT EMP_CK_GENDER CHECK (GENDER IN ('남성', '여성'))
, CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTID) 
REFERENCES DEPT(DEPTID) ON DELETE SET NULL

);






-- INSERT (TABLE: DEPT)

INSERT INTO DEPT(DEPTID, DEPTNAME)
VALUES (10001, 'IT팀');

INSERT INTO DEPT(DEPTID, DEPTNAME)
VALUES (10002, '생산운영팀');

INSERT INTO DEPT(DEPTID, DEPTNAME)
VALUES (10003, '생산기술팀');

?

-- INSERT (TABLE: EMP)

INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)
VALUES (30001, '최가은', '881012-1187527', '여성', 32, 10001);

INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)
VALUES (30002, '김효준', '850712-1000007', '남성', 35, 10002);

INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)
VALUES (30003, '서종균', '881112-1187527', '남성', 32, 10003);

DELETE FROM DEPT WHERE DEPTID = 10003;

select * from dept;
select * from emp;

drop table dept;
drop table emp;




