--  TABLES FOR REGULAR ENTITIES --

--Create table entity for Person
CREATE TABLE Person (
  amka INT PRIMARY KEY, 
  surname VARCHAR(30) NOT NULL,
  name VARCHAR(30) NOT NULL,
  father_name VARCHAR(30) NOT NULL,
  email VARCHAR(40) NOT NULL
);

--table entiy for Professor
CREATE TABLE Professor(
  person_amka INTEGER NOT NULL REFERENCES Person(amka),
  rank ENUM('full', 'associate', 'assistant', 'lecturer'),
  PRIMARY KEY(person_amka)
);

--table for entity Lab Teacher
CREATE TABLE LabTeacher(
  teacher_amka INTEGER NOT NULL REFERENCES Person(amka),
  level ENUM('A', 'B', 'C', 'D'),
  PRIMARY KEY(teacher_amka)
);

CREATE TABLE Student(
  student_amka INTEGER NOT NULL REFERENCES Person(amka),
  am INTEGER NOT NULL UNIQUE
);


--table for entity course
CREATE TABLE Course(
  course_title CHAR(40) NOT NULL,
  typical_season ENUM('winter', 'spring'),
  typical_year INTEGER NOT NULL,
  course_code INTEGER PRIMARY KEY,
  lab_hours INTEGER,
  lecture_hours INTEGER,
  tutorial_hours INTEGER,
  course_description INTEGER,
  obligatory BOOLEAN,
  units INTEGER
);

--table for semester
CREATE TABLE Semester(
  semester_id INTEGER NOT NULL PRIMARY KEY,
  --academic_year INTEGER NOT NULL 
  --academic_season ENUM('winter', 'spring'),
  end_date INTEGER NOT NULL,
  semester_status ENUM('past', 'present', 'future'),
  start_date INTEGER NOT NULL
);

--table for entity lab
CREATE TABLE Lab(
  lab_id INTEGER NOT NULL PRIMARY_KEY,
  lab_title VARCHAR(40),
  lab_description VARCHAR(60),
  --field_codes 
);

CREATE TABLE Sector(
  sector_code INTEGER NOT NULL PRIMARY KEY,
  sector_title VARCHAR(40),
  sector_description VARCHAR(60)
);

-- TABLES FOR WEAK ENTITIES --

--table for entity CourseRun
CREATE TABLE CourseRun(
  exam_min INTEGER NOT NULL,
  lab_min INTEGER,
  exam_percentage INTEGER,
  serial_number INTEGER REFERENCES ,
  PRIMARY KEY(serial_number)
);



