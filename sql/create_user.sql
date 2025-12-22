-- Create new user 'letsfutsal' and database 'letsfutsal'
-- Do this only once per development DBMS
create database `letsfutsal`;
create user `letsfutsal`@`localhost` identified by 'letsfutsal';
grant all privileges on `letsfutsal`.* to `letsfutsal`@`localhost`;
flush privileges;
