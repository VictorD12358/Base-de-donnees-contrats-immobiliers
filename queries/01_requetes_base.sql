-- Requête 1 : Lister les contrats avec leur surface pour la commune de Caen

SELECT c.Contrat_ID, c.Surface
FROM Contrat c
JOIN Region r
    ON c.Code_dep_code_commune = r.Code_dep_code_commune_region
WHERE r.com_nom_maj_court = 'CAEN';


-- Requête 2 : Lister les contrats et leur formule pour les maisons du département 71

SELECT c.Contrat_ID, c.Formule
FROM Contrat c
JOIN Region r
    ON c.Code_dep_code_commune = r.Code_dep_code_commune_region
WHERE r.cod_dep = '71';


-- Requête 3 : Lister les noms des régions de France

SELECT DISTINCT r.reg_nom
FROM Region r;


-- Requête 4 : Lister les 5 contrats ayant les surfaces les plus élevées

SELECT c.Contrat_ID, c.Surface
FROM Contrat c
ORDER BY c.Surface DESC
LIMIT 5;
