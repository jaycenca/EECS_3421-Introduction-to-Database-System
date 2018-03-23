-- ==============================================================================================================================================================================================================
-- Episode MMORPG DB

--- Data Insertion script
--- Jay Cen, February 2018

-- ==============================================================================================================================================================================================================
-- DATA

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into Studio (name, website, address) values
    ('Frumpy,Inc.',        'FrumpyDumpy.com',         'Toronto,ON'),
    ('YaYa Production',   'YaYaPro.ca',             'St Catherines,ON');

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into Series (series_name, creator, series_website, start_date, end_date, name, website) values
    ('Fronds',           'Danny Krane',             'fronds.tv',        '05/29/2016',   null,                'Frumpy,Inc.',               'FrumpyDumpy.com'),
    ('Fronds',           'Jenni Cohen',             'fronds.com',       '04/20/2016',   null,                'YaYa Production',           'YaYaPro.ca'),
    ('Me,Myself,and I',  'Spike Jonze',             'meeee.me',         '08/31/2015',   '06/05/2017',      'Frumpy,Inc.',               'FrumpyDumpy.com');  
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into Season (num, series_name, creator) values
    (1,                'Fronds',                  'Danny Krane'),
    (1,                'Fronds',                  'Jenni Cohen'),
    (1,                'Me,Myself,and I',         'Spike Jonze'),
    (2,                'Fronds',                  'Danny Krane'),
    (2,                'Fronds',                  'Jenni Cohen'),
    (2,                'Me,Myself,and I',         'Spike Jonze');
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into Episode (num, title, series_name, creator, description, rating, URL, air_date) values
    (1,     'Hooking up',             'Fronds',            'Danny Krane',     'Botany is never monotony.',                                              5,         'fronds.tv/01/01',        '09/09/2016'),	
    (1,     'Yikes,spikes!',          'Fronds',            'Danny Krane',     'Veronica pranks the others with a spiky plant.',                         2,         'fronds.tv/01/02',        '09/16/2016'),
    (1,     'The Lazy Amazon',        'Fronds',            'Danny Krane',     'Stuck on a raft with no paddles.',                                       4,         'fronds.tv/01/03',        '09/23/2016'),
    (2,     'Tangerine Skies',        'Fronds',            'Danny Krane',     'Paige decides to live in the canopy and will not come down!',            4,         'fronds.tv/02/01',        '09/08/2017'),
    (2,     'Cameron Blues',          'Fronds',            'Danny Krane',     'Cameron starts to self-medicate with new plants he discovers.',          5,         'fronds.tv/02/02',        '09/15/2017'),
    (2,     'The Lima Weekend',       'Fronds',            'Danny Krane',     'Hijinks ensue when Moss and Paige go to Lima for a weekend away.',       1,         'fronds.tv/02/03',        '09/22/2017'),

    (1,     'Prohibition',            'Fronds',            'Jenni Cohen',     'Canada outlaws caffeine and alcohol the same day they legalize weed.',   4,         'fronds.com/Prohib',       '09/16/2016'),
    (1,     'Higher and Higher',      'Fronds',            'Jenni Cohen',     'The economy stumbles with no one getting up before noon.',               3,         'fronds.com/Higher',       '09/23/2016'),
    (1,     'The Munchies',           'Fronds',            'Jenni Cohen',     'The food industry skyrockets.',                                          5,         'fronds.com/Munch',        '09/30/2016'),
    (2,     'Inhaling',               'Fronds',            'Jenni Cohen',     'Society begins to adjust to the haze,takes it in stride.',               3,         'fronds.com/Inhale',       '09/15/2017'),
    (2,     'All good',               'Fronds',            'Jenni Cohen',     'Healthcare costs plummet,tax revenues soar.',                            5,         'fronds.com/Budget',       '09/22/2017'),
    (2,     'Toke Bespoke',           'Fronds',            'Jenni Cohen',     'Andi and Ned get hitched,and the reception lasts for days.',             5,         'fronds.com/Toke',         '09/29/2017'),

    (1,     'Alone',                  'Me,Myself,and I',   'Spike Jonze',     'John cannot find himself.',                                              4,         'meeee.me/Alone',          '10/09/2015'),
    (1,     'Together',               'Me,Myself,and I',   'Spike Jonze',     'John finds more of himself than he could ever imagine!',                 5,         'meeee.me/Together',       '10/16/2015'),
    (2,     'The Solipsist',          'Me,Myself,and I',   'Spike Jonze',     'John starts his own universe.',                                          5,         'meeee.me/Solipsist',      '10/07/2016'),
    (2,     'Tea Time',               'Me,Myself,and I',   'Spike Jonze',     'John hosts a tea party and only he shows up.',                           1,         'meeee.me/Tea',            '10/07/2016'),
    (2,     'Au Revoir',              'Me,Myself,and I',   'Spike Jonze',     'John sees himself off.',                                                 5,         'meeee.me/Revior',         '04/28/2017');   
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
insert into Character (cname, role, series_name, creator) values
    ('Cameron',           'sardonic friend',           'Fronds',               'Danny Krane'),
    ('Moss',              'geeky friend',              'Fronds',               'Danny Krane'),
    ('Paige',             'whimsical friend',          'Fronds',               'Danny Krane'),
    ('Veronica',          'staid friend',              'Fronds',               'Danny Krane'),
    
    ('Andi',              'the pusher',                'Fronds',               'Jenni Cohen'),
    ('Issy',              'the user',                  'Fronds',               'Jenni Cohen'),
    ('Ned',               'the enabler',               'Fronds',               'Jenni Cohen'),
    ('Shane',             'the outsider',              'Fronds',               'Jenni Cohen'),
   
    ('John',              'the one',                   'Me,Myself,and I',      'Spike Jonze');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

insert into Actor (aname, actor_website) values
    ('Allie Grant',          'aaagrant.tv'),
    ('Britt Robertson',      'BrittRob.com'),
    ('Jennifer Lawrence',    'jl.tv'),
    ('Justin Kirk',          'itsybtsy.ca/3jx82289'),
    ('John Malkovich',       'malkovich2.com'),
    ('Josh Hutcherson',      'meenyurl.ca/UUjh2398'),
    ('Mary-Louise Parker',   'mlparker.org'),
    ('Mindy Kaling',         'itsybtsy.ca/hh21129s'),
    ('Richard Ayoade',       'ayoade.com');
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

insert into Portrayal (aname, cname, series_name, creator) values
    ('Josh Hutcherson',     'Cameron',             'Fronds',               'Danny Krane'),
    ('Richard Ayoade',      'Moss',                'Fronds',               'Danny Krane'),
    ('Mindy Kaling',        'Paige',               'Fronds',               'Danny Krane'),
    ('Allie Grant',         'Veronica',            'Fronds',               'Danny Krane'),
    ('Britt Robertson',     'Veronica',            'Fronds',               'Danny Krane'),
    ('Jennifer Lawrence',   'Veronica',            'Fronds',               'Danny Krane'),

    ('Mary-Louise Parker',  'Andi',                'Fronds',               'Jenni Cohen'),
    ('Allie Grant',         'Issy',                'Fronds',               'Jenni Cohen'),
    ('Justin Kirk',         'Ned',                 'Fronds',               'Jenni Cohen'),
    ('Justin Kirk',         'Shane',               'Fronds',               'Jenni Cohen'),
   
    ('John Malkovich',      'John',                'Me,Myself,and I',      'Spike Jonze');

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

insert into Stars (num, series_name, creator, aname, salary) values
    (1,   'Fronds',           'Danny Krane',            'Jennifer Lawrence',       250000),
    (1,   'Fronds',           'Danny Krane',            'Josh Hutcherson',         150000),
    (1,   'Fronds',           'Danny Krane',            'Mindy Kaling',            200000),
    (1,   'Fronds',           'Danny Krane',            'Richard Ayoade',          75000),
    (2,   'Fronds',           'Danny Krane',            'Allie Grant',             175000),
    (2,   'Fronds',           'Danny Krane',            'Britt Robertson',         200000),
    (2,   'Fronds',           'Danny Krane',            'Mindy Kaling',            350000),
    (2,   'Fronds',           'Danny Krane',            'Josh Hutcherson',         150000),
    (2,   'Fronds',           'Danny Krane',            'Richard Ayoade',          225000),
    
    (1,   'Fronds',           'Jenni Cohen',            'Allie Grant',             150000),
    (1,   'Fronds',           'Jenni Cohen',            'Justin Kirk',             275000),
    (1,   'Fronds',           'Jenni Cohen',            'Mary-Louise Parker',      275000),
    (2,   'Fronds',           'Jenni Cohen',            'Allie Grant',             100000),
    (2,   'Fronds',           'Jenni Cohen',            'Justin Kirk',             325000),
    (2,   'Fronds',           'Jenni Cohen',            'Mary-Louise Parker',      325000),

    (1,   'Me,Myself,and I',  'Spike Jonze',            'John Malkovich',           99999),
    (2,   'Me,Myself,and I',  'Spike Jonze',            'John Malkovich',          249999);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

insert into Features (num, series_name, creator, title, aname, cname) values
    (1,   'Fronds',            'Danny Krane',            'Hooking up',           'Jennifer Lawrence',             'Veronica'),
    (1,   'Fronds',            'Danny Krane',            'Hooking up',           'Josh Hutcherson',               'Cameron'),
    (1,   'Fronds',            'Danny Krane',            'Hooking up',           'Mindy Kaling',                  'Paige'),
    (1,   'Fronds',            'Danny Krane',            'Hooking up',           'Richard Ayoade',                'Moss'),
    (1,   'Fronds',            'Danny Krane',            'Yikes,spikes!',        'Jennifer Lawrence',             'Veronica'),
    (1,   'Fronds',            'Danny Krane',            'Yikes,spikes!',        'Josh Hutcherson',               'Cameron'),
    (1,   'Fronds',            'Danny Krane',            'Yikes,spikes!',        'Mindy Kaling',                  'Paige'),
    (1,   'Fronds',            'Danny Krane',            'Yikes,spikes!',        'Richard Ayoade',                'Moss'),
    (1,   'Fronds',            'Danny Krane',            'The Lazy Amazon',      'Jennifer Lawrence',             'Veronica'),
    (1,   'Fronds',            'Danny Krane',            'The Lazy Amazon',      'Josh Hutcherson',               'Cameron'),
    (1,   'Fronds',            'Danny Krane',            'The Lazy Amazon',      'Mindy Kaling',                  'Paige'),

    (2,   'Fronds',            'Danny Krane',            'Tangerine Skies',      'Allie Grant',                   'Veronica'),
    (2,   'Fronds',            'Danny Krane',            'Tangerine Skies',      'Britt Robertson',               'Veronica'),
    (2,   'Fronds',            'Danny Krane',            'Tangerine Skies',      'Josh Hutcherson',               'Cameron'),
    (2,   'Fronds',            'Danny Krane',            'Tangerine Skies',      'Mindy Kaling',                  'Paige'),
    (2,   'Fronds',            'Danny Krane',            'Tangerine Skies',      'Richard Ayoade',                'Moss'), 
    (2,   'Fronds',            'Danny Krane',            'Cameron Blues',        'Josh Hutcherson',               'Cameron'), 
    (2,   'Fronds',            'Danny Krane',            'Cameron Blues',        'Richard Ayoade',                'Moss'),
    (2,   'Fronds',            'Danny Krane',            'The Lima Weekend',     'Mindy Kaling',                  'Paige'), 
    (2,   'Fronds',            'Danny Krane',            'The Lima Weekend',     'Richard Ayoade',                'Moss'), 

    (1,   'Fronds',            'Jenni Cohen',            'Prohibition',          'Allie Grant',                   'Issy'),
    (1,   'Fronds',            'Jenni Cohen',            'Prohibition',          'Justin Kirk',                   'Ned'),
    (1,   'Fronds',            'Jenni Cohen',            'Prohibition',          'Mary-Louise Parker',            'Andi'),
    (1,   'Fronds',            'Jenni Cohen',            'Higher and Higher',    'Justin Kirk',                   'Shane'),
    (1,   'Fronds',            'Jenni Cohen',            'Higher and Higher',    'Mary-Louise Parker',            'Andi'),
    (1,   'Fronds',            'Jenni Cohen',            'The Munchies',         'Allie Grant',                   'Issy'),
    (1,   'Fronds',            'Jenni Cohen',            'The Munchies',         'Justin Kirk',                   'Ned'),
    (1,   'Fronds',            'Jenni Cohen',            'The Munchies',         'Mary-Louise Parker',            'Andi'),

    (2,   'Fronds',            'Jenni Cohen',            'Inhaling',             'Allie Grant',                   'Issy'),
    (2,   'Fronds',            'Jenni Cohen',            'Inhaling',             'Justin Kirk',                   'Shane'),
    (2,   'Fronds',            'Jenni Cohen',            'All good',             'Allie Grant',                   'Issy'), 
    (2,   'Fronds',            'Jenni Cohen',            'All good',             'Justin Kirk',                   'Ned'),
    (2,   'Fronds',            'Jenni Cohen',            'All good',             'Justin Kirk',                   'Shane'),
    (2,   'Fronds',            'Jenni Cohen',            'All good',             'Mary-Louise Parker',            'Andi'),
    (2,   'Fronds',            'Jenni Cohen',            'Toke Bespoke',         'Allie Grant',                   'Issy'),
    (2,   'Fronds',            'Jenni Cohen',            'Toke Bespoke',         'Justin Kirk',                   'Ned'),
    (2,   'Fronds',            'Jenni Cohen',            'Toke Bespoke',         'Mary-Louise Parker',            'Andi'),
   
    (1,   'Me,Myself,and I',   'Spike Jonze',            'Alone',                'John Malkovich',                'John'),
    (1,   'Me,Myself,and I',   'Spike Jonze',            'Together',             'John Malkovich',                'John'),
    (2,   'Me,Myself,and I',   'Spike Jonze',            'The Solipsist',        'John Malkovich',                'John'),
    (2,   'Me,Myself,and I',   'Spike Jonze',            'Tea Time',             'John Malkovich',                'John'),
    (2,   'Me,Myself,and I',   'Spike Jonze',            'Au Revoir',            'John Malkovich',                'John');
    

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

