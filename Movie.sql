--create database Movie;
--use Movie;

drop table if exists MovieActor;
drop table if exists MovieGenre;
drop table if exists Movies;
drop table if exists Directors;
drop table if exists Actors;
drop table if exists Genres;

create table Movies (
	MovieId int primary key identity,
	MovieName nvarchar(100),
	DirectorId int
);

create table Directors (
	DirectorId int primary key identity,
	DirectorName nvarchar(100),
	DirectorAge int
);

create table Actors (
	ActorId int primary key identity,
	ActorName nvarchar(100)
);

create table Genres (
	GenreId int primary key identity,
	GenreName nvarchar(100)
);

create table MovieActor (
	MovieId int,
	ActorId int
);

create table MovieGenre (
	MovieId int,
	GenreId int
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