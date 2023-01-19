use EXAM
-- ****** Stored Procedure for Topic Table ******--

-- select 
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



--insert
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

--update
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

-- Delete
create proc deleteTopic @id int
as
if exists(select topic_id from Topic  where topic_id = @id)
	delete from  Topic where topic_id = @id
else
	select 'Invalid ----> Topic does not exist' 

--calling
deleteCourse 20


