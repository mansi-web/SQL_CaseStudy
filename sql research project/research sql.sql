/*research project*/
/*submitted by Mansi*/
/*roll no 3569, New Delhi*/
create database researchproject;
/******1 display all******/
select *
from population
order by population desc
limit 5;
/******2 group by, order by, limit******/
select State_Uts, total
from statewise
order by 2 desc
limit 5;
select State_Uts, total
from statewise
order by 2 asc
limit 5;
/******3 COLUMN ALIAS******/
select rural_Beds+ urban_Beds as beds , States_UTs
from rural_urban_areas
group by States_UTs
order by beds desc
limit 5;
select rural_Beds+ urban_Beds as beds , States_UTs
from rural_urban_areas
group by States_UTs
order by beds asc
limit 5;
/******4 IN, NOT IN, MAX FUNCTION******/
select state_ut, Bgovt as beds
from ayushhospitals
where Hgovt in (select max(Hgovt) 
from ayushhospitals);
/******5 LIKE, WILDCARD******/
select zone_pu as northzones
from railways
where zone_pu like "%north%";
/******6 ADD NEW COLUMNN******/
Alter table rural_urban_areas
add column newdate date;
/******7 STR TO DATE FUNCTION******/
update rural_urban_areas
set newdate= str_to_date(left(date,10),'%d.%m.%Y');
/******8 HAVING******/
select States_UTs, rural_Beds+urban_Beds as beds, newdate
from rural_urban_areas
where rural_Beds+urban_Beds<1000
having newdate >='2017-01-01';
/******9 INNER JOIN, SUM FUNCTION******/
select ministryofdefence.State_Uts ,(sum(ministryofdefence.Hospitals)*100)/sum(statewise.Total) as shareH_by_def
from ministryofdefence inner join statewise
on ministryofdefence.State_Uts=statewise.State_Uts
group by 1;
/******10 COLUMN ALIAS******/
select state_ut, Bgovt/Hgovt as bedsperhospital
from ayushhospitals;
/******11 TABLE JOINS******/
select statewise.State_Uts ,statewise.Total/population.population as ratio
from statewise inner join population on statewise.State_Uts=population.State_Uts
group by statewise.State_Uts;
/******12 TABLE JOINS*******/
select ayushhospitals.State_UT,ayushhospitals.BTotal/population.population as ratio
from ayushhospitals inner join population on ayushhospitals.State_UT=population.State_Uts
group by ayushhospitals.State_UT;
/******13 DATE DIFF, CURDATE FUNCTION******/
select  states_uts, (datediff(curdate(), newdate)/365.25) as yearsolddata
from rural_urban_areas;
/******14 CASE WHEN STATEMENTS******/
select state_ut, btotal,
case
 when btotal>=2000 then "fine"
 when btotal>=500 then "poor"
 else "critical"
 end as stat
from ayushhospitals;
/****15 EXISTS FUNCTION*****/
select sno ,State_UT, Btotal
from ayushhospitals
where BTotal<=1000
and exists( select State_Uts
from population
where Population>100000000);
/*******************/