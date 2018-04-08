-- Who could donate a prize per quest and which prizes?

with 
    Haul (day, realm, theme, login, #prize, worth) as (
        select L.day, L.realm, L.theme, L.login, count(*), sum(T.sql)
        from Loot L, Treasure T
        where L.treasure = T.treasure 
          and login is not null 
        group by day, realm, theme, login
        having count(*) > 1
    ), 
  
    Donor (day, realm, theme, login, #prize, worth) as (
         select day, realm, theme, login, #prize, worth
         from Haul H
         where not exists (
                           select * 
                           from Haul J
                           where H.day = J.day
                           and H.realm = J.realm
                           and H.theme = J.theme 
                           and ( (J.#prize > H.#prize) 
                                  or 
                                 (J.#prize = H.#prize and J.worth > H.worth) 
                                  or 
                                 (J.#prize = H.#prize
                                        and J.worth = H.worth 
                                        and J.login > H.login)
                               )
                           )
         ),
    
    -- Per quest, pick a person (if any) who got no prize.
    -- In case of more than one person receiving nothing, we'll pick the one 
    -- with the 'login' that comes first (in dictionary order).
    Recipient (day, realm, theme, login) as 
                           (select day, realm, theme, min(login) as login 
                            from Actor 
                            where (day, realm, theme, login) not in (
                            select day, realm, theme, login
                            from Loot
                            )
                            group by day, realm, theme 
                            order by day, realm, theme
		            ), 

    -- DONATION 
    -- Per quest, pick the prize given to the Donor that is worth the 
    -- least. In case of ties, pick the prize by name (treasure) 
    -- that comes last in dictionary order (e.g., 'left sandal' 
    -- < 'right sandal'). If we still have a tie ( because the Donor 
    -- received more than one of such prizes, pick the one with the  
    -- greatest loot#.
    Donation (day, realm, theme, login, loot#, treasure, sql) as (
	select D.day, D.realm, D.theme, D.login, L.loot#, L.treasure, T.sql
        from Donor D, Loot L, Treasure T 
        where D.day = L.day    -- join of D and L 
	  and D.realm = L.realm 
	  and D.theme = L.theme 
	  and D.login = L.login 
	  and L.treasure = T.treasure -- join of L and T
	  and not exists (
		          select *
			  from Loot M, Treasure S
			  where M.day = L.day    --join of M and L 
			    and M.realm = L.realm 
			    and M.theme = L.theme 
			    and M.login = L.login 
			    and M.treasure = S.treasure 
			    and ((S.sql < T.sql) 
				  or
			         (S.sql = T.sql and S.treasure > T.treasure) 
				  or 
				 (S.sql = T.sql 
					and S.treasure = T.treasure 
					and M.loot# > L.loot#)
			        )
			  )		  	
       ) 

select D.login as Donor, R.login as Recipient, D.day, D.realm, D.theme, D.loot#, D.treasure, D.sql
from Recipient R, Donation D
where D.day = R.day 
  and D.realm = R.realm
  and D.theme = R.theme
order by day, realm, theme; 
