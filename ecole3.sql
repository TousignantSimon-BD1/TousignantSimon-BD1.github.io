DROP DATABASE IF EXISTS ecole;
CREATE DATABASE IF NOT EXISTS ecole;
USE ecole;

CREATE TABLE enseignants (
	code_employe NUMERIC(8) PRIMARY KEY,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    num_assurance_sociale CHAR(9),
    anciennete TINYINT
);

CREATE TABLE cours (
	cours_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255),
    sigle CHAR(10),
    duree TINYINT DEFAULT 60,
    nombre_semaine TINYINT DEFAULT 15,
    enseignant NUMERIC(8),
    FOREIGN KEY (enseignant) REFERENCES enseignants (code_employe)
);

CREATE TABLE programmes (
	code_programme CHAR(6) PRIMARY KEY,
    nom VARCHAR(255),
    prof_responsable NUMERIC(8),
    FOREIGN KEY (prof_responsable) REFERENCES enseignants (code_employe)
);


CREATE TABLE etudiants (
	code_etudiant NUMERIC (7) PRIMARY KEY,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    annee_admission YEAR,
    date_naissance DATETIME,
    code_programme CHAR(6),
    FOREIGN KEY (code_programme) REFERENCES programmes (code_programme)
);

CREATE TABLE sessions (
    session_code VARCHAR(3) PRIMARY KEY,
    session_saison ENUM("automne","hiver","été"),
    date_debut DATE not null,
    date_fin DATE not null
);

CREATE TABLE groupes (
	groupe_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    cours_id INTEGER,
    enseignant NUMERIC(8),
    session_code VARCHAR(4),
    numero_groupe TINYINT,
    FOREIGN KEY (cours_id) REFERENCES cours (cours_id),
    FOREIGN KEY (session_code) REFERENCES sessions (session_code),
    FOREIGN KEY (enseignant) REFERENCES enseignants(code_employe)
);

CREATE TABLE inscriptions (
	code_etudiant NUMERIC (7),
    groupe_id INTEGER,
    FOREIGN KEY (code_etudiant) REFERENCES etudiants (code_etudiant),
    FOREIGN KEY (groupe_id) REFERENCES groupes (groupe_id),
    PRIMARY KEY (code_etudiant, groupe_id)
);

CREATE TABLE evaluations (
	evaluation_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    groupe_id INTEGER,
    nom_evaluation VARCHAR(255),
    note_max NUMERIC(5,2),
	FOREIGN KEY (groupe_id) REFERENCES groupes (groupe_id)
);

CREATE TABLE evaluations_etudiants (
	evaluation_id INTEGER,
    code_etudiant NUMERIC(7),
    date_remise DATE,
    nom_document VARCHAR(255),
    note NUMERIC(5,2),
    PRIMARY KEY (evaluation_id, code_etudiant),
    FOREIGN KEY (evaluation_id) REFERENCES evaluations (evaluation_id),
    FOREIGN KEY (code_etudiant) REFERENCES etudiants (code_etudiant)
);

CREATE TABLE periodes (
    periode_id INT PRIMARY KEY AUTO_INCREMENT,
    heure_debut TIME,
    heure_fin TIME);
   
INSERT INTO enseignants (code_employe, nom, num_assurance_sociale, anciennete) 
VALUES 
(9876, 'Clark Kent', 150150150, 8), 
(8765, 'Bruce Wayne', 260260260, 14), 
(7654, 'Kara Danvers', 888777666, 0), 
(6573, 'Richard Grayson', 222444666, 4),
(1234, 'Diana Prince', 123456789, 5),
(2345, 'Barry Allen', 987654321, 2),
(3456, 'Hal Jordan', 456789123, 10),
(4567, 'Arthur Curry', 789123456, 3),
(5678, 'Victor Stone', 321654987, 7),
(6789, 'John Stewart', 654321789, 6);

INSERT INTO cours (nom, sigle, enseignant, duree) 
VALUES 
('Base de données 1', '420-2B4-VI', 9876, 60), 
('Développement Web 2', '420-2B5-VI', 8765, 75), 
('Programmation 1', '420-1B2-VI', 7654, 90), 
('Programmation 2', '420-2B3-VI', 7654, 90), 
('Mathématique de l\'ordinateur', '320-1B4-VI', null, 45), 
('Fonctionnement de l\'ordinateur', '420-3B1-VI', null, 60);

INSERT INTO programmes (code_programme, nom, prof_responsable) 
VALUES 
('420.01', 'Informatique appliquée', 9876), 
('420.02', 'Informatique de gestion', 7654);

INSERT INTO etudiants (code_etudiant, nom, prenom, annee_admission, date_naissance, code_programme) 
VALUES
(1900015, 'Alice', 'Dupont', 2019, '2000-05-12', '420.01'),
(1900026, 'Jean', 'Lemoine', 2019, '1998-11-10', '420.02'),
(1900037, 'Sophie', 'Bertrand', 2019, '2001-02-22', '420.01'),
(1900048, 'Marc', 'Leclerc', 2019, '2000-03-30', '420.02'),
(1900059, 'Eva', 'Petit', 2019, '1998-02-15', '420.01'),
(1900061, 'Pierre', 'Moreau', 2019, '1999-07-18', '420.02'),
(1900072, 'Nina', 'Giraud', 2019, '2001-09-12', '420.01'),
(1900083, 'Luc', 'Faure', 2019, '2000-04-20', '420.02'),
(1900094, 'Julie', 'Tanguy', 2019, '1997-12-09', '420.01'),
(1900105, 'Thomas', 'Bouvier', 2019, '2002-01-17', '420.02'),
(2100016, 'Alice', 'Dupont', 2021, '2000-05-12', '420.01'),
(2100027, 'Bob', 'Martin', 2021, '1999-08-23', '420.02'),
(2100038, 'Claire', 'Bernard', 2021, '2001-03-30', '420.01'),
(2100049, 'David', 'Lemoine', 2021, '2002-11-04', '420.02'),
(2100051, 'François', 'Lefevre', 2021, '1997-07-09', '420.01'),
(2100062, 'Géraldine', 'Robert', 2021, '2000-12-01', '420.02'),
(2100073, 'Hugo', 'Dufresne', 2021, '2001-01-25', '420.01'),
(2100084, 'Isabelle', 'Gauthier', 2021, '1999-06-11', '420.02'),
(2100095, 'Julien', 'Charpentier', 2021, '2000-09-14', '420.01'),
(2100106, 'Léa', 'Thomas', 2021, '2002-04-16', '420.02'),
(2200017, 'Camille', 'Blanc', 2022, '2000-06-08', '420.01'),
(2200028, 'Olivier', 'Roux', 2022, '2001-03-17', '420.02'),
(2200039, 'Claire', 'Bernard', 2022, '2001-03-30', '420.01'),
(2200041, 'Louis', 'Davis', 2022, '1999-12-19', '420.02'),
(2200052, 'Marion', 'Legrand', 2022, '2000-07-02', '420.01'),
(2200063, 'Maxime', 'Gosselin', 2022, '2001-01-11', '420.02'),
(2200074, 'Hélène', 'Benoit', 2022, '1998-04-25', '420.01'),
(2200085, 'Victor', 'Girard', 2022, '2001-11-08', '420.02'),
(2200096, 'Lina', 'Lemoine', 2022, '2000-02-13', '420.01'),
(2200107, 'Jean-Pierre', 'Robert', 2022, '2000-12-19', '420.02'),
(2300018, 'Sarah', 'Miller', 2023, '2000-04-03', '420.01'),
(2300029, 'Mélanie', 'Fournier', 2023, '1999-02-11', '420.02'),
(2300031, 'Alice', 'Nicolas', 2023, '2001-03-06', '420.01'),
(2300042, 'Victor', 'Charrier', 2023, '2001-09-08', '420.02'),
(2300053, 'Marianne', 'Noel', 2023, '2002-07-11', '420.01'),
(2300064, 'Étienne', 'Lemoine', 2023, '2000-01-22', '420.02'),
(2300075, 'Caroline', 'Leclerc', 2023, '1999-05-27', '420.01'),
(2300086, 'Nicolas', 'Faure', 2023, '2002-03-15', '420.02'),
(2300097, 'Léon', 'Dupuis', 2023, '2000-10-18', '420.01'),
(2300108, 'Charlotte', 'Durand', 2023, '2001-07-24', '420.02'),
(2300119, 'Alice', 'Lemoine', 2023, '2001-04-06', '420.01'),
(2300121, 'Alexandre', 'Robert', 2023, '2000-06-01', '420.02'),
(2300132, 'Aurélie', 'Blanc', 2023, '2000-11-15', '420.01'),
(2300143, 'Frédéric', 'Dufresne', 2023, '1999-02-25', '420.02'),
(2300154, 'Pierre', 'Roux', 2023, '2002-09-30', '420.01'),
(2300165, 'Juliette', 'Girard', 2023, '2000-03-18', '420.02'),
(2300176, 'Éloïse', 'Gauthier', 2023, '1998-12-17', '420.01'),
(2300187, 'Christophe', 'Charpentier', 2023, '2001-01-03', '420.02'),
(2300198, 'Julien', 'Leclerc', 2023, '1999-06-29', '420.01'),
(2300209, 'Mélanie', 'Bernard', 2023, '2001-05-23', '420.02');


INSERT INTO sessions (session_code, session_saison, date_debut, date_fin) 
VALUES 
('A20', 'automne', '2020-08-16', '2020-12-19'), 
('H21', 'hiver', '2021-01-13', '2021-05-18'), 
('A21', 'automne', '2021-08-17', '2021-12-20'), 
('A22', 'automne', '2022-08-17', '2022-12-15');

INSERT INTO groupes (cours_id, session_code, numero_groupe) VALUES  
(2, 'A20', 1), 
(3, 'A20', 1), 
(4, 'A22', 1), 
(5, 'A22', 1), 
(5, 'A20', 2), 
(1, 'H21', 1),
(1, 'H21', 2), 
(2, 'A21', 1), 
(3, 'A21', 1), 
(4, 'A21', 1), 
(5, 'A21', 1), 
(5, 'A21', 2);


INSERT INTO inscriptions (code_etudiant, groupe_id)
VALUES
(1900015, 1),
(1900026, 2),
(1900037, 3),
(1900048, 4),
(1900059, 5),
(1900061, 6),
(1900072, 7),
(1900083, 8),
(1900094, 9),
(1900105, 10),
(2100016, 11),
(2100027, 12),
(2100038, 1),
(2100049, 2),
(2100051, 3),
(2100062, 4),
(2100073, 5),
(2100084, 6),
(2100095, 7),
(2100106, 8),
(2200017, 9),
(2200028, 10),
(2200039, 11),
(2200041, 12),
(2200052, 1),
(2200063, 2),
(2200074, 3),
(2200085, 4),
(2200096, 5),
(2200107, 6),
(2300018, 7),
(2300029, 8),
(2300031, 9),
(2300042, 10),
(2300053, 11),
(2300064, 12),
(2300075, 1),
(2300086, 2),
(2300097, 3),
(2300108, 4),
(2300119, 5),
(2300121, 6),
(2300132, 7),
(2300143, 8),
(2300154, 9),
(2300165, 10),
(2300176, 11),
(2300187, 12),
(2300198, 1),
(2300209, 2);

INSERT INTO evaluations (groupe_id, nom_evaluation, note_max) 
VALUES 
(2, 'TP', 30), 
(2, 'Examen 1', 30), 
(2, 'Examen 2', 40), 
(3, 'Essai', 25), 
(3, 'Présentation', 25), 
(3, 'Final', 50), 
(6, 'Document Aide', 25), 
(6, 'Cours', 25), 
(6, 'Examen final', 50);

INSERT INTO evaluations_etudiants (evaluation_id, code_etudiant, note, date_remise, nom_document) VALUES 
(1, 1900015, 0, '2025-01-25', 'tp1.docx'),
(2, 1900026, 0, '2025-01-25', 'examen1.docx'),
(3, 1900037, 0, '2025-01-25', 'examen2.docx'),
(4, 1900048, 0, '2025-01-25', 'tp2.docx'),
(5, 1900059, 0, '2025-01-25', 'tp3.docx'),
(6, 1900061, 0, '2025-01-25', 'examen3.docx'),
(7, 1900072, 0, '2025-01-25', 'tp4.docx'),
(8, 1900083, 0, '2025-01-25', 'examen4.docx'),
(9, 1900094, 0, '2025-01-25', 'tp5.docx'),
(1, 1900105, 20.64, '2025-01-25', 'examen5.docx'),
(2, 2100016, 14, '2025-01-25', 'tp6.docx'),
(3, 2100027, 16, '2025-01-25', 'examen6.docx'),
(4, 2100038, 17, '2025-01-25', 'tp7.docx'),
(4, 2100049, 13, '2025-01-25', 'examen7.docx'),
(5, 2100051, 18, '2025-01-25', 'tp8.docx'),
(6, 2100062, 15, '2025-01-25', 'examen8.docx'),
(7, 2100073, 19, '2025-01-25', 'tp9.docx'),
(8, 2100084, 12, '2025-01-25', 'examen9.docx'),
(9, 2100095, 16, '2025-01-25', 'tp10.docx'),
(1, 2100106, 14, '2025-01-25', 'examen10.docx'),
(1, 2200017, 17, '2025-01-25', 'tp11.docx'),
(2, 2200028, 13, '2025-01-25', 'examen11.docx'),
(3, 2200039, 18, '2025-01-25', 'tp12.docx'),
(4, 2200041, 14, '2025-01-25', 'examen12.docx'),
(5, 2200052, 19, '2025-01-25', 'tp13.docx'),
(6, 2200063, 15, '2025-01-25', 'examen13.docx'),
(7, 2200074, 16, '2025-01-25', 'tp14.docx'),
(8, 2200085, 12, '2025-01-25', 'examen14.docx'),
(9, 2200096, 17, '2025-01-25', 'tp15.docx'),
(1, 2200107, 13, '2025-01-25', 'examen15.docx'),
(1, 2300018, 14, '2025-01-25', 'tp16.docx'),
(2, 2300029, 18, '2025-01-25', 'examen16.docx'),
(3, 2300031, 17, '2025-01-25', 'tp17.docx'),
(4, 2300042, 13, '2025-01-25', 'examen17.docx'),
(5, 2300053, 16, '2025-01-25', 'tp18.docx'),
(6, 2300064, 19, '2025-01-25', 'examen18.docx'),
(7, 2300075, 15, '2025-01-25', 'tp19.docx'),
(8, 2300086, 12, '2025-01-25', 'examen19.docx'),
(9, 2300097, 14, '2025-01-25', 'tp20.docx'),
(1, 2300108, 16, '2025-01-25', 'examen20.docx'),
(1, 2300119, 13, '2025-01-25', 'tp21.docx'),
(2, 2300121, 18, '2025-01-25', 'examen21.docx'),
(3, 2300132, 19, '2025-01-25', 'tp22.docx'),
(4, 2300143, 16, '2025-01-25', 'examen22.docx'),
(5, 2300154, 14, '2025-01-25', 'tp23.docx'),
(6, 2300165, 13, '2025-01-25', 'examen23.docx'),
(7, 2300176, 17, '2025-01-25', 'tp24.docx'),
(8, 2300187, 18, '2025-01-25', 'examen24.docx'),
(9, 2300198, 15, '2025-01-25', 'tp25.docx'),
(1, 2300209, 19, '2025-01-25', 'examen25.docx');
 
    
 -- code_etudiant NUMERIC (7) PRIMARY KEY,
  --  nom VARCHAR(255),
   -- prenom VARCHAR(255),
  -- annee_admission YEAR,
   -- date_naissance DATETIME,
   -- code_programme CHAR(6),   
    
    