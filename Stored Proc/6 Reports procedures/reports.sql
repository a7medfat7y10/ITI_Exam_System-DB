--1-
create proc getStudentsByDept @dept_id int
as
select * from student where dept_id = @dept_id

getStudentsByDept 2

--2-
create proc getStudentGrades @st_id int
as
select c.course_name, sum(t.std_grade) from Take_exam t, Exam e, course c where t.st_id = @st_id
and e.Exam_id = t.Exam_id and c.crs_id = e.crs_id
group by c.course_name

getStudentGrades 3
use EXAM
--3--
create proc getInstructorInfo @ins_id int
as
select c.course_name , count(sc.st_id) 
from instructor i, instructor_course ic, course c, student_course sc
where c.crs_id= sc.crs_id and i.ins_id = ic.ins_id and ic.crs_id = c.crs_id and 
i.ins_id = @ins_id
group by c.course_name

getInstructorInfo 1

--4-
create proc getTopics @crs_id int
as
select t.topic_name
	from course c
	inner join Topic t
	on c.crs_id = t.crs_id
	where c.crs_id = @crs_id

	getTopics 1




--5-
alter proc PrintExam @exam_id int
as
select eq.Exam_id ,q.Q_content, q.type, qc.choices, q.Q_correct_answer from Exam e
	inner join Exam_Question eq on e.Exam_id = eq.Exam_id
	inner join Question q on eq.Q_id = q.Q_id
	inner join question_choices qc on q.Q_id = qc.Q_id
	where e.Exam_id = @exam_id


	PrintExam 34
	PrintExam 36


--6-
alter proc QuestionVsStudentAns @exam_id int, @st_id int 
as
select t.Exam_id,q.Q_content, q.type, q.Q_correct_answer, t.std_answer 
from Take_exam t, question q
where t.Q_id = q.Q_id and t.Exam_id = @exam_id and t.st_id = @st_id


QuestionVsStudentAns 36,3