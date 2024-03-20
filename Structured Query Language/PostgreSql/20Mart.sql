--create table Users(
--userId serial primary key,
--userName varchar(50),
--userAge smallint
--)

--INSERT INTO Users (userName, userAge) VALUES ('Ebubekir', 20), ('Erva', 20), ('Doğa', 21);

-- select * from Users

-- (SELECT ARRAY[0,1,2] int_arr)

--create table UsersDeleteLog as select * from Users where userAge=50

--drop table users

--drop table UsersDeleteLog

--Select CHAR_LENGTH('Tam olarak 26 karakter var')


COPY users TO 'C:\Users\ebube\Masaüstü\Yazılım\Projects\DatabaseManagement_Sql\Structured Query Language\PostgreSql\users.csv' WITH CSV HEADER;

