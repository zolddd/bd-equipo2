create database service_stations;
use service_stations;
create table fuel(
id int not null auto_increment,
name_fuel varchar(10) not null,
create_at date not null,
update_at date not null,
PRIMARY KEY (id)
);

create table locations(
id int not null auto_increment,
country varchar(40) not null,
city varchar(50) not null,
address varchar(40) not null,
create_at date not null,
update_at date not null,
primary key (id)
);

 CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT,
  name_users VARCHAR(40) NOT NULL,
  password VARCHAR(45) NOT NULL,
  address VARCHAR(45) NULL,
  email VARCHAR(30) NOT NULL UNIQUE,
  phone INT NULL UNIQUE,
  create_at DATE NOT NULL,
  update_at DATE NOT NULL,
  PRIMARY KEY (id)
  );
  
   create table historical (
id int not null auto_increment,
id_users int not null,
name_historical varchar(30) not null,
date_historical date not null,
create_at date not null,
update_at date not null,
primary key (id),
FOREIGN KEY (id_users) references users (id)
);

 create table service_station(
           id INT NOT NULL auto_increment,
           id_location INT NOT NULL,
          name_station VARCHAR(40) NOT NULL,
          address VARCHAR(50) NOT NULL,
          phone VARCHAR(10) NULL UNIQUE,
          email VARCHAR(50) NULL UNIQUE,
          create_at DATE NOT NULL,
           update_at DATE NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_location) REFERENCES locations(id)
);

CREATE TABLE price_station(
	id int not null auto_increment,
	id_fuel int not null,
	id_station int not null,
	price float not null,
	create_at date not null,
	update_at date not null,
    PRIMARY KEY (id),
    FOREIGN KEY (id_fuel) REFERENCES fuel(id),
    FOREIGN KEY (id_station) REFERENCES service_station(id)
);
CREATE TABLE scores(
	id INT NOT NULL AUTO_INCREMENT,
	id_user INT NOT NULL,
	date_score DATE NOT NULL,
	quantity_litros FLOAT NOT NULL,
	quantity VARCHAR(40)NOT NULL,
	creat_at DATE NOT NULL,
	update_at DATE NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_user) REFERENCES users(id)
);

CREATE TABLE user_score(
	id INT NOT NULL AUTO_INCREMENT,
	id_user INT NOT NULL UNIQUE,
	id_score INT NOT NULL UNIQUE,
	creat_at DATE NOT NULL,
	update_at DATE NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_user) REFERENCES users(id),
FOREIGN KEY (id_score) REFERENCES scores(id)
);

CREATE TABLE permissions(
	id INT NOT NULL AUTO_INCREMENT,
	name_permissions VARCHAR(40)NOT NULL,
	creat_at DATE NOT NULL,
	update_at DATE NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE roles(
    id int not null auto_increment,
    id_user int not null,
    name varchar(30) null,
     create_at DATE NOT NULL,
      update_at DATE NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_user) REFERENCES users(id)
);

CREATE TABLE rol_permission (
  id int NOT NULL auto_increment,
  id_users int not null,
  id_rol int  NOT NULL,
  id_permissions int NOT NULL,
  creat_at date NOT NULL,
  update_at date NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_users) REFERENCES users(id),
FOREIGN KEY (id_permissions) REFERENCES permissions(id),
FOREIGN KEY (id_rol) REFERENCES roles(id)
);

insert into users values (null,"darko","darko","hxh","nj",747,NOW(),NOW());
insert into users values (null,"juan","juan","hh","nhj",717,NOW(),NOW());
insert into users values (null,"david","david","hqh","njz",797,NOW(),NOW());
select * from users;
insert into locations values (null,"españa","madrid","xxjhu",NOW(),NOW());
select * from locations;
insert into service_station values (null,1,"pemex","mexico","8787","pexes@gmail.com",NOW(),NOW());
insert into scores values (null,1,NOW(),50,5,NOW(),NOW());
insert into scores values (null,2,NOW(),40,4,NOW(),NOW());
select * from scores;
insert into user_score values(null,1,1,NOW(),NOW());
select * from user_score;

SELECT scores.quantity, users.name_users
FROM users
INNER JOIN scores ON scores.id_user=users.id where users.id=3;

insert into roles values(null, 1, "administrador", now(), now());
insert into roles values(null, 2, "cliente", now(), now());
insert into roles values(null, 3, "empleado", now(), now());

select * from roles;

insert into permissions values(null, "leer", now(), now());
insert into permissions values(null, "modificar", now(), now());
insert into permissions values(null, "crear", now(), now());

select * from permissions;

insert into rol_permission values (1, 1, 1, now(), now());



SELECT rol_user.quantity, users.name_users
FROM users
INNER JOIN scores ON scores.id_user=users.id;

select quantity, name_users from scores, user_score, users where users.id=1;

select * from rol_permission;

select * from users;

insert into rol_permission values (null, 1, 1, 1, now(), now());
insert into rol_permission values (null, 2, 2, 3, now(), now());


update rol_permission set id_permissions = 2 where id = 2;

SELECT users.name_users, permissions.name_permissions, roles.name
FROM users
INNER JOIN rol_permission ON rol_permission.id_users = users.id
inner join permissions on rol_permission.id = permissions.id
inner join roles on rol_permission.id_rol=roles.id
where users.id = 1; 
select * from roles;

select * from rol_permission;
