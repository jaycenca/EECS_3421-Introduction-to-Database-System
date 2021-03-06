-- ============================================================================
-- Episode MMORPG DB

-- Schema Creation script
-- Jay Cen, Feburary 2018

-- =============================================================================-- SCHEMA DEFINITION
--------------------------------------------------------------------------------

create table Studio (
     name              varchar(20) not null,
     website           varchar(20) not null,
     address           varchar(20) not null,
     constraint Studio_PK
        primary key (name, website)
);

-------------------------------------------------------------------------------

create table Series (
     series_name       varchar(20) not null,
     creator           varchar(20) not null,
     series_website    varchar(20) not null,
     start_date        date  not null,
     end_date          date         ,
     name              varchar(20) not null,
     website           varchar(20) not null,
     constraint Series_By_Studio_FK
        foreign key (name, website) references Studio,
     constraint Series_PK
        primary key (series_name, creator)
);

--------------------------------------------------------------------------------

create table Season ( 
     num               integer  not null,
     series_name       varchar(20) not null,
     creator           varchar(20) not null,
     constraint Season_Of_Series_FK
        foreign key (series_name, creator) references Series,
     constraint Season_PK
        primary key (num, series_name, creator)
);

-------------------------------------------------------------------------------

create table Episode ( 
     num               integer     not null,
     title             varchar(20) not null,
     series_name       varchar(20) not null,
     creator           varchar(20) not null,
     description       varchar(80) not null,
     rating            integer             ,
     URL               varchar(20)         ,
     air_date          date  not null,
     constraint Episode_In_Season_FK
        foreign key (num, series_name, creator) references Season,
     constraint Episode_PK
        primary key (title, num, series_name, creator)
);

-------------------------------------------------------------------------------

create table Character (
     cname             varchar(20) not null,
     role              varchar(20) not null,
     series_name       varchar(20) not null,
     creator           varchar(20) not null,
     constraint Character_PK
        primary key (cname, series_name, creator),
     constraint Character_belongs_Series_FK 
        foreign key (series_name, creator) references Series
);

-------------------------------------------------------------------------------

create table Actor (
     aname             varchar(20) not null,
     actor_website     varchar(20),
     constraint Actor_PK
        primary key (aname)
);

-------------------------------------------------------------------------------

create table Portrayal (
     aname             varchar(20) not null,
     cname             varchar(20) not null,
     series_name       varchar(20) not null,
     creator           varchar(20) not null,
     constraint Portrayal_Acts_Actor_FK
        foreign key (aname) references Actor,
     constraint Portrayal_Plays_Character_FK
        foreign key (cname, series_name, creator) references Character,
     constraint Portrayal_PK 
        primary key ( aname, cname, series_name, creator) 
);
 
-------------------------------------------------------------------------------

create table Stars (
     num               integer     not null,
     series_name       varchar(20) not null,
     creator           varchar(20) not null,
     aname             varchar(20) not null, 
     salary            integer     not null,
     constraint Stars_Of_Season_FK 
        foreign key (num, series_name, creator) references Season,
     constraint Stars_From_Actor_FK
        foreign key (aname) references Actor,
     constraint Stars_PK
        primary key (num, series_name, creator, aname)
);

-------------------------------------------------------------------------------

create table Features (
     num               integer     not null, 
     series_name       varchar(20) not null,
     creator           varchar(20) not null, 
     title             varchar(20) not null,
     aname             varchar(20) not null,
     cname             varchar(20) not null,
     constraint Features_in_Episode_FK
        foreign key (title, num, series_name, creator) references Episode,
     constraint Features_on_Portrayal_FK
        foreign key (aname, cname, series_name, creator) references Portrayal,
     constraint Features_with_Stars_FK
        foreign key (num, series_name, creator, aname) references Stars,
     constraint Features_PK
        primary key (num, series_name, creator, title, aname, cname)
);

------------------------------------------------------------------------------
                

