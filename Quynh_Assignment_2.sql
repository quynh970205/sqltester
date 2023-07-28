Create database  QuynhAssignment2;

use  QuynhAssignment2;

create table `Department`(
 DepartmentID int auto_increment primary key,
 DepartmentName varchar (50)
);
create table `Position`(
 PositionID int auto_increment primary key,
 PositionName varchar (50)
);
create table `Account`(
 AccountID int auto_increment primary key,
 Email varchar (50),
 Username varchar(100),
 FullName varchar (100),
 DepartmentIDAcc int,
 FOREIGN KEY (DepartmentIDAcc) REFERENCES `Department`(DepartmentID),
 PositionIDAcc int,
 FOREIGN KEY (PositionIDAcc) REFERENCES `Position`(PositionID),
 CreateDateAcc date
);
create table `Group`(
 GroupID int auto_increment primary key,
 GroupName varchar (50),
 CreatorID varchar (50),
 CreateDate date
);
create table `GroupAccount`(
 GroupIDAcc int auto_increment primary key,
 foreign key (GroupIDAcc) references `Group`(GroupID),
 GroupName varchar (50),
 AccountID varchar (50),
 JoinDate date
);
create table `TypeQuestion`(
 TypeID int auto_increment primary key,
 TypeName enum('Essay','Multiple-Choice')
);
create table `CategoryQuestion`(
 CategoryID int auto_increment primary key,
 CategoryName varchar (20)
);
create table `Question`(
 QuestionID int auto_increment primary key,
 Content varchar (100),
 CategoryIDQue int,
 foreign key (CategoryIDQue) references `CategoryQuestion`(CategoryID),
 TypeIDQue int,
 foreign key(TypeIDQue) references `TypeQuestion`(TypeID),
 CreatorID varchar(30),
 CreateDateQuestion date
);
create table `Answer`(
 AnswerID int auto_increment primary key,
 ContentAnswer varchar (20),
 QuestionIDAn int,
foreign key( QuestionIDAn) references `Question`(QuestionID),
isCorrect enum('DUNG','SAI')
);
create table `Exam`(
 ExamID int auto_increment primary key,
 CodeExam varchar (50),
 Title varchar (50),
 CategoryID varchar (50),
 Duration int,
 CreatorID varchar(50),
 CreateDate date
);
create table `ExamQuestion`(
 ExamIDQuestion int,
 foreign key(ExamIDQuestion) references `Exam`(ExamID),
 QuestionIDExam int,
 foreign key(QuestionIDExam) references `Question`(QuestionID)
);
select * from `Department`;
select * from `Position`;
select * from `Account`;
select * from `Group`;
select * from `GroupAccount`;
select * from `TypeQuestion`;
select * from `CategoryQuestion`;
select * from `Question`;
select * from `Answer`;
select * from `Exam`;
select * from `ExamQuestion`;