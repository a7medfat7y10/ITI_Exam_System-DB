use EXAM

-- ****** Stored Procedure for Question Table ******--

-- select 
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

--insert
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


--update
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



-- Delete
create proc deleteQuestion @id int   
as
if exists(select Q_id from Question where Q_id=@id)
	delete from  Question where Q_id = @id
else
	select 'Invalid ----> Question does not exist' 

--calling
deleteQuestion 101

getQuestion