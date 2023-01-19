-- ****** Stored Procedure for QuetsionChoices Table ******--

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

--- insert question choices in table question_choices 

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

getQuestion
getQuestionChoices

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


--delete choices from the the table by id   
create proc deleteQuestionChoices @id int   
as
if exists(select q_id from question_choices  where Q_id = @id)
	delete from  question_choices where Q_id = @id
else
	select 'Invalid ----> question choices does not exist' 

--calling
deleteQuestionChoices 100
