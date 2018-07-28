Create view 'Teilnehmerzahl' as 
Select name, count(name) from Fitnesskurse, Abo
where f_id = id
group by name
union 
Select name,0 from Fitnesskurse where id not in (Select k_id from Abo)