
SELECT * FROM top_movies.imdb_top_250_moviesv1;

-- find the top 10 highest ranking movies based off ratings
select ranking, title, rating
from imdb_top_250_moviesv1
where rating >= 8.5
order by rating desc
limit 10;

-- list of every adventure movie described within genre
select title, released_date, genre, certificate
from imdb_top_250_moviesv1
where genre like '%adventure%';

-- In the last decade, how many of the top movies were adventure
select title, released_date, genre, certificate
from imdb_top_250_moviesv1
where genre like '%adventure%'
and released_date >= 2014;

-- list of each movie certificate and the total amount of times each are displayed in the top 250
select certificate, count(certificate) as total_value
from imdb_top_250_moviesv1
where certificate is not null
group by certificate;

-- list of all the movies with adventure genre that are rated R
select title, released_date, genre, certificate
from imdb_top_250_moviesv1
where genre like '%adventure%'
and certificate like 'R';

-- released date with the most top movies greater than 1
select released_date, count(released_date) as total_amount
from imdb_top_250_moviesv1
group by released_date
order by released_date desc;

-- shows average movie released date
select avg(released_date)
from imdb_top_250_moviesv1;

-- the list of all the movies Steven Spielberg directed
select title, directors, released_date, box_office
from imdb_top_250_moviesv1
where directors like 'steven spielberg'
order by title;

-- grouped by directors and their total box office sells for the top movies list
select directors, sum(box_office) as Total_BoxOffice, count(directors) as CountPer
From imdb_top_250_moviesv1
where box_office is not null
group by directors
order by directors;

-- the top 15 highest box office sales
select title, released_date, certificate, box_office
from imdb_top_250_moviesv1
where box_office is not null
order by box_office desc
limit 15;

-- profit based off budget and gross box office sales
select title, budget, box_office, (box_office - budget) as profit
from imdb_top_250_moviesv1
where budget and box_office is not null
order by profit desc
limit 20;