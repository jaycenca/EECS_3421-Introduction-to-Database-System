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
    	
    P2INP1(P1_login, P1_avatar, P2_login, P2_avatar, realm, theme, day) as 
                         (select C.P1_login, C.P1_avatar, C.P2_login, C.P2_avatar, C.realm, P2.theme, P2.day
			  from Pair C, Single P2, Single P1
			  where C.realm = P2.realm 
			    and C.realm = P1.realm
			    and C.P1_login = P1.login 
			    and C.P1_avatar = P1.avatar
		            and C.P2_login = P2.login
		            and C.P2_avatar = P2.avatar
		            and P1.theme = P2.theme 
		            and P1.day = P2.day 	
			  group by C.P1_login, C.P1_avatar, C.P2_login, C.P2_avatar, C.realm, P2.theme, P2.day
			  ),

    CountP2INP1(P1_login, P1_avatar, P2_login, P2_avatar, realm, #theme) as 
                          (select P1_login, P1_avatar, P2_login, P2_avatar, realm, count(theme) 
			   from P2INP1 
			   group by P1_login, P1_avatar, P2_login, P2_avatar,realm
			   ),

    P1INP2(P1_login, P1_avatar, P2_login, P2_avatar, realm, theme, day) as 
                          (select distinct C.P1_login, C.P1_avatar, C.P2_login, C.P2_avatar, C.realm, P1.theme, P1.day
			   from Pair C, Single P1, Single P2
			   where C.realm = P1.realm
			     and C.realm = P2.realm
			     and C.P1_login = P1.login 
			     and C.P1_avatar = P1.avatar 
			     and C.P2_login = P2.login 
			     and C.P2_avatar = P2.avatar 
			     and P1.theme = P2.theme 
			     and P1.day = P2.day 
			   group by C.P1_login, C.P1_avatar, C.P2_login, C.P2_avatar, C.realm, P1.theme, P1.day 
			   ),

    Compare(P1_login, P1_avatar, P2_login, P2_avatar, realm) as 
                         (select C.P1_login, C.P1_avatar, C.P2_login, C.P2_avatar, C.realm
			 from Pair C
			 ),
			 
    Testing1(login, avatar, realm, day, theme) as 
                            (select * from Single 
			     where realm = 'Camelot'
		               and login = 'astral'
		             order by login, avatar, theme
		            ),
    Testing2(P1_login, P1_avatar, P2_login, P2_avatar, realm, theme, day) as 
                          (select * from Pair 
			   where realm = 'Camelot' 
			   and P1_login = 'astral'
		           order by P1_login, P1_avatar,P2_login, P2_avatar, realm, theme
			   ), 
     Testing3(P1_login, P1_avatar, P2_login, P2_avatar, realm, theme, day) as 
                          (select * from P2INP1
			   where realm = 'Camelot'
			     and P1_login = 'astral'
			     order by P1_login, P1_avatar, P2_login, P2_avatar, realm, theme
			  ) 

select * from P2INP1 where realm = 'Camelot';
