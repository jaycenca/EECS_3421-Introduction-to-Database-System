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
			group by P1.realm, P1.theme, P1.day, P1.login, P1.avatar, P2.login, P2.avatar
			order by P1.theme, P1.login, P2.login
		       ),
    	
    NotP2INP1(P1_login, P1_avatar, P2_login, P2_avatar, realm) as 
                         (select distinct C.P1_login, C.P1_avatar, C.P2_login, C.P2_avatar, C.realm
			  from Pair C, Single P2
			  where C.realm = P2.realm 
			    and C.P2_login = P2.login 
			    and C.P2_avatar = P2.avatar
                            and (P2.day, P2.theme) not in 
                                                    (select P1.day, P1.theme 
                                                     from Single P1
                                                     where P1.login = C.P1_login 
                                                       and P1.avatar = C.P1_avatar
                                                       and P1.realm = C.realm
                                                     )
			  ),
    NotP1INP2(P1_login, P1_avatar, P2_login, P2_avatar, realm)  as 
                          (select distinct C.P1_login, C.P1_avatar, C.P2_login, C.P2_avatar, C.realm
                           from Pair C, Single P1
                           where C.realm = P1.realm 
                             and C.P1_login = P1.login 
                             and C.P1_avatar = P1.avatar
			     and (P1.day, P1.theme) not in 
			                               (select P2.day, P2.theme
							from Single P2
							where P2.login = C.P2_login
							  and P2.avatar = C.P2_avatar 
							  and P2.realm = C.realm
							)
                          ),

    Compare(P1_login, P1_avatar, realm, P2_login, P2_avatar) as 
                         (select distinct P1_login, P1_avatar, realm, P2_login, P2_avatar
			 from Pair
                         where (P1_login, P1_avatar, realm, P2_login, P2_avatar) not in 
                              (   
                               select P1_login, P1_avatar, realm, P2_login, P2_avatar from NotP2INP1
			      )
			  and (P1_login, P1_avatar, realm, P2_login, P2_avatar) not in 
			      ( 
				select P1_login, P1_avatar, realm, P2_login, P2_avatar from NotP1INP2
			      )
			  ),

    Testing1(login, avatar, realm, day, theme) as 
                            (select * 
                             from Single 
			     where realm = 'Camelot'
		               and login = 'hills'
		             order by login, avatar, theme
		            ),

    Testing2(P1_login, P1_avatar, P2_login, P2_avatar, realm, theme, day) as 
                          (select * from Pair 
			   where realm = 'Camelot' 
			   and P1_login = 'astral'
		           order by P1_login, P1_avatar,P2_login, P2_avatar, realm, theme, day
			   ), 
     Testing3(P1_login, P1_avatar, P2_login, P2_avatar, realm)  as 
                          (select * from NotP1INP2
			   where realm = 'Camelot'
			     and P1_login = 'astral'
			     order by P1_login, P1_avatar, P2_login, P2_avatar, realm
			  ) 
select P1_login as Companion1, P1_avatar as fname, realm, P2_login as Companion2, P2_avatar as lname
from Compare 
order by realm, P1_login, P1_avatar, P2_login, P2_avatar;
