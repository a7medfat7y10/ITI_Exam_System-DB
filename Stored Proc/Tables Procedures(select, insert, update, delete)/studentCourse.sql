--				****** Stored Procedure for studentCourse Table ******--

-- select 
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


--insert
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


--update
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



-- Delete
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