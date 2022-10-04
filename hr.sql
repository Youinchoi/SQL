-- ���� ���� --

-- 1. 2003�⿡ �Ի��� ������� ���, �̸�, �Ի����� ���
select employee_id, first_name || ' ' || last_name as name, hire_date
from employees
where to_char (hire_date, 'yyyy') = 2003;

-- 2. ������ FI_ACCOUNT / FI_MGR / SA_MAN / SA_REP �� ������� ������ ���
select *
from employees
where ( job_id = 'FI_ACCOUNT' or  job_id = 'FI_MGR' or  job_id = 'SA_MAN' or  job_id ='SA_REP');
-- in

-- 3. Ŀ�̼��� �޴� ������� ����� ���
select *
from employees
where commission_pct is not null;
?
-- 4.������ SA_MAN �Ǵ� SA_REP�̸� "�Ǹźμ�"�� �� �ܴ� "�� �� �μ�"��� ���
select job_id,
            case when job_id = 'SA_MAN' or  job_id = 'SA_REP' then '�Ǹźμ�'
            else '�� �� �μ�'
            end as "�μ��̸�"
from employees;

-- 5. �������� �Ի��ڵ��� �ּұ޿�, �ִ� �޿�, �޿��� ���� �׸��� ��� �޿��� ���Ͻÿ�
select  to_char (hire_date, 'yyyy') as year, min(salary), max(salary), sum(salary), ceil(avg(salary))
from employees
group by to_char (hire_date, 'yyyy')
order by to_char (hire_date, 'yyyy');

-- 6. �μ��� ��� �޿��� $10,000 �̻��� �μ��� ���Ͻÿ�. ( ��ձ޿��� ���� ������ )
select department_id, ceil(avg(salary))
from employees
group by department_id
having avg(salary) >= 10000
order by avg(salary) desc ;

-- 7. �μ��� �ִ� �޿��� ���Ͻÿ�
select department_id, max(salary)
from employees
group by department_id;

