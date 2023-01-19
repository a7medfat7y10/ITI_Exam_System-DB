window.repositoryObject = {"columns_custom_fields":[],"relations_custom_fields":[],"unique_keys_custom_fields":[],"triggers_custom_fields":[],"object_id":"t3753","name":"Exam_Question","subtype":"TABLE","is_user_defined":false,"description":null,"summary":[{"field":"Documentation","value":{"_type":"link","name":"ITI-Exam System DB","id":"d10"}},{"field":"Schema","value":"dbo"},{"field":"Name","value":"Exam_Question"},{"field":"Type","value":"Table"}],"columns":[{"id":"column-34710","object_id":"column-34710","name":"Exam_id","name_without_path":"Exam_id","description":null,"is_pk":true,"is_identity":false,"data_type":"int","data_length":null,"is_nullable":false,"computed_formula":null,"default_value":null,"path":null,"level":1,"item_type":"COLUMN","is_user_defined":false,"custom_fields":{},"linked_terms":[],"references":[{"id":"t3752","name":"Exam","name_show_schema":"dbo.Exam"}]},{"id":"column-34711","object_id":"column-34711","name":"Q_id","name_without_path":"Q_id","description":null,"is_pk":true,"is_identity":false,"data_type":"int","data_length":null,"is_nullable":false,"computed_formula":null,"default_value":null,"path":null,"level":1,"item_type":"COLUMN","is_user_defined":false,"custom_fields":{},"linked_terms":[],"references":[{"id":"t3756","name":"Question","name_show_schema":"dbo.Question"}]}],"relations":[{"name":"FK_Exam_Question_Exam","title":null,"description":null,"is_user_defined":false,"foreign_table":"Exam_Question","foreign_table_show_schema":"dbo.Exam_Question","foreign_table_verbose":"Exam_Question","foreign_table_verbose_show_schema":"dbo.Exam_Question","foreign_table_object_id":"t3753","primary_table":"Exam","primary_table_show_schema":"dbo.Exam","primary_table_verbose":"Exam","primary_table_verbose_show_schema":"dbo.Exam","primary_table_object_id":"t3752","pk_cardinality":"1x","fk_cardinality":"mx","constraints":[{"primary_column_path":null,"primary_column":"Exam_id","foreign_column_path":null,"foreign_column":"Exam_id"}],"custom_fields":{}},{"name":"FK_Exam_Question_Question","title":null,"description":null,"is_user_defined":false,"foreign_table":"Exam_Question","foreign_table_show_schema":"dbo.Exam_Question","foreign_table_verbose":"Exam_Question","foreign_table_verbose_show_schema":"dbo.Exam_Question","foreign_table_object_id":"t3753","primary_table":"Question","primary_table_show_schema":"dbo.Question","primary_table_verbose":"Question","primary_table_verbose_show_schema":"dbo.Question","primary_table_object_id":"t3756","pk_cardinality":"1x","fk_cardinality":"mx","constraints":[{"primary_column_path":null,"primary_column":"Q_id","foreign_column_path":null,"foreign_column":"Q_id"}],"custom_fields":{}}],"unique_keys":[{"name":"PK_Exam_Question","description":null,"is_pk":true,"is_user_defined":false,"columns":[{"path":null,"name_without_path":"Exam_id","name":"Exam_id"},{"path":null,"name_without_path":"Q_id","name":"Q_id"}],"custom_fields":{}}],"triggers":[],"dependencies":{"uses":[{"object_name":"Exam_Question","object_name_show_schema":"dbo.Exam_Question","object_type":"TABLE","object_id":"t3753","type":"NORMAL","object_user_defined":false,"user_defined":false,"children":[{"object_name":"Exam","object_name_show_schema":"dbo.Exam","object_type":"TABLE","object_id":"t3752","type":"RELATION","pk_cardinality":"1x","fk_cardinality":"mx","object_user_defined":false,"user_defined":false,"children":[]},{"object_name":"Question","object_name_show_schema":"dbo.Question","object_type":"TABLE","object_id":"t3756","type":"RELATION","pk_cardinality":"1x","fk_cardinality":"mx","object_user_defined":false,"user_defined":false,"children":[]}]}],"used_by":[]},"imported_at":"2023-01-19 22:19"};