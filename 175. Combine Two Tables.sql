select FirstName,LastName,City,State from 
(select PersonId,FirstName,LastName from Person) as t1 
left join (select PersonId,City,State from Address) as t2 on 
t1.PersonId = t2.PersonId 
