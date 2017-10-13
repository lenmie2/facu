DROP DATABASE IF EXISTS `ejercicio1-biblioteca`;
CREATE DATABASE  `ejercicio1-biblioteca`;
USE `ejercicio1-biblioteca`;

create table socio(
	cod_socio	SMALLINT	UNSIGNED	NOT NULL	AUTO_INCREMENT,
	dni		INTEGER		UNSIGNED	NOT NULL,
	apellido	VARCHAR(64)	NOT NULL,
	nombre		VARCHAR(64)	NOT NULL,
	fecha_nac	DATE		NOT NULL,
	fecha_ing 	DATE		NOT NULL,
	PRIMARY KEY(cod_socio)
    );

insert into	socio values
	(NULL,	38377054,	'suarez',		'julia',	"1992-09-02",	"2013-07-21"),
	(NULL,	38648197,	'gutierrez',		'martin',	"1992-09-29",	"2013-08-18"),
	(NULL,	38919340,	'posik',		'ramiro',	"1992-10-26",	"2013-09-15"),
	(NULL,	39190483,	'pavilonis',		'nicolas',	"1992-11-22",	"2013-10-13"),
	(NULL,	39461626,	'martinez',		'yamila',	"1992-12-19",	"2013-11-10"),
	(NULL,	37021339,	'lopez',		'luciana',	"1992-04-20",	"2013-03-03"),
	(NULL,	37292482,	'ferrari',		'alberto',	"1992-05-17",	"2013-03-31"),
	(NULL,	37563625,	'sibilio',		'juan',		"1992-06-13",	"2013-04-28"),
	(NULL,	37834768,	'passeri',		'pedro',	"1992-07-10",	"2013-05-26"),
	(NULL,	38105911,	'portanier',		'carolina',	"1992-08-06",	"2013-06-23");


create table genero(
	cod_genero	SMALLINT	UNSIGNED	NOT NULL	AUTO_INCREMENT,
	nombre		VARCHAR(64)	NOT NULL,
	PRIMARY KEY(cod_genero)
    );

insert into	genero values
	(NULL,	'suspenso'),
	(NULL,	'romantico'),
	(NULL,	'misterio');

create table libro(
	isbn		VARCHAR(13)		NOT NULL,
	titulo		VARCHAR(64)		NOT NULL,
	cod_genero	SMALLINT		UNSIGNED	NOT NULL,
	descripcion	TEXT			NULL,
	PRIMARY KEY(isbn),
	FOREIGN KEY(cod_genero)
		REFERENCES	genero(cod_genero)
			ON DELETE CASCADE
			ON UPDATE CASCADE
	);

insert	into libro values
	('2222-1980',	'La Invencion de Morel',	3,	NULL),
	('2222-1990',	'el Aleph',			1,	NULL),
	('2222-2000',	'Tokio Blues',			2,	NULL),
	('2222-2010',	'Kafka en la Orilla',		1,	NULL),
	('2222-2020',	'Estudio en Escarlata',		3,	NULL),
	('2222-2030',	'Historias de Amor',		2,	NULL);

create	table	copia(
	isbn		VARCHAR(13)	NOT NULL,
	nro_ejemplar 	SMALLINT	UNSIGNED	NOT NULL,
	estado		VARCHAR(20),
	FOREIGN KEY(isbn)
		REFERENCES libro(isbn)
			ON DELETE CASCADE
			ON UPDATE CASCADE,
	PRIMARY KEY(isbn,nro_ejemplar)
    );

insert into copia values
	('2222-2010',	1,	'excelente'),
	('2222-2020',	4,	'excelente'),
	('2222-2000',	2,	'bueno'),
	('2222-1980',	2,	'malo'),
	('2222-1990',	2,	'bueno'),
	('2222-2030',	1,	'malo'),
	('2222-2030',	2,	'excelente'),
	('2222-2020',	2,	'bueno'),
	('2222-2020',	3,	'malo'),
	('2222-1980',	1,	'excelente'),
	('2222-1990',	1,	'bueno'),
	('2222-2000',	1,	'malo');

    create	table	editorial(
	cod_editorial	SMALLINT	UNSIGNED	NOT NULL	AUTO_INCREMENT,
	denominacion	VARCHAR(32)	NOT NULL,
	telefono	INTEGER 	UNSIGNED	NOT NULL,
	calle		VARCHAR(32)	NOT NULL,
	numero		SMALLINT	UNSIGNED 	NOT NULL,
	piso		SMALLINT	UNSIGNED	NULL,
	dpto		CHAR		NULL,
	PRIMARY KEY(cod_editorial)
    );

insert	into editorial(denominacion,telefono,calle,numero,piso,dpto) values
	('Norma',		43433463,	'suarez',		2852,	2,	'A'),
	('Nueva Editorial',	42152425,	'scallabrini',		5323,	1,	'1'),
	('Gran Editorial',	43443463,	'perito moreno',	442,	NULL,	NULL),
	('Ivrea',		43552345,	'lisandro torre',	2566,	NULL,	NULL),
	('Larp',		43453463,	'corrientes',		3245,	NULL,	NULL);

create table prestamo(
	nro_prestamo		SMALLINT	UNSIGNED	NOT NULL	 AUTO_INCREMENT,
	cod_socio		SMALLINT	UNSIGNED	NOT NULL,
	isbn			VARCHAR(13)	NOT NULL,
	nro_ejemplar 		SMALLINT	UNSIGNED	NOT NULL,
	fecha_prestamo		DATE	NOT NULL,
	fecha_devolucion	DATE	NULL,
	FOREIGN KEY(cod_socio)
		REFERENCES	socio(cod_socio)
			ON DELETE CASCADE
			ON UPDATE CASCADE,
	FOREIGN KEY(isbn,nro_ejemplar)
		REFERENCES	copia(isbn,nro_ejemplar)
			ON DELETE CASCADE
			ON UPDATE CASCADE,
	PRIMARY KEY(nro_prestamo));

insert into prestamo values
	(NULL,	2,	'2222-1980',	1,	'2016-09-10',	NULL),
	(NULL,	3,	'2222-1990',	2,	'2016-09-10',	'2016-10-05'),
	(NULL,	4,	'2222-2000',	1,	'2016-09-10',	'2016-10-05'),
	(NULL,	1,	'2222-2010',	1,	'2016-09-15',	NULL),
	(NULL,	5,	'2222-2020',	3,	'2016-09-20',	NULL),
	(NULL,	8,	'2222-2030',	1,	'2016-10-05',	'2016-10-20'),
	(NULL,	3,	'2222-1980',	2,	'2016-10-10',	'2016-10-20'),
	(NULL,	3,	'2222-2020',	4,	'2016-10-20',	NULL),
	(NULL,	3,	'2222-2020',	2,	'2016-10-20',	NULL);

