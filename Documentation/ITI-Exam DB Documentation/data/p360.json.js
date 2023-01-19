window.repositoryObject = {"parameters_custom_fields":[],"object_id":"p360","name":"updateTakeExam","subtype":"PROCEDURE","is_user_defined":false,"description":null,"summary":[{"field":"Documentation","value":{"_type":"link","name":"ITI-Exam System DB","id":"d10"}},{"field":"Schema","value":"dbo"},{"field":"Name","value":"updateTakeExam"},{"field":"Type","value":"Procedure"}],"script":"create proc updateTakeExam @st_id int = null,@ex_id int = null,@q_id int = null,@st_ans varchar(50) = null,@st_grade float = null \r\nAS\r\n\t\r\n\tif @st_id is null  SET @st_id=(SELECT st_id FROM Take_exam WHERE st_id = @st_id)\r\n\tif @ex_id is null SET @ex_id=(SELECT Exam_id FROM Take_exam WHERE Exam_id = @ex_id) \r\n\tif @q_id is null SET @q_id=(SELECT Q_id FROM Take_exam WHERE Q_id = @q_id) \r\n\tif @st_ans is null  SET @st_ans=(SELECT std_answer FROM Take_exam WHERE std_answer = @st_ans)\r\n\tif @st_grade is null SET @st_grade=(SELECT std_grade FROM Take_exam WHERE std_grade = @st_grade) \r\n\t\r\n\tIF @st_id IS NULL OR @ex_id IS NULL OR @q_id IS NULL\r\n\t\tSELECT 'First 3 Parameters must Inserted'\r\n\tELSE\r\n\tBEGIN\r\n\t\tif not exists(SELECT Exam_id FROM Exam WHERE Exam_id = @ex_id)\r\n\t\t\tselect ' Invalid ----> Exam ID does not exist'\r\n\t\telse if not exists(SELECT st_id FROM student WHERE st_id = @st_id)\r\n\t\t\tselect ' Invalid ----> Student ID does not exist'\r\n\t\telse if not exists(SELECT Q_id FROM Question WHERE Q_id = @q_id)\r\n\t\t\tselect ' Invalid ----> Question ID does not exist'\r\n\t\telse\r\n\t\tbegin\r\n\t\t\tUPDATE Take_exam SET\r\n\t\t\t\t\tst_id = @st_id, \r\n\t\t\t\t\tExam_id= @ex_id, \r\n\t\t\t\t\tQ_id= @q_id,\r\n\t\t\t\t\tstd_answer= @st_ans,\r\n\t\t\t\t\tstd_grade= @st_grade\r\n\t\t\tWHERE st_id= @st_id and Exam_id= @ex_id and Q_id = @q_id\r\n\t\t\tSELECT 'Take Exam Updated Successfully'\r\n\t\tend\r\n\t\t\r\n\tEND","parameters":[{"name":"st_id","description":null,"mode":"IN","data_type":"int","custom_fields":{}},{"name":"ex_id","description":null,"mode":"IN","data_type":"int","custom_fields":{}},{"name":"q_id","description":null,"mode":"IN","data_type":"int","custom_fields":{}},{"name":"st_ans","description":null,"mode":"IN","data_type":"varchar(50)","custom_fields":{}},{"name":"st_grade","description":null,"mode":"IN","data_type":"float","custom_fields":{}}],"dependencies":{"uses":[],"used_by":[]},"imported_at":"2023-01-19 22:19"};