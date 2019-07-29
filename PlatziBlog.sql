/*creacion de base de datos PlatziBlog*/
create database PlatziBlog default character set utf8 ;

/*linia para utilizar PlatziBlog*/
use PlatziBlog;

/*construccion de tablas independientes*/
create table categorias
(
id int not null auto_increment,
nom_categoria varchar(30) not null,
constraint primary key (id)
);

create table etiquetas
(
id int not null auto_increment,
nom_etiquetas varchar(30) not null,
constraint primary key (id)
);

create table usuarios 
(
  id int not null auto_increment,
  login varchar(30) not null,
  pasword varchar(32) not null,
  nickname varchar(40) not null,
  email varchar(40) not null,
  primary key (id),
  unique key email_unique (email)
);

create table posts 
(
  id int not null auto_increment,
  titulo varchar(130) not null,
  fecha_publicacion timestamp null default null,
  contenido text not null,
  estatus char(8) default "activo",
  usuario_id int default null,
  categoria_id int default null,
  constraint primary key (id),
  constraint foreign key (categoria_id) references categorias (id) on delete no action on update no action,
  constraint foreign key (usuario_id) references usuarios (id) on delete no action on update cascade
  )













