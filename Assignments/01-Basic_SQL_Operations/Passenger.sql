create database assignment01;

-- 1. Create a table (Passenger) based on the following specifications.
create table Passenger
(
    Passenger_ID int,
    Passenger_FName varchar(200),
    Passenger_LName varchar(200),
    Passenger_Age int,
    Destination varchar(200)
);

-- 2. Add the following five records to the table.
insert into Passenger
values
    (1, 'Ken', 'Kaneki', 21, 'Tokyo');
insert into Passenger
values
    (2, 'Hideyoshi', 'Nagachika', 26, 'Tokyo');
insert into Passenger
values
    (3, 'Frank', 'Robertson', 46, 'Madrid');
insert into Passenger
values
    (4, 'Indrajit', 'Roy', 37, 'Delhi');
insert into Passenger
values
    (5, 'Abul', 'Kashem', 57, 'Lahore');


-- 3. Display the unique Destination values.
select distinct Destination
from Passenger;

-- 4. Update the Destination of Frank to Delhi.  
update Passenger set Destination = 'Delhi' where Passenger_FName = 'Frank';

-- 5. Delete the records from the table if the Destination is Tokyo. 
delete from Passenger where Destination = 'Tokyo';

-- 6. Display the Passenger_FName values if the Passenger_Age value is greater than 30. 
select Passenger_FName
from Passenger
where Passenger_Age > 30;

-- 7. Add a new column Source of Varchar type to the table.  
alter table Passenger add Source varchar(200);

-- 8. For all the existing entries of the table, set the value of Source as Paris. 
update Passenger set Source = 'Paris';

-- 9. Display all the entries completely.  
select *
from Passenger;

-- 10. Introduce Primary Key in combination of Passenger_ID and Passenger_LName.
alter table Passenger alter column Passenger_ID int not null;
alter table Passenger alter column Passenger_LName varchar(200) not null;
alter table Passenger add constraint prim_key primary key (Passenger_ID, Passenger_LName);

-- 11. Introduce a Check so that the Passenger_Age must be greater than 18.  
alter table Passenger add constraint pass_age check (Passenger_Age > 18);

-- 12. Set the Default value of Destination as Kyoto.  
alter table Passenger add constraint dest_const default 'Kyoto' for Destination;

-- 13. Display the records in descending order in regards to the Passenger_Age values.  
select *
from Passenger
order by Passenger_Age desc;

-- 14. Display the records whose Passenger_Age values are within the range of 25 to 40.  
select *
from Passenger
where Passenger_Age between 25 and 40;

-- 15. Display Passenger_FName values of records whose Passenger_LName values have o in them.  
select Passenger_FName
from Passenger
where Passenger_LName like '%o%';

-- 16. Drop the Check on Passenger_Age attribute.  
alter table Passenger
drop constraint pass_age;

-- 17. Drop the Default constraint from the Destination attribute.  
alter table Passenger drop constraint dest_const;

-- 18. Delete the Passenger_Age column from the table.  
alter table Passenger drop column Passenger_Age;

-- 19. Delete all the records from the Passenger table.  
truncate table Passenger;

-- 20. Delete the Passenger table.  
drop table Passenger;

drop database assignment01;