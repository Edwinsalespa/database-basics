/*creacion de base de datos test_db*/
create database test_db default character set utf8 ;

/*linia para utilizar test_db*/
use test_db;

/*creacion de tabla people*/
create table test_db.people
(
person_id int not null auto_increment,
last_name varchar(255) null,
first_name varchar(255) null,
address varchar(255) null,
city varchar(255) null,
constraint primary key (person_id)
);

/*insercion de datos a la tabla people*/
insert into test_db.people (last_name,first_name,address,city)
value ("salinas", "edwin", "calle1", "medellin");

insert into test_db.people (last_name,first_name,address,city)
value ("salinas", "alex", "carrera 2", "pitalito");

insert into test_db.people (last_name,first_name,address,city)
value ("hernandez", "yenny", "carrera al cielo", "medellin");

/*muestra la tabla people*/
select * from test_db.people;

/*crea una vista con el nombre de platzi_people de la tabla people de la base de datos test_db*/
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = root@localhost 
    SQL SECURITY DEFINER
VIEW test_db.platzi_people AS
    SELECT 
        test_db.people.person_id AS person_id,
        test_db.people.last_name AS last_name,
        test_db.people.first_name AS first_name,
        test_db.people.address AS address,
        test_db.people.city AS city
    FROM
        test_db.people;

/*utilizacion de alter*/

/*insercion de colomna a la tabla*/
alter table people 
add column date_of_birth datetime null after city;

/*altera el tipo de dato de una columna*/
ALTER TABLE test_db.people 
CHANGE COLUMN date_of_birth date_of_birth VARCHAR(30) NULL DEFAULT NULL;

/*elimina la columna*/
ALTER TABLE test_db.people 
DROP COLUMN date_of_birth;

/*actualizar datos*/
update people
set last_name = "chavez", city = "merida"
where person_id =1;

/*acion peligrosa que puede generar conflictos*/
update people
set first_name = "juan"
where city = "merida";

select first_name, last_name
from people;

/*eliminar sregistro de una tabla*/
delete from people
where person_id =1;


/*se da por teminado los primeros pasos de base de datos*/






