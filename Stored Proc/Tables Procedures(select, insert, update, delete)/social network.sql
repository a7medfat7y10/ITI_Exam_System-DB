
use EXAM
-- ****** Stored Procedure for student_network Table ******--

-- 1. SP to select info about social network for student 
    -- case 1 :  If user don't give SP and Parameter: 
	           -- it will select all rows in table

	-- case 2 : If user give SP student id as a Parameter: 
	           -- it will select only one row of the input student id
			   
	-- case 3 : If user give SP student id as a Parameter and this id is not valid: 
			-- user will have an error message ( this id is not invalid .. student does not exist)	 


-- select  
alter proc getNetworkInfo @id int =null
as 
if @id is null
	select * from student_network
else 
	begin 
		if  exists(select SN.st_id from student_network SN ,student S where S.st_id=SN.st_id) 	
		and exists ( select st_id from student_network where st_id=@id )
			select * from student_network where st_id = @id
		else
		select ' student id not matched .. studet does not exists  '			
	end

--calling
getNetworkInfo
execute getNetworkInfo 2

----------------------------------------------------------------------------------------------------------
-- 2. SP to insert info about social network for student 
    -- case 1 :  If user don't give SP and Parameter: 
	           -- user will have an error message ( you have to enter values you want to insert )

	-- case 2 : If user give SP parameters student id , student social network account: 
	           -- it will insert new info to student network table 	  

--insert
alter proc addNetworkInfo @id int ,@network varchar(50)
as
begin try 
	insert into student_network values(@id,@network)
end try 
begin catch
	select ' Invalid ----> This social network already exists'
end catch 

--calling
addNetworkInfo 1,'omar1@gmail.com'
getNetworkInfo

deleteNetworkInfo 1


--------------------------------------------------------------------------------

-- 3. SP to update info of social network for student 
    -- case 1 :  If user give SP an student id and this parameter is invalid (not exists): 
	           -- user will have an error message (you can not update .. this student does not exist!)

	-- case 2 : If user give SP parameters student id: 
	           -- it will update social network info of student

--update
create proc updateNetworkInfo 
@id int ,@oldnetwork varchar(50),@newnetwork varchar(50)
as
	if exists(select st_id from student where st_id=@id)
	begin
		if exists ( select socialMediaAccount from student_network where 
		             socialMediaAccount=@oldnetwork and st_id=@id)
			update student_network set socialMediaAccount = @newnetwork 
			where st_id=@id and socialMediaAccount=@oldnetwork		
	end
	else 
		select 'you can not update .. this student does not exist !'

--calling
updateNetworkInfo 4, 'sayed44@gmail.com','ahaah@gmail.com'
getNetworkInfo


-----------------------------------------------------------------------------------
-- 4. SP to delete info of social network for student 
    -- case 1 :  If user give SP an student id and this parameter is invalid (not exists): 
	           -- user will have an error message (Invalid ----> student does not exist)

	-- case 2 : If user give SP parameters student id: 
	           -- it will delete all social network info of student

-- Delete
create proc deleteNetworkInfo @id int ,@network varchar(50)=null   
as
if exists(select st_id from student_network where st_id = @id)
begin
if @network is not null
	delete from  student_network where st_id = @id and socialMediaAccount=@network
else
delete from  student_network where st_id = @id
end
else
	select 'Invalid ----> student does not exist' 

	
--calling
deleteNetwork 20 

-----------------------------------------------------------------------------




