use EXAM

-- ****** Stored Procedure for Student Table1 ******-------------------------------------------------------------

-- 1/select ---------------------------------------------------
alter proc getStudent @id int = null
as 
if @id is null
	select * from student
else 
	begin
	if exists(select st_id from student  where st_id = @id)
			select * from student where st_id = @id
	else
		select 'student does not exist'
	end

--calling
getStudent 
execute getStudent 2



--2/insert--------------------------------------------------------
alter proc addStudent 
@id int , @first_name varchar(50), @last_name varchar(50), @address varchar(50), @age int, @dept_id int
as
begin try 
	insert into student values(@id, @first_name, @last_name, @address, @age, @dept_id)
end try 
begin catch
	select ' Invalid ----> you cannot add student'
end catch 

--calling
addStudent 30, 'khaled', 'Magdy', 'demietta', 25, 2

--3/update-----------------------------------------------------------
alter proc updateStudent 
@id int , @first_name varchar(50)=NULL, @last_name varchar(50) = NULL,
@address varchar(50)=NULL, @age int=NULL, @dept_id int =NULL
as
begin try
	if exists(select st_id from student where st_id=@id)
	begin
		if @first_name is not null
			update student set st_fname = @first_name where st_id=@id
		if @last_name is not null
			update student set st_lname = @last_name where st_id=@id
		if @address is not null
			update student set adress = @address where st_id=@id
		if @age is not null
			update student set age = @age where st_id=@id
		if @dept_id is not null
			update student set dept_id = @dept_id where st_id=@id
	end
	else 
		select 'student does not exist'
end try
begin catch
	select 'department does not exist'
end catch


--calling
updateStudent 4, 'khaled', 'Magdy', 'demietta', 25, 2 --update all for id 2
updateStudent 3, @first_name='ali' --update only first name
updateStudent 3, @age=44 --update only age

-- 4/Delete------------------------------------------------------
alter proc deleteStudent @id int   
as
if exists(select st_id from student  where st_id = @id)
	delete from  student where st_id = @id
else
	select 'Invalid ----> student does not exist' 

--calling
deleteStudent 45



-- ****** Stored Procedure for Department Table2 ******----------------------------------------------

-- 1/select --------------------------------------------------------------
alter proc getDepartment @id int  =null
as 
if @id is null
	select * from department
else 
	begin
		if exists(select dept_id from department  where dept_id = @id)
				select * from department where dept_id = @id
		else
			select 'Department does not exist'
	end
--calling
execute getDepartment
execute getDepartment 15

--2/insert----------------------------------------------------------
create proc addDepartment @id int ,@name varchar(50)
as
begin try 
	insert into department values(@id,@name)
end try 
begin catch
	select ' Invalid ----> you cannot add department'
end catch 

--calling
addDepartment 20,'SSS'



--3/update------------------------------------------------------------------
alter proc updateDepartment @id int , @name varchar(50)
as
	if exists(select dept_id from department where dept_id=@id)
			update department set dept_name = @name where dept_id=@id
	else 
		select 'department does not exist'

--calling
updateDepartment 20, 'abc' --update all for id 20


-- 4/Delete------------------------------------------------------------
create proc deleteDepartment @id int   
as
if exists(select dept_id from department  where dept_id = @id)
	delete from  department where dept_id = @id
else
	select 'Invalid ----> Department does not exist' 

--calling
deleteDepartment 20

select * from department



-- ****** Stored Procedure for Topic Table3 ******--------------------------------------------

-- 1/select ------------------------------------------------------------
alter proc getTopic @id int = null
as 
if @id is null
	select * from Topic
else 
	begin 
		if exists(select topic_id from Topic  where topic_id = @id)
			select * from topic where topic_id = @id
		else
			select 'topic does not exist'
	end
--calling
getTopic  
execute getTopic 1



--2/insert------------------------------------------------------------
create proc addTopic @id int ,@name varchar(50),@courseid int 
as
begin try 
	insert into Topic values(@id,@name,@courseid)
end try 
begin catch
	select ' Invalid ----> you cannot add topic'
end catch 

--calling
addTopic 20,'ddddd',1

--3/update-----------------------------------------------------------------
alter proc updateTopic 
@id int ,@name varchar(50)=NULL,@course_id int = NULL
as
	begin try
		if exists(select topic_id from Topic where topic_id = @id)
			begin
				if @name is not null
					update Topic set topic_name = @name where topic_id = @id
				if @course_id is not null
					update Topic set crs_id= @course_id where topic_id = @id
			end
		else 
			select 'Topic does not exist'
	end try
	begin catch
		select 'course does not exist'
	end catch

--calling
updateTopic 20, 'eeeeedd', 5 --update all for id 
updateTopic 20, @name='eeee5' --update only course name
updateTopic 20, @course_id=6 --update only course duration

getTopic

-- 4/Delete-------------------------------------------------------
create proc deleteTopic @id int
as
if exists(select topic_id from Topic  where topic_id = @id)
	delete from  Topic where topic_id = @id
else
	select 'Invalid ----> Topic does not exist' 

--calling
deleteTopic 20




-- ****** Stored Procedure for Question Table4 ******--

-- 1/select -----------------------------------------------------
alter proc getQuestion @id int=null
as 
if @id is null
	select * from Question
else 
	begin
	if exists(select Q_id from Question  where Q_id = @id)
			select * from Question where Q_id = @id
	else
		select 'Question does not exist'
	end

--calling
getQuestion
execute getQuestion 2

select * from Topic

--2/insert------------------------------------------------------
alter proc addQuestion 
@q_content varchar(50), @q_correct_ans varchar(50), @type varchar(50), @q_mark int, @crs_id int
as
begin try 
	insert into Question values(@q_content, @q_correct_ans, @type, @q_mark, @crs_id)
end try 
begin catch
	select ' Invalid ----> you cannot add question'
end catch 

--calling
addQuestion 'what is bla bla?', 'A', 'mcq', 1, 2
getQuestion


--3/update------------------------------------------------------
create proc updateQuestion
@id int , @q_content varchar(50) = NULL, @q_correct_ans varchar(50) = NULL, 
@type varchar(50) = NULL, @q_mark int = NULL, @crs_id int = NULL
as
begin try
	if exists(select Q_id from Question where Q_id=@id)
	begin
		if @q_content is not null
			update Question set Q_content = @q_content where Q_id=@id
		if @q_correct_ans is not null
			update Question set Q_correct_answer = @q_correct_ans where Q_id=@id
		if @type is not null
			update Question set type = @type where Q_id=@id
		if @q_mark is not null
			update Question set Q_mark = @q_mark where Q_id=@id
		if @crs_id is not null
			update Question set crs_id = @crs_id where Q_id=@id
	end
	else 
		select 'Question does not exist'
end try
begin catch
	select 'Course does not exist'
end catch


--calling
updateQuestion 3, '3.C# programming language is used to develop -', 'D', 'mcq', 1, 1 --update all for id 2
updateQuestion 3, @Q_content='3.C# programming language is used to develop -' --update only first name
updateQuestion 3, @q_mark=1 --update only age
updateQuestion 3, @crs_id= 200 --update only age
updateQuestion 3, @q_correct_ans= 'D' --update only age
updateQuestion 140, @type= 'mcq' --update only age



-- 4/Delete---------------------------------------------------
create proc deleteQuestion @id int   
as
if exists(select Q_id from Question where Q_id=@id)
	delete from  Question where Q_id = @id
else
	select 'Invalid ----> Question does not exist' 

--calling
deleteQuestion 101

getQuestion



-- ****** Stored Procedure for Course Table5 ******-------------------------------------------------

-- 1/select -----------------------------------------------------
alter proc getCourse @id int= null
as 
if @id is null
	select * from course
else 
	begin 
		if exists(select crs_id from course  where crs_id = @id)
			select * from course where crs_id = @id
		else
			select 'course does not exist'
	end


--calling
getCourse 
execute getCourse 2



--2/insert----------------------------------------------------------
create proc addCourse @id int ,@duration int ,@name varchar(50)
as
begin try 
	insert into course values(@id, @duration, @name)
end try 
begin catch
	select ' Invalid ----> you cannot add course'
end catch 

--calling
addCourse 30, 3, 'testing'



--3/update--------------------------------------------------------------
alter proc updateCourse 
@id int ,@duration int =NULL, @name varchar(50)=NULL
as
	if exists(select crs_id from course where crs_id=@id)
	begin
		if @duration is not null
			update course set cours_duration = @duration where crs_id=@id
		if @name is not null
			update course set course_name = @name where crs_id=@id
	end
	else 
		select 'course does not exist'

--calling
updateCourse 30, 7, 'devops' --update all for id 
updateCourse 30, @name='swe' --update only course name
updateCourse 30, @duration=44 --update only course duration



-- 4/Delete---------------------------------------------------------
create proc deleteCourse @id int   
as
if exists(select crs_id from course  where crs_id = @id)
	delete from  course where crs_id = @id
else
	select 'Invalid ----> Course does not exist' 

--calling
deleteCourse 30


-- ****** Stored Procedure for Exam Table6 ******-----------------------------------------------------------

-- 1/select --------------------------------------------------------------------------
-- format:
-- getExam Exam_id
-- return exam data by id
-- if no parameter is passed it will return all exmas data
create proc getExam @id int = null
as 
if @id is null
	select * from Exam
else 
	begin 
		if exists(select Exam_id from Exam  where Exam_id = @id)
			select * from Exam where Exam_id = @id
		else
			select 'Exam does not exist'
	end


--calling
execute getExam 
execute getExam 2



-- 2/insert--------------------------------------------------------------------------
-- format:
-- addExam  exam_duration, exam_date, course_id
-- create new row in exam table
-- all parameters must be passed
create proc addExam @duration int = null ,@date date = null, @crs_id int = null
as
begin try 
    IF  @duration IS NULL OR @date IS NULL OR @crs_id IS NULL
        SELECT 'Missing Parameter'
    ELSE
    BEGIN
        insert into Exam values( @duration, @date,@crs_id)
        SELECT 'Exam Added Successfully'
    END
end try 
begin catch
		select ' Invalid ----> Course ID does not exist'
end catch 

--calling
addExam  3, '3-3-2000',1



-- 3/update----------------------------------------------------------------------------
-- format:
-- updateExam exam_id, exam_duration, exam_date, course_id
-- Exam id must be inserted
-- if one of the parameters or more is not passed it will return the old vaue in the row
create proc updateExam 
@ex_id int,@duration int = null,@date date = null, @crs_id int = null 
AS
begin try 
	
	IF not exists(SELECT Exam_id FROM Exam WHERE Exam_id = @ex_id)
		SELECT 'Invalid ----> Exam ID does not exist'

	if @duration is null  SET @duration=(SELECT exam_duration FROM Exam WHERE Exam_id = @ex_id)
	if @date is null SET @date=(SELECT exam_date FROM Exam WHERE Exam_id = @ex_id) 
	if @crs_id is null SET @crs_id=(SELECT crs_id FROM Exam WHERE Exam_id = @ex_id) 

	ELSE
	BEGIN
		IF @duration >0 -- avoid negative value...
		BEGIN
			UPDATE Exam SET
					Exam_id = @ex_id, 
					exam_duration= @duration, 
					exam_date= @date,
					crs_id= @crs_id
			WHERE Exam_id = @ex_id
			SELECT 'Exam Updated Successfully'
		END
		ELSE
			SELECT ' Invalid ----> Exam Duration must be bigger than 0'
	END
end try 
begin catch

	if ISNUMERIC(@crs_id) = 0
		select ' Invalid ----> Course ID'
	if not exists(SELECT crs_id FROM course WHERE crs_id = @crs_id)
		select ' Invalid ----> Course ID does not exist'
end catch 
--calling
updateExam 1, 2, '3-3-2000',2 --update all for id 
getExam


-- 4/Delete----------------------------------------------------------------------
-- format:
-- deleteExam exam_id
-- Exam ID must be passed
alter proc deleteExam @id int   
as
if exists(select Exam_id from Exam  where Exam_id = @id)
	begin
		delete from  Exam where Exam_id = @id
		SELECT 'Exam Deleted Successfully';
	end
else
	select 'Invalid ----> Exam does not exist' 

--calling
deleteExam 5


-- ****** Stored Procedure for Instructor Table7 ******-----------------------------------------------------------

--1/select----------------------------------------------------------------------
create proc ins_show @ins_id int = null 
as

if @ins_id is null
select * from instructor 
else  
begin
if @ins_id is not null and @ins_id in (select ins_id from instructor)
select * from instructor where ins_id=@ins_id
else 
select 'your inserted id doesn not exist'
end

ins_show 10


--2/insert instructor with the name and salary and department and check if you can insert or not
create proc insertIns  @ins_name varchar(30), @ins_salary float , @ins_dept int
as
begin try 
	insert into instructor(ins_name,salary,dept_id) values(@ins_name,@ins_salary,@ins_dept)
end try
begin catch
	select 'you entered wrong data'
end catch

--call insert instructor with the name and salary and department 
-- paramaters (  name , salary , dept id  )
insertIns 'ahmed fathy',3000,7




--- 3/update the instructor name , salary , dept id --------------------------------
alter proc updateIns 
@id int , @name varchar(50) = null,  @salary float=null, @dept_id int =null
as
begin try
	if exists(	select ins_id from instructor where ins_id=@id)
	begin
		if @name is not null
			update instructor set ins_name = @name where ins_id=@id
		if @salary is not null
			update instructor set salary = @salary where ins_id=@id
		if @dept_id is not null
			update instructor set dept_id = @dept_id where ins_id=@id
	end
	else 
		select 'instructor does not exist'
end try
begin catch
	select 'department doesnot exist'
end catch
--call update instructor table
--paramaters instructor( ID , name , salary , dept id )
updateIns 10 , 'yasser' , 3000,1000
updateIns 10, @name = 'ali'



--- 4/delete procedure delete specific instructor from table --------------------------------
alter proc deleteIns @id int   
as
if exists(select ins_id from instructor  where ins_id = @id)
	delete from  instructor where ins_id = @id
else
	select 'Invalid ----> instructor does not exist' 

--calling
deleteIns 1







--	****** Stored Procedure for studentCourse Table8 ******---------------------------------------------

-- 1/select -------------------------------------------------------------------
create proc getStudentCourse @stu_id int = null
as 
if @stu_id is null
	select * from [dbo].[student_course]
else 
	begin 
		if( 
		exists(select st_id from [dbo].[student_course] 
		where st_id=@stu_id)
		)
			select * from [dbo].[student_course]  where st_id=@stu_id
		else
			select 'course does not exist'
	end


--calling => select *
getStudentCourse 
--select Student courses procedure
--insert one parameter (student ID)
execute getStudentCourse 2


--2/insert-------------------------------------------------------------------------
create proc addStudentCourse @stu_id int ,@crs_id int 
as
begin try 
	insert into [dbo].[student_course] values(@stu_id, @crs_id)
end try 
begin catch
	select ' Invalid ----> you cannot add student_course'
end catch 

--calling
--inserting Student courses procedure
--insert two parameter (student ID,course ID)
addStudentCourse 1, 3


--3/update--------------------------------------------------------------------------
create proc updateStudentCourse @stu_id int = 0 , @newCrs_id int = 0 , @oldCrs_id int = 0 
as
	if (
	exists(select @newCrs_id from [dbo].[course]
		where crs_id=@newCrs_id)
		and
	exists(select st_id from [dbo].[student_course]
		where st_id=@stu_id)
		and
	exists(select @oldCrs_id from [dbo].[course]
		where crs_id=@oldCrs_id)
		)
	begin
		if @stu_id != 0 and @newCrs_id !=0
		begin
		--updating student course (crs_id) depending on student ID and old course id
		update [dbo].[student_course]  set crs_id=@newCrs_id  where st_id = @stu_id and  crs_id=@oldCrs_id	
		end
	end
	else 
		select 'Invalid update...'

--calling
--inserting Student courses procedure
--insert three parameter (student ID,new course ID,old course ID)
--update student course (crs_id) depending on student ID and old course id
updateStudentCourse 6,1,6



-- 4/Delete----------------------------------------------------------------------------
create proc deleteStudentCourse @stu_id int   
as
if(	exists(select st_id from [dbo].[student_course] where st_id=@stu_id))
	delete from  [dbo].[student_course] where st_id = @stu_id
else
	select 'Invalid ----> student does not exist' 

--calling
--delete Student courses procedure
--insert one parameter (student ID)
deleteStudentCourse 6





-- ****** Stored Procedure for instructor_course Table9 ******----------------------------------------------

-- 1. SP to select instructor and their courses 
    -- case 1 :  If user don't give SP and Parameter: 
	           -- it will select all rows in table

	-- case 2 : If user give SP instructor id as a Parameter: 
	           -- it will select only one row of the input instructor id
			   
	-- case 3 : If user give SP instructor id as a Parameter and this id is not valid: 
			-- user will have an error message ( this id is not invalid .. instructor does not exist)	 

-- select -----------------------------------------------------------------------
create proc getInstructorCourse @id int = null
as 
if @id is null
	select * from instructor_course
else 
	begin 
		if exists(select ins_id from instructor where ins_id = @id)
			select * from instructor_course where ins_id = @id
		else
			select ' this id is not invalid .. instructor does not exist'
	end
--calling
getInstructorCourse 
execute getInstructorCourse 1



--2/insert-------------------------------------------------------------------
create proc addInstructorCourse @id int , @courseid int  
as
begin try 

 if exists ( select ins_id  from instructor where ins_id =@id)
 and exists ( select crs_id from course where crs_id =@courseid)
 
	insert into instructor_course values(@id,@courseid)
end try 
begin catch
	select ' Invalid Insertion '
end catch 

--calling
addInstructorCourse 1,2
addInstructorCourse 1,3
getInstructorCourse


--3/update -------------------------------------------------------------------------
alter proc updateInstructorCourse
@id int ,@oldcrs_id int , @newcrs_id int
as
	begin try
		if exists(select ins_id from instructor where ins_id = @id )
		and exists (select crs_id from course where crs_id = @oldcrs_id )
		and exists (select crs_id from course where crs_id = @newcrs_id )
			begin			
				update instructor_course set crs_id = @newcrs_id where 
				ins_id = @id and crs_id=@oldcrs_id		
			end	
			else 
			select ' ivalid update '
	end try

	begin catch
		select ' ivalid update '
	end catch

--calling
updateInstructorCourse 1,3,4--update all for id 
updateInstructorCourse 20, @name='eeee5' --update only course name
updateInstructorCourse 20, @course_id=6 --update only course duration


-- 4/Delete------------------------------------------------------------------
create proc deleteInstructorCourse @id int , @crsid int = null 
as
	if @crsid is not null 
	begin 
		if exists(select ins_id from instructor_course where ins_id = @id)
		and exists ( select crs_id from instructor_course where crs_id=@crsid )
			delete from  instructor_course where 
			ins_id = @id and crs_id = @crsid
	end
	else if exists(select ins_id from instructor_course where ins_id = @id) 
		delete from instructor_course where ins_id = @id
	else
		select 'Invalid deletion for instructor courses ' 

--calling
deleteInstructorCourse 1,4
deleteInstructorCourse 1





-- ****** Stored Procedure for QuetsionChoices Table10 ******--------------------------------------------

--1/select---------------------------------------------------------------
--- procedures show the question choices 
--if you pass id it will get certain question 
--if not it will get all questions
create proc getQuestionChoices @id  int = null
as
if @id is null
	select * from question_choices
else
begin
if @id is not null and @id in (select q_id from question_choices where Q_id=@id) 
	select * from question_choices where Q_id=@id
else
	select 'no question aswers with the inserted id'
end 

getQuestionChoices
getQuestionChoices 10

--- 2/insert question choices in table question_choices -----------------------------------

create proc addQuestionChoices 
@id int,  @A varchar(200),@B varchar(200),@C varchar(200)=null,@D varchar(200) = null
as
begin try
	insert into question_choices values(@id,@A)
	insert into question_choices values(@id,@B)
	if @C is not null
		insert into question_choices values(@id,@C)
	if @D is not null
		insert into question_choices values(@id,@D)
end try
begin catch
	select 'invalid insertion'
end catch

addQuestionChoices 100 ,'A. Android','B. iOS' ,'C. Both A and B', 'D. None of the above'
getQuestionChoices



--3/update-------------------------------------------------------------------
alter proc updateQuestionChoices 
@id int,  @A varchar(200) = null,@B varchar(200)=null,@C varchar(200)=null,@D varchar(200) = null
as
	if exists(select Q_id from question_choices where Q_id=@id) 
	begin
		if @A is not null
			update question_choices set choices = @A where Q_id=@id and choices like '[Aa]%'
		if @B is not null
			update question_choices set choices = @B where Q_id=@id and choices like '[Bb]%'
		if @C is not null
			update question_choices set choices = @C where Q_id=@id and choices like '[Cc]%'
		if @D is not null
			update question_choices set choices = @D where Q_id=@id and choices like '[Dd]%'
	end
	else 
		select 'question does not exist'

updateQuestionChoices 100 , 'A. Androidd' ,'B. iOSS', 'C. Both A and BB', 'D. None of the abovee'
updateQuestionChoices 100 , @A = 'A. Android'
updateQuestionChoices 100 , @B = 'B. iOSS'
updateQuestionChoices 100 , @C = 'C. Both A and BB'
updateQuestionChoices 100 , @D = 'D. None of the abovee'
getQuestionChoices


--4/delete choices from the the table by id  --------------------------------------- 
create proc deleteQuestionChoices @id int   
as
if exists(select q_id from question_choices  where Q_id = @id)
	delete from  question_choices where Q_id = @id
else
	select 'Invalid ----> question choices does not exist' 

--calling
deleteQuestionChoices 100




-- ****** Stored Procedure for student_network Table11 ******---------------------------------------

-- 1. SP to select info about social network for student 
    -- case 1 :  If user don't give SP and Parameter: 
	           -- it will select all rows in table

	-- case 2 : If user give SP student id as a Parameter: 
	           -- it will select only one row of the input student id
			   
	-- case 3 : If user give SP student id as a Parameter and this id is not valid: 
			-- user will have an error message ( this id is not invalid .. student does not exist)	 


-- select  
alter proc getNetworkInfo @id int =null
as 
if @id is null
	select * from student_network
else 
	begin 
		if  exists(select SN.st_id from student_network SN ,student S where S.st_id=SN.st_id) 	
		and exists ( select st_id from student_network where st_id=@id )
			select * from student_network where st_id = @id
		else
		select ' student id not matched .. studet does not exists  '			
	end

--calling
getNetworkInfo
execute getNetworkInfo 2

----------------------------------------------------------------------------------------------------------
-- 2. SP to insert info about social network for student 
    -- case 1 :  If user don't give SP and Parameter: 
	           -- user will have an error message ( you have to enter values you want to insert )

	-- case 2 : If user give SP parameters student id , student social network account: 
	           -- it will insert new info to student network table 	  

--insert
alter proc addNetworkInfo @id int ,@network varchar(50)
as
begin try 
	insert into student_network values(@id,@network)
end try 
begin catch
	select ' Invalid ----> This social network already exists'
end catch 

--calling
addNetworkInfo 1,'omar1@gmail.com'
getNetworkInfo

deleteNetworkInfo 1


--------------------------------------------------------------------------------

-- 3. SP to update info of social network for student 
    -- case 1 :  If user give SP an student id and this parameter is invalid (not exists): 
	           -- user will have an error message (you can not update .. this student does not exist!)

	-- case 2 : If user give SP parameters student id: 
	           -- it will update social network info of student

--update
create proc updateNetworkInfo 
@id int ,@oldnetwork varchar(50),@newnetwork varchar(50)
as
	if exists(select st_id from student where st_id=@id)
	begin
		if exists ( select socialMediaAccount from student_network where 
		             socialMediaAccount=@oldnetwork and st_id=@id)
			update student_network set socialMediaAccount = @newnetwork 
			where st_id=@id and socialMediaAccount=@oldnetwork		
	end
	else 
		select 'you can not update .. this student does not exist !'

--calling
updateNetworkInfo 4, 'sayed44@gmail.com','ahaah@gmail.com'
getNetworkInfo


-----------------------------------------------------------------------------------
-- 4. SP to delete info of social network for student 
    -- case 1 :  If user give SP an student id and this parameter is invalid (not exists): 
	           -- user will have an error message (Invalid ----> student does not exist)

	-- case 2 : If user give SP parameters student id: 
	           -- it will delete all social network info of student

-- Delete
create proc deleteNetworkInfo @id int ,@network varchar(50)=null   
as
if exists(select st_id from student_network where st_id = @id)
begin
if @network is not null
	delete from  student_network where st_id = @id and socialMediaAccount=@network
else
delete from  student_network where st_id = @id
end
else
	select 'Invalid ----> student does not exist' 

	
--calling
deleteNetwork 20 



-- ****** Stored Procedure for TakeExam Table12 ******--------------------------------------------------------

-- 1/select-----------------------------------------------------------------------
-- getTakeExam st_id, Exam_id, Q_id
-- getTakeExam ---> with no parameters return all rows
-- you must enter 3 parameters or no parameter
create proc getTakeExam @st_id int = null,@ex_id int = null,@q_id int = null
as 
if @st_id is null and @ex_id is null and @q_id is null
	select * from Take_exam
else 
	begin 
		if exists(select st_id, Exam_id, Q_id from Take_exam  where st_id = @st_id and Exam_id = @ex_id and Q_id = @q_id)			
			select * from Take_exam  where st_id = @st_id and Exam_id = @ex_id and Q_id = @q_id
		else
			select 'Take Exam does not exist'
	end

--calling
execute getTakeExam 
execute getTakeExam 1,1,4



--2/insert---------------------------------------------------------------------------
-- format:
-- addTakeExam st_id, Exam_id, Q_id, std_answer, std_grade
-- all parameters must be passed
ALTER proc addTakeExam @st_id int = null,@ex_id int = null,@q_id int = null,@st_ans varchar(50) = null,@st_grade float = null
as
	IF @st_id IS NULL OR @ex_id IS NULL OR @q_id IS NULL OR @st_ans IS NULL OR @st_grade IS NULL
		SELECT 'Missing Parameter'
	ELSE
	BEGIN
		IF EXISTS(SELECT st_id, Exam_id, Q_id FROM Take_exam WHERE st_id= @st_id AND Exam_id= @ex_id AND Q_id= @q_id )
			SELECT 'ROW Already Exists'
		ELSE
		BEGIN
			INSERT INTO Take_exam VALUES(@st_id, @ex_id, @q_id, @st_ans, @st_grade)
			SELECT 'TakeExam Added Successfully'
		END
	END

use Exam
--calling
addTakeExam 1, 1, 4,'A',30
getTakeExam

-- 3/update------------------------------------------------------------------------------------
-- format:
-- updateTakeExam student_id, exam_id, question_id, student_answer, student_grade
-- first 3 parameters must be inserted
-- if any of the other parameters had not inserted it would be his old value in the row
alter proc updateTakeExam @st_id int = null,@ex_id int = null,@q_id int = null,@st_ans varchar(50) = null,@st_grade float = null 
AS
	
	if @st_id is null  SET @st_id=(SELECT st_id FROM Take_exam WHERE st_id = @st_id)
	if @ex_id is null SET @ex_id=(SELECT Exam_id FROM Take_exam WHERE Exam_id = @ex_id) 
	if @q_id is null SET @q_id=(SELECT Q_id FROM Take_exam WHERE Q_id = @q_id) 
	if @st_ans is null  SET @st_ans=(SELECT std_answer FROM Take_exam WHERE std_answer = @st_ans)
	if @st_grade is null SET @st_grade=(SELECT std_grade FROM Take_exam WHERE std_grade = @st_grade) 
	
	IF @st_id IS NULL OR @ex_id IS NULL OR @q_id IS NULL
		SELECT 'First 3 Parameters must Inserted'
	ELSE
	BEGIN
		if not exists(SELECT Exam_id FROM Exam WHERE Exam_id = @ex_id)
			select ' Invalid ----> Exam ID does not exist'
		else if not exists(SELECT st_id FROM student WHERE st_id = @st_id)
			select ' Invalid ----> Student ID does not exist'
		else if not exists(SELECT Q_id FROM Question WHERE Q_id = @q_id)
			select ' Invalid ----> Question ID does not exist'
		else
		begin
			UPDATE Take_exam SET
					st_id = @st_id, 
					Exam_id= @ex_id, 
					Q_id= @q_id,
					std_answer= @st_ans,
					std_grade= @st_grade
			WHERE st_id= @st_id and Exam_id= @ex_id and Q_id = @q_id
			SELECT 'Take Exam Updated Successfully'
		end
		
	END
--calling
updateTakeExam 112, 3, 55,'C',29 --update all for id 
getTakeExam


-- 4/Delete------------------------------------------------------------
-- format:
-- deleteTakeExam student_id, exam_id, qustion_id
-- all parameters must be passed
CREATE proc deleteTakeExam @st_id int = null,@ex_id int = null,@q_id int = null  
as
	IF @st_id IS NULL OR @ex_id IS NULL OR @q_id IS NULL
		SELECT 'Missing Parameter'
	ELSE
	BEGIN
		IF exists(select st_id,Exam_id,Q_id from Take_exam  where st_id= @st_id and Exam_id= @ex_id and Q_id = @q_id)
		BEGIN
			delete from  Take_exam where st_id= @st_id and Exam_id= @ex_id and Q_id = @q_id
			SELECT 'Take Exam Deleted Successfully';
		END
		ELSE
			select 'Invalid ----> Exam does not exist' 
	END
--calling
deleteTakeExam 1,1,4
getTakeExam
