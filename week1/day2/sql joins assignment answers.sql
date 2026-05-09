-- 1
select s.student_name, c.course_name
from students s
left join enrollments e
on s.student_id = e.student_id
left join courses c
on e.course_id = c.course_id;

-- 2
select c.course_id, c.course_name
from courses c
left join enrollments e
on c.course_id = e.course_id
where e.course_id is null;

-- 3
select i.instructor_name, c.course_name
from instructors i
left join courses c
on i.instructor_id = c.instructor_id;

-- 4
select course_id, course_name
from courses
where instructor_id is null;

-- 4 (using join)
select c.course_name
from courses c
left join instructors i
on c.instructor_id = i.instructor_id
where i.instructor_id is null;

-- 5
select *
from enrollments e
right join students s
on e.student_id = s.student_id;

-- 6
select s.student_name
from students s
left join enrollments e
on s.student_id = e.student_id
where e.student_id is null;

-- 7 (full outer join)
select s.student_name, e.enrollment_id, e.course_id, e.enrollment_date
from students s
left join enrollments e
on s.student_id = e.student_id

union

select s.student_name, e.enrollment_id, e.course_id, e.enrollment_date
from students s
right join enrollments e
on s.student_id = e.student_id;

-- 8
select c.course_id, c.course_name
from courses c
left join enrollments e
on c.course_id = e.course_id
where e.course_id is null;

-- 9 (full outer join)
select *
from instructors i
left join courses c
on i.instructor_id = c.instructor_id

union

select *
from instructors i
right join courses c
on i.instructor_id = c.instructor_id;

-- 10
select s.student_name, c.course_name, i.instructor_name
from students s
left join enrollments e
on s.student_id = e.student_id
left join courses c
on e.course_id = c.course_id
left join instructors i
on c.instructor_id = i.instructor_id;
