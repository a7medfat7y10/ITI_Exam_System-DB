use EXAM



-- ****** Stored Procedure for Student Table ******--

-- select 
alter proc getStudent @id int = null
as 
if @id is null
	select * from student
else 
	begin
	if exists(select st_id from student  where st_id = @id)
			select * from student where st_id = @id
	else
		select 'student does not exist'
	end

--calling
getStudent 
execute getStudent 2



--insert
alter proc addStudent 
@first_name varchar(50), @last_name varchar(50), @address varchar(50), @age int, @dept_id int
as
begin try 
	insert into student values(@first_name, @last_name, @address, @age, @dept_id)
end try 
begin catch
	select ' Invalid ----> you cannot add student'
end catch 

--calling
addStudent 30, 'khaled', 'Magdy', 'demietta', 25, 2



--update
alter proc updateStudent 
@id int , @first_name varchar(50)=NULL, @last_name varchar(50) = NULL,
@address varchar(50)=NULL, @age int=NULL, @dept_id int =NULL
as
begin try
	if exists(select st_id from student where st_id=@id)
	begin
		if @first_name is not null
			update student set st_fname = @first_name where st_id=@id
		if @last_name is not null
			update student set st_lname = @last_name where st_id=@id
		if @address is not null
			update student set adress = @address where st_id=@id
		if @age is not null
			update student set age = @age where st_id=@id
		if @dept_id is not null
			update student set dept_id = @dept_id where st_id=@id
	end
	else 
		select 'student does not exist'
end try
begin catch
	select 'department does not exist'
end catch


--calling
updateStudent 4, 'khaled', 'Magdy', 'demietta', 25, 2 --update all for id 2
updateStudent 3, @first_name='ali' --update only first name
updateStudent 3, @age=44 --update only age



-- Delete
alter proc deleteStudent @id int   
as
if exists(select st_id from student  where st_id = @id)
	delete from  student where st_id = @id
else
	select 'Invalid ----> student does not exist' 

--calling
deleteStudent 45


