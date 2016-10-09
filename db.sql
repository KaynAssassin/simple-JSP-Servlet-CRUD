CREATE DATABASE PROJECT1;
USE PROJECT1;

CREATE TABLE Users (
  userId int(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  userName varchar(50) NOT NULL,
  lastName varchar(50) NOT NULL,
  gender char(1) NOT NULL,
  dob date NOT NULL
);

 CREATE TABLE Address (
	addressId int(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  userId int(5) NOT NULL,
	workAddress varchar(100) DEFAULT NULL,
  homeAddress varchar(100) DEFAULT NULL,
  FOREIGN KEY (userId) REFERENCES Users(userId)
  ON DELETE CASCADE
);

 
 #### DUMMY ENTRIES ####
insert into users(userName, lastName, gender, dob) values ('Monica', 'Belucci', 'f', '1969/02/15');
insert into address(userId, workAddress, homeAddress) values (1, 'Dimokratias 121, Patra, Greece', 'Athinas 25, Patra Greece');

insert into users(userName, lastName, gender, dob) values ('Bob', 'Dylan', 'm', '1965/06/21');
insert into address(userId, workAddress, homeAddress) values (2, 'Panormou 312, Athens, Greece', 'Athinas 25, Athens, Greece');

insert into users(userName, lastName, gender, dob) values ('John', 'Deer', 'm', '1989/05/14');
insert into address(userId, workAddress, homeAddress) values (3, '211 Barton Street, London, UK', '94 Ebourne Road, London, UK');