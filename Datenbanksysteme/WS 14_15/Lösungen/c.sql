Select k_name from 
(Select Kunde.name as k_name, sum(preis) from Kunde, Abo, Fitnesskurse
where Kunde.id = k_id and f_id = Fitnesskurse.id
group by Kunde.name
having sum(preis) <= 150 and age <= 25)