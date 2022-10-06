-- INSERT / UPDATE / DELETE����

-- (1) �μ��� �޿���� ���̺� ����

rollback;

create table stat_salary ( 

stat_date date not null, -- ��¥
dept_no number, -- �μ�
emp_count number, -- �����
tot_salary number, -- �޿��Ѿ�
avg_salary number ); -- �޿����

desc stat_salary;

-- (2) ��¥�� �μ���ȣ �Է�
select sysdate, deptno
from emp
group by deptno;

insert into stat_salary ( stat_date, dept_no )
    select sysdate, deptno 
    from emp
    group by deptno;
    
select * from stat_salary;

-- �μ��� �����, ����, ��

select count(*) ����� , sum(sal) �޿��Ѿ�, round(avg(sal)) �޿����
from emp
group by deptno;

update stat_salary ss 
set (emp_count, tot_salary, avg_salary)
        = (select count(*), sum(sal), round(avg(sal)) 
            from emp e
            where ss.dept_no = e.deptno
            group by deptno);
            
select * from stat_salary;


-- (3) �����, �޿��Ѿ�, ��ձ޿� �Է�(?) -> ����

create table emp_cp as select 
from emp
select * from emp_cp;

-- �μ����� 'sales' �� ����� ���� ���� (emp_cp)
delete from emp
where deptno = (select deptno from dept where dname = 'SALES');

rollback;

---------------------------------------------------------------------------------------------------------------------

-- merge

/* ?merge into Table1?
     using Table2?
     on (����������)?
     when matched then?
     update set ������Ʈ ����?
     delete where ����?
     when not matched then?
     insert values(�÷��̸�); */

-- ������̺� �����ϴ� ����̸� ����� �޿��� 10% �λ��ϰ�,
-- �������� �ʴ� ����̸� ������̺� ������ �Է��Ѵ�

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






