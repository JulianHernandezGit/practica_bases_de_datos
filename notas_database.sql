/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

drop database if exists notas_database;
create database notas_database;
use notas_database;

drop table if exists usuario;

create table usuario (
id int primary key not null auto_increment,
nombre varchar(100) not null,
apellido varchar(100) not null,
email varchar(50) not null unique
);

insert into usuario(nombre, apellido, email)
values('Lucas', 'Sequeira', 'lucassequeira@gmail.com'),
('Julian', 'Hernandez', 'julianhernandez@gmail.com'),
('Leonel', 'Dechat', 'leoneldechat@gmail.com'),
('Agustin', 'Taylor', 'agustintaylor@gmail.com'),
('Jose', 'Guillen', 'joseguillen@gmail.com'),
('Juan', 'Perez', 'juanperez@gmail.com'),
('Sara', 'Diaz', 'saradiaz@gmail.com'),
('Gregorio', 'Romero', 'gregorioromero@gmail.com'),
('Gaston', 'Rodriguez', 'gastonrodriguez@gmail.com'),
('Pedro', 'Lopez', 'pedrolopez@gmail.com');

drop table if exists categoria;

create table categoria (
id int primary key not null auto_increment,
nombre_categoria varchar(100) not null
);

insert into categoria(nombre_categoria)
values('Musica'),
('Peliculas'),
('Historia'),
('Humor'),
('Tecnologia'),
('Literatura'),
('Ciencia'),
('Turismo'),
('Videojuegos'),
('Economia');

drop table if exists notas;

create table notas (
id int primary key not null auto_increment,
titulo varchar(100),
fecha_creacion date default current_date(),
fecha_ultima_modificacion date default current_date(),
descripcion text,
eliminable boolean,
usuario_id int not null,
categoria_id int not null,
key usuario_id_fk (usuario_id),
key categoria_id_fk (categoria_id),
constraint usuario_id_fk foreign key(usuario_id) references usuario(id),
constraint categoria_id_fk foreign key(categoria_id) references categoria(id)
);

insert into notas(titulo, fecha_creacion, fecha_ultima_modificacion, descripcion, eliminable, usuario_id, categoria_id)
values('Titulo 1', default, default, 'Descripcion 1', 0, 2, 5),
('Titulo 2', default, default, 'Descripcion 2', 1, 1, 1),
('Titulo 3', default, default, 'Descripcion 3', 0, 4, 3),
('Titulo 4', default, default, 'Descripcion 4', 0, 2, 1),
('Titulo 5', default, default, 'Descripcion 5', 1, 7, 6),
('Titulo 6', default, default, 'Descripcion 6', 1, 9, 2),
('Titulo 7', default, default, 'Descripcion 7', 0, 1, 7),
('Titulo 8', default, default, 'Descripcion 8', 1, 3, 6),
('Titulo 9', default, default, 'Descripcion 9', 0, 5, 4),
('Titulo 10', default, default, 'Descripcion 10', 0, 8, 9);

drop table if exists notas_categoria;

create table notas_categoria (
id int primary key not null auto_increment,
notas_id int not null,
categoria_id int not null,
key nota_id_fk (notas_id),
key categoria_id_notas_fk (categoria_id),
constraint nota_id_fk foreign key(notas_id) references notas(id),
constraint categoria_id_notas_fk foreign key(categoria_id) references categoria(id)
);

insert into notas_categoria(notas_id, categoria_id)
values(1, 5),
(2, 1),
(3, 3),
(4, 1),
(5, 6),
(6, 2),
(7, 7),
(8, 6),
(9, 4),
(10, 9);

drop table if exists usuario_notas;

create table usuario_notas (
id int primary key not null auto_increment,
tipo_gestion enum('crear', 'modificar', 'eliminar') not null,
notas_id int not null,
usuario_id int not null,
fecha_gestion date default current_date(),
key nota_id_usuario_fk(notas_id),
key usuario_id_notas_fk(usuario_id),
constraint nota_id_usuario_fk foreign key(notas_id) references notas(id),
constraint usuario_id_notas_fk foreign key(usuario_id) references usuario(id)
);

insert into usuario_notas (tipo_gestion, notas_id, usuario_id)
values(1, 1, 2),
(2, 2, 1),
(3, 3, 4),
(2, 4, 2),
(1, 5, 7),
(1, 6, 9),
(2, 7, 1),
(1, 8, 3),
(1, 9, 5),
(2, 10, 8);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;