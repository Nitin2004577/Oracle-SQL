Connect system/1234  --Connect with system which is provided by college where Query
    CREATE USER Nitin_kumar_Shah_23049298 IDENTIFIED BY 1234; -- create a New User 
GRANT CONNECT, RESOURCE to Nitin_Kumar_Shah-23049298;   --Giving privilege to user for access. 

-- Creating Student-3 table
CREATE TABLE Student_3 (
    student_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100),
    address VARCHAR2(200),
    enroll_date DATE,
    program_id NUMBER,
    CONSTRAINT fk_program_id FOREIGN KEY (program_id) REFERENCES Program_3(program_id)
);

-- Creating Program-3 table
CREATE TABLE Program_3 (
    program_id NUMBER PRIMARY KEY,
    program_name VARCHAR2(100),
    program_description VARCHAR2(500),
    program_duration NUMBER
);

-- Creating Student-Module-3 table
CREATE TABLE Student_Module_3 (
    student_id NUMBER,
    module_id NUMBER,
    PRIMARY KEY (student_id, module_id),
    CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES Student_3(student_id),
    CONSTRAINT fk_module_id FOREIGN KEY (module_id) REFERENCES Module_3(module_id)
);

-- Creating Module-3 table
CREATE TABLE Module_3 (
    module_id NUMBER PRIMARY KEY,
    module_name VARCHAR2(100),
    module_description VARCHAR2(500),
    duration NUMBER,
    credit_value NUMBER,
    teacher_id NUMBER,
    CONSTRAINT fk_teacher_id FOREIGN KEY (teacher_id) REFERENCES Teacher_3(teacher_id)
);

-- Creating Module-Resource-3 table
CREATE TABLE Module_Resource_3 (
    student_id NUMBER,
    module_id NUMBER,
    resource_id NUMBER,
    resource_status VARCHAR2(50),
    PRIMARY KEY (student_id, module_id, resource_id),
    CONSTRAINT fk_student_module_resource FOREIGN KEY (student_id, module_id) REFERENCES Student_Module_3(student_id, module_id),
    CONSTRAINT fk_resource_id FOREIGN KEY (resource_id) REFERENCES Resource_3(resource_id)
);

-- Creating Resource-3 table
CREATE TABLE Resource_3 (
    resource_id NUMBER PRIMARY KEY,
    title VARCHAR2(100),
    type VARCHAR2(50),
    description VARCHAR2(500),
    duration NUMBER
);

-- Creating Teacher-3 table
CREATE TABLE Teacher_3 (
    teacher_id NUMBER PRIMARY KEY,
    T_first_name VARCHAR2(50),
    T_last_name VARCHAR2(50),
    specialization VARCHAR2(100),
    content VARCHAR2(500),
    post_date DATE
);

-- Creating Module-Announcement-3 table
CREATE TABLE Module_Announcement_3 (
    module_id NUMBER,
    announcement_id NUMBER,
    student_id NUMBER,
    PRIMARY KEY (module_id, announcement_id, student_id),
    CONSTRAINT fk_module_id_announcement FOREIGN KEY (module_id) REFERENCES Module_3(module_id),
    CONSTRAINT fk_announcement_id FOREIGN KEY (announcement_id) REFERENCES Announcement_3(announcement_id),
    CONSTRAINT fk_student_id_announcement FOREIGN KEY (student_id) REFERENCES Student_3(student_id)
);

-- Creating Announcement-3 table
CREATE TABLE Announcement_3 (
    announcement_id NUMBER PRIMARY KEY,
    announcement_title VARCHAR2(200),
    content VARCHAR2(1000),
    post_date DATE,
    submission_date DATE
);

-- Creating Module-Assessment-3 table
CREATE TABLE Module_Assessment_3 (
    module_id NUMBER,
    student_id NUMBER,
    assessment_id NUMBER,
    PRIMARY KEY (module_id, student_id, assessment_id),
    CONSTRAINT fk_module_id_assessment FOREIGN KEY (module_id) REFERENCES Module_3(module_id),
    CONSTRAINT fk_student_id_assessment FOREIGN KEY (student_id) REFERENCES Student_3(student_id),
    CONSTRAINT fk_assessment_id FOREIGN KEY (assessment_id) REFERENCES Assessment_3(assessment_id)
);

-- Creating Assessment-3 table
CREATE TABLE Assessment_3 (
    assessment_id NUMBER PRIMARY KEY,
    assessment_title VARCHAR2(200),
    assessment_deadline DATE,
    weightage NUMBER,
    assessment_type VARCHAR2(50)
);

-- Creating Assessment-Result-3 table
CREATE TABLE Assessment_Result_3 (
    student_id NUMBER,
    assessment_id NUMBER,
    result_id NUMBER,
    module_id NUMBER,
    remark VARCHAR2(500),
    percentage NUMBER,
    grade VARCHAR2(10),
    rank NUMBER,
    PRIMARY KEY (student_id, assessment_id, result_id, module_id),
    CONSTRAINT fk_student_id_result FOREIGN KEY (student_id) REFERENCES Student_3(student_id),
    CONSTRAINT fk_assessment_id_result FOREIGN KEY (assessment_id) REFERENCES Assessment_3(assessment_id),
    CONSTRAINT fk_module_id_result FOREIGN KEY (module_id) REFERENCES Module_3(module_id)
);



-- Insert into Program_3
INSERT ALL
    INTO Program_3 (program_id, program_name, program_description, program_duration)
    VALUES (1, 'Computer Science', 'Study of computation and programming', 4)
    INTO Program_3 (program_id, program_name, program_description, program_duration)
    VALUES (2, 'Data Science', 'Focus on data analysis', 2)
    INTO Program_3 (program_id, program_name, program_description, program_duration)
    VALUES (3, 'Cybersecurity', 'Study of securing networks and systems', 3)
    INTO Program_3 (program_id, program_name, program_description, program_duration)
    VALUES (4, 'Artificial Intelligence', 'Study of intelligent systems', 3)
    INTO Program_3 (program_id, program_name, program_description, program_duration)
    VALUES (5, 'Software Engineering', 'Focus on software design and development', 4)
SELECT * FROM DUAL;

-- Insert into Teacher_3
INSERT ALL
    INTO Teacher_3 (teacher_id, T_first_name, T_last_name, specialization, content, post_date)
    VALUES (1, 'John', 'Doe', 'Artificial Intelligence', 'Content on AI basics', SYSDATE)
    INTO Teacher_3 (teacher_id, T_first_name, T_last_name, specialization, content, post_date)
    VALUES (2, 'Jane', 'Smith', 'Cybersecurity', 'Content on network security', SYSDATE)
    INTO Teacher_3 (teacher_id, T_first_name, T_last_name, specialization, content, post_date)
    VALUES (3, 'Emily', 'Brown', 'Data Science', 'Content on data visualization', SYSDATE)
    INTO Teacher_3 (teacher_id, T_first_name, T_last_name, specialization, content, post_date)
    VALUES (4, 'Michael', 'Johnson', 'Software Engineering', 'Content on Agile methodologies', SYSDATE)
SELECT * FROM DUAL;

-- Insert into Student_3
INSERT ALL
    INTO Student_3 (student_id, first_name, last_name, email, address, enroll_date, program_id)
    VALUES (101, 'Alice', 'Green', 'alice.green@example.com', '123 Elm St', SYSDATE, 1)
    INTO Student_3 (student_id, first_name, last_name, email, address, enroll_date, program_id)
    VALUES (102, 'Bob', 'White', 'bob.white@example.com', '456 Oak St', SYSDATE, 2)
    INTO Student_3 (student_id, first_name, last_name, email, address, enroll_date, program_id)
    VALUES (103, 'Charlie', 'Black', 'charlie.black@example.com', '789 Pine St', SYSDATE, 3)
    INTO Student_3 (student_id, first_name, last_name, email, address, enroll_date, program_id)
    VALUES (104, 'Daisy', 'Blue', 'daisy.blue@example.com', '101 Maple St', SYSDATE, 4)
SELECT * FROM DUAL;

-- Insert into Module_3
INSERT ALL
    INTO Module_3 (module_id, module_name, module_description, duration, credit_value, teacher_id)
    VALUES (1, 'Introduction to Programming', 'Basics of programming', 12, 4, 1)
    INTO Module_3 (module_id, module_name, module_description, duration, credit_value, teacher_id)
    VALUES (2, 'Data Structures', 'Advanced data storage techniques', 10, 4, 4)
    INTO Module_3 (module_id, module_name, module_description, duration, credit_value, teacher_id)
    VALUES (3, 'Network Security', 'Securing computer networks', 8, 3, 2)
SELECT * FROM DUAL;

-- Insert into Student_Module_3
INSERT ALL
    INTO Student_Module_3 (student_id, module_id)
    VALUES (101, 1)
    INTO Student_Module_3 (student_id, module_id)
    VALUES (102, 2)
    INTO Student_Module_3 (student_id, module_id)
    VALUES (103, 3)
    INTO Student_Module_3 (student_id, module_id)
    VALUES (104, 1)
SELECT * FROM DUAL;

-- Insert into Resource_3
INSERT ALL
    INTO Resource_3 (resource_id, title, type, description, duration)
    VALUES (1, 'Programming Guide', 'Document', 'Guide to basic programming', 5)
    INTO Resource_3 (resource_id, title, type, description, duration)
    VALUES (2, 'Data Structures Video', 'Video', 'Video on data structures', 3)
    INTO Resource_3 (resource_id, title, type, description, duration)
    VALUES (3, 'Network Security Book', 'Book', 'Textbook on network security', 10)
SELECT * FROM DUAL;

-- Insert into Module_Resource_3
INSERT ALL
    INTO Module_Resource_3 (student_id, module_id, resource_id, resource_status)
    VALUES (101, 1, 1, 'Completed')
    INTO Module_Resource_3 (student_id, module_id, resource_id, resource_status)
    VALUES (102, 2, 2, 'Pending')
    INTO Module_Resource_3 (student_id, module_id, resource_id, resource_status)
    VALUES (103, 3, 3, 'Completed')
SELECT * FROM DUAL;

-- Insert into Announcement_3
INSERT ALL
    INTO Announcement_3 (announcement_id, announcement_title, content, post_date, submission_date)
    VALUES (1, 'Module 1 Announcement', 'Details about Module 1', SYSDATE, SYSDATE + 7)
    INTO Announcement_3 (announcement_id, announcement_title, content, post_date, submission_date)
    VALUES (2, 'Module 2 Announcement', 'Details about Module 2', SYSDATE, SYSDATE + 7)
SELECT * FROM DUAL;

-- Insert into Module_Announcement_3
INSERT ALL
    INTO Module_Announcement_3 (module_id, announcement_id, student_id)
    VALUES (1, 1, 101)
    INTO Module_Announcement_3 (module_id, announcement_id, student_id)
    VALUES (2, 2, 102)
SELECT * FROM DUAL;

-- Insert into Assessment_3
INSERT ALL
    INTO Assessment_3 (assessment_id, assessment_title, assessment_deadline, weightage, assessment_type)
    VALUES (1, 'Final Exam', SYSDATE + 30, 50, 'Exam')
    INTO Assessment_3 (assessment_id, assessment_title, assessment_deadline, weightage, assessment_type)
    VALUES (2, 'Midterm', SYSDATE + 15, 30, 'Exam')
SELECT * FROM DUAL;

-- Insert into Module_Assessment_3
INSERT ALL
    INTO Module_Assessment_3 (module_id, student_id, assessment_id)
    VALUES (1, 101, 1)
    INTO Module_Assessment_3 (module_id, student_id, assessment_id)
    VALUES (2, 102, 2)
SELECT * FROM DUAL;

-- Insert into Assessment_Result_3
INSERT ALL
    INTO Assessment_Result_3 (student_id, assessment_id, result_id, module_id, remark, percentage, grade, rank)
    VALUES (101, 1, 1, 1, 'Excellent', 95, 'A+', 1)
    INTO Assessment_Result_3 (student_id, assessment_id, result_id, module_id, remark, percentage, grade, rank)
    VALUES (102, 2, 2, 2, 'Good', 85, 'A', 2)
SELECT * FROM DUAL;

-- Check data in Program_3
SELECT * FROM Program_3;

-- Check data in Teacher_3
SELECT * FROM Teacher_3;

-- Check data in Student_3
SELECT * FROM Student_3;

-- Check data in Module_3
SELECT * FROM Module_3;

-- Check data in Student_Module_3
SELECT * FROM Student_Module_3;

-- Check data in Resource_3
SELECT * FROM Resource_3;

-- Check data in Module_Resource_3
SELECT * FROM Module_Resource_3;

-- Check data in Announcement_3
SELECT * FROM Announcement_3;

-- Check data in Module_Announcement_3
SELECT * FROM Module_Announcement_3;

-- Check data in Assessment_3
SELECT * FROM Assessment_3;

-- Check data in Module_Assessment_3
SELECT * FROM Module_Assessment_3;

-- Check data in Assessment_Result_3
SELECT * FROM Assessment_Result_3;


SELECT 
    S.student_id, S.first_name, S.last_name, M.module_name 
FROM 
    Student_3 S
JOIN 
    Student_Module_3 SM ON S.student_id = SM.student_id
JOIN 
    Module_3 M ON SM.module_id = M.module_id;

SELECT * 
FROM Student_Module_3 SM 
WHERE NOT EXISTS (
    SELECT 1 
    FROM Student_3 S 
    WHERE S.student_id = SM.student_id
);

SELECT COUNT(*) FROM Program_3;

SELECT 
    P.program_name, 
    COUNT(S.student_id) AS total_students_enrolled
FROM 
    Program_3 P
LEFT JOIN 
    Student_3 S ON P.program_id = S.program_id
GROUP BY 
    P.program_name
ORDER BY 
    P.program_name;


SELECT 
    A.announcement_id, 
    A.announcement_title, 
    A.content, 
    A.post_date, 
    A.submission_date
FROM 
    Announcement_3 A
JOIN 
    Module_Announcement_3 MA ON A.announcement_id = MA.announcement_id
WHERE 
    MA.module_id = <MODULE_ID> -- Replace with the desired module ID
    AND A.post_date BETWEEN TO_DATE('2024-05-01', 'YYYY-MM-DD') AND TO_DATE('2024-05-28', 'YYYY-MM-DD')
ORDER BY 
    A.post_date;


SELECT 
    M.module_name, 
    COUNT(MR.resource_id) AS total_resources_uploaded
FROM 
    Module_3 M
LEFT JOIN 
    Module_Resource_3 MR ON M.module_id = MR.module_id
WHERE 
    M.module_name LIKE 'D%'
GROUP BY 
    M.module_name
ORDER BY 
    M.module_name;

SELECT 
    S.first_name || ' ' || S.last_name AS student_name, 
    P.program_name
FROM 
    Student_3 S
JOIN 
    Program_3 P ON S.program_id = P.program_id
LEFT JOIN 
    Module_Assessment_3 MA ON S.student_id = MA.student_id
WHERE 
    MA.module_id = <MODULE_ID> -- Replace with the desired module ID
    AND MA.assessment_id IS NULL;

SELECT 
    T.T_first_name || ' ' || T.T_last_name AS teacher_name, 
    COUNT(M.module_id) AS total_modules
FROM 
    Teacher_3 T
JOIN 
    Module_3 M ON T.teacher_id = M.teacher_id
GROUP BY 
    T.T_first_name, T.T_last_name
HAVING 
    COUNT(M.module_id) > 1
ORDER BY 
    teacher_name;

-- List the programs that are available in the college and the total number of students enrolled in each.
SELECT 
    P.program_name, 
    COUNT(S.student_id) AS total_students_enrolled
FROM 
    Program_3 P
LEFT JOIN 
    Student_3 S ON P.program_id = S.program_id
GROUP BY 
    P.program_name
ORDER BY 
    total_students_enrolled DESC;


SELECT 
    A.announcement_id, 
    A.announcement_title, 
    A.content, 
    A.post_date, 
    A.submission_date
FROM 
    Announcement_3 A
JOIN 
    Module_Announcement_3 MA ON A.announcement_id = MA.announcement_id
WHERE 
    MA.module_id = 1 -- Replace with the desired module ID
    AND A.post_date BETWEEN TO_DATE('2024-05-01', 'YYYY-MM-DD') AND TO_DATE('2024-05-28', 'YYYY-MM-DD')
ORDER BY 
    A.post_date;


SELECT 
    M.module_name, 
    COUNT(MR.resource_id) AS total_resources
FROM 
    Module_3 M
LEFT JOIN 
    Module_Resource_3 MR ON M.module_id = MR.module_id
WHERE 
    M.module_name LIKE 'D%'
GROUP BY 
    M.module_name
ORDER BY 
    total_resources DESC;


SELECT 
    S.first_name || ' ' || S.last_name AS student_name, 
    P.program_name
FROM 
    Student_3 S
JOIN 
    Program_3 P ON S.program_id = P.program_id
LEFT JOIN 
    Module_Assessment_3 MA ON S.student_id = MA.student_id
WHERE 
    (MA.module_id = 1 OR MA.module_id IS NULL) -- Replace 1 with the desired module ID
    AND MA.assessment_id IS NULL;


SELECT 
    T.T_first_name || ' ' || T.T_last_name AS teacher_name, 
    COUNT(M.module_id) AS total_modules
FROM 
    Teacher_3 T
JOIN 
    Module_3 M ON T.teacher_id = M.teacher_id
GROUP BY 
    T.T_first_name, T.T_last_name
HAVING 
    COUNT(M.module_id) > 1
ORDER BY 
    total_modules DESC;


SELECT 
    A.announcement_id, 
    A.announcement_title, 
    A.content, 
    A.post_date, 
    A.submission_date
FROM 
    Announcement_3 A
JOIN 
    Module_Announcement_3 MA ON A.announcement_id = MA.announcement_id
WHERE 
    MA.module_id = 1 -- Replace with the desired module ID
    AND A.post_date BETWEEN TO_DATE('2024-05-01', 'YYYY-MM-DD') AND TO_DATE('2024-05-28', 'YYYY-MM-DD')
ORDER BY 
    A.post_date;


-- DELETE ALL TABLE 
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE ANNOUNCEMENT CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE ASSESSMENT CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE ASSESSMENT_RESULT CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE MODULE CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE MODULE_ASSESSMENT CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE MODULE_RESOURCE CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE MODULE_TEACHER CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE PROGRAM CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE RESOURCES CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE RESULT CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE STUDENT CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE STUDENT_MODULE CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE TEACHER CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE TEACHER_ANNOUNCEMENT CASCADE CONSTRAINTS';
END;
/
