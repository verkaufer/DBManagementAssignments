--LAB


-- list all departments and the number of people in each
select departments.name, count(*)
from people
join departments on people.did = departments.did
group by departments.name

-- list all fiscal years and the number of people hired in that time span
select fy.year, count(people.pid) as "Number hired"
from fy
join people on fy.start < people.hiredate AND fy.enddate > people.hiredate
group by fy.year

-- list all fiscal years and # of departments found in that time span
select fy.year, count(departments.did)
from fy
LEFT OUTER JOIN departments on departments.dateformed >= fy.start AND departments.dateformed <= fy.enddate
group by year

-- list departments with no people
select d.*
from departments d
where did NOT IN (select did from people)

-- list people with no departments

select people.firstName, people.lastName, departments.did
from people
full outer join departments on departments.did = people.did
where firstName = '' AND lastName = '';

--list people hired before department was founded