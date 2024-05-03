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
	PRIMARY KEY("User_ID"),
	FOREIGN KEY("ID_role") REFERENCES "Role"("ID_role") ON DELETE CASCADE
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
	PRIMARY KEY("ID_com"),
	FOREIGN KEY("ID_art") REFERENCES "Article"("ID_art") ON DELETE CASCADE,
	FOREIGN KEY("User_ID") REFERENCES "User"("User_ID") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Article" (
	"ID_art"	INTEGER,
	"date_art"	date,
	"description"	VARCHAR(100),
	"User_ID"	INTEGER,
	"ID_cat"	INTEGER,
	PRIMARY KEY("ID_art"),
	FOREIGN KEY("ID_cat") REFERENCES "categories"("ID_cat") ON DELETE CASCADE,
	FOREIGN KEY("User_ID") REFERENCES "User"("User_ID") ON DELETE CASCADE
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
INSERT INTO "comment" VALUES (1,'Premier commentaire','2024-05-03',1,1);
INSERT INTO "comment" VALUES (2,'Deuxième commentaire','2024-05-03',2,2);
INSERT INTO "comment" VALUES (3,'Troisième commentaire','2024-05-03',4,3);
INSERT INTO "Article" VALUES (1,'2024-03-03','Première description',1,1);
INSERT INTO "Article" VALUES (2,'2024-04-02','Deuxième description',2,2);
INSERT INTO "Article" VALUES (3,'2024-05-03','Troisième description',4,1);
INSERT INTO "Article" VALUES (4,'2024-02-01','Troisième description',3,2);
INSERT INTO "Article" VALUES (5,'2024-05-01','Troisième description',5,3);
COMMIT;
