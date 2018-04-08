-- List how many prizes (pieces of loot) that each actor
-- (player participating in a quest) received.

with
    Loot#Pos (day, realm, theme, login, #loot) as (
        select A.day, A.realm, A.theme, A.login, count(*)
        from Actor A, Loot L
        where A.realm = L.realm
          and A.day   = L.day
          and A.theme = L.theme
          and A.login = L.login
        group by A.day, A.realm, A.theme, A.login
    ),
    Loot# (day, realm, theme, login, #loot) as (
        select *
        from Loot#Pos
        union
        select day, realm, theme, login, 0
        from Actor
        where (login, realm, day, theme) not in (
                select login, realm, day, theme
                from Loot#Pos
            )
    )
select day, realm, theme, login, #loot
from Loot#
order by day, realm, theme, login;

