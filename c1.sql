create database service_stations;
use service_stations;
 CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT,
  name_users VARCHAR(40) NOT NULL,
  password VARCHAR(45) NOT NULL,
  address VARCHAR(45) NULL,
  email VARCHAR(30) NOT NULL UNIQUE,
  phone INT NULL UNIQUE,
  create_at DATE NOT NULL,
  update_at DATE NOT NULL,
  PRIMARY KEY (id));

create table historical (
id int not null auto_increment,
name_historical varchar(30) not null,
date_historical date not null,
create_at date not null,
update_at date not null,
primary key (id));

create table locations(
id int not null auto_increment,
country varchar(40) not null,
city varchar(50) not null,
address varchar(40) not null,
create_at date not null,
update_at date not null,
primary key (id)
);

CREATE TABLE permissions(
	id INT NOT NULL AUTO_INCREMENT,
	id_permission_rol INT NOT NULL,
	name_permissions VARCHAR(40)NOT NULL,
	creat_at DATE NOT NULL,
	update_at DATE NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_permission_rol) REFERENCES permission_rol(id)
);


CREATE TABLE Scores(
	id INT NOT NULL AUTO_INCREMENT,
	id_user_score INT NOT NULL,
	id_station INT NOT NULL,
	date_score DATE NOT NULL,
	quantity_litros FLOAT NOT NULL,
	quantity VARCHAR(40)NOT NULL,
	creat_at DATE NOT NULL,
	update_at DATE NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_user_score) REFERENCES user_score(id),
FOREIGN KEY (id_station) REFERENCES service_station(id)
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

create table fuel(
id int not null auto_increment,
name_fuel varchar(10) not null,
create_at date not null,
update_at date not null,
PRIMARY KEY (id)
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


CREATE TABLE user_score(
	id INT NOT NULL AUTO_INCREMENT,
	id_user INT NOT NULL UNIQUE,
	id_scor INT NOT NULL UNIQUE,
	creat_at DATE NOT NULL,
	update_at DATE NOT NULL,
PRIMARY KEY (id)
FOREING KEY (id_user) REFERENCES user(id),
FOREING KEY (id_score) REFERENCES score(id)
)


CREATE TABLE roles(
    id int null auto_increment,
    id_user int not null,
    id_permission_rol int not null,
    name varchar(30) null,
     create_at DATE NOT NULL,
      update_at DATE NOT NULL,
PRIMARY KEY (id).
FOREING KEY (id_user) REFERENCES user(user_rol),
FOREING KEY (id_permission_rol) REFERENCES user(permission_rol_rol)
);

CREATE TABLE `rol_permission` (
  `id` int NOT NULL,
  `id_rol` int  NOT NULL,
  `id_permissions` int NOT NULL,
  `creat_at` date NOT NULL,
  `update_at` date NOT NULL,
PRIMARY KEY (id),
FOREING KEY (id_permissions) REFERENCES permissions(id),
FOREING KEY (id_rol) REFERENCES roles(id)
);
