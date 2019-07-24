/*creacion de base de datos platziBlog*/
create database platziblog default character set utf8 ;

/*linia para utilizar platziBlog*/
use platziblog;

/*creacion de tabla people*/
create table platziblog.people
(
person_id int not null auto_increment,
last_name varchar(255) null,
first_name varchar(255) null,
address varchar(255) null,
city varchar(255) null,
constraint primary key (person_id)
);

select * from platziblog.people;


