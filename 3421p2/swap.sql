with  
    count(login, gender, num) as 
                 (select A.login, P.gender, count(*) as num
	          from Avatar A, Player P
		  where A.login = P.login 
	          group by A.login, P.gender)

select P.login, P.name, P.gender, C.num 
from Player P, Avatar A, count C
where C.login = P.login
  and A.login = P.login
  and P.gender <> A.gender
  and (P.login, P.gender) in 
                            (select C1.login, C1.gender
		             from count C1
		             )
group by P.login, P.name, P.gender, C.num
order by P.login;
