-- 사원명, 급여, 월급(급여/12)를 출력하되 월급은 십단위에서 반올림하여 출력
select ename,sal, round(sal/12, -2) as wolgub
from emp; 

-- 사원명, 급여, 세금(급여의 3.3%)를 원단위 절삭하고 출력
select ename,sal, trunc(sal*0.033, -1) tax
from emp; 

-- smith의 정보를 사원번호, 성명, 담당업무(소문자) 출력
select empno, ename, lower(job) as job
from emp
where lower (ename) = 'smith';

-- 사원번호, 사원명(첫글자만 대문자), 담당업무(첫글자만 대문자)로 출력
select empno, initcap(ename),  initcap(job)
from emp;

-- 이름의 첫글자가 ‘K’보다 크고 ‘Y’보다 작은 사원의 정보( 사원번호, 이름, 업무, 급여, 부서번호)를 출력하되 이름순으로 정렬
select empno, ename, job, sal, deptno 
from emp
where substr(ename,1,1)>'K' and substr(ename,1,1)<'Y'
order by ename;

-- 이름이 5글자 이상인 사원들을 출력
select *
from emp
where length (ename)>=5;

-- 이름을 15자로 맞추고 글자는 왼쪽에 오른쪽에는 ‘*’로 채운다
select rpad (ename,15,'*')
from emp;

-- 급여는 10자로 맞추고 숫자는 오른쪽에 왼쪽엔 ‘-‘로 채운다
select lpad(sal,10,'-')
from emp;

-- 급여를 숫자에서 ‘영일이삼사오육칠팔구’ 글자로 대체
select sal, translate (sal, '0123456789','영일이삼사오륙칠팔구') kor_sal
from emp;

-- 급여의 숫자에서 0을 ‘$’로 바꾸어 출력
select sal, replace (sal,0,'$') char_sal
from emp;

select name, substr(jumin, 8,1), gender
from info_tab;

select sysdate
from dual;

select '-' || trim(' 이순신 ') || '-' as col1, 

'-' || ltrim(' 이순신 ') || '-' as col2, 

'-' || rtrim(' 이순신 ') || '-' as col3 

from dual; -- 오라클 고유 테이블 

-- ***모든 공백제거
select replace ( '   이   순   신   ', ' ', '' ) as ename
from dual;

-- 현재까지 근무일 수가 많은 사람 순으로 출력
select ename, hiredate, ceil (sysdate - hiredate) as 근무일수
from emp
order by sysdate - hiredate desc nulls last;

-- 현재까지 근무일 수가 몇 주 몇 일인가를 출력
select ename, sysdate-hiredate, 
           trunc ((sysdate-hiredate)/7,0) as weeks,
           floor ( mod (sysdate-hiredate, 7)) as days
from emp;

-- (*) 10번 부서의 사원의 현재까지의 근무 월수를 계산 
--select trunc((sysdate - hiredate)/30,0) 
select ename, floor (month_between (sysdate, hiredate))
from emp 
where deptno = 10;

-- 현재 날짜에서 3개월 후의 날짜 구하기
select add_months( sysdate, 3 ) as mydate 
from dual;

-- 현재 날짜에서 돌아오는 ‘월’요일의 날짜 구하기
select next_day (sysdate,'월') as myday
from dual;

select next_day (sysdate, 2) as myday
from dual;

-- 현재 날짜에서 해당 월의 마지막 날짜 구하기
select last_day (sysdate) as theday
from dual;

-------------------------------------------------------------------------------

-- 입사일자에서 입사년도를 출력
select ename, hiredate, to_char(hiredate,'YYYY') as hire_year
from emp;

-- 입사일자를 ‘1999년 1월 1일’ 형식으로 출력
select ename, hiredate, to_char(hiredate, 'yyyy') as hiredate
from emp;

-- 1981년도에 입사한 사원 검색
select *
from emp
where to_char(hiredate,'yyyy') = 1981;

select *
from emp
where extract(year from hiredate) = 1981;

-- 5월에 입사한 사원 검색
select *
from emp
where to_char(hiredate, 'MM') = 05;

-- 급여 앞에 $를 삽입하고 3자리 마다 ,를 출력
select ename, sal, to_char(sal, '$999,999,999,999') as dollar
from emp;

-- 81년 2월에 입사
select *
from emp
where to_char(hiredate,'yyyy-mm') in ('1981-02');

-- 81년 입사하지 않은
select *
from emp
where to_char(hiredate,'yyyy')  not in ('1981');

select *
from emp
where to_char(hiredate,'yyyy') != 1981;

-- 81년 하반기에 입사 
select *
from emp
where  to_char (hiredate,'yyyy-mm') between '1981-07' and '1981-12';

-------------------------------------------------------------

SELECT decode( substr(jumin, 8, 1), '1', '남자', '3', '남자', '여자') AS gender FROM info_tab;


SELECT CASE substr( jumin, 8, 1) 

            WHEN '1' THEN '남자'
            WHEN '3' THEN '남자'
            ELSE '여자'
            END as gender

FROM info_tab;


-- 부서번호가 10이면 영업부, 20이면 관리부, 30이면 IT부 그 외는 기술부로 출력

SELECT ename, deptno, decode (deptno,10,'영업부',20,'관리부',30,'IT부','기술부') as "부서"
from emp;

select deptno, 
            case when deptno = 10 then '영업부'
                      when deptno = 20 then '관리부'
                      when deptno = 30 then 'IT부'
            else '기술부'
            end as "부서이름"
from emp;


-- 업무(job)이 analyst이면 급여 증가가 10%이고 clerk이면 15%, manager이면 20%인 경우 사원번호, 사원명, 업무, 급여, 증가한 급여를 출력
SELECT empno, ename, job, sal, decode (job, 'ANALYST', sal*1.1, 'CLERK', sal*1.15, 'MANAGER',sal*1.2)  as "증가된 급여"
from emp;

SELECT empno, ename, job, sal, case job
                when  'ANALYST' then sal*1.1
                when 'CLERK' then sal*1.15
                when 'MANAGER' then sal*1.2
                else sal
                end as "증가된 급여"
from emp;

----------------------------------------------------------

select distinct job from emp;
desc emp;

select rownum, empno, ename, job
from emp 
where rownum<=5;

----------------------------------------------------------

-- 업무가 'salesman'인 사람들의 월급 평균, 총합, 최소값, 최대값을 구하기
select avg(sal) avg, sum(sal) sum, min (sal) min, max (sal) max
from emp
where job = 'SALESMAN';

insert into emp (empno, ename, job)
values (9001,'홍길국', 'SALESMAN');

rollback;

-- 커미션을 받는 사람들의 수
select count (comm)
from emp
where comm != 0;

----------------------------------------------------------

-- 부서별로 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기
select deptno, count (*), avg(sal), min(sal), max(sal), sum(sal)
from emp
-- where
group by deptno;
-- having

-- 부서별로 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기 ( 부서별 급여의 합이 높은 순으로
select deptno, count(*), avg(sal), min(sal), max(sal), sum(sal)
from emp
group by deptno
order by 6 desc;
-- order by sum(sal) desc;


-- 부서별 업무별 그룹하여 부서번호, 업무, 인원수, 급여의 평균, 급여의 합을 구하기
select deptno "부서번호", job "업무", count(empno) "인원", floor(avg(sal)) "평균급여", sum(sal) "급여의 합"
from emp
group by deptno, job;

-- 최대 급여가 2900 이상인 부서에 대해 부서번호, 평균 급여, 급여의 합을 출력
select deptno "부서번호", floor(avg(sal)) "평균급여", sum(sal) "급여의 합"
from emp
group by deptno
having max(sal) > 2900;

-- 업무별 급여의 평균이 3000이상인 업무에 대해 업무명, 평균 급여, 급여의 합을 출력
select job "업무명", floor(avg(sal)) "평균급여", sum(sal) "급여의 합"
from emp
group by job
having avg(sal) >= 3000;

-- 전체 합계 급여가 5000를 초과하는 각 업무에 대해서 업무와 급여 합계를 출력
--단, SALESMAN은 제외하고 급여 합계가 높은 순으로 정렬
select job "업무명",  sum(sal) "급여의 합"
from emp
group by job
having sum(sal) > 5000 and job not like 'SA_%'
order by sum(sal) desc;

-- 업무별 최고 급여와 최소 급여의 차이를 구하라
select job, max(sal)-min(sal)
from emp
group by job;


-- 부서 인원이 4명 보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력
select deptno, count(*) "부서 인원", sum(sal) "급여의 합"
from emp
group by deptno
having count(*) >4;





