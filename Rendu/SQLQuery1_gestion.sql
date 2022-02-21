create database gestion_db;

use gestion_db

create table Clients(
	code_client int primary key not null, 
	nom varchar(255)  not null, 
	prenom varchar(255)  not null,
	adresse varchar(255)  not null,
	ville varchar(255)  not null, 
	code_postal int  not null,
	pays varchar(255)  not null,
	telephone int  not null, 
	e_mail varchar(255)  not null
);

create table Categorie(
	code_categorie int primary key not null,
	description varchar(255) not null
	);

create table Prestation(
	code_prest int primary key not null,
	designation_prest varchar(255) not null
	);

create table Classe(
	nombre_etoile int primary key not null,
	caracteristique varchar(255) not null
	);

create table Consommations(
	num_consommation int primary key not null,
	date_consommation date not null,
	heure_consommation time not null,
	code_clients int not null,
	foreign key(code_clients) references Clients(code_client)
	);

create table Reservation(
	num_reservation int primary key not null,
	date_debut date not null,
	date_fin date not null,
	date_paye_arrhes date not null,
	code_clients int not null,
	numeros int not null,
	foreign key(code_clients) references Clients(code_client),
	foreign key(numeros) references Chambres(numero)
	);

create table Chambres(
	numero int primary key not null, 
	numero_tel int not null,
	codes int not null,
	foreign key(codes) references Hotels(code)
	);

create table Hotels(
	code int primary key not null,
	nom varchar(255) not null,
	adresse varchar(255) not null,
	CPH int not null,
	telephone int not null,
	nombre_etoiles int not null,
	foreign key(nombre_etoiles) references Classe(nombre_etoile)
	);

create table Concerner(
	num_consommation int not null,
	code_preste int not null,
	foreign key(num_consommation) references Consommations(num_consommation),
	foreign key(code_preste) references Prestation(code_prest)
	);


create table Offrir(
	code_preste int not null,
	codes int not null,
	foreign key(code_preste) references Prestation(code_prest),
	foreign key(codes) references Hotels(code)
	);

create table Tarifier(
	code_categories int not null,
	numeros int not null,
	foreign key(code_categories) references Categorie(code_categorie),
	foreign key(nombre_etoiles) references Classe(nombre_etoile)
	);

create table Appartenir (
	code_categories int not null,
	numeros int not null,
	foreign key(code_categories) references Categorie(code_categorie),
	foreign key(numeros) references Chambres(numero)
	);

	
	select * from Clients;
	insert into Clients values(1, 'cendy', 'lili', 'mardjandafack', 'Ndjamena', 001, 'Tchad', 68246271, 'cendy@gmail.com');
	insert into Clients values(2, 'sissou', 'othneil', 'mardjandafack', 'bangui', 002, 'Centrafrique', 68246271, 'sissou@gmail.com');
	insert into Clients values(3, 'cendy', 'lili', 'mardjandafack', 'Ndjamena', 003, 'Tchad', 68246271, 'cendy@gmail.com');
	insert into Clients values(4, 'oli', 'ernestine', 'mardjandafack', 'Ndjamena', 004, 'Tchad', 68246271, 'oli@gmail.com');



	select * from Classe;
	insert into Classe values(5, 'hebergement tres haut de gamme'); 
	insert into Classe values(4, 'hebergement haut de gamme');
	insert into Classe values(3, 'hebergement milieu de gamme superieur');
	insert into Classe values(2, 'hebergement milieu de gamme');
	insert into Classe values(1, 'hebergement econonomique');



		select * from Prestation;
		insert into Prestation values(01, 'petit dejeuner');
		insert into Prestation values(02, 'dejeuner');
		insert into Prestation values(03, 'diner');
		insert into Prestation values(04, 'dejeuner');
		insert into Prestation values(05, 'diner');



		select * from Categorie;
		insert into Categorie values(01, 'chambre standard');
		insert into Categorie values(02, 'chambre standard vue mer');
		insert into Categorie values(03, 'chambre deluxe vue jardin');
		insert into Categorie values(04, 'chambre deluxe vue mer');


		select * from Consommations;
		insert into Consommations values(1, '2022-01-02', '15:00', 2);
		insert into Consommations values(2, '2019-01-02', '12:00', 3);
		insert into Consommations values(3, '2023-01-02', '13:00', 2);
		insert into Consommations values(4, '2020-01-02', '10:00', 4);
		insert into Consommations values(5, '2021-01-02', '11:00', 1);


		select * from Hotels;
		insert into Hotels values(001, 'la belle lune', 'quartier goudji', 001, 97865432, 5); 
		insert into Hotels values(002, 'soluxe', 'quartier moursal', 005, 97865432, 4); 
		insert into Hotels values(003, 'la tchadienne', 'quartier farcha', 004, 97865432, 2); 
		insert into Hotels values(004, 'radisson', 'quartier gassi', 002, 97865432, 1); 
		insert into Hotels values(005, 'hilton', 'quartier mardjandaffack', 003, 97865432, 3); 



		select * from Chambres;
		insert into Chambres values(10, 65789054, 001);
		insert into Chambres values(11, 65789054, 002);
		insert into Chambres values(12, 65789054, 005);
		insert into Chambres values(13, 65789054, 004);
		insert into Chambres values(14, 65789054, 003);

		select * from Reservation;
		insert into Reservation values(01, '2022-01-12', '2022-01-30', '2022-02-01', 1, 10);
		insert into Reservation values(02, '2022-01-12', '2022-01-30', '2022-02-01', 2, 11);
		insert into Reservation values(03, '2022-01-12', '2022-01-30', '2022-02-01', 4, 12);
		insert into Reservation values(04, '2022-01-12', '2022-01-30', '2022-02-01', 3, 13);

		select * from Concerner;
		insert into Concerner values(1, 01);
		insert into Concerner values(2, 02);
		insert into Concerner values(3, 03);
		insert into Concerner values(4, 04);
		insert into Concerner values(5, 05);

		select * from Offrir;
		insert into Offrir values(01, 001);
		insert into Offrir values(01, 002);
		insert into Offrir values(01, 003);
		insert into Offrir values(01, 004);
		insert into Offrir values(01, 005);

		select * from Tarifier;
		insert into Tarifier values(01, 2);
		insert into Tarifier values(02, 1);
		insert into Tarifier values(04, 5);
		insert into Tarifier values(03, 3);


		select * from Appartenir;
		insert into Appartenir values(01, 10);
		insert into Appartenir values(02, 11);
		insert into Appartenir values(04, 12);
		insert into Appartenir values(03, 13);