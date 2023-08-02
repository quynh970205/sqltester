use assignment;

# thêm  2- 5  loại lĩnh vực câu hỏi vào trong bảng categoryquestion 
insert  into `categoryquestion`(`Category_ID`,`Category_Name`) values (5,'Vật lí'),(6,'Vi điều khiển'),
(7,'Trí tuệ nhân tạo'),(8,'Lập trình mạng và truyền thông'),(9,'Thiết kế ứng dụng trên thiết bị di động');
select * from `categoryquestion`;

#Thêm một 10 câu hỏi và các câu trả lời tương ứng (bảng question và answer) với mỗi câu hỏi sẽ có 4 câu trả lời. 
#Trong 4 câu trả lời đó thì sẽ có 1 câu trả lời đúng
insert  into `question`(`Question_ID`,`Content`,`Category_ID`,`Type_ID`,`Creator_ID`,`Create_Date`) 
values (3,'Kết quả của biểu thức sau là m ấy: 8 + 9 = ?',4,2,6,'2023-07-31'),(4,'Vi điều khiển STM32F429ZIT6 có bao nhiêu chân?',6,1,4,'2023-07-31'),
(5,'2dm thì bằng:',5,2,8,'2023-08-01'),(6,'Lớp nào trong mô hình phù hợp nhất với cụm từ: "bit sống trên dây dẫn":',8,1,7,'2023-08-01');
select * from `question`;

update `answer` set `Content`  = 'kết quả là 2',`Question_ID`= 2, `is_Correct` = '0' where `Answer_ID` = 5;  
insert  into `answer`(`Answer_ID`,`Content`,`Question_ID`,`is_Correct`) values (6,'kết quả là 3',2,'1'),(7,'kết quả là 4',2,'0'),(8,'kết quả là 5',2,'0'),
(9,'kết quả là 11',3,'0'),(10,'kết quả là 15',3,'0'),(11,'kết quả là 17',3,'1'),(12,'kết quả là 19',3,'0'),
(13,'kết quả là 144',4,'1'),(14,'kết quả là 256',4,'0'),(15,'kết quả là 167',4,'0'),(16,'kết quả là 345',4,'0'),
(17,'kết quả là 200cm',5,'0'),(18,'kết quả là 2000cm',5,'0'),(19,'kết quả là 2cm',5,'0'),(20,'kết quả là 20cm',5,'1'),
(21,'Lớp liên kết dữ liệu',6,'0'),(22,'Lớp Giao vận',6,'0'),(23,'Lớp Ứng dụng',6,'0'),(24,'Lớp Vật lý ',6,'1'),(25,NULL,NULL,'0');
select * from `answer`;

#Lấy toàn bộ danh sách các câu hỏi và câu trả lời đúng. Sắp xếp theo thứ tự thời gian tạo tăng dần. 
select `question`.`Question_ID`,`question`.`Content`,`question`.`Category_ID`,`question`.`Type_ID`,
`question`.`Creator_ID`,`question`.`Create_Date`,`answer`.`Content`,`answer`.`is_Correct`  from `question` join `answer` 
on `question`.`Question_ID` = `answer`.`Question_ID`
group by `answer`.`Content`
having `answer`.`is_Correct` = 1
order by `question`.`Create_Date` asc;

#Lấy toàn bộ danh sách các câu hỏi được tạo ra trong ngày hôm nay
select `question`.`Question_ID`,`question`.`Content`,`question`.`Category_ID`,`question`.`Type_ID`,
`question`.`Creator_ID`,`question`.`Create_Date` from `question`
having `question`.`Create_Date` = '2023-08-01';

# Thống kê xem mỗi lĩnh vực câu hỏi, mỗi lĩnh vực có bao nhiêu câu hỏi. 
# và mỗi lĩnh vực có bao nhiêu câu hỏi khó , bao nhiêu câu hỏi dễ.
select `categoryquestion`.`Category_Name`,`TypeQuestion`.`Type_Name`,count(`TypeQuestion`.`Type_ID`) as SoCau 
from `categoryquestion` join `question` join `TypeQuestion` 
on `categoryquestion`.`Category_ID` = `question`.`Category_ID`and `TypeQuestion`.`Type_ID` = `question`.`Type_ID`
group by `Category_Name`,`Type_Name`;

select count(*),`categoryquestion`.`Category_Name` from `categoryquestion` join `question`
on `categoryquestion`.`Category_ID` = `question`.`Category_ID`
group by `Category_Name`;

# Tìm trong bảng question có bao nhiêu lĩnh vực câu hỏi đã được thêm.
select count(distinct(`Category_id`)) as SolinhvucCauhoi from `question`;