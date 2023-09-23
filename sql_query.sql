-- SELECT ALL Students, on going Courses, And Lecturer
SELECT CONCAT(st.FirstName,' ',st.LastName) StudentName, StudentPhone, CourseName, 
CONCAT(lc.FirstName,' ',lc.LastName) LecturerName, LecturerPhone, DepartmentName, Location
FROM Student st INNER JOIN Class cl ON st.ID = cl.StudentID
INNER JOIN Course co ON cl.CourseID = co.ID
INNER JOIN Lecturer lc ON co.LecturerID = lc.ID
INNER JOIN Department dp ON lc.DepartmentID = dp.ID;

-- Select All Lecturer by Total courses 
SELECT CONCAT(lc.FirstName,' ',lc.LastName) LecturerName, COUNT(*) CourseTotal
FROM Lecturer lc
LEFT JOIN Course co ON lc.ID = co.LecturerID
GROUP BY 1 
ORDER BY 2 DESC;

-- Select Students by Total Courses
SELECT CONCAT(st.FirstName,' ',st.LastName) StudentName, COUNT(*) CourseTotal
FROM Student st LEFT JOIN Class cl ON st.ID = cl.StudentID
INNER JOIN Course co ON cl.CourseID = co.ID
GROUP BY 1 
ORDER BY 2 DESC;

-- Select Course Name by Total Student and Total Lecturer
SELECT CourseName,COUNT(StudentID) StudentTotal, COUNT(LecturerID) LecturerTotal
FROM Course co
LEFT JOIN Class cl ON co.ID = cl.CourseID
LEFT JOIN Student st ON cl.StudentID = st.ID
GROUP BY 1
ORDER BY 2 DESC;