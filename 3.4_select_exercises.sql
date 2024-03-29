
select * from albums where artist = 'Pink Floyd';
select release_date from albums where name = 'Sgt. Pepper\'s Lonely Hearts Club Band';
select genre from albums where name = 'Nevermind';
select name from albums where release_date between 1990 and 1999;
select name from albums where sales < 20.0;
select name from albums where genre = 'Rock';
-- query looks for specifically "Rock" could use "%Rock" to get all results containing "Rock";
select name from albums where genre like '%Rock';