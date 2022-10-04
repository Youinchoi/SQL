-- �����, �޿�, ����(�޿�/12)�� ����ϵ� ������ �ʴ������� �ݿø��Ͽ� ���
select ename,sal, round(sal/12, -2) as wolgub
from emp; 

-- �����, �޿�, ����(�޿��� 3.3%)�� ������ �����ϰ� ���
select ename,sal, trunc(sal*0.033, -1) tax
from emp; 

-- smith�� ������ �����ȣ, ����, ������(�ҹ���) ���
select empno, ename, lower(job) as job
from emp
where lower (ename) = 'smith';

-- �����ȣ, �����(ù���ڸ� �빮��), ������(ù���ڸ� �빮��)�� ���
select empno, initcap(ename),  initcap(job)
from emp;

-- �̸��� ù���ڰ� ��K������ ũ�� ��Y������ ���� ����� ����( �����ȣ, �̸�, ����, �޿�, �μ���ȣ)�� ����ϵ� �̸������� ����
select empno, ename, job, sal, deptno 
from emp
where substr(ename,1,1)>'K' and substr(ename,1,1)<'Y'
order by ename;

-- �̸��� 5���� �̻��� ������� ���
select *
from emp
where length (ename)>=5;

-- �̸��� 15�ڷ� ���߰� ���ڴ� ���ʿ� �����ʿ��� ��*���� ä���
select rpad (ename,15,'*')
from emp;

-- �޿��� 10�ڷ� ���߰� ���ڴ� �����ʿ� ���ʿ� ��-���� ä���
select lpad(sal,10,'-')
from emp;

-- �޿��� ���ڿ��� �������̻�����ĥ�ȱ��� ���ڷ� ��ü
select sal, translate (sal, '0123456789','�����̻�����ĥ�ȱ�') kor_sal
from emp;

-- �޿��� ���ڿ��� 0�� ��$���� �ٲپ� ���
select sal, replace (sal,0,'$') char_sal
from emp;

select name, substr(jumin, 8,1), gender
from info_tab;

select sysdate
from dual;

select '-' || trim(' �̼��� ') || '-' as col1, 

'-' || ltrim(' �̼��� ') || '-' as col2, 

'-' || rtrim(' �̼��� ') || '-' as col3 

from dual; -- ����Ŭ ���� ���̺� 

-- ***��� ��������
select replace ( '   ��   ��   ��   ', ' ', '' ) as ename
from dual;

-- ������� �ٹ��� ���� ���� ��� ������ ���
select ename, hiredate, ceil (sysdate - hiredate) as �ٹ��ϼ�
from emp
order by sysdate - hiredate desc nulls last;

-- ������� �ٹ��� ���� �� �� �� ���ΰ��� ���
select ename, sysdate-hiredate, 
           trunc ((sysdate-hiredate)/7,0) as weeks,
           floor ( mod (sysdate-hiredate, 7)) as days
from emp;

-- (*) 10�� �μ��� ����� ��������� �ٹ� ������ ��� 
--select trunc((sysdate - hiredate)/30,0) 
select ename, floor (month_between (sysdate, hiredate))
from emp 
where deptno = 10;

-- ���� ��¥���� 3���� ���� ��¥ ���ϱ�
select add_months( sysdate, 3 ) as mydate 
from dual;

-- ���� ��¥���� ���ƿ��� ������������ ��¥ ���ϱ�
select next_day (sysdate,'��') as myday
from dual;

select next_day (sysdate, 2) as myday
from dual;

-- ���� ��¥���� �ش� ���� ������ ��¥ ���ϱ�
select last_day (sysdate) as theday
from dual;

-------------------------------------------------------------------------------

-- �Ի����ڿ��� �Ի�⵵�� ���
select ename, hiredate, to_char(hiredate,'YYYY') as hire_year
from emp;

-- �Ի����ڸ� ��1999�� 1�� 1�ϡ� �������� ���
select ename, hiredate, to_char(hiredate, 'yyyy') as hiredate
from emp;

-- 1981�⵵�� �Ի��� ��� �˻�
select *
from emp
where to_char(hiredate,'yyyy') = 1981;

select *
from emp
where extract(year from hiredate) = 1981;

-- 5���� �Ի��� ��� �˻�
select *
from emp
where to_char(hiredate, 'MM') = 05;

-- �޿� �տ� $�� �����ϰ� 3�ڸ� ���� ,�� ���
select ename, sal, to_char(sal, '$999,999,999,999') as dollar
from emp;

-- 81�� 2���� �Ի�
select *
from emp
where to_char(hiredate,'yyyy-mm') in ('1981-02');

-- 81�� �Ի����� ����
select *
from emp
where to_char(hiredate,'yyyy')  not in ('1981');

select *
from emp
where to_char(hiredate,'yyyy') != 1981;

-- 81�� �Ϲݱ⿡ �Ի� 
select *
from emp
where  to_char (hiredate,'yyyy-mm') between '1981-07' and '1981-12';

-------------------------------------------------------------

SELECT decode( substr(jumin, 8, 1), '1', '����', '3', '����', '����') AS gender FROM info_tab;


SELECT CASE substr( jumin, 8, 1) 

            WHEN '1' THEN '����'
            WHEN '3' THEN '����'
            ELSE '����'
            END as gender

FROM info_tab;


-- �μ���ȣ�� 10�̸� ������, 20�̸� ������, 30�̸� IT�� �� �ܴ� ����η� ���

SELECT ename, deptno, decode (deptno,10,'������',20,'������',30,'IT��','�����') as "�μ�"
from emp;

select deptno, 
            case when deptno = 10 then '������'
                      when deptno = 20 then '������'
                      when deptno = 30 then 'IT��'
            else '�����'
            end as "�μ��̸�"
from emp;


-- ����(job)�� analyst�̸� �޿� ������ 10%�̰� clerk�̸� 15%, manager�̸� 20%�� ��� �����ȣ, �����, ����, �޿�, ������ �޿��� ���
SELECT empno, ename, job, sal, decode (job, 'ANALYST', sal*1.1, 'CLERK', sal*1.15, 'MANAGER',sal*1.2)  as "������ �޿�"
from emp;

SELECT empno, ename, job, sal, case job
                when  'ANALYST' then sal*1.1
                when 'CLERK' then sal*1.15
                when 'MANAGER' then sal*1.2
                else sal
                end as "������ �޿�"
from emp;

----------------------------------------------------------

select distinct job from emp;
desc emp;

select rownum, empno, ename, job
from emp 
where rownum<=5;

----------------------------------------------------------

-- ������ 'salesman'�� ������� ���� ���, ����, �ּҰ�, �ִ밪�� ���ϱ�
select avg(sal) avg, sum(sal) sum, min (sal) min, max (sal) max
from emp
where job = 'SALESMAN';

insert into emp (empno, ename, job)
values (9001,'ȫ�汹', 'SALESMAN');

rollback;

-- Ŀ�̼��� �޴� ������� ��
select count (comm)
from emp
where comm != 0;

----------------------------------------------------------

-- �μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ�
select deptno, count (*), avg(sal), min(sal), max(sal), sum(sal)
from emp
-- where
group by deptno;
-- having

-- �μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ� ( �μ��� �޿��� ���� ���� ������
select deptno, count(*), avg(sal), min(sal), max(sal), sum(sal)
from emp
group by deptno
order by 6 desc;
-- order by sum(sal) desc;


-- �μ��� ������ �׷��Ͽ� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���ϱ�
select deptno "�μ���ȣ", job "����", count(empno) "�ο�", floor(avg(sal)) "��ձ޿�", sum(sal) "�޿��� ��"
from emp
group by deptno, job;

-- �ִ� �޿��� 2900 �̻��� �μ��� ���� �μ���ȣ, ��� �޿�, �޿��� ���� ���
select deptno "�μ���ȣ", floor(avg(sal)) "��ձ޿�", sum(sal) "�޿��� ��"
from emp
group by deptno
having max(sal) > 2900;

-- ������ �޿��� ����� 3000�̻��� ������ ���� ������, ��� �޿�, �޿��� ���� ���
select job "������", floor(avg(sal)) "��ձ޿�", sum(sal) "�޿��� ��"
from emp
group by job
having avg(sal) >= 3000;

-- ��ü �հ� �޿��� 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������ �޿� �հ踦 ���
--��, SALESMAN�� �����ϰ� �޿� �հ谡 ���� ������ ����
select job "������",  sum(sal) "�޿��� ��"
from emp
group by job
having sum(sal) > 5000 and job not like 'SA_%'
order by sum(sal) desc;

-- ������ �ְ� �޿��� �ּ� �޿��� ���̸� ���϶�
select job, max(sal)-min(sal)
from emp
group by job;


-- �μ� �ο��� 4�� ���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���
select deptno, count(*) "�μ� �ο�", sum(sal) "�޿��� ��"
from emp
group by deptno
having count(*) >4;





