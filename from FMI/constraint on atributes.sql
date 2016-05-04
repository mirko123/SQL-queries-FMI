--CREATE DATABASE ships2

USE ships2

CREATE TABLE Classes
(
	class varchar(50),
	type varchar(50),
	country varchar(50),
	numGuns int,
	bore int,
	displacement int,
);

ALTER TABLE Classes
ADD CONSTRAINT unique_class
UNIQUE (class)

CREATE TABLE Ships
(
	name varchar(50),
	class varchar(50),
	launched int,
	CONSTRAINT fk_to_class FOREIGN KEY (class) REFERENCES Classes(class), 
)

ALTER TABLE Ships
ADD CONSTRAINT uniq_name
UNIQUE (name)

CREATE TABLE Battles
(
	name varchar(50) UNIQUE,
	date datetime
)

CREATE TABLE Outcomes
(
	ship varchar(50) REFERENCES Ships(name),
	battle varchar(50) REFERENCES Battles(name),
	result varchar(50)
)
-------------------------
USE Ship2

ALTER TABLE Ships
ADD CONSTRAINT no_null_ship 
CHECK (name IS NOT NULL)

ALTER TABLE Ships
ADD CONSTRAINT pk_name PRIMARY KEY (name) 

ALTER TABLE Ships ALTER COLUMN name varchar(50) NOT NULL

---------------------------


INSERT INTO Classes
VALUES ('Bismarck','bb','Germany',8,15,42000),
('Iowa','bb','USA',9,16,46000),
('Kongo','bc','Japan',8,14,32000),
('North Carolina','bb','USA',12,16,37000),
('Renown','bc','Gt.Britain',6,15,32000),
('Revenge','bb','Gt.Britain',8,15,29000),
('Tennessee','bb','USA',12,14,32000),
('Yamato','bb','Japan',9,18,65000);

INSERT INTO Battles
VALUES ('Guadalcanal','19421115 00:00:00.000'),
('North Atlantic','19410525 00:00:00.000'),
('North Cape','19431226 00:00:00.000'),
('Surigao Strait','19441025 00:00:00.000');

INSERT INTO Ships
VALUES ('California','Tennessee',1921),
('Haruna','Kongo',1916),
('Hiei','Kongo',1914),
('Iowa','Iowa',1943),
('Kirishima','Kongo',1915),
('Kongo','Kongo',1913),
('Missouri','Iowa',1944),
('Musashi','Yamato',1942),
('New Jersey','Iowa',1943),
('North Carolina','North Carolina',1941),
('Ramillies','Revenge',1917),
('Renown','Renown',1916),
('Repulse','Renown',1916),
('Resolution','Renown',1916),
('Revenge','Revenge',1916),
('Royal Oak','Revenge',1916),
('Royal Sovereign','Revenge',1916),
('Tennessee','Tennessee',1920),
('Washington','North Carolina',1941),
('Wisconsin','Iowa',1944),
('Yamato','Yamato',1941),
('South Dakota','North Carolina',1941);

INSERT INTO Outcomes
VALUES ('California','Surigao Strait','ok'),
 ('Kirishima','Guadalcanal','sunk'),
 ('South Dakota','Guadalcanal','damaged'),
 ('Tennessee','Surigao Strait','ok'),
 ('Washington','Guadalcanal','ok'),
('California','Guadalcanal','damaged');


UPDATE Ships
SET launched = 1927, 



















