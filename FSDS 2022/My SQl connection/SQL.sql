Create database if not exists Baroda;
use baroda;
Create table if not exists bank_cred(
age int,
job varchar(30),
marital varchar(30),
education varchar(30),
`default` varchar(30),
balance int,
housing varchar(30),
loan varchar(30),
contact varchar(30),
`day` int,
`month` varchar(30),
duration int,
campaign int,
pdays int,
previous int,
poutcome varchar(30),
y varchar(30) );
Describe bank_cred;
insert into bank_cred values(58,"management","married","tertiary","no",2143,"yes","no","unknown",5,"may",261,1,-1,0,"unknown","no");
select * from bank_cred;
insert into bank_cred values
(44,"technician","single","secondary","no",29,"yes","no","unknown",5,"may",151,1,-1,0,"unknown","no"),
(33,"entrepreneur","married","secondary","no",2,"yes","yes","unknown",5,"may",76,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",1506,"yes","no","unknown",5,"may",92,1,-1,0,"unknown","no"),
(33,"unknown","single","unknown","no",1,"no","no","unknown",5,"may",198,1,-1,0,"unknown","no"),
(35,"management","married","tertiary","no",231,"yes","no","unknown",5,"may",139,1,-1,0,"unknown","no"),
(28,"management","single","tertiary","no",447,"yes","yes","unknown",5,"may",217,1,-1,0,"unknown","no"),
(42,"entrepreneur","divorced","tertiary","yes",2,"yes","no","unknown",5,"may",380,1,-1,0,"unknown","no"),
(58,"retired","married","primary","no",121,"yes","no","unknown",5,"may",50,1,-1,0,"unknown","no"),
(43,"technician","single","secondary","no",593,"yes","no","unknown",5,"may",55,1,-1,0,"unknown","no"),
(41,"admin.","divorced","secondary","no",270,"yes","no","unknown",5,"may",222,1,-1,0,"unknown","no"),
(29,"admin.","single","secondary","no",390,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",6,"yes","no","unknown",5,"may",517,1,-1,0,"unknown","no"),
(58,"technician","married","unknown","no",71,"yes","no","unknown",5,"may",71,1,-1,0,"unknown","no"),
(57,"services","married","secondary","no",162,"yes","no","unknown",5,"may",174,1,-1,0,"unknown","no"),
(51,"retired","married","primary","no",229,"yes","no","unknown",5,"may",353,1,-1,0,"unknown","no"),
(45,"admin.","single","unknown","no",13,"yes","no","unknown",5,"may",98,1,-1,0,"unknown","no"),
(57,"blue-collar","married","primary","no",52,"yes","no","unknown",5,"may",38,1,-1,0,"unknown","no"),
(60,"retired","married","primary","no",60,"yes","no","unknown",5,"may",219,1,-1,0,"unknown","no"),
(33,"services","married","secondary","no",0,"yes","no","unknown",5,"may",54,1,-1,0,"unknown","no"),
(28,"blue-collar","married","secondary","no",723,"yes","yes","unknown",5,"may",262,1,-1,0,"unknown","no"),
(56,"management","married","tertiary","no",779,"yes","no","unknown",5,"may",164,1,-1,0,"unknown","no"),
(32,"blue-collar","single","primary","no",23,"yes","yes","unknown",5,"may",160,1,-1,0,"unknown","no"),
(25,"services","married","secondary","no",50,"yes","no","unknown",5,"may",342,1,-1,0,"unknown","no"),
(40,"retired","married","primary","no",0,"yes","yes","unknown",5,"may",181,1,-1,0,"unknown","no"),
(44,"admin.","married","secondary","no",-372,"yes","no","unknown",5,"may",172,1,-1,0,"unknown","no");

select * from bank_cred where age=58 and balance=2143;

select * from bank_cred;
select age, job from bank_cred;
select * from bank_cred where job='retired' and balance>100;
select * from bank_cred where education ='primary' or balance <100;
select distinct job from bank_cred;
select * from bank_cred order by age;
select * from bank_cred order by age desc;
select count(*) from bank_cred;
select sum(balance) from bank_cred;
select avg(balance) from bank_cred;
select min(balance) from bank_cred;
select * from bank_cred where balance= (select min(balance) from bank_cred);
select marital, count(*) from bank_cred group by marital;
select marital, count(*),  sum(balance) from bank_cred group by marital;
select marital, count(*),  sum(balance), avg(balance) from bank_cred group by marital;
select marital, count(*),  sum(balance), avg(balance) from bank_cred group by marital having sum(balance)>550;

set sql_safe_updates=0;
update bank_cred set balance=0 where job='unknown';
select * from bank_cred where job='unknown';
update bank_cred set contact='known', y='yes' where month='may';
update bank_cred set `default`='null' where `default`='yes';
delete from bank_cred where job='unknown';

Delimiter && 
create procedure show_database()
begin
	select * from bank_cred;
end &&
Call show_database;

Delimiter && 
create procedure database_filt(in var varchar(30) ,in var1 int)
begin
	select * from bank_cred where job=var and balance> var1;
end &&
Call database_filt('retired', 200);

select *from (select job, age, education, y from bank_cred) as a where a.age=58; 
select job, age, education, y from bank_cred where age=58;

Create view bank_subview as select job, age, education, y from bank_cred;
select *from bank_subview as a where a.age=58; 

#new table
Create table if not exists bank_cred1(
age int,
job varchar(30),
marital varchar(30),
education varchar(30),
`default` varchar(30),
balance int,
housing varchar(30),
loan varchar(30),
contact varchar(30),
`day` int,
`month` varchar(30),
duration int,
campaign int,
pdays int,
previous int,
poutcome varchar(30),
y varchar(30) );

insert into bank_cred1 select * from bank_cred;
select * from bank_cred1;

Create table if not exists bank_cred2(
age int,
job varchar(30),
marital varchar(30),
education varchar(30),
`default` varchar(30),
balance int,
housing varchar(30),
loan varchar(30),
contact varchar(30),
`day` int,
`month` varchar(30),
duration int,
campaign int,
pdays int,
previous int,
poutcome varchar(30),
y varchar(30) );

insert into bank_cred2 select * from bank_cred where age=58;
insert into bank_cred2 select * from bank_cred where age=47;
set sql_safe_updates=0;
delete from bank_cred2 where age=58;
select * from bank_cred2;

select bank_cred.age, bank_cred.marital, bank_cred.education from bank_cred inner join bank_cred2 on bank_cred.age=bank_cred2.age;

select bank_cred.age, bank_cred.marital, bank_cred.education from bank_cred left join bank_cred2 on bank_cred.age=bank_cred2.age;

select bank_cred.age, bank_cred.marital, bank_cred.education from bank_cred right join bank_cred2 on bank_cred.age=bank_cred2.age;

