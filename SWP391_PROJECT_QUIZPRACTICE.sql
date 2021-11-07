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

insert into Account values (1,'admin','Mr','lamndhe151284@fpt.edu.vn','111111','0375596151','Hai Duong',1,'active')
insert into Account values (2,N'Phạm Hùng Hà','Mr','haphhe151269@fpt.edu.vn','011201','0396314096',N'Hải Dương',0,'active')
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
insert into Account values (19,N'a duoi','Mr','test','1','0867680175',N'Viet Nam',0,'active')
create table Setting
(
settingId int identity(1,1) primary key,
[type] varchar(50) not null,
settingValue varchar(50) not null,
settingOrder int ,
[status] nvarchar(150),

)

drop table setting
insert into Setting([type],settingValue,settingOrder,[status]) values ('user_role','Admin',1,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('user_role','Guest',0,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('user_role','Customer',2,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('user_role','Marketing',3,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('user_role','Manager',4,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('user_role','Expert',5,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('category','c1',1,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('category','c2',2,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('c1','Science',1,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('c1','Math',2,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('c1','Biology',3,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('c1','Human Atanomy',4,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('c2','sub1',1,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('c2','sub2',2,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('c2','sub3',3,'active')
insert into Setting([type],settingValue,settingOrder,[status]) values ('c2','sub4',4,'active')

create table Question
(
qId int identity(1,1) primary key ,
[subject] int not null,
category varchar(50),
subcategory varchar(50),
[level] varchar(10),
[status] varchar(12),
quiz int not null,
content varchar(200),
media varchar(1000),
explanation varchar(100)
)

create table AnswerOption
(
qId int not null,
answer varchar(100),
[key] bit
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

select * from question
create table [Authorization](
permission int not null,
[url] varchar(20) not null
)
insert into [Authorization] values (1,'/UserPaging')
insert into [Authorization] values (0,'/UserDetail')
insert into [Authorization] values (1,'/UserDetail')

create table Test(
testId int identity(1,1)  primary key,
subId int not null,
[type] varchar(20),
start_time varchar(25),
duration int,
result float,
tag varchar(10),
ques_numb int,
ques_cate varchar(50),
ques_subcate varchar(50),
)

drop table Test
insert into Test values (1,'Free Test','10-10-2021 00:01:00','120','80','Pass','40','c1','Math',80)
select * from test
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

