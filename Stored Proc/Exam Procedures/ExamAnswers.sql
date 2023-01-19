alter proc examAnswers 
@exam_id int, @st_name varchar(50), @q_1 varchar(50),
@q_2 varchar(50),@q_3 varchar(50),@q_4 varchar(50),@q_5 varchar(50),@q_6 varchar(50),
@q_7 varchar(50),@q_8 varchar(50),@q_9 varchar(50),@q_10 varchar(50)
as
	begin try
		declare @st_id int
		select @st_id = st_id from student where st_fname + ' ' + st_lname =@st_name
		
		if @st_id is not null
		begin 
			declare @t table(student_answer varchar(50))
			insert into @t values(@q_1), (@q_2), (@q_3),(@q_4), (@q_5), (@q_6),(@q_7), (@q_8), (@q_9),(@q_10)

			--select Q_id from Question where crs_id = @
			--insert into Take_exam
			--select @st_id,@exam_id,student_answer from @t
			insert into Take_exam 
			select st_id, eq.Exam_id,eq.Q_id, null, null from Exam_Question eq, student s
			where Exam_id = @exam_id and st_id = @st_id


			declare c2 cursor
			for select t.std_answer from Take_exam t where t.Exam_id = @exam_id and t.st_id=@st_id
			for update
				declare @std_answer_Answer varchar(50)
				open c2
				fetch c2 into @std_answer_Answer
				while @@FETCH_STATUS=0
				begin
					declare c1 cursor
					for select student_answer from @t
					for read only
						declare @temp_Answer varchar(50)
						open c1
						fetch c1 into @temp_Answer 
						while @@FETCH_STATUS=0
						begin
							update Take_exam
							set  std_answer=@temp_Answer  from Take_exam t 
							where current of c2
							fetch c2 into @std_answer_Answer
							fetch c1 into @temp_Answer
						end
    
				end
				close c1
				deallocate c1
			close c2
			deallocate c2

			select 'Exam Answered Successfully'
		end
		else
			select 'this student does not exist'
	end try
	begin catch
		select 'invalid exam answering.. try again'
	end catch



	


 examAnswers 36, 'ahmed mohamed', 'B','A', 'B', 'B','A', 'C', 'A', 'T', 'F', 'F'

 getExam 36
 PrintExam 36