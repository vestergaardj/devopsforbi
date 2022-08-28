CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'FellowmindStyrerForVildt2022';
GO;

CREATE DATABASE SCOPED CREDENTIAL [https://cmsvnext.blob.core.windows.net/sqldbauditlogs]
    WITH IDENTITY = N'SHARED ACCESS SIGNATURE';

