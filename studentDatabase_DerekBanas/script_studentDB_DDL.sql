# SCRIPT - MySQl
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS tests;
DROP TABLE IF EXISTS scores;
DROP TABLE IF EXISTS absences;

CREATE TABLE student (
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NULL,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(50)  NOT NULL,
    state CHAR(2) NOT NULL DEFAULT "SP",
    zip MEDIUMINT UNSIGNED NOT NULL,
    phone VARCHAR(20)  NOT NULL,
    birth_date DATE NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    date_entered TIMESTAMP,
    lunch_cost FLOAT NULL,
    student_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE class (
    name VARCHAR(50) NOT NULL, 
    class_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE test (
    date DATE NOT NULL, 
    type ENUM('T', 'Q') NOT NULL,
    class_id INT UNSIGNED NOT NULL,
    test_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);

ALTER TABLE test
    ADD maxscore INT NOT NULL AFTER type;

CREATE TABLE score (
    student_id INT UNSIGNED NOT NULL,
    event_id INT UNSIGNED NOT NULL,
    score INT NOT NULL,
    PRIMARY KEY(event_id, student_id)
);

ALTER TABLE score
    CHANGE event_id test_id INT UNSIGNED NOT NULL;

CREATE TABLE absence (
    student_id INT UNSIGNED NOT NULL,
    date DATE NOT NULL,
    PRIMARY KEY(student_id, date)
);

RENAME TABLE
    absence to absences,
    test to tests,
    score to scores,
    class to classes,
    student to students;

ALTER TABLE absences
    ADD COLUMN test_taken char(1) not null default 'F'
    AFTER student_id;
    
alter table absences
    modify column test_taken enum('F', 'T') not null default 'F';
    
alter table absences
    drop column test_taken;
