use EXAM


-- ****** Stored Procedure for Course Table ******--

-- select 
--getCourse @id 
--this sp takes the course id as a parameter and returns all its data
--getCourse without parameters returns all the courses
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



--insert
--addCourse @id ,@duration ,@name
--this sp adds new course and must take 3 parameters
alter proc addCourse @duration int ,@name varchar(50)
as
begin try 
	insert into course values(@duration, @name)
end try 
begin catch
	select ' Invalid ----> you cannot add course'
end catch 

--calling
addCourse 3, 'hhh'



--update
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



-- Delete
alter proc deleteCourse @id int   
as
if exists(select crs_id from course  where crs_id = @id)
	delete from  course where crs_id = @id
else
	select 'Invalid ----> Course does not exist' 

--calling
deleteCourse 30


