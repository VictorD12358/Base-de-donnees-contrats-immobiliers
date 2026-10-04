-- ============================================================
-- ANALYSES MÉTIER
-- Base de données de contrats immobiliers
-- ============================================================


-- 1. Cotisation mensuelle moyenne
-- Résultat : 19,33 €

SELECT AVG(c.Prix_cotisation_mensuel) AS moyenne_cotisation
FROM Contrat c;


-- 2. Surface moyenne des logements assurés à Paris
-- Résultat : 51,77 m²

SELECT AVG(c.Surface) AS surface_moyenne
FROM Contrat c
JOIN Region r
    ON c.Code_dep_code_commune = r.Code_dep_code_commune_region
WHERE r.dep_nom = 'Paris';


-- 3. Top 10 des départements selon la cotisation
-- mensuelle moyenne
-- Paris (75) arrive en première position avec 36,40 €

SELECT
    r.cod_dep,
    AVG(c.Prix_cotisation_mensuel) AS moyenne_cotisation
FROM Contrat c
JOIN Region r
    ON c.Code_dep_code_commune = r.Code_dep_code_commune_region
GROUP BY r.cod_dep
ORDER BY moyenne_cotisation DESC
LIMIT 10;


-- 4. Communes comptant plus de 150 contrats
-- Paris 18 arrive en tête avec 515 contrats

SELECT
    r.com_nom_maj_court,
    COUNT(c.Contrat_ID) AS nombre_contrat
FROM Contrat c
JOIN Region r
    ON c.Code_dep_code_commune = r.Code_dep_code_commune_region
GROUP BY r.com_nom_maj_court
HAVING COUNT(c.Contrat_ID) > 150
ORDER BY nombre_contrat DESC;


-- 5. Répartition des contrats par région
-- L'Île-de-France arrive largement en tête
-- avec 14 177 contrats

SELECT
    r.reg_nom,
    COUNT(c.Contrat_ID) AS nombre_contrat
FROM Contrat c
JOIN Region r
    ON c.Code_dep_code_commune = r.Code_dep_code_commune_region
GROUP BY r.reg_nom
ORDER BY nombre_contrat DESC;
