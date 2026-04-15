# Student-Result-Management-System
Project Overview

The Student Result Management System is a database project designed to efficiently manage student academic records. It stores student details, subject information, exam data, and marks, and helps in calculating total scores, percentages, and grades.

🎯 Objective
Store student academic information
Manage subjects and exams
Record marks obtained by students
Calculate total marks, percentage, and grades
Generate reports for performance analysis
🛠️ Technologies Used
SQL (PostgreSQL / MySQL)
Database Concepts (DDL, DML)
Joins, Aggregations, Window Functions
🗂️ Database Schema
📘 Tables Used:
students
student_id (Primary Key)
student_name
age
class
subjects
subject_id (Primary Key)
subject_name
max_marks
exams
exam_id (Primary Key)
exam_name
exam_date
marks
mark_id (Primary Key)
student_id (Foreign Key)
subject_id (Foreign Key)
exam_id (Foreign Key)
marks_obtained
🔗 Relationships
One student can have multiple marks
One subject can be assigned to multiple students
One exam can include multiple subjects
📊 Key Features
✔️ Store and manage student data
✔️ Track subject-wise marks
✔️ Calculate total marks and percentage
✔️ Assign grades using CASE statements
✔️ Identify top-performing students
✔️ Use of JOIN, GROUP BY, and Window Functions
📌 Sample Queries
🔹 Total Marks Per Student
SELECT s.student_name, SUM(m.marks_obtained) AS total
FROM students s
JOIN marks m ON s.student_id = m.student_id
GROUP BY s.student_name;
🔹 Grade Calculation
SELECT s.student_name,
       SUM(m.marks_obtained) AS total,
       CASE 
           WHEN SUM(m.marks_obtained) >= 400 THEN 'A'
           WHEN SUM(m.marks_obtained) >= 300 THEN 'B'
           WHEN SUM(m.marks_obtained) >= 200 THEN 'C'
           ELSE 'FAIL'
       END AS grade
FROM students s
JOIN marks m ON s.student_id = m.student_id
GROUP BY s.student_name;
🚀 How to Run the Project
Clone the repository
Open your SQL tool (PostgreSQL / MySQL)
Run schema/create_tables.sql
Run data/insert_data.sql
Execute queries from queries/


📚 Learning Outcomes
Database design and normalization
Writing efficient SQL queries
Using joins and aggregations
Implementing real-world database systems
👩‍💻 Author

Vijaya Lakshmi

⭐ Acknowledgment

This project is created for learning and academic purposes to understand database management systems.
