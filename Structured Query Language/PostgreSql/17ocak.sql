--create table persons(
--	personId bigserial primary key,
--	personNameSurname varchar(50),
--	personTcKimlikNo char(11),
--	personAge smallint
--);

--select * from persons

--insert into persons(personNameSurname,personTcKimlikNo,personAge) values ('Ebubekir Sıddık Nazlı','22204741428',20),('Muhammed Emir Yılmaz','31314144413',21);

--select * from persons order by personId asc

--insert into persons(personNameSurname,personTcKimlikNo,personAge) values ('Enes Ahmet Gül','11122233344',20);

--update persons set personTcKimlikNo='31313131313' where personId=2

-- insert into persons(personNameSurname,personTcKimlikNo,personAge) values ('Mehmet Turan','60603131251',22);

-- CREATE TABLE personels (
--     personId INT,
--     personelJob VARCHAR(30),
--     personelMaas DECIMAL(8,2),
--     FOREIGN KEY (personId) REFERENCES persons(personId)
-- );

select personNameSurname, personels.personelJob,personels.personelMaas from personels join persons on persons.personId=personels.personId order by personelMaas desc

-- insert into personels(personId,personelJob,personelMaas) values(2,'Backend Developer',58000.99),(3,'Frontend Developer',60000.31),(4,'Siber Güvenlikçi',72000.60);

--alter table personels add column hizmet smallint;

--select * from personels

--update personels set hizmet=3

-- SELECT CHAR_LENGTH('ABCDE')

CREATE FUNCTION topla(s1 int, s2 int) RETURNS bigint 
AS $$
DECLARE
  sonuc INTEGER;
BEGIN
  sonuc = s1 + s2;
  RETURN sonuc;
END;
$$ LANGUAGE plpgsql;

-- Call the function and display the result
create view onbesvebesintoplamı
as
SELECT topla(15, 5);

select * from onbesvebesintoplamı

--transaction
begin;
select topla(15,5)
rollback;



CREATE OR REPLACE FUNCTION set_insert_date()
RETURNS TRIGGER AS $$
BEGIN
  NEW.insert_date := CURRENT_DATE;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_trigger
BEFORE INSERT ON your_table
FOR EACH ROW
EXECUTE FUNCTION set_insert_date();



