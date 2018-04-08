--#SET DELIMITER !

-- ============================================================================
ECHO Making table Reassigned

CREATE TABLE Reassigned (
	donor       varchar(20) not null,
	recipient   varchar(20) not null,
        day         Date        not null,
        realm       varchar(20) not null,
        theme       varchar(20) not null,
        loot#       int         not null,
        treasure    varchar(20),
        sql         int         not null,
        	
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
                            order by day, realm, theme)

select day, realm, theme, login, #prize, worth 
from Donor
order by day, realm, theme; 
