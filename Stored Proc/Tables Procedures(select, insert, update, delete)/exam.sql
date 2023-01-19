use EXAM
-- ****** Stored Procedure for Exam Table ******--

-- select 
-- format:
-- getExam Exam_id
-- return exam data by id
-- if no parameter is passed it will return all exmas data
alter proc getExam @id int = null
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



-- insert
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



-- update
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


-- Delete
-- format:
-- deleteExam exam_id
-- Exam ID must be passed
create proc deleteExam @id int   
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
