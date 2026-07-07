
USE COLLEGE;

CREATE SCHEMA School;

CREATE TABLE Student(
StudentID int primary key auto_increment,
Name varchar(100),
Email varchar(100) unique,
Department varchar(50)
 );
 
 CREATE TABLE Instructor(
 InstructorID INT PRIMARY KEY auto_increment,
 NAME varchar(100),
 Department varchar(50)
 );
 
 CREATE TABLE course(
 CourseID int primary key auto_increment,
 Title varchar(100),
 Code varchar(100) unique,
 Credithours int,
 InstructorID int,
 foreign key(instructorID)references instructor(Instructorid)
 );
 
 CREATE TABLE Registration(
 RegID int primary key auto_increment,
 StudentID int,
 CourseID int,
 Semester varchar(10),
 RegDate date,
 foreign key (StudentID) references Student(StudentID),
 foreign key(CourseID) references Course (CuorseID),
 unique(StudentID,CourseID,Semester)
 );
 
 CREATE index idx_course_code ON Course(Code);
CREATE index idx_student_dept ON Course(Code);
CREATE index idx_registration_semester ON Registration(Semester);
CREATE index idx_registration_student ON Registration(StudentID);
CREATE index idx_registaration_course ON Registration(CourseID);

INSERT INTO Student (Name, Email, Deparment) VALUES
('Alice Manesa','alice.manesah@uni.edu','Computer Science'),
('Benard Owusu','benard.owusu@uni.edu','Mathematics'),
('Clara Addo', 'clara.addo@uni.edu','Physics'),
('Danielle Asare','daniele.asare@uni.edu','Computer Science'),
('Ellen Dapaah','ellen.dappaah@uni.edu','Chemistry'),
('Francis Tetteh','fracis.tetteh@uni.edu''Biology'),
('Grace Obeng','grace.obeng@uni.edu','Pyhsics'),
('Henry Archin','henry.archin@uni.edu','Mathematics'),
('Ivy Boateng','ivy.boateng@uni.edu','Chemistry'),
('John Kumah','john..kuma@uni.edu','Computer Science'),
('Katte Aponasah','kate.aponash@uni.edu','Biology'),
('Louis Yeboh','louis.yeboh@uni.edu');

insert into Instructor (Name, Department) values
('Dr. Kwamae Agyeman','Computer Science'),
('Dr. Afua Serwaa','Mathematic'),
('Dr. kofi Bouadu','Physics'),
('Dr. Janet Opuko','Chemistry'),
('Dr. Kojo Owusu','Biology'),
('Dr.Linda Nyarko','Computer Science'),
('Dr. James Osei','Mathematics'),
('Dr. Esi Tandoh','Physics'),
('Dr. Francsica Mensah','Chemistry'),
('Dr. Samuel Akoto','Biology'),
('Dr. George Quaye','Pyhsics'),
('Dr. Akua Danquah','Mathematics');

insert into Course (Title, Code, CreditHHours, InstructorID) values
('Introduction to programming','CSC101',3,1),
('Calculus I''MTH101',4,2),
('General Physics','PHY101',3,3),
('Organic Chemistry','CHM201',3,4),
('Data structures','CSC201',3,6),
('Linear Algebra','MTH201',4,7),
('Cell Biology','BIO101',3,5),
('Thermodynamics','PHY201',3,8),
('Web Development','CSC301',3,1),
('Analytic Chemistry','CHM301',3,9),
('Mordern Physics','PHY301',3.11),
('Discrete Mathematics','MTH301',3,12);

insert into Registration (StudentID,CourseID,Semester,RegDate) values
(1,1,'2023A','2023-01-15'),
(2,2,'2023A','2023-01-16' ),
(3,3,'2023B','2023-01-17'),
(4,5,'2023B','2023-08-10'),
(5,4,'2023B','2023-08-11'),
(6,7,'2023B','2023-08-12'),
(7,8,'2024A','2024-01-12'),
(8,6,'2024A','2024-01-13'),
(9,10,'2024A','2024-01-14'),
(10,9,'2024B','2024-08-20'),
(11,12,'2024B','2024-08-21'),
(12,11,'2024B','2024-08-22');

select 
 s.Name AS Student_Name,
 s.Department,
 c.Title AS Course_Title,
 c.code,
 r.semester,
 r.RegDate
 from Registration r
 join Student s on r.StudentID = s.StudentID
 join Course c on r.CourseID = c.CourseID
 order by s.name, r.Semester;
 
 select
  c.Title AS Course_Title,
   c.code,
count(r.RegID) as Number_of__Students
from Course c
left join Registration r on c.CourseID = r.CourseID
group by c.CourseId, c.Title,c.Code
order by Numbeer_of_Students desc;

select
 s.Name AS Student,
 c.Title AS Course,
 r.RegDate
 from Registration r
 join Student s on r.StudentID = s.StudentID
join Course c on r.CourseID = c.CourseID
where year(r.RegDate) = 2024
order by r.RegDate;

select
s.Name,
s.Email,
r.Semester,
r.RegDate
from Registration r
join Student s on r.StudentID = s.StudentID
join Course c on r.CourseID = c.CourseID
where s.Department = 'Computer Science'
and c.Title = 'Web Development';

  




 









 
 
 