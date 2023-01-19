use EXAM
-- ****** Stored Procedure for Department Table ******--

-- select 
alter proc getDepartment @id int  =null
as 
if @id is null
	select * from department
else 
	begin
		if exists(select dept_id from department  where dept_id = @id)
				select * from department where dept_id = @id
		else
			select 'Department does not exist'
	end
--calling
execute getDepartment
execute getDepartment 15

--insert
alter proc addDepartment @name varchar(50)
as
begin try 
	insert into department values(@name)
end try 
begin catch
	select ' Invalid ----> you cannot add department'
end catch 

--calling
addDepartment 'SSS'



--update
alter proc updateDepartment @id int , @name varchar(50)
as
	if exists(select dept_id from department where dept_id=@id)
			update department set dept_name = @name where dept_id=@id
	else 
		select 'department does not exist'

--calling
updateDepartment 20, 'abc' --update all for id 20


-- Delete
create proc deleteDepartment @id int   
as
if exists(select dept_id from department  where dept_id = @id)
	delete from  department where dept_id = @id
else
	select 'Invalid ----> Department does not exist' 

--calling
deleteDepartment 20

select * from department
