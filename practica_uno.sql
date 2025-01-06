-- Selecionar datos de una tabla
SELECT FROM column1, column2, ...
FROM nombre_tabla;

-- Seleciona todos los datos de la tabla
SELECT *
FROM nombre_tabla;

-- Se utiliza para devolver sólo los valores distintos (diferentes)
SELECT DISTINCT column1, column2, ...
FROM nombre_tabla;

-- Se utiliza para filtrar registros
SELECT column1, column2, ...
FROM nombre_tabla
WHERE condicion;

-- Practica 1
create database tienda;
use tienda;
create table direccion (
id_direccion smallint auto_increment primary key,
calle varchar (40) not null,
numero varchar (5) not null,
colonia varchar (40) not null,
codigo_p varchar (5) not null,
ciudad varchar (40) not null,
entidad_f varchar (30) not null,
estado boolean not null default true
);

-- Tarea --> Crear tablas: Usuario, Categoria
create table usuario (
id_usuario smallint auto_increment primary key,
usuario varchar (25) not null unique,
contrasena varchar (20) not null,
imagen varchar (30) not null,
fecha_creacion timestamp default current_timestamp,
tipo varchar (30) not null,
estado boolean not null default true
);


create table categoria (
id_categoria smallint auto_increment primary key,
nombre varchar (30) not null,
estado boolean not null default true
);