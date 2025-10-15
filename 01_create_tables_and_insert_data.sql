Create Tables
-- Students Table
CREATE TABLE Students (
 student_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(50),
 age INT,
 class VARCHAR(20),
 city VARCHAR(30)
);
-- Teachers Table
CREATE TABLE Teachers (
 teacher_id INT PRIMARY KEY AUTO_INCREMENT,
 teacher_name VARCHAR(50),
 department VARCHAR(30),
 salary DECIMAL(10,2)
);
-- Courses Table
CREATE TABLE Courses (
 course_id INT PRIMARY KEY AUTO_INCREMENT,
 course_name VARCHAR(50),
 teacher_id INT,
 FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);
-- Enrollments Table
CREATE TABLE Enrollments (
 enroll_id INT PRIMARY KEY AUTO_INCREMENT,
 student_id INT,
 course_id INT,
 grade VARCHAR(5),
 fees DECIMAL(10,2),
 FOREIGN KEY (student_id) REFERENCES Students(student_id),
 FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
2. Insert Sample Data
INSERT INTO Students (name, age, class, city) VALUES
('Amit Shah', 17, '10th', 'Ahmedabad'),
('Priya Patel', 19, '12th', 'Surat'),
('Ravi Mehta', 18, '11th', 'Baroda'),
('Neha Singh', 20, 'BSc', 'Ahmedabad'),
('Karan Joshi', 16, '9th', 'Delhi'),
('Sneha Rao', 21, 'BCom', 'Surat'),
('Manish Jain', 22, 'BSc', 'Baroda'),
('Alok Verma', 17, '10th', 'Ahmedabad'),
('Divya Desai', 18, '12th', 'Surat'),
('Rahul Shah', 19, 'BSc', 'Ahmedabad');
INSERT INTO Teachers (teacher_name, department, salary) VALUES
('Mr. Sharma', 'Mathematics', 45000),
('Mrs. Iyer', 'Science', 48000),
('Mr. Khan', 'Computer Science', 52000),
('Ms. Patel', 'English', 40000),
('Mr. Gupta', 'Commerce', 55000);
INSERT INTO Courses (course_name, teacher_id) VALUES
('Mathematics', 1),
('Physics', 2),
('Chemistry', 2),
('Computer Science', 3),
('English Literature', 4),
('Accounting', 5);
INSERT INTO Enrollments (student_id, course_id, grade, fees) VALUES
(1, 1, 'A', 20000),
(2, 1, 'B', 18000),
(3, 2, 'A', 22000),
(4, 3, 'C', 25000),
(5, 4, 'B', 15000),
(6, 5, 'A', 23000),
(7, 6, 'B', 24000),
(8, 1, 'A', 19000),
(9, 2, 'C', 21000),
(10, 4, 'A', 26000); this is dataset so how can i upload it