create database case5;
select id, age, coins_needed, power
from wands
inner join wands_property on wands.code = wands_property.code
where wands_property.is_evil= 0
order by power desc, age desc;