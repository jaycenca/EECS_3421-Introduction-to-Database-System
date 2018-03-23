with 
    Male ( login, male) as (
       select distinct P.login as login, P.gender as male
       from Avatar A, Player P
       where A.login = P.login 
         and P.gender = 'M'), 

    Female ( login, female) as (
       select distinct P.login as login, P.gender as female
       from Avatar A, Player P
       where A.login = P.login
         and P.gender = 'F'),
   
    NumF (num) as (
       select count(login) 
       from Male), 
   
    NumM (num) as (
       select count(login)
       from Female)

select M.num as #male, F.num as #female
from NumM M, NumF F;



