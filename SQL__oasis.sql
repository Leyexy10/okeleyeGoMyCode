--Create Bookstores Database
Create Database oasis
Go

--Access the new Database Bookstores
Use oasis
Go

--1. this is link of my Relational Model(https://docs.google.com/document/d/1QRh7lzc8irxQixu65juk5_DX3EmI5uyzvziGRsXv0pA/edit?usp=sharing)

create table wine (
Num_W int primary key,
Category Varchar(30),
Year int,
Degree float
);
Go

create table producer (
Num_p int primary key,
First_name Varchar(30),
Last_name Varchar (30),
Region varchar (30),
);

Create table Harvest (
Primary key (Num_w,Num_p),
Num_w int foreign key references wine(Num_w),
Num_p int foreign key references  producer(Num_p),
Quantity int
);

--records wine table 
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (1, 'red',2010,45.3);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (2, 'blue',2013,30.7);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (3, 'black',2016,60.5);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (4, 'purple',2019,90.0);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (5, 'brown',1998,25.7);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (6, 'white',2004,28.0);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (7, 'pink',2011,10.20);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (8, 'grey',1897,20.70);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (9, 'orange',1992,25.3);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (10, 'dark',1875,88.0);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (11, 'strawberry',1962,90.8);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (12, 'fruit',1865,25.3);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (13, 'vodka',2004,27.80);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (14, 'green',2000,44.97);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (15, 'ogogoro',2022,29.3);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (16, 'kaikai',2022,23.3);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (17, 'spirit',2022,20.3);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (18, 'table',2001,25.3);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (19, 'green',2016,10.40);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (20, 'brown',2022,15.46);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (21, 'pink',1965,88.40);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (22, 'black',2006,80);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (23, 'blue',2004,25);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (24, 'white',2003,30);
INSERT INTO Wine(Num_w, category, Year, Degree) VALUES (25, 'red',2013,24.90);

--records producer table
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (319,'Atanda','sultan','Kaduna');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (514,'Femi','George','Lagos');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (720,'Emeka','Iluminati','Yaba');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (9987,'Fola','Aarin','Ebute');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (1143,'Dami','Lola','Imota');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (106,'Atanda','femi','Kaduna');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (225,'Femi','sultan','Lagos');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (01,'Emeka','Iluminati','Yaba');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (02,'leye','Aarin','Ebute');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (011,'kumu','Lola','Imota');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (30,'Atanda','leye','Kaduna');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (25,'amira','George','Lagos');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (17,'george','Iluminati','Yaba');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (90,'Fola','ifenna','Ebute');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (0190,'zion','zulu','Imota');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (903,'eli','reddingtton','Kaduna');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (565,'jack','bauer','Lagos');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (732,'Eme','keji','Yaba');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (009,'Fola','kemi','Ebute');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (1101,'zule','zoo','Imota');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (3087,'zion','zebra','Kaduna');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (56,'ofada','rice','Lagos');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (74,'bread','beans','Yaba');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (997,'leye','corper','Ebute');
INSERT INTO Producer(Num_p, First_name, Last_name, Region) VALUES (911,'caleb','amirat','Imota');


--records harvest table
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (1,319,10);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (2,514,20);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (3,720,15);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (4,9987,38);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (5,1143,40);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (6,106,28);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (7,225,10);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (8,01,20);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (9,02,63);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (10,011,88);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (11,30,60);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (12,25,25);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (13,17,80);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (14,90,97);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (15,0190,20);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (16,903,239);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (17,565,223);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (18,732,213);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (19,009,216);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (20,1101,222);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (21,3087,196);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (22,56,268);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (23,74,245);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (24,997,233);
INSERT INTO harvest(Num_w, Num_p, Quantity) VALUES (25,911,234);


--give the list the producers
Select producer.*
from producer

--Give the list of producers sorted by name
Select producer.First_name,last_name
from producer

--Give the list the producers of Sousse
select First_name,last_name,Region
from producer
where region='sousse'

--Calculate the total quantity of wine produced having the number 12
select sum(quantity), producer.num_p
from harvest
join producer
on harvest.Num_p=producer.Num_p
where Quantity=12
group by producer.Num_p

--Calculate the quantity of wine produced by category
select count(Harvest.Quantity), producer.Num_p
from Harvest
join producer
on harvest.num_p=producer.Num_p
where Harvest.Num_p=Quantity
group by producer.Num_p

--Which producers in the Sousse region have harvested at least one wine in quantities greater than 300 liters? We want the names and first names of the producers, sorted in alphabetical order
select first_name,last_name,region,quantity
from producer
join harvest
on producer.num_p=harvest.num_p
where region='sousse' and quantity>300
order by producer.first_name,last_name asc

--List the wine numbers that have a degree greater than 12 and that have been produced by producer number 24
select wine.Num_W,harvest.num_p
from wine
join harvest
on wine.num_w=harvest.num_w
where degree>12 and num_p=24












