window.repositoryObject = {"parameters_custom_fields":[],"object_id":"p343","name":"getTakeExam","subtype":"PROCEDURE","is_user_defined":false,"description":null,"summary":[{"field":"Documentation","value":{"_type":"link","name":"ITI-Exam System DB","id":"d10"}},{"field":"Schema","value":"dbo"},{"field":"Name","value":"getTakeExam"},{"field":"Type","value":"Procedure"}],"script":"create proc getTakeExam @st_id int = null,@ex_id int = null,@q_id int = null\r\nas \r\nif @st_id is null and @ex_id is null and @q_id is null\r\n\tselect * from Take_exam\r\nelse \r\n\tbegin \r\n\t\tif exists(select st_id, Exam_id, Q_id from Take_exam  where st_id = @st_id and Exam_id = @ex_id and Q_id = @q_id)\t\t\t\r\n\t\t\tselect * from Take_exam  where st_id = @st_id and Exam_id = @ex_id and Q_id = @q_id\r\n\t\telse\r\n\t\t\tselect 'Take Exam does not exist'\r\n\tend","parameters":[{"name":"st_id","description":null,"mode":"IN","data_type":"int","custom_fields":{}},{"name":"ex_id","description":null,"mode":"IN","data_type":"int","custom_fields":{}},{"name":"q_id","description":null,"mode":"IN","data_type":"int","custom_fields":{}}],"dependencies":{"uses":[],"used_by":[]},"imported_at":"2023-01-19 22:19"};