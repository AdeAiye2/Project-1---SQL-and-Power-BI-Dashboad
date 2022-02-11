select * from flix.netflix_movies

select * from flix.imdb_scores


# to count all rows in the table
select count(*) from flix.netflix_movies


# to count how many documentary movies exists in the table 
select count(*) from flix.netflix_movies
where Genre = 'Documentary'


# The sum of the runtime of all Comedy movies in the table
select SUM(Runtime) from flix.netflix_movies
where Genre = 'Comedy'

# The average runtime of all Comedy movies in the table
select AVG(Runtime) from flix.netflix_movies
where Genre = 'Comedy'


# The movie with the maximum runtime
select MAX(Runtime) from flix.netflix_movies


# The movie with the manimum runtime
select Title, MIN(Runtime) from flix.netflix_movies

#group the movies by runtimes, below, above average or too low
select Title, Runtime, case
	when Runtime >= 93 then 'Above average'
    when Runtime >= 10 then 'Below average'
    else 'very low'
    end as Movie_length
from flix.netflix_movies


#number of movies per genre per language
select genre, language, count(*) as Amount
from flix.netflix_movies
group by 1, 2

# tells you how many movies are grouped as documentary, thriller, etc.
select genre, count(*) as Total
from flix.netflix_movies
group by 1

# tells you how many movies are in the table per language, in decending order.
select language, count(*) as Number_of_Movies
from flix.netflix_movies
group by 1
order by count(*) DESC

# tells you how many movies are in the table per language and then applies a filter to list languages with more than 10 movies.
select language, count(*) as Number_of_Movies
from flix.netflix_movies
group by 1
having count(*) > 10
order by count(*) DESC

#tells you the number of movies premiered each year
select RIGHT(Premiere,4) as premiere_year, count(*) as Number_of_Movies
from flix.netflix_movies
group by 1
order by count(*) DESC



# tells you how many movies were premiered in 2019, per language, in decending order 
select language, count(*) as Number_of_Movies, RIGHT(Premiere,4) as premiere_year
from flix.netflix_movies
where Premiere like '%2019'
group by 1
order by count(*) DESC


#Join the two tables and output, title, genre and IMDB score
select flix.netflix_movies.title, genre, `imdb score`
from flix.imdb_scores
JOIN flix.netflix_movies on flix.netflix_movies.title=flix.imdb_scores.title
order by `imdb score` DESC



# Join two tables, and output the documnetart movies with imdb scores greater than or equal to 5 , in decending order
select flix.netflix_movies.title, genre, `imdb score`
from flix.imdb_scores
JOIN flix.netflix_movies on flix.netflix_movies.title=flix.imdb_scores.title
where genre like 'Documentary' and `imdb score` >= 5
group by 1
order by `imdb score` DESC


