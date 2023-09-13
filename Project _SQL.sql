create database db__pat;
use db__pat;
show databases;
create table New_Patient(
Patients_ID int(10) primary key,
Patient_Name varchar(20),
Sex varchar(10),
Age int(20),
Address varchar(70),
Postal_Code int(20),
State varchar(30),
Country varchar(30),
RegDate int(20),
Doctor_ID int(20));
Insert into New_Patient(Patients_ID,Patient_Name,Sex,Age,Address,Postal_Code,State,Country,RegDate,Doctor_ID) values (01,"Sheela","F",23,"Flat no 201, vasavi heights Yakutapura",500023,"Telangana","India",03/03/2020,142);
Insert into New_Patient(Patients_ID,Patient_Name,Sex,Age,Address,Postal_Code,State,Country,RegDate,Doctor_ID) values (02,"Rehan","M",21,"Building no  2,Yelahanka",560063,"Karnatka","India",13/11/2020,211);
Insert into New_Patient(Patients_ID,Patient_Name,Sex,Age,Address,Postal_Code,State,Country,RegDate,Doctor_ID) values (03,"Anay","M",56,"H No 1,panipat",132140,"Haryana","India",12/12/2021,143);
Insert into New_Patient(Patients_ID,Patient_Name,Sex,Age,Address,Postal_Code,State,Country,RegDate,Doctor_ID) values (04,"Mahira","F",42,"House no 12 ,Gandhi nagar",382421,"Gujarat","India",28/01/2022,343);
Insert into New_Patient(Patients_ID,Patient_Name,Sex,Age,Address,Postal_Code,State,Country,RegDate,Doctor_ID) values (05,"Nishant","M",12,"Sunflower Heights ,Thane",400080,"Maharashtra","India",05/01/2023,131);
select * from New_Patient;
create table Patients_Checkup(
Patients_ID int(10) primary key,
BP int(10),
Weight int(10),
Consultation_Fees int(30));
insert into Patients_Checkup(Patients_ID,BP,Weight,Consultation_Fees)values(01,121/80,67,300);
insert into Patients_Checkup(Patients_ID,BP,Weight,Consultation_Fees)values(02,142/76,78,400);
insert into Patients_Checkup(Patients_ID,BP,Weight,Consultation_Fees)values(03,151/75,55,300);
insert into Patients_Checkup(Patients_ID,BP,Weight,Consultation_Fees)values(04,106/81,61,550);
insert into Patients_Checkup(Patients_ID,BP,Weight,Consultation_Fees)values(05,143/67,78,700);
select * from Patients_Checkup;
/* Q1. Write a SQl query to fetch current dat-time from the system */
select now() as Today;
/* Q2. Find nth highest Consultation fees*/
select Consultation_Fees from Patients_Checkup order by Consultation_Fees desc limit 1,1;
/* Q3. Find top n records using limit and order by*/
select * from Patients_Checkup  order by Consultation_Fees limit 1;
/* Q4. Write a SQL query to create a table where structure is copied from other table*/
create table Newpatientstable as select * from New_Patient;
/* Q5. Write a SQL query to fetch duplicate records from New_Patient withour considering primary key */
select Patient_Name,State,RegDate,Doctor_ID,count(*) from New_Patient group by Patient_Name,State,RegDate,Doctor_ID having count(*)>1;
/* Q6. Write a query to fetch number of patient whose weight greater than 68*/
select count(*)from Patients_Checkup where Weight>68;
/* Q7.Write a query to fetch patient details along with the weight,fees even if the details are missing */
select P.Patient_Name,C.Consultation_Fees from New_Patient P left join Patients_Checkup C on P.Patients_ID=C.Patients_ID;
/* Q8. Write a SQl query to fetch doctor wise count of patients sorted by the doctors*/
select Doctor_ID, count(Patients_ID) as Patient_Count from New_Patient group by Doctor_ID order by Patient_Count;
/* Q9. Write a SQl query to fetch the first & last record of the Patients table*/
select* from New_Patient where Patients_ID =(select min(Patients_ID)  from New_Patient);
/* Q10. Write a SQl query to find whose joined in the year 2022*/
select * from New_Patient where year(RegDate) =2022;
/* Q11. Write a query to find those patients who have paid consultation fees between 400 to 700 */
select Consultation_Fees from Patients_Checkup where Consultation_Fees between 400 and 700;
/* Q12. Write a SQL query to fetch Consultation_Fees wise count and sort them in descending order*/
select Consultation_Fees,count(Patients_ID) as CFcount from Patients_Checkup group by Consultation_Fees order by CFcount desc;
/* Q13. Write a query to fetch 50% records from the Patients_Checkup table*/
select * from  Patients_Checkup where Patients_ID=(select count(Patients_ID)/2 from Patients_Checkup);
/* Q14. Write a query to find all patients names whose name Begin with A,end with S and Contains 3 alphabeta,Staying in the state telangana*/
select Patient_Name from New_Patient where New_Patient like "__S";
select * from New_Patient where Patient_Name like "%A";
select * from New_Patient where State like "Telangana";
/* Q15. Write a query to fetch details of all patients excluding patients with name Sheela and Anay*/
select * from New_Patient where Patient_Name not in ("Sheela","Anay");



