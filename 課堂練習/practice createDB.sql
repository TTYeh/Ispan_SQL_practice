-- 建立資料庫 school, DDL create--
create database school;

-- 使用資料庫
use school
-- 建立學生資料表
create table student(
s_id int primary key,
s_name varchar(20),
major varchar(20),
age int
)
-- 新增資料 --
insert into student(s_id,s_name,major,age)
values(1,'jack','cs',10);
insert into student(s_id,s_name,major,age)
values(2,'maria','cs',40);
insert into student(s_id,s_name,major,age)
values(3,'monkey','cs',30);
-- 讀取
select * from student
-- 更新
update student
set age = 100
where s_id = 1
-- 刪除
delete from student
where s_id = 3
-- 修改資料表
alter table student
add tel varchar(12);
-- 刪資料表
drop table student;

