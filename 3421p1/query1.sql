select E.rating, E.title, E.air_date, A.aname, Stars.salary
from Episode as E, Season as S, Stars, Actor as A
where rating > 4
  and E.num = S.num
  and E.series_name = S.series_name
  and E.creator = S.creator
  and S.num = Stars.num
  and S.series_name = Stars.series_name
  and S.creator = Stars.creator
  and A.aname = Stars.aname;
