DROP DATABASE IF EXISTS jla;
CREATE DATABASE IF NOT EXISTS jla;
USE jla;

SELECT 'CREATING DATABASE STRUCTURE' as 'INFO';

DROP TABLE IF EXISTS employees; 

set default_storage_engine = Maria;

CREATE TABLE employees (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,    
    PRIMARY KEY (emp_no)
);

SELECT 'LOADING employees' as 'INFO';
INSERT INTO `employees` VALUES (10001,'1939-03-30','Bruce','Wayne','M'),
(10002,'1941-11-02','Arthur','Curry','M'),
(10003,'1980-10-03','Victor','Stone','M'),
(10004,'1956-10-01','Barry','Allen','M'),
(10005,'1959-10-21','Hal','Jordan','M'),
(10006,'1938-04-18','Clark','Kent','M'),
(10007,'1941-10-23','Diana','Prince','F');

