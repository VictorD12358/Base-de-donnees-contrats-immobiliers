CREATE TABLE Region (
    Code_dep_code_commune_region VARCHAR(7) NOT NULL,
    reg_code INT NOT NULL,
    reg_nom VARCHAR(50) NOT NULL,
    aca_nom VARCHAR(50) NOT NULL,
    dep_nom VARCHAR(80) NOT NULL,
    com_nom_maj_court VARCHAR(50) NOT NULL,
    cod_dep VARCHAR(6) NOT NULL,
    dep_nom_num VARCHAR(50) NOT NULL,
    PRIMARY KEY (Code_dep_code_commune_region)
);


CREATE TABLE Contrat (
    Contrat_ID INT NOT NULL,
    No_voie INT,
    B_T_Q CHAR(1) DEFAULT 'Z',
    Type_de_voie VARCHAR(10) NOT NULL,
    Voie VARCHAR(50) NOT NULL,
    Code_dep_code_commune VARCHAR(7) NOT NULL,
    Code_postal VARCHAR(5) NOT NULL,
    Surface INT NOT NULL,
    Type_location VARCHAR(15) NOT NULL,
    Occupation VARCHAR(15) NOT NULL,
    Contrat VARCHAR(30) NOT NULL,
    Formule VARCHAR(15) NOT NULL,
    Valeur_declaree_bien VARCHAR(15) NOT NULL,
    Prix_cotisation_mensuel INT NOT NULL,
    PRIMARY KEY (Contrat_ID)
);
