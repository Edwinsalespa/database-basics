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

insert categorias (nom_categoria)
value   ("programacion"),
		("ciencia"),
        ("tecnologia"),
		("base de datos"),
        ("git");
        
select * from categorias;

create table etiquetas
(
id int not null auto_increment,
nom_etiquetas varchar(30) not null,
constraint primary key (id)
);

insert etiquetas (nom_etiquetas)
value   ("curso de programacion"),
		("cura con el cancer"),
        ("nuevo tesla"),
		("NoSQL"),
        ("git en android");
        
select * from etiquetas;

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

/*insercion en la tabla usuarios*/
insert usuarios (login, pasword, nickname, email)
value   ("edwinsalespa",1234,"edwinsalespa", "edwinsalespa@gmail.com"),
		("alexsalespa",1234,"alexsalespa", "alexsalespa@gmail.com"),
        ("robinsalespa",1234,"robinsalespa", "robinsalespa@gmail.com");
        
select * from usuarios;

/*Tablas dependientes*/
create table pots
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
  
  insert into pots (titulo, fecha_publicacion, contenido, estatus,usuario_id,categoria_id)
  value   ("platziblog",'2019-07-16 00:00:00',"proyrcto de fundamentos de base de datos", "activo",1,1),
		  ("platziblog2",'2019-05-12 00:00:00',"proyrcto de fundamentos de base de datos", "activo",2,2),
          ("platziblog3",'2019-07-23 00:00:00',"proyrcto de fundamentos de base de datos", "activo",3,3);
          
select * from pots;
select * from etiquetas;

create table comentarios
(
  id int not null auto_increment,
  cuerpo_comentario text not null,
  usuario_id int not null,
  pots_id int not null,
  constraint primary key (id),
  constraint foreign key (pots_id) references pots (id) on delete no action on update no action,
  constraint foreign key (usuario_id) references usuarios (id) on delete no action on update no action
);

insert comentarios (cuerpo_comentario, usuario_id, pots_id)
value ("la mejor educacion",1,5),
	  ("la mejor educacion",2,6);

select * from comentarios;

/*enlace de muchos a muchos en las tablas post y etiquetas*/
create table pots_etiquetas
(
pots_id int not null,
etiquetas_id int not null,
constraint foreign key (pots_id) references pots (id) on delete no action on update no action,
constraint foreign key (etiquetas_id) references etiquetas (id) on delete no action on update no action,
constraint primary key (pots_id,etiquetas_id)
);

insert pots_etiquetas (pots_id, etiquetas_id)
value (5,1),
	  (6,1),
      (7,1);
      
select * from pots_etiquetas;






































