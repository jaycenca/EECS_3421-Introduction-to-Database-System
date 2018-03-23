with 
    Single(login, avatar, realm,  day, theme) as 
                     (select distinct V.login, V.name as avatar, V.realm, V.day, Q.theme 
		       from  Avatar A, Actor Ac, Visit V, Quest Q
		       where A.login = V.login
		         and V.day = Q.day
		         and V.realm = Q.realm
			 and Ac.login = V.login
			 and Ac.realm = V.realm 
			 and Ac.day = V.day
			 and Ac.theme = Q.theme
		       group by V.realm, Q.theme, V.login, V.name, V.day
		     ),

    Pair(P1_login, P1_avatar, P2_login, P2_avatar, realm, day, theme) as 
                      (select distinct P1.login, P1.avatar, P2.login, P2.avatar, P1.realm, P1.day, P1.theme
		       from Single P1, Single P2
		       where P1.realm = P2.realm
		         and P1.day = P2.day
		         and P1.theme = P2.theme
			 and P1.login < P2.login
			 and P1.avatar <> P2.avatar
			group by P1.realm, P1.theme, P1.day, P1.login, P1.avatar, P2.login, P2.avatar
			order by P1.theme, P1.login, P2.login
		       ),
    	
    DayCompare(P1_login, P1_avatar, P2_login, P2_avatar, realm) as 
                         (select C.P1_login, C.P1_avatar, C.P2_login, C.P2_avatar, C.realm
			  from Pair C, Single P2, Single P1
			  where C.realm = P2.realm 
                            and C.realm = P1.realm
			    and C.P1_login = P1.login 
			    and C.P1_avatar = P1.avatar
		            and C.P2_login = P2.login
		            and C.P2_avatar = P2.avatar  
                            and P1.day <> P2.day
                            and P1.theme = P2.theme
			  group by C.P1_login, C.P1_avatar, C.P2_login, C.P2_avatar, C.realm
			  ),
    ThemeCompare(P1_login, P1_avatar, P2_login, P2_avatar, realm)  as 
                          (select C.P1_login, C.P1_avatar, C.P2_login, C.P2_avatar, C.realm 
                           from Pair C, Single P2, Single P1
                           where C.realm = P1.realm 
                             and C.realm = P2.realm 
                             and C.P1_login = P1.login 
                             and C.P1_avatar = P1.avatar 
                             and C.P2_login = P2.login 
                             and C.P2_avatar = P2.avatar
                             and P1.day <> P2.day
                             and P1.theme <> P2.theme 
                           group by C.P1_login, C.P1_avatar, C.P2_login, C.P2_avatar, C.realm
                          ),

    Compare(P1_login, P1_avatar, realm, P2_login, P2_avatar) as 
                         (select P1_login, P1_avatar, realm, P2_login, P2_avatar
			 from Pair C
                         where (P1_login, P1_avatar, P2_login, P2_avatar, realm) not in  
                                ( select * from ThemeCompare
                                 union
                                 select * from DayCompare  
                                )
			 ),

    Testing1(login, avatar, realm, day, theme) as 
                            (select * from Single 
			     where realm = 'Walmart'
		               and login = 'macho'
		             order by login, avatar, theme
		            ),
    Testing2(P1_login, P1_avatar, P2_login, P2_avatar, realm, theme, day) as 
                          (select * from Pair 
			   where realm = 'Camelot' 
			   and P1_login = 'astral'
		           order by P1_login, P1_avatar,P2_login, P2_avatar, realm, theme
			   ), 
     Testing3(P1_login, P1_avatar, P2_login, P2_avatar, realm) as 
                          (select * from ThemeCompare
			   where realm = 'Camelot'
			     and P1_login = 'astral'
			     order by P1_login, P1_avatar, P2_login, P2_avatar, realm
			  ) 
select P1_login as companion1, P1_avatar as fname, realm, P2_login as companion2, P2_avatar as lname
from Compare 
order by realm, companion1, fname, companion2,lname;
