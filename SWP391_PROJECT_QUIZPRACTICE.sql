create database SWP391_Prj_QuizPrac

use SWP391_Prj_QuizPrac

--Account
create table Account
(
userId int not null,
[fullname] nvarchar(50) not null,
userTitle varchar(3),
email varchar(50) not null,
[password] varchar(50) not null,
phone varchar(10),
[address] nvarchar(150),
permission int not null,
[status] varchar(10) not null,
constraint [PK_userID] primary key (userID)
)
--select * from Account

insert into Account values (1,'admin','Mr','lamndhe151284@fpt.edu.vn','111111','0375596151','Hai Duong',1,'active')
insert into Account values (2,N'Phạm Hùng Hà','Mr','haphhe151269@fpt.edu.vn','011201','0396314096',N'Hải Dương',3,'active')
insert into Account values (3,N'Lê Mạnh Hùng','Mr','hungle19052001@gmail.com','190501','0867680175',N'Thanh Hóa',0,'active')
insert into Account values (4,N'Trịnh Anh Quân','Mr','quantahe151524@fpt.edu.vn','280701','0867680175',N'Hà Nội',0,'active')
insert into Account values (5,N'Lê Hữu Phúc','Mr','phuclhhe151336@fpt.edu.vn','030701','0867680175',N'Hà Nội',0,'active')
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
insert into Account values (18,N'Phạm Hùng Hà','Mr','hungha19156@gmail.com','hungha1915','0396314096',N'Hải Dương',5,'active')
insert into Account values (19,'admin','Mr','test','1','0375596151','Hai Duong',5,'active')
insert into Account values (20,'admin','Mr','test1','1','0375596151','Hai Duong',2,'active')

--select * from Account



--Class
create table Class
(
classID int not null,
userID int not null,
[status] varchar(10),
[date] date,
constraint [PK_classID] primary key (classID),
constraint [FK_class_user] foreign key (userID) references Account(userId)
)

--Member
create table Member
(
classID int not null,
userID int not null,
constraint [FK_classID] foreign key (classID) references Class(classID)
)

--Setting
create table Setting 
(
settingID int,
[type] varchar(50) not null,
settingValue varchar(50) not null,
settingOrder int ,
[status] nvarchar(50),
constraint [PK_settingID] primary key (settingID)
)
--drop table Setting
insert into Setting values (1,'user_role','Admin',1,'active')
insert into Setting values (2,'user_role','Guest',0,'active')
insert into Setting values (3,'user_role','Customer',2,'active')
insert into Setting values (4,'user_role','Marketing',3,'active')
insert into Setting values (5,'user_role','Manager',4,'active')
insert into Setting values (6,'user_role','Expert',5,'active')
insert into Setting values (7,'category','c1',1,'active')
insert into Setting values (8,'category','c2',2,'active')
insert into Setting values (9,'c1','Science',1,'active')
insert into Setting values (10,'c1','Math',2,'active')
insert into Setting values (11,'c1','Biology',3,'active')
insert into Setting values (12,'c1','Human Atanomy',4,'active')
insert into Setting values (13,'c2','sub1',1,'active')
insert into Setting values (14,'c2','sub2',2,'active')
insert into Setting values (15,'c2','sub3',3,'active')
insert into Setting values (16,'c2','sub4',4,'active')
insert into Setting values (19,'post_category','Art & Design',1,'active')
insert into Setting values (20,'post_category','Business',2,'active')
insert into Setting values (21,'post_category','IT & Software',3,'active')
insert into Setting values (22,'post_category','Languages',4,'active')
insert into Setting values (23,'post_category','Programming',5,'active')
insert into Setting values (24,'post_category','Technology',6,'active')
insert into Setting values (25,'exam_category','Writing Exam',1,'active')
insert into Setting values (26,'exam_category','Listening Exam',2,'active')
insert into Setting values (27,'exam_category','Reading Exam',3,'active')
insert into Setting values (28,'exam_category','Multiple Choice Exam',4,'active')
insert into Setting values (29,'test_type','Free Test',1,'active')
insert into Setting values (30,'test_type','Quiz Practice',2,'active')
insert into Setting values (31,'test_type','Simulation Test',3,'active')
--Select * from Setting where [type] = 'post_category'

--select * from Setting

--Post
create table Post
(
postid int identity(1,1) primary key,
thumbnail varchar(1000) not null,
title nvarchar(70) not null,
brief nvarchar(4000), 
detail ntext not null,
post_cate int, 
author int not null,
featured varchar(1000),
[time] smalldatetime,
[status] varchar(10),
constraint [FK_post_author] foreign key (author) references Account(userId),
constraint [FK_post_cate] foreign key (post_cate) references Setting(settingID)
)

insert into Post values ('images\blog\blog3-1.png','Research of Learn training process','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',19,2,'abcdef','2019-02-14','Completed')
insert into Post values ('images\blog\blog3-2.png','Research of Learn training process','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',19,2,'abcdefghijk','2019-02-14','Completed')
insert into Post values ('images\blog\blog3-3.png','Research of Learn training process','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',21,2,'12yfaskfac','2019-02-14','Completed')
insert into Post values ('images\blog\details_2.png','Research of Learn training process','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',24,2,'abcdef','2019-02-14','Completed')
insert into Post values ('images\blog\details_2.png','How to Become Master In CSS within a Week','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',22,2,'abcdef','2019-02-14','Completed')
insert into Post values ('images\blog\details_2.png','Students work together to solve a problem','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',20,2,'abcdef','2019-02-14','Completed')
--select * from Post
--drop table Post

--Document
create table Document
(
docID int not null,
thumbnail varchar(1000) not null,
title nvarchar(70) not null,
brief nvarchar(4000), 
content ntext not null,
doc_cate nvarchar(50),
author int not null,
update_date date,
constraint [FK_doc_author] foreign key (author) references Account(userId)
)

insert into Document values(1,'pic\education-la-gi-1-1008x570.jpg','Quiz1','This is Quiz1 brief_info','This is Quiz1 post_content','DocumentCate1',3,'2021-5-19')
insert into Document values(2,'pic\Education-la-gi-2-e1623658098277.jpg','Quiz2','This is Quiz2 brief_info','This is Quiz2 post_content','DocumentCate2',3,'2018-3-29')
insert into Document values(3,'pic\Picture1-6.jpg','Quiz3','This is Quiz3 brief_info','This is Quiz3 post_content','DocumentCate3',3,'2021-4-20')
insert into Document values(4,'pic\Education-in-Spain-1-1920x1080.jpg','Quiz4','This is Quiz4 brief_info','This is Quiz4 post_content','DocumentCate1',4,'2020-9-9')
insert into Document values(5,'pic\edu.jpg','Quiz5','This is Quiz5 brief_info','This is Quiz5 post_content','DocumentCate2',2,'2021-7-15')
insert into Document values(6,'pic\pic/dreamstime_s_74311588.jpg','Quiz6','This is Quiz6 brief_info','This is Quiz6 post_content','DocumentCate3',5,'2018-2-23')
insert into Document values(7,'pic\30c65f19-8e87-457c-b22a-cb32f44f4dd0.jpg','Quiz7','This is Quiz7 brief_info','This is Quiz7 post_content','DocumentCate1',2,'2020-6-28')
insert into Document values(8,'pic\Picture1-6.jpg','Quiz8','This is Quiz8 brief_info','This is Quiz8 post_content','DocumentCate3',3,'2021-10-24')
insert into Document values(9,'pic\pic/education2.jpg','Quiz9','This is Quiz9 brief_info','This is Quiz9 post_content','DocumentCate1',3,'2017-10-15')
insert into Document values(10,'pic\education-la-gi-1-1008x570.jpg','Quiz10','This is Quiz10 brief_info','This is Quiz10 post_content','DocumentCate3',4,'2020-8-12')
--select * from Document

--Subject
create table [Subject]
(
subID int not null,
title nvarchar(70) not null,
[name] nvarchar(70),
[description] ntext,
category nvarchar(50),
author int not null,
featured varchar(1000),
[status] varchar(10),
constraint [PK_subID] primary key (subID),
constraint [FK_sub_author] foreign key (author) references Account(userId)
)
insert into [Subject] values (1,'t1','a1','description1','c1',1,'featured_1','published')
insert into [Subject] values (2,'t2','a2','description2','c2',2,'featured_2','published')
insert into [Subject] values (3,'t3','a3','description3','c3',5,'featured_3','published')
insert into [Subject] values (4,'t4','a4','description4','c4',3,'featured_4','published')
insert into [Subject] values (5,'t5','a5','description5','c5',4,'featured_5','published')
--select * from [Subject]

--Test
create table Test
(
testId int identity(1,1) primary key,
subID int not null,
[type] nvarchar(20),
start_time varchar(25),
duration int,
result float,
tag nvarchar(20),
ques_numb int,
ques_cate nvarchar(50),
ques_subcate nvarchar(50),
constraint [FK_test_subID] foreign key (subID) references [Subject](subID)
)
 insert into Test values (1,'Free Test','20-10-2022',120,80,'fail',12,'c1','Science')
 select * from test
--Dimension
create table Dimension
(
ID int,
[type] nvarchar(50),
dimension nvarchar(50),
subID int not null,
constraint [FK_dimension_subID] foreign key (subID) references [Subject](subID)
)

insert into Dimension values (1, 'Domain', 'Business', 1)
insert into Dimension values (2, 'Domain', 'Process', 1)
insert into Dimension values (3, 'Domain', 'People', 1)
insert into Dimension values (4, 'Group', 'Initialing', 1)
insert into Dimension values (5, 'Group', 'Initialing', 1)
insert into Dimension values (6, 'Group', 'Executing', 1)
--select * from Dimension
create table Lesson
(
lessonId  int identity(1,1) primary key,
subID int not null,
title nvarchar(100),
[status] nvarchar(20),
brief nvarchar(100),
content ntext,
constraint [FK_lesson_subID] foreign key (subID) references [Subject](subID)
)
insert into Lesson values (1,'abcd','published','day la lesson 1','alsdkfjasldkfjlsakdfjlaskdclknalsdkfjwreca')
insert into Lesson values (1,'abcd','published','day la lesson 1','alsdkfjasldkfjlsakdfjlaskdclknalsdkfjwreca')
insert into Lesson values (2,'abcd','published','day la lesson 1','alsdkfjasldkfjlsakdfjlaskdclknalsdkfjwreca')
insert into Lesson values (2,'abcd','published','day la lesson 1','alsdkfjasldkfjlsakdfjlaskdclknalsdkfjwreca')
insert into Lesson values (1,'abcd','published','day la lesson 1','alsdkfjasldkfjlsakdfjlaskdclknalsdkfjwreca')
select count(*) from Lesson where (content like '%%' or brief like '%%')
--PricePackage
create table PricePackage
(
pacID int,
package nvarchar(50),
duration int,
list_price float,
sale_price float,
[status] nvarchar(50),
subID int not null,
constraint [FK_package_subID] foreign key (subID) references [Subject](subID)
)
insert into PricePackage values (1,N'Gói truy cập 3 tháng',3,3600,3200,'Active',1)
insert into PricePackage values (2,N'Gói truy cập 6 tháng',6,5000,4500,'Inactive',1)
insert into PricePackage values (3,N'Gói truy cập vô thời hạn',NULL,10000,9800,N'Active',1)
--select * from PricePackage

--Quiz
create table QuizList(
	quizId int identity(1,1) primary key,
	name nvarchar(2000),
	[subject] int FOREIGN KEY REFERENCES Subject(subID),
	category nvarchar(100),
	[level] nvarchar(50),
	[type] nvarchar(50),
	quesNum int ,
	passRate int ,
	expert int FOREIGN KEY REFERENCES Account(userId)
  )
  insert into QuizList (name,[subject],category,[level],[type],quesNum,passRate,expert) values('discrete mathematics and its applications',1,'advanced math','university','free test',20,80,6)
  insert into QuizList (name,[subject],category,[level],[type],quesNum,passRate,expert) values('Mathematics for Engineering',1,'advanced math','university','free test',20,80,6)
  insert into QuizList (name,[subject],category,[level],[type],quesNum,passRate,expert) values('Statistics and Probability',1,'advanced math','university','free test',20,80,6)
  insert into QuizList (name,[subject],category,[level],[type],quesNum,passRate,expert) values('Programming Fundamentals',1,'c++ program','university','free test',20,80,4)
  insert into QuizList (name,[subject],category,[level],[type],quesNum,passRate,expert) values('Object-Oriented Programming',1,'OOP with Java','university','free test',20,80,4)



--Question
create table Question
(
qId int identity(1,1) primary key not null,
[subject] int not null,
category nvarchar(50),
subcategory nvarchar(50),
[level] nvarchar(10),
[status] varchar(50),
quiz int not null,
content ntext,
media ntext,
explanation nvarchar(1000),
constraint [FK_ques_subject] foreign key ([subject]) references [Subject](subID),
constraint [FK_ques_quiz] foreign key (quiz) references [QuizList](quizId)
)
insert into Question values (1,'c1','Science','university','Unpublished',1,'Select abcd','<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1069779253&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/adedmusicgroup" title="ADED Music Group" target="_blank" style="color: #cccccc; text-decoration: none;">ADED Music Group</a> · <a href="https://soundcloud.com/adedmusicgroup/pdld-cukak" title="Phố Đã Lên Đèn - Huyền Tâm Môn (Cukak Remix) [Official]" target="_blank" style="color: #cccccc; text-decoration: none;">Phố Đã Lên Đèn - Huyền Tâm Môn (Cukak Remix) [Official]</a></div>','')
insert into Question values (1,'c1','Science','university','Unpublished',1,'Select abcd','','')
insert into Question values (1,'c1','Science','university','Unpublished',1,'Select abcd','','')
insert into Question values (1,'c1','Math','university','Unpublished',1,'Select abcd','','')
insert into Question values (1,'c1','Math','university','Unpublished',1,'Select abcd','','')
insert into Question values (1,'c1','Math','university','Unpublished',1,'Select abcd','','')
insert into Question values (1,'c1','Biology','university','Unpublished',1,'Select abcd','','')
insert into Question values (1,'c1','Biology','university','Unpublished',1,'Select abcd','','')
insert into Question values (1,'c1','Human Atanomy','university','Unpublished',1,'Select abcd','','')
insert into Question values (1,'c1','Human Atanomy','university','Unpublished',1,'Select abcd','','')
insert into Question values (1,'c1','Human Atanomy','university','Unpublished',1,'Select abcd','','')

insert into Question values (2,'c2','sub1','university','Unpublished',2,'Select abcd','<iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1069779253&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/adedmusicgroup" title="ADED Music Group" target="_blank" style="color: #cccccc; text-decoration: none;">ADED Music Group</a> · <a href="https://soundcloud.com/adedmusicgroup/pdld-cukak" title="Phố Đã Lên Đèn - Huyền Tâm Môn (Cukak Remix) [Official]" target="_blank" style="color: #cccccc; text-decoration: none;">Phố Đã Lên Đèn - Huyền Tâm Môn (Cukak Remix) [Official]</a></div>','')
insert into Question values (2,'c2','sub1','university','Unpublished',2,'Select abcd','','')
insert into Question values (2,'c2','sub1','university','Unpublished',2,'Select abcd','','')
insert into Question values (2,'c2','sub2','university','Unpublished',2,'Select abcd','','')
insert into Question values (2,'c2','sub2','university','Unpublished',2,'Select abcd','','')
insert into Question values (2,'c2','sub3','university','Unpublished',2,'Select abcd','','')
insert into Question values (2,'c2','sub3','university','Unpublished',2,'Select abcd','','')
insert into Question values (2,'c2','sub3','university','Unpublished',2,'Select abcd','','')
insert into Question values (2,'c2','sub4','university','Unpublished',2,'Select abcd','','')
insert into Question values (2,'c2','sub4','university','Unpublished',2,'Select abcd','','')
insert into Question values (2,'c2','sub4','university','Unpublished',2,'Select abcd','','')


--Result
create table Result
(
userID int,
quesID int not null,
[status] varchar(10),
constraint [FK_result_quesID] foreign key (quesID) references Question(qId)
)

--AnswerOption
create table AnswerOption
(
qId int not null,
answer ntext,
[key] nvarchar(50),
)

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


--Slider
create table Slider
(
sliderID int identity(1,1),
title nvarchar(70) not null,
[image] varchar(1000),
backlink varchar(1000),
note ntext,
[status] varchar(10),
constraint [PK_sliderID] primary key (sliderID)
)
--Authorization
create table [Authorization](
permission int not null,
[url] varchar(50) not null
)

insert into [Authorization] values (1,'/AccountControl')
  insert into [Authorization] values (2,'/AccountControl')
  insert into [Authorization] values (3,'/AccountControl')
  insert into [Authorization] values (4,'/AccountControl')
  insert into [Authorization] values (5,'/AccountControl')
  insert into [Authorization] values (0,'/ResetPasswordServlet')
  insert into [Authorization] values (1,'/ResetPasswordServlet')
  insert into [Authorization] values (2,'/ResetPasswordServlet')
  insert into [Authorization] values (3,'/ResetPasswordServlet')
  insert into [Authorization] values (4,'/ResetPasswordServlet')
  insert into [Authorization] values (5,'/ResetPasswordServlet')
  insert into [Authorization] values (3,'/SliderListServlet')
  insert into [Authorization] values (3,'/SliderServlet')
  insert into [Authorization] values (3,'/postmanager')
  insert into [Authorization] values (0,'/DocumentControl')
  insert into [Authorization] values (1,'/DocumentControl')
  insert into [Authorization] values (2,'/DocumentControl')
  insert into [Authorization] values (3,'/DocumentControl')
  insert into [Authorization] values (4,'/DocumentControl')
  insert into [Authorization] values (5,'/DocumentControl')
  insert into [Authorization] values (0,'/DocumentDetailsServlet')
  insert into [Authorization] values (1,'/DocumentDetailsServlet')
  insert into [Authorization] values (2,'/DocumentDetailsServlet')
  insert into [Authorization] values (3,'/DocumentDetailsServlet')
  insert into [Authorization] values (4,'/DocumentDetailsServlet')
  insert into [Authorization] values (5,'/DocumentDetailsServlet')
  insert into [Authorization] values (1,'/SettingServlet')
  insert into [Authorization] values (1,'/AdminControl')
  insert into [Authorization] values (1,'/UserPaging')
  insert into [Authorization] values (1,'/UserDetail')
  insert into [Authorization] values (2,'/UserDetail')
  insert into [Authorization] values (3,'/UserDetail')
  insert into [Authorization] values (4,'/UserDetail')
  insert into [Authorization] values (5,'/UserDetail')
  insert into [Authorization] values (5,'/LessonList')
  insert into [Authorization] values (5,'/LessonDetail')
  insert into [Authorization] values (2,'/PracticeDetail')
  insert into [Authorization] values (2,'/practice-list')
  insert into [Authorization] values (5,'/QuestionPaging')
  insert into [Authorization] values (5,'/QuestionDetail')
  insert into [Authorization] values (5,'/UploadFileServlet')
  insert into [Authorization] values (5,'/getQuizBySubject')
  insert into [Authorization] values (5,'/getSubcategory')
  insert into [Authorization] values (0,'/getSubcategory')
  insert into [Authorization] values (1,'/getSubcategory')
  insert into [Authorization] values (2,'/getSubcategory')
  insert into [Authorization] values (3,'/getSubcategory')
  insert into [Authorization] values (4,'/getSubcategory')
--Exam
create table Exam
(
examID int identity(1,1),
title nvarchar(70) not null,
thumbnail varchar(1000),
exam_cate int,
brief nvarchar(4000),
content ntext,
[type] nvarchar(50),
[date] date,
constraint [PK_examID] primary key (examID),
constraint [FK_exam_cate] foreign key (exam_cate) references Setting(settingID)
)
--drop table Exam
insert into Exam values ('Writing Exam','https://timviec365.com/pictures/images/Psychometric-Test-la-gi-1.jpg',25,N'psychometric test là gì?',N'Psychometric tests are assessment tools used to objectively measure an individuals personality traits, aptitude, intelligence, abilities and behavioral style.','Free','2020-04-05')
insert into Exam values ('Reading Exam','https://www.testim.io/wp-content/uploads/2019/11/What-Is-Test-Automation.jpg',27,N'Automation test là gì?',N'Automation tests are assessment tools used to objectively measure an individuals personality traits, aptitude, intelligence, abilities and behavioral style.','Assigned','2020-02-01')
insert into Exam values ('Multiple Choice Exam','https://phungthaihoc.com/wp-content/uploads/2020/03/resultados-test_9.jpg',28,N'Multiple choice test là gì?',N'Multiple choice tests are assessment tools used to objectively measure an individuals personality traits, aptitude, intelligence, abilities and behavioral style.','Assigned','2021-04-12')
insert into Exam values ('Listening Exam','https://www.rhumsaintaubin.com/wp-content/uploads/2021/07/eq.jpg',26,'Listening Test 1','ahvbjaslnugsahojcqkcnoa','Assigned','2021-02-12')
--select * from Exam

