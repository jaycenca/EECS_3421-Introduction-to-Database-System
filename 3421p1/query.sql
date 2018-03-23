select E.title, E.air_date, A.aname as actor, C.cname as character, C.role, Stars.salary
from Episode as E, Season as S, Features as F, Actor as A, Character as C, Portrayal as P, Stars 
where rating > 3
  and E.title = F.title
  and E.num = S.num
  and E.series_name = S.series_name
  and E.creator = S.creator
  and A.aname = P.aname
  and C.cname = P.cname
  and A.aname = Stars.aname
  and S.num = Stars.num
  and S.series_name = Stars.series_name
  and S.creator = Stars.creator
  and P.cname = F.cname
  and P.aname = F.aname 
  and Stars.num = F.num
  and Stars.series_name = F.series_name 
  and Stars.creator = F.creator
ORDER BY E.air_date, E.title, A.aname, C.cname;
