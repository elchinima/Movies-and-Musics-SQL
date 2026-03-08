create database Movie;

use Movie;

drop table if exists MovieActor;
drop table if exists MovieGenre;
drop table if exists Movies;
drop table if exists Directors;
drop table if exists Actors;
drop table if exists Genres;

create table Directors (
	DirectorId int primary key identity not null, 
	DirectorName nvarchar(100) not null,
	DirectorAge int not null
); 

create table Genres (
	GenreId int primary key identity not null, 
	GenreName nvarchar(100) not null
);

create table Actors (
	ActorId int primary key identity not null,
	ActorName nvarchar(100) not null
);

create table Movies (
	MovieId int primary key identity not null,
	MovieName nvarchar(100) not null,
	DirectorId int not null,
	IMDB_Point decimal(3,1) not null,
	Duration int not null
);

create table MovieActor (
	MovieId int not null,
	ActorId int not null
);

create table MovieGenre (
	MovieId int not null,
	GenreId int not null
);

alter table Movies
add constraint FK_Movies_Directors
foreign key (DirectorId)
references Directors(DirectorId);

alter table MovieActor
add constraint FK_MovieActor_Movies
foreign key (MovieId)
references Movies(MovieId);

alter table MovieActor
add constraint FK_MovieActor_Actors
foreign key (ActorId)
references Actors(ActorId);

alter table MovieGenre
add constraint FK_MovieGenre_Movies
foreign key (MovieId)
references Movies(MovieId);

alter table MovieGenre
add constraint FK_MovieGenre_Genres
foreign key (GenreId)
references Genres(GenreId);

insert into Directors (DirectorName, DirectorAge)
values 
('Christopher Nolan', 52),
('Quentin Tarantino', 60),
('Steven Spielberg', 77);

insert into Genres (GenreName)
values 
('Action'),
('Drama'),
('Thriller');

insert into Actors (ActorName)
values 
('Christian Bale'),
('Heath Ledger'),
('Morgan Freeman');

insert into Movies (MovieName, DirectorId, IMDB_Point, Duration)
values 
('The Dark Knight', 1, 9.0, 152),
('Inglourious Basterds', 2, 8.3, 153),
('Schindler''s List', 3, 8.9, 195);

insert into MovieActor (MovieId, ActorId)
values 
(1, 1),
(1, 2),
(3, 3);

insert into MovieGenre (MovieId, GenreId)
values 
(1, 1),
(1, 3),
(2, 2),
(3, 2);

select 
    m.MovieName,
    m.IMDB_Point,
    g.GenreName,
    d.DirectorName,
    a.ActorName
from Movies m
join Directors d on m.DirectorId = d.DirectorId
join MovieGenre mg on m.MovieId = mg.MovieId
join Genres g on mg.GenreId = g.GenreId
join MovieActor ma on m.MovieId = ma.MovieId
join Actors a on ma.ActorId = a.ActorId
where m.IMDB_Point > 6;

select 
    m.MovieName,
    m.IMDB_Point,
    g.GenreName
from Movies m
join MovieGenre mg on m.MovieId = mg.MovieId
join Genres g on mg.GenreId = g.GenreId
where g.GenreName like '%a%';

select 
    m.MovieName,
    m.IMDB_Point,
    m.Duration,
    g.GenreName
from Movies m
join MovieGenre mg on m.MovieId = mg.MovieId
join Genres g on mg.GenreId = g.GenreId
where len(m.MovieName) > 10
and right(m.MovieName,1) = 't';

select 
    m.MovieName,
    m.IMDB_Point,
    g.GenreName,
    d.DirectorName,
    a.ActorName
from Movies m
join Directors d on m.DirectorId = d.DirectorId
join MovieGenre mg on m.MovieId = mg.MovieId
join Genres g on mg.GenreId = g.GenreId
join MovieActor ma on m.MovieId = ma.MovieId
join Actors a on ma.ActorId = a.ActorId
where m.IMDB_Point > (select avg(IMDB_Point) from Movies)
order by m.IMDB_Point desc;