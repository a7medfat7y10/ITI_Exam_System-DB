alter proc examCorrection @exam_id int, @st_name varchar(50) 
as
	declare @st_id int
	select @st_id = st_id from student where st_fname + ' ' + st_lname =@st_name

	begin try 
		if @st_id is not null
		begin 
			declare @t table(student_answer varchar(50))
			insert into @t select q.Q_correct_answer from question q 
			inner join take_Exam TE on q.Q_id = TE.Q_id where TE.st_id=@st_id and TE.Exam_id=@exam_id

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
						declare @correct_Answer varchar(50) 
						open c1
							fetch c1 into @correct_Answer 
							while @@FETCH_STATUS=0
							begin 
								if(@correct_Answer=@std_answer_Answer) 
								begin
									update Take_exam 
									set std_grade=1 
									where current of c2
								end
								else 
								begin
									update Take_exam 
									set std_grade=0 
									where current of c2 
								end
								 fetch c2 into @std_answer_Answer 
								 fetch c1 into @correct_Answer
							end	
					end
				close c1
				deallocate c1
				close c2
				deallocate c2

				execute getStudentGrades @st_id
	end
	else 
		select 'this student does not exist'
	end try
	begin catch

	end catch

	


examCorrection 36, 'ahmed mohamed'