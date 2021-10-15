create database SWP391_Prj_QuizPrac

use SWP391_Prj_QuizPrac
create table Account
(
userId int primary key,
[fullname] nvarchar(50) not null,
userTitle varchar(3),
email varchar(50) not null,
[password] varchar(50) not null,
phone varchar(10),
[address] nvarchar(150),
permission bit not null,
[status] varchar(10) not null
)
drop table Account


insert into Account values (1,'admin','Mr','lamndhe151284@fpt.edu.vn','111111','0375596151','Hai Duong',1,'active')
insert into Account values (2,N'Phạm Hùng Hà','Mr','haphhe151269@fpt.edu.vn','011201','0396314096',N'Hải Dương',0,'inactive')
insert into Account values (3,N'Lê Mạnh Hùng','Mr','hungle19052001@gmail.com','190501','0867680175',N'Thanh Hóa',0,'inactive')
insert into Account values (4,N'Trịnh Anh Quân','Mr','quantahe151524@fpt.edu.vn','280701','0867680175',N'Hà Nội',0,'inactive')
insert into Account values (5,N'Lê Hữu Phúc','Mr','phuclhhe151336@fpt.edu.vn','030701','0867680175',N'Hà Nội',0,'inactive')
insert into Account values (6,N'a duoi','Mr','nguyendailam05@gmail.com','04122001','0867680175',N'Hà Nội',0,'inactive')
insert into Account values (7,N'a duoi','Mr','nguyendailam07@gmail.com','04122001','0867680175',N'Hà Nội',0,'inactive')
insert into Account values (8,N'a duoi','Mr','nguyendailam08@gmail.com','04122001','0867680175',N'Hà Nội',0,'inactive')
insert into Account values (9,N'a duoi','Mr','nguyendailam09@gmail.com','04122001','0867680175',N'Hà Nội',0,'inactive')
insert into Account values (10,N'a duoi','Mr','nguyendailam010@gmail.com','04122001','0867680175',N'Hà Nội',0,'inactive')
insert into Account values (11,N'a duoi','Mr','nguyendailam011@gmail.com','04122001','0867680175',N'Hà Nội',0,'inactive')
insert into Account values (12,N'a duoi','Mr','nguyendailam12@gmail.com','04122001','0867680175',N'Hà Nội',0,'inactive')
insert into Account values (13,N'a duoi','Mr','nguyendailam13@gmail.com','04122001','0867680175',N'Hà Nội',0,'inactive')
insert into Account values (14,N'a duoi','Mr','nguyendailam14@gmail.com','04122001','0867680175',N'Hà Nội',0,'inactive')
insert into Account values (15,N'a duoi','Mr','nguyendailam15@gmail.com','04122001','0867680175',N'Hà Nội',0,'inactive')
insert into Account values (16,N'a duoi','Mr','nguyendailam16@gmail.com','04122001','0867680175',N'Hà Nội',0,'inactive')
insert into Account values (17,N'a duoi','Mr','nguyendailam17@gmail.com','04122001','0867680175',N'Hà Nội',0,'inactive')
insert into Account values (18,N'a duoi','Mr','nguyendailam18@gmail.com','04122001','0867680175',N'Hà Nội',0,'inactive')
create table Setting
(
settingId int identity(1,1) primary key,
[type] varchar(50) not null,
settingValue varchar(50) not null,
settingOrder int ,
[status] nvarchar(150),

)
drop table setting
select MAX(userId) from account 
insert into Setting([type],settingValue,settingOrder,[status]) values ('user_role','Admin',1,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('user_role','Guest',0,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('user_role','Customer',2,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('user_role','Marketing',3,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('user_role','Manager',4,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('user_role','Expert',5,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('quiz_category','Science',1,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('quiz_category','Math',2,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('quiz_category','Biology',3,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('quiz_category','Human Atanomy',4,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('Science','Quantum Physics',1,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('Science','Computer Science',2,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('Math','Algorithm',1,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('Math','Discrete Math',2,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('Biology','Human Disease',1,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('Biology','Plague',2,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('Human Atanomy','Skeleton',1,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('Human Atanomy','Muscle',2,'active')
select * from setting
create table Question
(
qId int identity(1,1) not null primary key ,
[subject] varchar(50),
category varchar(50) not null,
subcategory varchar(50),
[level] varchar(10),
[status] varchar(12),
quiz varchar(50),
content varchar(200),
media varchar(100),
explanation varchar(100)
)
drop table question
create table AnswerOption
(
qId int not null,
answer varchar(100),
[key] bit
)
drop table AnswerOption
insert into Question values ('SWP391','Science','Quantum Physics','Hard','Unpublished','Demoadf','Select abcd','','')
insert into Question values ('SWP391','Science','Quantum Physics','Hard','Unpublished','Demoadg','Select abcd','','')
insert into Question values ('SWP391','Science','Quantum Physics','Hard','Unpublished','Demoggggg','Select abcd','','')
insert into Question values ('SWP391','Science','Quantum Physics','Hard','Unpublished','Demo1231231','Select abcd','','')
insert into Question values ('SWP391','Science','Quantum Physics','Hard','Unpublished','Demoadfasdfvv','Select abcd','','')
insert into Question values ('SWP391','Science','Quantum Physics','Hard','Unpublished','Democxbxcvbv','Select abcd','','')
insert into Question values ('SWP391','Science','Quantum Physics','Hard','Unpublished','Demogfjfghn','Select abcd','','')
insert into Question values ('SWP391','Science','Quantum Physics','Hard','Unpublished','Demofv','Select abcd','','')
insert into Question values ('SWP391','Science','Quantum Physics','Hard','Unpublished','Demoa','Select abcd','','')
insert into Question values ('SWP391','Science','Quantum Physics','Hard','Unpublished','Demovvvvv','Select abcd','','')
insert into Question values ('SWP391','Science','Quantum Physics','Hard','Unpublished','Demog','Select abcd','','')

insert into Question values ('SWP391','Math','Algorithm','Hard','Unpublished','Demoadf','Select abcd','','')
insert into Question values ('SWP391','Math','Algorithm','Hard','Unpublished','Demoadg','Select abcd','','')
insert into Question values ('SWP391','Math','Algorithm','Hard','Unpublished','Demoggggg','Select abcd','','')
insert into Question values ('SWP391','Math','Discrete Math','Hard','Unpublished','Demo1231231','Select abcd','','')
insert into Question values ('SWP391','Math','Discrete Math','Hard','Unpublished','Demoadfasdfvv','Select abcd','','')
insert into Question values ('SWP391','Biology','Human Disease','Hard','Unpublished','Democxbxcvbv','Select abcd','','')
insert into Question values ('SWP391','Biology','Human Disease','Hard','Unpublished','Demogfjfghn','Select abcd','','')
insert into Question values ('SWP391','Human Atanomy','Muscle','Hard','Unpublished','Demofv','Select abcd','','')
insert into Question values ('SWP391','Human Atanomy','Muscle','Hard','Unpublished','Demoa','Select abcd','','')
insert into Question values ('SWP391','Human Atanomy','Skeleton','Hard','Unpublished','Demovvvvv','Select abcd','','')
insert into Question values ('SWP391','Human Atanomy','Skeleton','Hard','Unpublished','Demog','Select abcd','','')
select * from Question 
select * from AnswerOption where Qid=1
delete from question where qId=32

insert into AnswerOption values (1,'A:alsdkfjasldkfjs',0)
insert into AnswerOption values (1,'B:alsdkfjasldkfjs',1)
insert into AnswerOption values (2,'A:alsdkfjasldkfjs',0)
insert into AnswerOption values (2,'B:alsdkfjasldkfjs',1)
insert into AnswerOption values (2,'C:alsdkfjasldkfjs',0)
insert into AnswerOption values (3,'A:alsdkfjasldkfjs',1)
insert into AnswerOption values (3,'B:alsdkfjasldkfjs',0)
insert into AnswerOption values (3,'C:alsdkfjasldkfjs',0)
insert into AnswerOption values (4,'A:alsdkfjasldkfjs',1)
insert into AnswerOption values (4,'B:alsdkfjasldkfjs',0)
insert into AnswerOption values (4,'C:alsdkfjasldkfjs',0)
select * from Account
