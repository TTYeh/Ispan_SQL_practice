-- �إ߸�Ʈw school, DDL create--
create database school;

-- �ϥθ�Ʈw
use school
-- �إ߾ǥ͸�ƪ�
create table student(
s_id int primary key,
s_name varchar(20),
major varchar(20),
age int
)
-- �s�W��� --
insert into student(s_id,s_name,major,age)
values(1,'jack','cs',10);
insert into student(s_id,s_name,major,age)
values(2,'maria','cs',40);
insert into student(s_id,s_name,major,age)
values(3,'monkey','cs',30);
-- Ū��
select * from student
-- ��s
update student
set age = 100
where s_id = 1
-- �R��
delete from student
where s_id = 3
-- �ק��ƪ�
alter table student
add tel varchar(12);
-- �R��ƪ�
drop table student;

