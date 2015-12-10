DECLARE @COMMAND NVARCHAR(200);SELECT TOP 1 @COMMAND= 'ALTER TABLE UM_ROLE_PERMISSION DROP CONSTRAINT ' + RC.CONSTRAINT_NAME + ';' FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KF ON RC.CONSTRAINT_NAME = KF.CONSTRAINT_NAME JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KP ON RC.UNIQUE_CONSTRAINT_NAME = KP.CONSTRAINT_NAME WHERE KF.TABLE_NAME = 'UM_ROLE_PERMISSION' AND KP.TABLE_NAME='UM_PERMISSION';EXEC (@COMMAND);

DECLARE @COMMAND NVARCHAR(200);SELECT TOP 1 @COMMAND= 'ALTER TABLE UM_USER_PERMISSION DROP CONSTRAINT ' + RC.CONSTRAINT_NAME + ';' FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KF ON RC.CONSTRAINT_NAME = KF.CONSTRAINT_NAME JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KP ON RC.UNIQUE_CONSTRAINT_NAME = KP.CONSTRAINT_NAME WHERE KF.TABLE_NAME = 'UM_USER_PERMISSION' AND KP.TABLE_NAME='UM_PERMISSION';EXEC (@COMMAND);

DECLARE @COMMAND NVARCHAR(200);SELECT TOP 1 @COMMAND= 'ALTER TABLE UM_HYBRID_USER_ROLE DROP CONSTRAINT ' + RC.CONSTRAINT_NAME + ';' FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS RC JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KF ON RC.CONSTRAINT_NAME = KF.CONSTRAINT_NAME JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE KP ON RC.UNIQUE_CONSTRAINT_NAME = KP.CONSTRAINT_NAME WHERE KF.TABLE_NAME = 'UM_HYBRID_USER_ROLE' AND KP.TABLE_NAME='UM_HYBRID_ROLE';EXEC (@COMMAND);

ALTER TABLE UM_ROLE_PERMISSION ADD FOREIGN KEY (UM_PERMISSION_ID, UM_TENANT_ID) REFERENCES UM_PERMISSION(UM_ID, UM_TENANT_ID) ON DELETE CASCADE;

ALTER TABLE UM_USER_PERMISSION ADD FOREIGN KEY (UM_PERMISSION_ID, UM_TENANT_ID) REFERENCES UM_PERMISSION(UM_ID, UM_TENANT_ID) ON DELETE CASCADE;

ALTER TABLE UM_HYBRID_USER_ROLE ADD FOREIGN KEY (UM_ROLE_ID, UM_TENANT_ID) REFERENCES UM_HYBRID_ROLE(UM_ID, UM_TENANT_ID) ON DELETE CASCADE;