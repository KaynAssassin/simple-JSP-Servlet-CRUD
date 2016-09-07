CREATE DATABASE PROJECT1;
USE PROJECT1;

 CREATE TABLE Address (
	addressId int(5) NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	workAddress varchar(100) DEFAULT NULL,
    homeAddress varchar(100) DEFAULT NULL 
);

CREATE TABLE Users (
	 userId int(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	 userName varchar(50) NOT NULL,
	 lastName varchar(50) NOT NULL,
	 gender char(1) NOT NULL,
	 dob date NOT NULL, 
     address int(5),
     FOREIGN KEY (Address) REFERENCES Address(addressId)
 );
 
 #### DUMMY ENTRIES ####
insert into address(workAddress, homeAddress) values ('Dimokratias 121, Patra, Greece', 'Athinas 25, Patra Greece');
insert into users(userName, lastName, gender, dob, address) values ('Monica', 'Belucci', 'f', '1969/02/15', 1);
 
insert into address(workAddress, homeAddress) values ('Panormou 312, Athens, Greece', 'Athinas 25, Athens, Greece');
insert into users(userName, lastName, gender, dob, address) values ('Bob', 'Dylan', 'm', '1965/06/21', 2);
 
insert into address(workAddress, homeAddress) values ('211 Barton Street, London, UK', '94 Ebourne Road, London, UK');
insert into users(userName, lastName, gender, dob, address) values ('John', 'Deer', 'm', '1989/05/14', 3);