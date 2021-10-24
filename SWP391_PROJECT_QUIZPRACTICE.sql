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
--drop table Account


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
--drop table setting
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
--drop table question
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

create table PostCategory
(
cid int primary key,
cname nvarchar(50)
)

create table Post
(
postid int,
thumbnail varchar(1000),
title nvarchar(70),
brief nvarchar(4000), 
detail ntext,
cId int not null foreign key references PostCategory(cid),
author int foreign key references Account(userId),
featured varchar(1000),
[time] smalldatetime,
[status] varchar(10)
)
insert into PostCategory values (1,'Art & Design')
insert into PostCategory values (2,'Business')
insert into PostCategory values (3,'IT & Software')
insert into PostCategory values (4,'Languages')
insert into PostCategory values (5,'Programming')
insert into PostCategory values (6,'Technology')

insert into Post values ('images\blog\blog3-1.png','Research of Learn training process','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',5,2,'abcdef','2019-02-14','Completed')
insert into Post values ('images\blog\blog3-2.png','Research of Learn training process','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',5,2,'abcdefghijk','2019-02-14','Completed')
insert into Post values ('images\blog\blog3-3.png','Research of Learn training process','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',6,2,'12yfaskfac','2019-02-14','Completed')
insert into Post values ('images\blog\details_2.png','Research of Learn training process','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',3,2,'abcdef','2019-02-14','Completed')
insert into Post values ('images\blog\details_2.png','How to Become Master In CSS within a Week','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',3,2,'abcdef','2019-02-14','Completed')
insert into Post values ('images\blog\details_2.png','Students work together to solve a problem','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',3,2,'abcdef','2019-02-14','Completed')

create table Document
(
id int identity(1,1) primary key,
thumbnail nvarchar(300) not null,
title nvarchar(50) not null,
author nvarchar(50) not null,
update_date Date not null,
brief_info nvarchar(50) not null,
post_content nvarchar(200) not null,
doccategory nvarchar(50),
)

insert into Document values('pic/education-la-gi-1-1008x570.jpg','Quiz1','Le Manh Hung','2021-5-19','This is Quiz1 brief_info','This is Quiz1 post_content','DocumentCate1')
insert into Document values('pic/Education-la-gi-2-e1623658098277.jpg','Quiz2','Nguyen Thi Cuc','2018-3-29','This is Quiz2 brief_info','This is Quiz2 post_content','DocumentCate2')
insert into Document values('pic/Picture1-6.jpg','Quiz3','Le Duy Hai','2021-4-20','This is Quiz3 brief_info','This is Quiz3 post_content','DocumentCate3')
insert into Document values('pic/Education-in-Spain-1-1920x1080.jpg','Quiz4','Nguyen Dai Lam','2020-9-9','This is Quiz4 brief_info','This is Quiz4 post_content','DocumentCate1')
insert into Document values('pic/edu.jpeg','Quiz5','Le Huu Phuc','2021-7-15','This is Quiz5 brief_info','This is Quiz5 post_content','DocumentCate2')
insert into Document values('pic/pic/dreamstime_s_74311588.jpg','Quiz6','Trinh Anh Quan','2018-2-23','This is Quiz6 brief_info','This is Quiz6 post_content','DocumentCate3')
insert into Document values('pic/30c65f19-8e87-457c-b22a-cb32f44f4dd0.jpeg','Quiz7','Pham Hung Ha','2020-6-28','This is Quiz6 brief_info','This is Quiz6 post_content','DocumentCate1')
insert into Document values('pic/Picture1-6.jpg','Quiz8','Le Duy Hung','2021-10-24','This is Quiz8 brief_info','This is Quiz8 post_content','DocumentCate3')
insert into Document values('pic/pic/education2.jpg','Quiz9','Le Manh Hung','2017-10-15','This is Quiz9 brief_info','This is Quiz9 post_content','DocumentCate1')
insert into Document values('pic/education-la-gi-1-1008x570.jpg','Quiz10','Le Duy Hung','2020-8-12','This is Quiz10 brief_info','This is Quiz10 post_content','DocumentCate3')

insert into Setting([type],settingValue,settingOrder,[status]) values('doccategory','DocumentCate1',1,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values('doccategory','DocumentCate2',2,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values('doccategory','DocumentCate3',3,'active')


GO
/****** Object:  Table [dbo].[Dimension]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimension](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[dimension] [nvarchar](50) NULL,
	[subject_id] [int] NULL,
 CONSTRAINT [PK_Dimention] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Price_Package]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price_Package](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[package] [nvarchar](50) NULL,
	[duration] [int] NULL,
	[list_price] [int] NULL,
	[sale_price] [int] NULL,
	[status] [nvarchar](50) NULL,
	[subject_id] [int] NULL,
 CONSTRAINT [PK_Price_Package] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NULL,
	[author] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[featured] [bit] NULL,
	[category] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Dimension] ON 

INSERT [dbo].[Dimension] ([id], [type], [dimension], [subject_id]) VALUES (1, N'Domain', N'Business', 1)
INSERT [dbo].[Dimension] ([id], [type], [dimension], [subject_id]) VALUES (2, N'Domain', N'Process', 1)
INSERT [dbo].[Dimension] ([id], [type], [dimension], [subject_id]) VALUES (3, N'Domain', N'People', 1)
INSERT [dbo].[Dimension] ([id], [type], [dimension], [subject_id]) VALUES (4, N'Group', N'Initialing', 1)
INSERT [dbo].[Dimension] ([id], [type], [dimension], [subject_id]) VALUES (5, N'Group', N'Planning', 1)
INSERT [dbo].[Dimension] ([id], [type], [dimension], [subject_id]) VALUES (6, N'Group', N'Executing', 1)
SET IDENTITY_INSERT [dbo].[Dimension] OFF
GO
SET IDENTITY_INSERT [dbo].[Price_Package] ON 

INSERT [dbo].[Price_Package] ([id], [package], [duration], [list_price], [sale_price], [status], [subject_id]) VALUES (1, N'Gói truy cập 3 tháng', 3, 3600, 3200, N'Active', 1)
INSERT [dbo].[Price_Package] ([id], [package], [duration], [list_price], [sale_price], [status], [subject_id]) VALUES (2, N'Gói truy cập 6 tháng', 6, 5000, 4500, N'Inactive', 1)
INSERT [dbo].[Price_Package] ([id], [package], [duration], [list_price], [sale_price], [status], [subject_id]) VALUES (3, N'Gói truy cập vô thời hạn', NULL, 10000, 9800, N'Active', 1)
SET IDENTITY_INSERT [dbo].[Price_Package] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([id], [title], [author], [status], [featured], [category], [name], [description]) VALUES (1, N't1', N'a1', N's1', 1, N'c1', N'n1_update', N'description')
INSERT [dbo].[Subject] ([id], [title], [author], [status], [featured], [category], [name], [description]) VALUES (2, N't2', N'a2', N's2', 1, N'c2', N'n2', N'description')
INSERT [dbo].[Subject] ([id], [title], [author], [status], [featured], [category], [name], [description]) VALUES (3, N't3', N'a3', N's3', 1, N'c3', N'n3', N'description')
INSERT [dbo].[Subject] ([id], [title], [author], [status], [featured], [category], [name], [description]) VALUES (4, N't4', N'a4', N's4', 1, N'c4', N'n4', N'description')
INSERT [dbo].[Subject] ([id], [title], [author], [status], [featured], [category], [name], [description]) VALUES (5, N't5', N'a5', N's5', 0, N'c5', N'n5', N'description')
INSERT [dbo].[Subject] ([id], [title], [author], [status], [featured], [category], [name], [description]) VALUES (6, N't6', N'a6', N's6', 0, N'c6', N'n6', N'description')
INSERT [dbo].[Subject] ([id], [title], [author], [status], [featured], [category], [name], [description]) VALUES (7, N'add sup', N'au1', N'published', 1, N'ca1', N'sup namw', N'hello')
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
ALTER TABLE [dbo].[Dimension]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subject] ([id])
GO
ALTER TABLE [dbo].[Price_Package]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subject] ([id])
GO

create table QuizList(
	quizId int identity(1,1) primary key,
	name nvarchar(2000),
	[subject] int FOREIGN KEY REFERENCES Subject(id),
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
  insert into QuizList (name,[subject],category,[level],[type],quesNum,passRate,expert) values('Object-Oriented Programming',1,'OOP with Java','university','free test',20,80,4)
  insert into QuizList (name,[subject],category,[level],[type],quesNum,passRate,expert) values('Object-Oriented Programming',1,'OOP with Java','university','free test',20,80,4)
  insert into QuizList (name,[subject],category,[level],[type],quesNum,passRate,expert) values('Object-Oriented Programming',2,'OOP with Java','university','free test',20,80,4)
  insert into QuizList (name,[subject],category,[level],[type],quesNum,passRate,expert) values('Object-Oriented Programming',2,'OOP with Java','university','free test',20,80,4)
  insert into QuizList (name,[subject],category,[level],[type],quesNum,passRate,expert) values('Object-Oriented Programming',2,'OOP with Java','university','free test',20,80,4)
  insert into QuizList (name,[subject],category,[level],[type],quesNum,passRate,expert) values('Object-Oriented Programming',2,'OOP with Java','university','free test',20,80,4)
  insert into QuizList (name,[subject],category,[level],[type],quesNum,passRate,expert) values('Object-Oriented Programming',2,'OOP with Java','university','free test',20,80,4)
  insert into QuizList (name,[subject],category,[level],[type],quesNum,passRate,expert) values('Object-Oriented Programming',2,'OOP with Java','university','free test',20,80,4)
  insert into QuizList (name,[subject],category,[level],[type],quesNum,passRate,expert) values('Object-Oriented Programming',2,'OOP with Java','university','free test',20,80,4)
  insert into QuizList (name,[subject],category,[level],[type],quesNum,passRate,expert) values('Object-Oriented Programming',2,'OOP with Java','university','free test',20,80,4)
  insert into QuizList (name,[subject],category,[level],[type],quesNum,passRate,expert) values('Object-Oriented Programming',2,'OOP with Java','university','free test',20,80,4)
  insert into QuizList (name,[subject],category,[level],[type],quesNum,passRate,expert) values('Object-Oriented Programming',2,'OOP with Java','university','free test',20,80,4)

