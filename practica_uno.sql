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
-- create table usuario (
-- id_usuario smallint auto_increment primary key,
-- usuario varchar (25) not null unique,
-- contrasena varchar (20) not null,
-- imagen varchar (30) not null,
-- fecha_creacion timestamp default current_timestamp,
-- tipo varchar (30) not null,
-- estado boolean not null default true
-- );

create table usuario (
id_usuario smallint auto_increment primary key,
usuario varchar (25) not null unique,
contrasena varchar (20) not null,
imagen varchar (30) not null,
fecha_creacion timestamp not null default current_timestamp on update current_timestamp,
tipo varchar (30) not null,
estado boolean not null default true
);

create table categoria (
id_categoria smallint auto_increment primary key,
nombre varchar (30) not null,
estado boolean not null default true
);

-- Tabla Proveedor con llave foranea
create table proveedor (
id_proveedor smallint auto_increment primary key,
rfc char (13) not null unique,
nombre varchar (20) not null,
apellido_p varchar (20) not null,
apellido_m varchar (20) not null,
telefono char (10) not null unique,
correo_e varchar (40) not null unique,
estado boolean not null default true,
id_direccion smallint not null,
foreign key (id_direccion) references direccion (id_direccion) on update cascade on delete cascade
);

-- Tabla Empleado con 2 llaves foraneas
create table empleado (
id_empleado smallint auto_increment primary key,
nombre varchar (20) not null,
apellido_p varchar (20) not null,
apellido_m varchar (20) not null,
telefono char (10) not null,
correo_e varchar (40) not null unique,
puesto varchar (40) not null,
sueldo float not null,
estado boolean not null default true,
id_direccion smallint not null,
foreign key (id_direccion) references direccion (id_direccion) on update cascade on delete cascade,
id_usuario smallint not null,
foreign key (id_usuario) references usuario (id_usuario) on update cascade on delete cascade
);

create table cliente (
id_cliente smallint auto_increment primary key,
rfc char (13) not null unique,
nombre varchar (20) not null,
apellido_p varchar (20) not null,
apellido_m varchar (20) not null,
telefono char (10) not null,
correo_e varchar (40) not null unique,
estado boolean not null default true,
id_direccion smallint not null,
foreign key (id_direccion) references direccion (id_direccion) on update cascade on delete cascade,
id_usuario smallint not null,
foreign key (id_usuario) references usuario (id_usuario) on update cascade on delete cascade
);

create table producto (
id_producto smallint auto_increment primary key,
sku char (8) not null unique,
descripcion varchar (50) not null,
precio_compra float not null,
precio_venta float not null,
existencia int (11) not null,
imagen varchar (30) not null,
estado boolean not null default true,
id_categoria smallint not null,
foreign key (id_categoria ) references categoria (id_categoria) on update cascade on delete cascade
);

create table pedido (
id_pedido smallint auto_increment primary key,
fecha timestamp not null default current_timestamp on update current_timestamp,
total float not null,
estado boolean not null default true,
id_proveedor smallint not null,
foreign key (id_proveedor) references proveedor (id_proveedor) on update cascade on delete cascade,
id_empleado smallint not null,
foreign key (id_empleado) references empleado (id_empleado) on update cascade on delete cascade
);

-- Llaves primarias compuestas
create table detallepedido (
cantidad int (11) not null, 
subtotal float not null,
id_pedido smallint not null,
foreign key (id_pedido) references pedido (id_pedido) on update cascade on delete cascade,
id_producto smallint not null,
foreign key (id_producto) references producto (id_producto) on update cascade on delete cascade,
primary key (id_pedido, id_producto) 
);

create table venta (
id_venta smallint auto_increment primary key,
fecha timestamp not null default current_timestamp on update current_timestamp,
total float not null,
id_cliente smallint not null,
foreign key (id_cliente) references cliente (id_cliente) on update cascade on delete cascade
);

create table detalleventa (
cantidad int (11) not null, 
subtotal float not null,
id_venta smallint not null,
foreign key (id_venta) references venta (id_venta) on update cascade on delete cascade,
id_producto smallint not null,
foreign key (id_producto) references producto (id_producto) on update cascade on delete cascade,
primary key (id_venta, id_producto) 
);

-- Insertar datos en la tabla
insert into categoria (nombre) values ("Frutas");
insert into categoria (nombre) values ("Verduras");
insert into categoria (nombre) values ("Legumbres");
insert into categoria (nombre) values ("Lácteos");
insert into categoria (nombre) values ("Cereales");