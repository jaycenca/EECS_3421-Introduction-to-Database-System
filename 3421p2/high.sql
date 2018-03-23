with 
    fetchRace (theme, race, login, day, realm, treasure, sql ) as 
                         ( select L.theme, A.race, A.login, V.day, V.realm, L.treasure, T.sql
		           from Avatar A, Visit V, Loot L, Treasure T
			   where V.name = A.name
			     and V.login = A.login
			     and L.login = V.login
			     and V.day = L.day
			     and V.realm = L.realm 
			     and L.treasure = T.treasure
			   order by L.theme, A.race, A.login, V.realm
			 ),
     raceCount (theme, race, total) as 
                         ( select F.theme, F.race, sum(F.sql)
		           from fetchRace F
			   group by F.race, F.theme
			 )
		 
select theme, race, total
from raceCount
where (theme, total) in 
                   ( select R.theme, max(total)
                     from raceCount R
       		     where R.theme = theme
	             group by R.theme
                   )
order by theme, race;

		         


