-- SQLite


-- Table Programme
CREATE TABLE Programme (
    id_programme INTEGER PRIMARY KEY AUTOINCREMENT,
    code_programme TEXT UNIQUE NOT NULL,
    nom_programme TEXT NOT NULL,
    niveau TEXT NOT NULL,
    credits_requis INTEGER NOT NULL
);


-- Table AnneeAcademique
CREATE TABLE AnneeAcademique (
    id_annee INTEGER PRIMARY KEY AUTOINCREMENT,
    annee TEXT UNIQUE NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL
);


-- Table Etudiant
CREATE TABLE Etudiant (
    id_etudiant INTEGER PRIMARY KEY AUTOINCREMENT,
    id_programme INTEGER,
    matricule TEXT UNIQUE NOT NULL,
    nom TEXT NOT NULL,
    prenom TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    date_naissance DATE,
    date_inscription DATE NOT NULL,
    FOREIGN KEY (id_programme) REFERENCES Programme(id_programme)
);


-- Table Session
CREATE TABLE Session (
    id_session INTEGER PRIMARY KEY AUTOINCREMENT,
    id_annee INTEGER,
    nom_session TEXT NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    FOREIGN KEY (id_annee) REFERENCES AnneeAcademique(id_annee)
);

-- Table Cours
CREATE TABLE Cours (
    id_cours INTEGER PRIMARY KEY AUTOINCREMENT,
    id_session INTEGER,
    code_cours TEXT UNIQUE NOT NULL,
    nom_cours TEXT NOT NULL,
    credits INTEGER NOT NULL,
    description TEXT,
    FOREIGN KEY (id_session) REFERENCES Session(id_session)
);

-- Table Note
CREATE TABLE Note (
    id_note INTEGER PRIMARY KEY AUTOINCREMENT,
    id_etudiant INTEGER,
    id_cours INTEGER,
    id_session INTEGER,
    note DECIMAL(5,2) NOT NULL,
    date_obtention DATE NOT NULL,
    FOREIGN KEY (id_etudiant) REFERENCES Etudiant(id_etudiant),
    FOREIGN KEY (id_cours) REFERENCES Cours(id_cours),
    FOREIGN KEY (id_session) REFERENCES Session(id_session)
);

-- Table Objectif
CREATE TABLE Objectif (
    id_objectif INTEGER PRIMARY KEY AUTOINCREMENT,
    id_etudiant INTEGER,
    id_cours INTEGER,
    id_session INTEGER,
    id_annee INTEGER,
    description TEXT NOT NULL,
    date_creation DATE NOT NULL,
    date_echeance DATE,
    statut TEXT,
    type_objectif TEXT NOT NULL,
    FOREIGN KEY (id_etudiant) REFERENCES Etudiant(id_etudiant),
    FOREIGN KEY (id_cours) REFERENCES Cours(id_cours),
    FOREIGN KEY (id_session) REFERENCES Session(id_session),
    FOREIGN KEY (id_annee) REFERENCES AnneeAcademique(id_annee)
);

-- Table Evenement
CREATE TABLE Evenement (
    id_evenement INTEGER PRIMARY KEY AUTOINCREMENT,
    id_etudiant INTEGER,
    id_cours INTEGER,
    titre TEXT NOT NULL,
    description TEXT,
    date_debut DATETIME NOT NULL,
    date_fin DATETIME,
    type TEXT,
    FOREIGN KEY (id_etudiant) REFERENCES Etudiant(id_etudiant),
    FOREIGN KEY (id_cours) REFERENCES Cours(id_cours)
);