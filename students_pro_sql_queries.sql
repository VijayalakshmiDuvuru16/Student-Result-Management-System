CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    age INT,
    class VARCHAR(20)
);

CREATE TABLE subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100),
    max_marks INT
);

CREATE TABLE exams (
    exam_id INT PRIMARY KEY,
    exam_name VARCHAR(50),
    exam_date DATE
);

CREATE TABLE marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    exam_id INT,
    marks_obtained INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
    FOREIGN KEY (exam_id) REFERENCES exams(exam_id)
);

--inserting values 
INSERT INTO students VALUES
(1,'Aarav',16,'10th'),
(2,'Diya',15,'10th'),
(3,'Rohan',16,'10th'), 
(4,'Sneha',15,'10th'),
(5,'Arjun',16,'10th'),
(6,'Meera',15,'10th'),
(7,'Rahul',16,'10th'), 
(8,'Anjali',15,'10th'),
(9,'Karan',16,'10th'),
(10,'Pooja',15,'10th'),
(11,'Vikram',16,'10th'), 
(12,'Neha',15,'10th'),
(13,'Suresh',16,'10th'),
(14,'Priya',15,'10th'),
(15,'Amit',16,'10th'), 
(16,'Kavya',15,'10th'),
(17,'Ravi',16,'10th'), 
(18,'Nisha',15,'10th'),
(19,'Manoj',16,'10th'), 
(20,'Divya',15,'10th'),
(21,'Harsha',16,'10th'),
(22,'Teja',15,'10th'),
(23,'Varun',16,'10th'),
(24,'Swathi',15,'10th'),
(25,'Ajay',16,'10th'), 
(26,'Deepika',15,'10th'),
(27,'Tarun',16,'10th'),
(28,'Bhavana',15,'10th'),
(29,'Gokul',16,'10th'),
(30,'Latha',15,'10th');

INSERT INTO subjects VALUES
(101,'Maths',100),
(102,'Science',100),
(103,'English',100),
(104,'Social',100),
(105,'Computer',100);

INSERT INTO exams VALUES
(201,'Mid Term','2026-03-01'),
(202,'Final Exam','2026-04-01');

INSERT INTO marks VALUES
(1,1,101,201,85),(2,2,102,201,78),(3,3,103,201,88),
(4,4,104,201,67),(5,5,105,201,91),(6,6,101,201,72),
(7,7,102,201,64),(8,8,103,201,89),(9,9,104,201,77),
(10,10,105,201,68),(11,11,101,201,90),(12,12,102,201,73),
(13,13,103,201,84),(14,14,104,201,69),(15,15,105,201,75),
(16,16,101,201,80),(17,17,102,201,66),(18,18,103,201,92),
(19,19,104,201,70),(20,20,105,201,88),(21,21,101,202,81),
(22,22,102,202,74),(23,23,103,202,86),(24,24,104,202,65),
(25,25,105,202,79),(26,26,101,202,83),(27,27,102,202,71),
(28,28,103,202,90),(29,29,104,202,68),(30,30,105,202,76);

select * from marks;
select * from students;
select * from exams;
select * from subjects;

--Total Marks per Student

select
s.student_id,
s.student_name,
sum(m.marks_obtained) over(partition by s.student_id) as total_marks
from students as s
join marks as m
on s.student_id = m.student_id;

--top performers
select
s.student_id,
s.student_name,
sum(m.marks_obtained) over(partition by s.student_id) as total_marks
from students as s
join marks as m
on s.student_id = m.student_id
order by total_marks desc
limit 2;

--grading system
select
s.student_name,
sum(m.marks_obtained)  as total_marks,
case 
	when sum(m.marks_obtained) >=90 then 'A'
	when sum(m.marks_obtained) >=80 then 'B'
	when sum(m.marks_obtained) >=70 then 'C'
	when sum(m.marks_obtained) >=60 then 'D'
	when sum(m.marks_obtained) >=50 then 'E'
	else 'Fail'
end as grade
from students as s
join marks as m
on s.student_id = m.student_id
group by s.student_name;
	