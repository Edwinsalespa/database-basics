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

create table post
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
  );

create table comentarios
(
  id int not null auto_increment,
  cuerpo_comentario text not null,
  usuario_id int not null,
  post_id int not null,
  primary key (id),
  constraint foreign key (post_id) references post (id) on delete no action on update no action,
  constraint foreign key (usuario_id) references usuarios (id) on delete no action on update no action
);

create table pots_etiquetas
(
post_id int not null,
etiquetas_id int not null,
constraint foreign key (post_id) references post (id) on delete no action on update no action,
constraint foreign key (etiquetas_id) references etiquetas (id) on delete no action on update no action,
constraint primary key (post_id,etiquetas_id)
);







