USE db_example;

CREATE TABLE Class (
  ID        INT NOT NULL, 
  CourseID  INT NOT NULL, 
  StudentID INT NOT NULL, 
  PRIMARY KEY (ID));
 
CREATE TABLE Course (
  ID           INT NOT NULL, 
  DepartmentID INT NOT NULL, 
  LecturerID   INT NOT NULL, 
  CourseName   varchar(255), 
  PRIMARY KEY (ID));
 
CREATE TABLE Department (
  ID             INT NOT NULL, 
  DepartmentName varchar(255), 
  Location       varchar(255), 
  PRIMARY KEY (ID));
 
CREATE TABLE Lecturer (
  ID            INT NOT NULL, 
  DepartmentID  INT NOT NULL, 
  FirstName     varchar(255), 
  LastName      varchar(255), 
  LecturerPhone varchar(255), 
  PRIMARY KEY (ID));
 
CREATE TABLE Student (
  ID           INT NOT NULL, 
  FirstName    varchar(255), 
  LastName     varchar(255), 
  StudentPhone varchar(255), 
  PRIMARY KEY (ID));

ALTER TABLE Class ADD CONSTRAINT FKClassStudent FOREIGN KEY (StudentID) REFERENCES Student (ID);
ALTER TABLE Class ADD CONSTRAINT FKClassCourse FOREIGN KEY (CourseID) REFERENCES Course (ID);
ALTER TABLE Course ADD CONSTRAINT FKCourseLecturer FOREIGN KEY (LecturerID) REFERENCES Lecturer (ID);
ALTER TABLE Course ADD CONSTRAINT FKCourseDepartment FOREIGN KEY (DepartmentID) REFERENCES Department (ID);
ALTER TABLE Lecturer ADD CONSTRAINT FKLecturerDepartment FOREIGN KEY (DepartmentID) REFERENCES Department (ID);

INSERT INTO Student
VALUES 
  (1, 'Andi', 'Barshani', '081234567789'),
  (2, 'Bianka', 'Latusina', '081111222333'),
  (3, 'Cecilia', 'Pandrani', '081808180810');
 
INSERT INTO Department
VALUES 
  (1, 'Computer Science', 'Murray Hall'),
  (2, 'Mathematics', 'West Wing'),
  (3, 'Psychology', 'Tillett Hall');
 
INSERT INTO Lecturer
VALUES 
  (1, 1, 'Jianmin', 'Zuo', '91928938392'),
  (2, 2, 'Shami', 'Nejadi', '65128912833'),
  (3, 3, 'Christopher', 'Joyce', '652172187382');
 
INSERT INTO Course
VALUES 
  (1, 1, 1, 'Data Structure And Algorithm'),
  (2, 1, 1, 'Programming Languages'),
  (3, 2, 2, 'Mathematics for Machine Learning'),
  (4, 3, 3, 'Cognitive Psychology'),
  (5, 3, 3, 'General Psychology');
 
INSERT INTO Class
VALUES 
  (001, 1, 1),
  (002, 2, 2),
  (003, 3, 3),
  (004, 1, 2),
  (005, 1, 3),
  (006, 3, 2),
  (007, 5, 3);
