-- EX1
-- SELECT title, due_date
-- FROM assignments
-- WHERE course_id LIKE '%1234';

-- EX2
-- SELECT min(due_date)
-- FROM assignments

-- EX3
-- SELECT max(due_date)
-- FROM assignments

-- EX4
-- SELECT title, course_id
-- FROM  assignments
-- WHERE due_date LIKE '2024-10-08';

-- EX5
-- SELECT title, due_date
-- FROM  assignments
-- WHERE due_date LIKE '2024-10%';

-- EX6
SELECT due_date
FROM  assignments
WHERE status != 'Completed'
ORDER by due_date DESC
LIMIT 1;
