
create proc ins_show @ins_id int = null 
as

if @ins_id is null
select * from instructor 
else  
begin
if @ins_id is not null and @ins_id in (select ins_id from instructor)
select * from instructor where ins_id=@ins_id
else 
select 'your inserted id doesn not exist'
end

ins_show 10


--insert instructor with the name and salary and department and check if you can insert or not
alter proc insertIns  @ins_name varchar(30), @ins_salary float , @ins_dept int
as
begin try 
	insert into instructor(ins_name,salary,dept_id) values(@ins_name,@ins_salary,@ins_dept)
end try
begin catch
	select 'you entered wrong data'
end catch

--call insert instructor with the name and salary and department 
-- paramaters (  name , salary , dept id  )
insertIns 'ahmed fathy',3000,7




--- update the instructor name , salary , dept id 
alter proc updateIns 
@id int , @name varchar(50) = null,  @salary float=null, @dept_id int =null
as
begin try
	if exists(	select ins_id from instructor where ins_id=@id)
	begin
		if @name is not null
			update instructor set ins_name = @name where ins_id=@id
		if @salary is not null
			update instructor set salary = @salary where ins_id=@id
		if @dept_id is not null
			update instructor set dept_id = @dept_id where ins_id=@id
	end
	else 
		select 'instructor does not exist'
end try
begin catch
	select 'department doesnot exist'
end catch
	
--call update instructor table
--paramaters instructor( ID , name , salary , dept id )
updateIns 10 , 'yasser' , 3000,1000
updateIns 10, @name = 'ali'

--- delete procedure delete specific instructor from table 
create proc deleteIns @id int   
as
if exists(select ins_id from instructor  where ins_id = @id)
	delete from  instructor where ins_id = @id
else
	select 'Invalid ----> instructor does not exist' 

--calling
deleteIns 1