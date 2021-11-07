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
insert into Account values (3,N'Lê Mạnh Hùng','Mr','hungle19052001@gmail.com','190501','0867680175',N'Thanh Hóa',3,'active')
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
--select * from Account

--Authorization
create table [Authorization]
(
permission int not null,
[url] varchar(100),
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
update_date date
)

insert into Document values('pic/education-la-gi-1-1008x570.jpg','Quiz1','Le Manh Hung','2021-5-19','This is Quiz1 brief_info','Simply put, the work of most organizations would slow to a crawl without functioning IT systems. You’d be hard-pressed to find a business that doesn’t at least partially rely on computers and the networks that connect them. Maintaining a standard level of service, security and connectivity is a huge task, but it’s not the only priority or potential challenge on their plates.
More and more companies want to implement more intuitive and sophisticated solutions. “IT can provide the edge a company needs to outsmart, outpace and out-deliver competitors,” says Edward Kiledjian, a Chief Information Security Officer and technology blogger. Let’s take a look at the needs that current and future IT specialists will be working on','DocumentCate1')
insert into Document values('pic/Education-la-gi-2-e1623658098277.jpg','Quiz2','Nguyen Thi Cuc','2018-3-29','This is Quiz2 brief_info',' it can be hard to separate worthwhile content from all the noise. So the BizTech team has crawled the web and put together this list of the 50 Must-Read IT Blogs for your convenience. 
Our list is a mix of independent, media, analyst and vendor blogs. You’ll recognize some big names, and you’ll find some unfamiliar names too (and if we’ve overlooked one of your favorite blogs, feel free to tell us in the comment section). Known or unknown, all of the blogs on this list have valuable content to contribute to the IT discussion.','DocumentCate2')
insert into Document values('pic/Picture1-6.jpg','Quiz3','Le Duy Hai','2021-4-20','This is Quiz3 brief_info','Simply put, the work of most organizations would slow to a crawl without functioning IT systems. You’d be hard-pressed to find a business that doesn’t at least partially rely on computers and the networks that connect them. Maintaining a standard level of service, security and connectivity is a huge task, but it’s not the only priority or potential challenge on their plates.
More and more companies want to implement more intuitive and sophisticated solutions. “IT can provide the edge a company needs to outsmart, outpace and out-deliver competitors,” says Edward Kiledjian, a Chief Information Security Officer and technology blogger. Let’s take a look at the needs that current and future IT specialists will be working on','DocumentCate3')
insert into Document values('pic/Education-in-Spain-1-1920x1080.jpg','Quiz4','Nguyen Dai Lam','2020-9-9','This is Quiz4 brief_info',' it can be hard to separate worthwhile content from all the noise. So the BizTech team has crawled the web and put together this list of the 50 Must-Read IT Blogs for your convenience. 
Our list is a mix of independent, media, analyst and vendor blogs. You’ll recognize some big names, and you’ll find some unfamiliar names too (and if we’ve overlooked one of your favorite blogs, feel free to tell us in the comment section). Known or unknown, all of the blogs on this list have valuable content to contribute to the IT discussion.','DocumentCate1')
insert into Document values('pic/edu.jpeg','Quiz5','Le Huu Phuc','2021-7-15','This is Quiz5 brief_info','Simply put, the work of most organizations would slow to a crawl without functioning IT systems. You’d be hard-pressed to find a business that doesn’t at least partially rely on computers and the networks that connect them. Maintaining a standard level of service, security and connectivity is a huge task, but it’s not the only priority or potential challenge on their plates.
More and more companies want to implement more intuitive and sophisticated solutions. “IT can provide the edge a company needs to outsmart, outpace and out-deliver competitors,” says Edward Kiledjian, a Chief Information Security Officer and technology blogger. Let’s take a look at the needs that current and future IT specialists will be working on','DocumentCate2')
insert into Document values('pic/dreamstime_s_74311588.jpg','Quiz6','Trinh Anh Quan','2018-2-23','This is Quiz6 brief_info',' it can be hard to separate worthwhile content from all the noise. So the BizTech team has crawled the web and put together this list of the 50 Must-Read IT Blogs for your convenience. 
Our list is a mix of independent, media, analyst and vendor blogs. You’ll recognize some big names, and you’ll find some unfamiliar names too (and if we’ve overlooked one of your favorite blogs, feel free to tell us in the comment section). Known or unknown, all of the blogs on this list have valuable content to contribute to the IT discussion.','DocumentCate3')
insert into Document values('pic/30c65f19-8e87-457c-b22a-cb32f44f4dd0.jpeg','Quiz7','Pham Hung Ha','2020-6-28','This is Quiz6 brief_info','Simply put, the work of most organizations would slow to a crawl without functioning IT systems. You’d be hard-pressed to find a business that doesn’t at least partially rely on computers and the networks that connect them. Maintaining a standard level of service, security and connectivity is a huge task, but it’s not the only priority or potential challenge on their plates.
More and more companies want to implement more intuitive and sophisticated solutions. “IT can provide the edge a company needs to outsmart, outpace and out-deliver competitors,” says Edward Kiledjian, a Chief Information Security Officer and technology blogger. Let’s take a look at the needs that current and future IT specialists will be working on','DocumentCate1')
insert into Document values('pic/Picture1-6.jpg','Quiz8','Le Duy Hung','2021-10-24','This is Quiz8 brief_info',' it can be hard to separate worthwhile content from all the noise. So the BizTech team has crawled the web and put together this list of the 50 Must-Read IT Blogs for your convenience. 
Our list is a mix of independent, media, analyst and vendor blogs. You’ll recognize some big names, and you’ll find some unfamiliar names too (and if we’ve overlooked one of your favorite blogs, feel free to tell us in the comment section). Known or unknown, all of the blogs on this list have valuable content to contribute to the IT discussion.','DocumentCate3')
insert into Document values('pic/education2.jpg','Quiz9','Le Manh Hung','2017-10-15','This is Quiz9 brief_info','Simply put, the work of most organizations would slow to a crawl without functioning IT systems. You’d be hard-pressed to find a business that doesn’t at least partially rely on computers and the networks that connect them. Maintaining a standard level of service, security and connectivity is a huge task, but it’s not the only priority or potential challenge on their plates.
More and more companies want to implement more intuitive and sophisticated solutions. “IT can provide the edge a company needs to outsmart, outpace and out-deliver competitors,” says Edward Kiledjian, a Chief Information Security Officer and technology blogger. Let’s take a look at the needs that current and future IT specialists will be working on','DocumentCate1')
insert into Document values('pic/education-la-gi-1-1008x570.jpg','Quiz10','Le Duy Hung','2020-8-12','This is Quiz10 brief_info',' it can be hard to separate worthwhile content from all the noise. So the BizTech team has crawled the web and put together this list of the 50 Must-Read IT Blogs for your convenience. 
Our list is a mix of independent, media, analyst and vendor blogs. You’ll recognize some big names, and you’ll find some unfamiliar names too (and if we’ve overlooked one of your favorite blogs, feel free to tell us in the comment section). Known or unknown, all of the blogs on this list have valuable content to contribute to the IT discussion.','DocumentCate3')
--select * from Document

insert into Setting([type],settingValue,settingOrder,[status]) values('doc_cate','DocumentCate1',1,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values('doc_cate','DocumentCate2',2,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values('doc_cate','DocumentCate3',3,'active')

--Subject
create table [Subject]
(
subID int not null,
title nvarchar(70) not null,
[name] nvarchar(70),
[description] ntext,
sub_cate nvarchar(50),
author int not null,
featured varchar(1000),
[status] varchar(10),
constraint [PK_subID] primary key (subID),
constraint [FK_sub_author] foreign key (author) references Account(userId)
)

insert into [Subject] values (8,'t1','a1','description1','sub_cate_1',1,'featured_1','published')
insert into [Subject] values (9,'t2','a2','description2','sub_cate_2',2,'featured_2','published')
insert into [Subject] values (,'t3','a3','description3','sub_cate_3',5,'featured_3','published')
insert into [Subject] values (4,'t4','a4','description4','sub_cate_4',3,'featured_4','published')
insert into [Subject] values (5,'t5','a5','description5','sub_cate_5',4,'featured_5','published')
select * from [Subject]

--Test
create table Test
(
testId int,
subID int not null,
[type] nvarchar(20),
start_time varchar(25),
duration int,
result float,
tag nvarchar(20),
ques_numb int,
ques_cate nvarchar(50),
ques_subcate nvarchar(50),
constraint [FK_test_subID] foreign key (subID) references [Subject](id)
)

 insert into Test values (1,1,'Free Test','20-10-2022',120,80,'fail',12,'c1','Science')
 
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
lessonId int,
subID int not null,
title nvarchar(100),
[status] nvarchar(20),
brief nvarchar(100),
content ntext,
constraint [FK_lesson_subID] foreign key (subID) references [Subject](id)
)
insert into Lesson values (1,1,'abcd','published','day la lesson 1','alsdkfjasldkfjlsakdfjlaskdclknalsdkfjwreca')
insert into Lesson values (2,1,'abcd','published','day la lesson 1','alsdkfjasldkfjlsakdfjlaskdclknalsdkfjwreca')
insert into Lesson values (3,2,'abcd','published','day la lesson 1','alsdkfjasldkfjlsakdfjlaskdclknalsdkfjwreca')
insert into Lesson values (4,2,'abcd','published','day la lesson 1','alsdkfjasldkfjlsakdfjlaskdclknalsdkfjwreca')
insert into Lesson values (5,1,'abcd','published','day la lesson 1','alsdkfjasldkfjlsakdfjlaskdclknalsdkfjwreca')
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
constraint [FK_package_subID] foreign key (subID) references [Subject](id)
)
insert into PricePackage values (1,N'Gói truy cập 3 tháng',3,3600,3200,'Active',1)
insert into PricePackage values (2,N'Gói truy cập 6 tháng',6,5000,4500,'Inactive',1)
insert into PricePackage values (3,N'Gói truy cập vô thời hạn',NULL,10000,9800,N'Active',1)
--select * from PricePackage

--Quiz
create table Quiz
(
quizID int not null,
title nvarchar(70) not null,
[subject] nvarchar(50),
quiz_cate nvarchar(50),
[level] nvarchar(10),
[type] nvarchar(20),
pass_rate float,
author int not null,
ques_numb int,
constraint [PK_quizID] primary key (quizID),
constraint [FK_quiz_author] foreign key (author) references Account(userId)
)
select * from [QuizList]
--Question
create table Question
(
quesID int not null,
subID int not null,
ques_cate nvarchar(50),
ques_subcate nvarchar(50),
[level] nvarchar(10),
quizID int not null,
content ntext,
media ntext,
explaination nvarchar(1000),
[status] varchar(50),
constraint [PK_quesID] primary key (quesID),
constraint [FK_ques_subID] foreign key (subID) references [Subject](subID),
constraint [FK_ques_quizID] foreign key (subID) references [Subject](subID)
)
insert into Question values (1,2,'Math','Algorithm','Hard','1','Select abcd','','','Unpublished')
insert into Question values (2,5,'Math','Algorithm','Hard','1','Select abcd','','','Unpublished')
insert into Question values (3,5,'Math','Algorithm','Hard','1','Select abcd','','','Unpublished')
insert into Question values (4,5,'Math','Discrete Math','Hard','2','Select abcd','','','Unpublished')
insert into Question values (5,1,'Math','Discrete Math','Hard','2','Select abcd','','','Unpublished')
insert into Question values (6,1,'Biology','Human Disease','Hard','3','Select abcd','','','Unpublished')
insert into Question values (7,2,'Biology','Human Disease','Hard','3','Select abcd','','','Unpublished')
insert into Question values (8,2,'Human Atanomy','Muscle','Hard','3','Select abcd','','','Unpublished')
insert into Question values (9,4,'Human Atanomy','Muscle','Hard','4','Select abcd','','','Unpublished')
insert into Question values (10,4,'Human Atanomy','Skeleton','Hard','4','Select abcd','','','Unpublished')
insert into Question values (11,3,'Human Atanomy','Skeleton','Hard','5','Select abcd','','','Unpublished')
select * from Question

--Result
create table Result
(
userID int,
quesID int not null,
[status] varchar(10),
constraint [FK_result_quesID] foreign key (quesID) references Question(quesID)
)

--AnswerOption
create table AnswerOption
(
quesID int not null,
answer ntext,
[key] nvarchar(50),
constraint [PK_answeroption_quesID] primary key (quesID),
constraint [FK_answeroption_quesID] foreign key (quesID) references Question(quesID)
)



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

insert into Slider values('Slider1','pic/slider1.jpg','s1','note of slider1','active')
insert into Slider values('Slider2','pic/slider2.jpg','s2','note of slider2','active')
insert into Slider values('Slider3','pic/slider3.jpg','s3','note of slider3','active')
insert into Slider values('Slider4','pic/slider4.jpg','s4','note of slider4','active')
insert into Slider values('Slider5','pic/slider5.jpg','s5','note of slider5','active')
insert into Slider values('Slider6','pic/slider6.jpg','s6','note of slider6','active')

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

