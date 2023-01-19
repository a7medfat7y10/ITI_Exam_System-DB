
use EXAM
-- ****** Stored Procedure for TakeExam Table ******--

-- select
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



--insert
-- format:
-- addTakeExam st_id, Exam_id, Q_id, std_answer, std_grade
-- all parameters must be passed
create proc addTakeExam @st_id int = null,@ex_id int = null,@q_id int = null,@st_ans varchar(50) = null,@st_grade float = null
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

-- update
-- format:
-- updateTakeExam student_id, exam_id, question_id, student_answer, student_grade
-- first 3 parameters must be inserted
-- if any of the other parameters had not inserted it would be his old value in the row
create proc updateTakeExam @st_id int = null,@ex_id int = null,@q_id int = null,@st_ans varchar(50) = null,@st_grade float = null 
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


-- Delete
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
