use exam
alter proc generateExam 
@crs_name varchar(50), @mcq_no int, @tf_no int, @ex_duration int =2 , @ex_date date =null
as
	if @ex_date is null set @ex_date =getDate()
	
	declare @crs_id int
	set @crs_id = (SELECT crs_id FROM course WHERE course_name = @crs_name)
	
	if @crs_id is not null
	begin
		INSERT INTO Exam
		VALUES (@ex_duration,@ex_date,@crs_id)
	
		DECLARE @new_exam_id int = @@IDENTITY
		--select @new_exam_id=max(Exam_id) from Exam

		DECLARE @total_questions int = @mcq_no + @tf_no 
	
		INSERT INTO Exam_Question
		SELECT TOP (@mcq_no) @new_exam_id, Q_id FROM Question WHERE crs_id = @crs_id and type ='mcq' ORDER BY NEWID()
	
		Insert Into Exam_Question
		SELECT TOP (@tf_no) @new_exam_id, Q_id FROM Question WHERE crs_id = @crs_id and type = 'tf' ORDER BY NEWID()
	end
	else 
		select 'this course is not found'	
	
	

generateExam 'programmingLanguage', 6, 4
generateExam 'front', 7, 3
