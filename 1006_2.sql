-- INSERT / UPDATE / DELETE에서

-- (1) 부서별 급여통계 테이블 생성

rollback;

create table stat_salary ( 

stat_date date not null, -- 날짜
dept_no number, -- 부서
emp_count number, -- 사원수
tot_salary number, -- 급여총액
avg_salary number ); -- 급여평균

desc stat_salary;

-- (2) 날짜와 부서번호 입력
select sysdate, deptno
from emp
group by deptno;

insert into stat_salary ( stat_date, dept_no )
    select sysdate, deptno 
    from emp
    group by deptno;
    
select * from stat_salary;

-- 부서별 사원수, 월급, 평군

select count(*) 사원수 , sum(sal) 급여총액, round(avg(sal)) 급여평균
from emp
group by deptno;

update stat_salary ss 
set (emp_count, tot_salary, avg_salary)
        = (select count(*), sum(sal), round(avg(sal)) 
            from emp e
            where ss.dept_no = e.deptno
            group by deptno);
            
select * from stat_salary;


-- (3) 사원수, 급여총액, 평균급여 입력(?) -> 수정

create table emp_cp as select 
from emp
select * from emp_cp;

-- 부서명이 'sales' 인 사원의 정보 삭제 (emp_cp)
delete from emp
where deptno = (select deptno from dept where dname = 'SALES');

rollback;

---------------------------------------------------------------------------------------------------------------------

-- merge

/* ?merge into Table1?
     using Table2?
     on (병합조건절)?
     when matched then?
     update set 업데이트 내용?
     delete where 조건?
     when not matched then?
     insert values(컬럼이름); */

-- 사원테이블에 존재하는 사원이면 사원의 급여를 10% 인상하고,
-- 존재하지 않는 사원이면 사원테이블에 정보를 입력한다

CREATE TABLE emp_merge_tests
AS SELECT empno, ename, sal, deptno FROM emp WHERE deptno IN (10);

MERGE INTO emp_merge_test m
USING emp e
ON (m.empno = e.empno)
WHEN MATCHED THEN
  UPDATE SET m.sal = ROUND(m.sal*1.1)
WHEN NOT MATCHED THEN
INSERT (m.empno, m.deptno, m.sal) VALUES (e.empno, e.deptno, e.sal);

COMMIT;






