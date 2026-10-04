-- Requête 5 : Prix moyen de la cotisation mensuelle

SELECT AVG(c.Prix_cotisation_mensuel) AS moyenne_cotisation
FROM Contrat c;


-- Requête 6 : Nombre de contrats par catégorie
-- de valeur déclarée des biens

SELECT
    c.Valeur_declaree_bien,
    COUNT(c.Contrat_ID) AS total_contrats
FROM Contrat c
GROUP BY c.Valeur_declaree_bien;


-- Requête 7 : Nombre de contrats par formule
-- dans la région Pays de la Loire

SELECT
    c.Formule,
    COUNT(c.Contrat_ID) AS total_formule
FROM Contrat c
JOIN Region r
    ON c.Code_dep_code_commune = r.Code_dep_code_commune_region
WHERE r.reg_nom = 'Pays de la Loire'
GROUP BY c.Formule;


-- Requête 8 : Contrats du département 71 avec leur formule

SELECT
    c.Contrat_ID,
    c.Formule
FROM Contrat c
JOIN Region r
    ON c.Code_dep_code_commune = r.Code_dep_code_commune_region
WHERE r.cod_dep = '71';


-- Requête 9 : Surface moyenne des contrats à Paris

SELECT AVG(c.Surface) AS surface_moyenne
FROM Contrat c
JOIN Region r
    ON c.Code_dep_code_commune = r.Code_dep_code_commune_region
WHERE r.dep_nom = 'Paris';


-- Requête 10 : Top 10 des départements
-- selon la cotisation mensuelle moyenne

SELECT
    r.cod_dep,
    AVG(c.Prix_cotisation_mensuel) AS moyenne_cotisation
FROM Contrat c
JOIN Region r
    ON c.Code_dep_code_commune = r.Code_dep_code_commune_region
GROUP BY r.cod_dep
ORDER BY moyenne_cotisation DESC
LIMIT 10;


-- Requête 11 : Communes ayant plus de 150 contrats

SELECT
    r.com_nom_maj_court,
    COUNT(c.Contrat_ID) AS nombre_contrat
FROM Contrat c
JOIN Region r
    ON c.Code_dep_code_commune = r.Code_dep_code_commune_region
GROUP BY r.com_nom_maj_court
HAVING COUNT(c.Contrat_ID) > 150
ORDER BY nombre_contrat DESC;


-- Requête 12 : Nombre de contrats par région

SELECT
    r.reg_nom,
    COUNT(c.Contrat_ID) AS nombre_contrat
FROM Contrat c
JOIN Region r
    ON c.Code_dep_code_commune = r.Code_dep_code_commune_region
GROUP BY r.reg_nom
ORDER BY nombre_contrat DESC;
