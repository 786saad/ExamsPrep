--Select distinct A.name, B.name from Kunde A, Kunde B, Abo a, Abo b, Fitnesskurse F
--where A.id = a.k_id
--and B.id = b.k_id and 
--a.f_id  in (Select id from Fitnesskurse where name = 'Yoga') and
-- b.f_id in (Select id from Fitnesskurse where name = 'Yoga')
--and A.age - B.age <=5
--and A.age >= B.age
--and A.geschlecht = B.geschlecht
--and A.id != B.id

Select distinct A.name, B.name from Kunde A, Kunde B, Abo a, Abo b, Fitnesskurse F
where A.id = a.k_id
and B.id = b.k_id
and F.name = 'Yoga' 
and F.id = a.f_id
and F.id = b.f_id
and A.age >= B.age
and A.geschlecht = B.geschlecht