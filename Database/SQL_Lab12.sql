-- Ex1
-- SELECT concat(course_name, ' - ', semester)
-- FROM courses

-- Ex2
-- SELECT course_id, course_name, lab_time
-- FROM courses
-- WHERE lab_time like 'Fri%';

-- Ex3
-- SELECT status, due_date
-- FROM  assignments
-- WHERE due_date > '2024-11-21'
-- order by due_date

-- Ex4
-- SELECT SUBSTRING(status, 1, 11) AS prefix, COUNT(*)
-- FROM assignments
-- group by prefix;

-- Ex5
-- SELECT concat(course_name,length(course_name))
-- FROM courses
-- order by course_name desc
-- LIMIT 1;

--Ex6
-- SELECT upper(course_name)
-- FROM courses;

--Ex7
-- SELECT title, due_date
-- FROM assignments
-- where due_date like '202%-09%';

-- Ex8
-- INSERT INTO assignments (course_id, title, status, due_date) 
-- VALUES ('COMP1238', 'Assignment with no date', 'Not Started', 'NULL');
-- SELECT course_id, due_date
-- FROM assignments
-- WHERE due_date LIKE 'NULL';








