BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Role" (
	"ID_role"	INTEGER,
	"Nom_role"	varchar(10),
	PRIMARY KEY("ID_role")
);
CREATE TABLE IF NOT EXISTS "User" (
	"User_ID"	INTEGER,
	"nom"	VARCHAR(10),
	"prenom"	VARCHAR(10),
	"mail"	VARCHAR(30),
	"motpass"	VARCHAR(20),
	"ID_role"	INTEGER,
	FOREIGN KEY("ID_role") REFERENCES "Role"("ID_role") ON DELETE CASCADE,
	PRIMARY KEY("User_ID")
);
CREATE TABLE IF NOT EXISTS "categories" (
	"ID_cat"	INTEGER,
	"Nomcat"	VARCHAR(10),
	PRIMARY KEY("ID_cat")
);
CREATE TABLE IF NOT EXISTS "comment" (
	"ID_com"	INTEGER,
	"contenu"	varchar(100),
	"datecom"	date,
	"ID_art"	INTEGER,
	"User_ID"	INTEGER,
	FOREIGN KEY("ID_art") REFERENCES "Article"("ID_art") ON DELETE CASCADE,
	FOREIGN KEY("User_ID") REFERENCES "User"("User_ID") ON DELETE CASCADE,
	PRIMARY KEY("ID_com")
);
INSERT INTO "Role" VALUES (10,'user');
INSERT INTO "Role" VALUES (12,'admin');
INSERT INTO "User" VALUES (1,'ayoub','boulaghla','boulaghla.12@example.com','secret789',12);
INSERT INTO "User" VALUES (2,'ayoub','boulaghla','boulaghla.12@example.com','secret789',12);
INSERT INTO "User" VALUES (3,'karim','ahmad','ahmad@example.com','secret789',10);
INSERT INTO "User" VALUES (4,'Doe','John','john.doe@example.com','motdepasse123',10);
INSERT INTO "User" VALUES (5,'Smith','Jane','jane.smith@example.com','mdp456',12);
INSERT INTO "User" VALUES (6,'Garcia','Maria','maria.garcia@example.com','secret789',10);
INSERT INTO "categories" VALUES (1,'Électronique');
INSERT INTO "categories" VALUES (2,'Vêtements');
INSERT INTO "categories" VALUES (3,'Livres');
INSERT INTO "categories" VALUES (4,'Alimentation');
COMMIT;
