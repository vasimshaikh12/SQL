-- SQL Project Queries
-- Vasim
-- Contains 50 practice queries

SQL Queries 
1. Display all students from Ahmedabad.
SELECT * from students
where city = "Ahmedabad";
 
2. Find all courses taught by "Mr. Sharma".
SELECT teachers.*, courses.* 
from teachers
join 
courses
on teachers.teacher_id = courses.teacher_id
HAVING teacher_name = "Mr. Sharma";
 
3. Get details of students older than 18.
SELECT students.*,enrollments.*
from students
JOIN
enrollments
on students.student_id=enrollments.student_id
HAVING age >18;
 
4. Show all teachers in "Computer Science" department.
SELECT * from teachers
where department =  'Computer Science';
 
5. List all enrollments where fees > 20000.
SELECT * FROM enrollments
where fees>20000;
 
6. Display students ordered by name ASC.
SELECT * FROM students
ORDER by name;
 
7. Display teachers ordered by salary DESC.
SELECT * FROM `teachers`
ORDER by salary DESC;
 
8. List courses ordered by course_name ASC.
SELECT * FROM `courses`
ORDER by course_name;
 
9. Find students aged between 15 and 20.
SELECT * FROM `students`
where age BETWEEN 15 and 20;
 
10. Show teachers with salary between 30000 and 50000.
SELECT * FROM `teachers`
WHERE salary BETWEEN 30000 and 50000;
 
11. List enrollments with fees between 10000 and 25000.
SELECT * FROM `enrollments`
where fees BETWEEN 10000 and 25000;
 
12. Show students from cities ('Ahmedabad','Surat','Baroda').
SELECT * FROM `students`
where city IN ("Ahmedabad","Surat","Baroda");
 
13. Find students NOT from 'Delhi'.
SELECT * FROM `students`
where city != "Delhi";
 
14. List teachers from departments in ('Maths','Science').
SELECT * FROM `teachers`
where department in ("Mathematics","Science");
 
15. Count total number of students.
SELECT count(student_id) as total_number_of_students
 FROM `students
OR
SELECT student_id
 FROM `students`
 where student_id = (SELECT COUNT(student_id) as count FROM students);
 
16. Find average age of students.
SELECT AVG(age) as averageage
FROM students;
Averageage =18.7000
 
17. Find total fees collected from enrollments.
SELECT sum(fees) AS total_fees FROM enrollments;
 
18. Count how many courses are offered.
SELECT COUNT(course_name) as Total_courses  FROM courses;
 
19. Find average salary of teachers.
SELECT salary FROM `teachers`
where salary = (SELECT AVG(salary) as avg_salary FROM teachers);
 
20. Find maximum fees paid by a student.
SELECT * FROM `enrollments`
where fees = (SELECT max(fees) as max_fees_paid FROM enrollments);
OR
SELECT enrollments.*,students.* FROM `enrollments`
JOIN
Students on enrollments.student_id=students.student_id
where fees = (SELECT max(fees) as max_fees_paid FROM enrollments);
 
21. Count number of students in each city.
SELECT count(city) as  no_of_students_in_each_city,city from students
GROUP by city;
 
22. Find total fees collected per course.
SELECT courses.course_name, sum(enrollments.fees) as total_fee 
from courses
join 
enrollments
on courses.course_id=enrollments.course_id
GROUP by course_name;
 
23. Find average salary department-wise.
SELECT department,AVG(salary) as avg_salary 
FROM teachers
GROUP by department;
 
24. Count students per class, only show classes having more than 10 students.
SELECT count(student_id) as total_student,class FROM `students`
GROUP by class;
 
25. Find teachers per department, only show departments with more than 5 teachers.
SELECT *,COUNT(department) as dep_count from teachers
GROUP by department;
 
26. Find courses with average fees > 15000.
SELECT AVG(enrollments.fees) as avg_fees , courses.course_name
FROM enrollments
join 
courses
on enrollments.course_id=courses.course_id
GROUP by course_name
HAVING avg_fees > 15000;
 
27. Find cities having more than 3 students enrolled.
SELECT city, COUNT(student_id) as cunt_std
from students
GROUP by city
HAVING cunt_std >3;
 
28. Display student name with their enrolled course name.
SELECT students.name,courses.course_name
from
enrollments
INNER JOIN 
courses on enrollments.course_id=courses.course_id
INNER JOIN
students on students.student_id=enrollments.student_id;
 
 
29. Show course name with teacher name.
SELECT courses.course_name,teachers.teacher_name
FROM courses
LEFT JOIN
teachers
on courses.teacher_id=teachers.teacher_id;
 
30. List student name, course name, and fees.
SELECT students.name,courses.course_name ,enrollments.fees
from
enrollments
INNER JOIN 
courses on enrollments.course_id=courses.course_id
INNER JOIN
students on students.student_id=enrollments.student_id;
 
31. Find all students with their grades in each course.
SELECT enrollments.* , courses.course_name
FROM enrollments
inner JOIN
courses
on enrollments.course_id=courses.course_id;
 
32. Display teacher name with course name they teach.
SELECT teachers.teacher_name,courses.course_name
from teachers
INNER join 
courses
on teachers.teacher_id=courses.teacher_id;
 
33. Show students who have not enrolled in any course (LEFT JOIN).
34. Show courses with no students enrolled (RIGHT JOIN).
35. Display student-city wise courses.
SELECT enrollments.student_id,enrollments.course_id,courses.course_name,students.name,students.city
FROM enrollments
INNER join 
courses
on enrollments.course_id=courses.course_id
INNER JOIN
students
on enrollments.student_id=students.student_id;
 
36. Show course wise student count using join.
SELECT courses.course_name,COUNT(students.student_id) as countofstudnt 
FROM enrollments
INNER JOIN
students
on enrollments.student_id = students.student_id
INNER JOIN 
courses
on enrollments.course_id=courses.course_id
GROUP by courses.course_name;
 
37. List teachers and students connected through courses.
SELECT teachers.teacher_name,courses.course_name,enrollments.student_id,students.name
FROM teachers
join courses
on teachers.teacher_id=courses.teacher_id
JOIN enrollments
on courses.course_id=enrollments.course_id
JOIN students
on enrollments.student_id=students.student_id;
 
38. Find students who enrolled in course 'Mathematics'.
SELECT teachers.teacher_name,courses.course_name,enrollments.student_id,students.name
FROM teachers
join courses
on teachers.teacher_id=courses.teacher_id
JOIN enrollments
on courses.course_id=enrollments.course_id
JOIN students
on enrollments.student_id=students.student_id
HAVING courses.course_name="Mathematics"
 
39. List teachers who teach at least one course.
SELECT teachers.teacher_name,courses.course_name,courses.course_id
FROM teachers
join courses
on teachers.teacher_id=courses.teacher_id
JOIN enrollments
on courses.course_id=enrollments.course_id
JOIN students
on enrollments.student_id=students.student_id
HAVING courses.course_id>=1;
 
40. Find students who paid fees more than average fees.
SELECT teachers.teacher_name,courses.course_name,students.name,enrollments.fees
FROM teachers
join courses
on teachers.teacher_id=courses.teacher_id
JOIN enrollments
on courses.course_id=enrollments.course_id
JOIN students
on enrollments.student_id=students.student_id
WHERE enrollments.fees > (SELECT AVG(fees) as avgfees FROM enrollments);
 
OR
 
SELECT enrollments.student_id,students.name,enrollments.fees
FROM enrollments
INNER join students
on enrollments.student_id=students.student_id
where fees > (SELECT avg(fees) as avgfees from enrollments);
 
41. Show students who enrolled in more than 2 courses.
SELECT enrollments.student_id,students.name
FROM enrollments
INNER join students
on enrollments.student_id=students.student_id
where enrollments.enroll_id > (SELECT COUNT(enroll_id) as newenid FROM enrollments)
 
42. Find teachers whose salary is greater than average salary of all teachers.
SELECT * FROM teachers
where salary > (SELECT avg(salary) as newsalary FROM teachers)
 
43. Create a view StudentFeesView showing student name, course, and fees.
CREATE VIEW StudentFeesView11  AS
SELECT students.name,courses.course_name,enrollments.fees
FROM teachers
join courses
on teachers.teacher_id=courses.teacher_id
JOIN enrollments
on courses.course_id=enrollments.course_id
JOIN students
on enrollments.student_id=students.student_id;
 
44. Create a view TeacherSalaryView showing teacher_name and salary.
CREATE VIEW TeacherSalaryView11 AS
SELECT teacher_name,salary FROM `teachers`
 
45. Create a view CourseStatsView with course, total students enrolled.
CREATE VIEW CourseStatsView AS
SELECT 
    c.course_name,
    COUNT(e.student_id) AS total_students
FROM 
    courses c
JOIN 
    enrollments e
    ON c.course_id = e.course_id
GROUP BY 
    c.course_name
HAVING 
    COUNT(e.student_id) > 0;
 
46. Create a view CityWiseStudents showing city and count of students.
CREATE VIEW CityWiseStudents AS
SELECT 
    s.city, 
    COUNT(e.student_id) AS count_students
FROM 
    students s
JOIN 
    enrollments e 
    ON s.student_id = e.student_id
GROUP BY 
    s.city
HAVING 
    COUNT(e.student_id) > 0;
 
47. Create a view HighFeesStudents for students paying fees > 20000.
CREATE VIEW HighFeesStudents AS
SELECT enrollments.student_id,enrollments.fees
from enrollments
WHERE fees > 20000;
 
48. Find course-wise average fees, only show courses having avg fees > 20000.
SELECT avg(enrollments.fees) as avg_fees,courses.course_name
FROM enrollments
join 
courses
on enrollments.course_id=courses.course_id
GROUP by courses.course_name
HAVING avg(enrollments.fees) > 20000;
 
49. Display teacher name and total number of students under them.
SELECT teachers.teacher_name,count(enrollments.student_id) as noofstudnt
FROM teachers
join 
courses
on teachers.teacher_id=courses.teacher_id
JOIN enrollments
on courses.course_id=enrollments.course_id
GROUP by teachers.teacher_name;
 
50. Find city-wise total fees collected, order by highest to lowest.
SELECT students.city , sum(enrollments.fees) as totalfees
from enrollments
join students
on enrollments.student_id=students.student_id
GROUP by students.city
ORDER by totalfees DESC
