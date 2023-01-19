
-- ****** Stored Procedure for instructor_course Table ******----------------------------------------------

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



--insert-------------------------------------------------------------------
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


--update -------------------------------------------------------------------------
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


-- Delete------------------------------------------------------------------
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




