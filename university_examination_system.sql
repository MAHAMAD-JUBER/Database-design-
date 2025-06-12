create database university_examination_system;

use university_examination_system;

CREATE TABLE Department(
department_id INT not null primary key,
name varchar(250),
hod_id int
);


CREATE TABLE Faculty(
faculty_id INT not null primary key,
name varchar (250),
department_id INT,
foreign key (department_id) references Department(department_id) on delete cascade
);


CREATE TABLE Student(
student_id INT not null primary key,
name varchar(250), 
enrollment_number int,
department_id INT,
foreign key (department_id) references Department(department_id) on delete cascade
);


CREATE TABLE Course(
course_id INT not null primary key,
name varchar(250),
course_code varchar(50),
department_id INT,
faculty_id INT,
foreign key (department_id) references Department(department_id) on delete cascade,
foreign key (faculty_id) references Faculty(faculty_id) on delete cascade
);


CREATE TABLE Exam(
exam_id INT not null primary key,
name varchar(250),
exam_date date,
duration time,
total_marks INT,
course_id INT,
foreign key (course_id) references Course(course_id) on delete cascade
);


CREATE TABLE Student_exam_result(
result_id INT not null primary key,
student_id INT,
exam_id INT,
marks_obtained INT,
grade varchar(250),
foreign key (student_id) references Student(student_id) on delete cascade,
foreign key (exam_id) references Exam(exam_id) on delete cascade
);


INSERT INTO Department (department_id, name, hod_id) VALUES
(1, 'Computer Science', NULL),
(2, 'Electronics', NULL),
(3, 'Mechanical Engineering', NULL);


INSERT INTO Faculty (faculty_id, name, department_id) VALUES
(101, 'Dr. A. Verma', 1),
(102, 'Prof. B. Sharma', 2),
(103, 'Dr. C. Khan', 3);


INSERT INTO Student (student_id, name, enrollment_number, department_id) VALUES
(1001, 'Rahul Singh', 202301, 1),
(1002, 'Neha Mehta', 202302, 1),
(1003, 'Amit Rao', 202303, 2),
(1004, 'Priya Das', 202304, 3);


INSERT INTO Course (course_id, name, course_code, department_id, faculty_id) VALUES
(501, 'Database Systems', 'CS301', 1, 101),
(502, 'Digital Circuits', 'EC202', 2, 102),
(503, 'Thermodynamics', 'ME101', 3, 103);


INSERT INTO Exam (exam_id, name, exam_date, duration, total_marks, course_id) VALUES
(201, 'Midterm Exam - DB', '2025-05-01', '02:00:00', 50, 501),
(202, 'Final Exam - DB', '2025-06-10', '03:00:00', 100, 501),
(203, 'Midterm - Circuits', '2025-05-02', '02:00:00', 50, 502);


INSERT INTO Student_exam_result (result_id, student_id, exam_id, marks_obtained, grade) VALUES
(301, 1001, 201, 45, 'A'),
(302, 1002, 201, 38, 'B'),
(303, 1003, 203, 42, 'A'),
(304, 1001, 202, 88, 'A+'),
(305, 1002, 202, 76, 'B+');




























