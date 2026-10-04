# Base-de-donnees-contrats-immobiliers

# Création et utilisation d'une base de données de contrats immobiliers

SQL · Python · Formation

Conception et implémentation d'une base de données relationnelle MySQL à partir de deux fichiers CSV (contrats et régions), puis exploitation par requêtes SQL.

## Contexte

Ce projet a été réalisé dans le cadre de ma formation de Data Analyst chez OpenClassrooms. À partir de deux fichiers CSV hétérogènes, l'un sur des contrats liés à des logements, l'autre sur le découpage géographique (régions, départements, communes), l'objectif était de concevoir une base relationnelle fonctionnelle, de l'alimenter, puis de répondre à des questions métier par des requêtes SQL.

## Démarche

1. **Inspection des données et dictionnaire**
   - Ouverture des CSV sous Excel et repérage des valeurs manquantes (numéro de voie, indicateur B/T/Q, type de voie) et des formats inadaptés
   - Choix des types de données (INT, VARCHAR dimensionné au plus juste, CHAR, ENUM pour les listes à valeurs fixes)
   - Construction du dictionnaire de données (types, tailles, clés, descriptions)

2. **Conception du schéma relationnel**
   - Modélisation sous SQL Power Architect, export du code MySQL via Forward Engineer
   - Relation 1-n : une région/commune peut contenir plusieurs contrats, un contrat n'est rattaché qu'à une seule commune
   - Clé primaire `Code_dep_code_commune` (table Region), clé étrangère dans la table Contrat

3. **Création de la base et import des données**
   - Création des tables en ligne de commande MySQL
   - Échec des imports via le Table Import Wizard (trop lent) et `LOAD DATA INFILE` (encodage et BOM)
   - Solution retenue : script Python (`csv` + `mysql.connector`) avec suppression du BOM et `INSERT ... ON DUPLICATE KEY UPDATE`, import reproductible
   - Résolution des erreurs d'intégrité référentielle : 3 communes de La Réunion absentes de la table Region, identifiées par requête de vérification puis ajoutées
   - Modification de la colonne `Type_de_voie` pour accepter les valeurs NULL (`ALTER TABLE ... MODIFY`)

4. **Exploitation par requêtes SQL**
   - Jointures, filtres, agrégations (`COUNT`, `AVG`), `GROUP BY`, `HAVING`, `ORDER BY`, `LIMIT`

## Résultats

La base finale contient **30 335 contrats** et **38 919 communes**. Exemples d'analyses réalisées :

- Nombre de contrats par région : l'Île-de-France arrive en tête avec 14 177 contrats
- Communes comptant plus de 150 contrats (Paris 18e en tête avec 515)
- Top 10 des départements par cotisation mensuelle moyenne (Paris : environ 36,40 €)
- Cotisation mensuelle moyenne tous contrats confondus : environ 19,33 €
- Surface moyenne des logements assurés à Paris : environ 51,8 m²
- Répartition des contrats par tranche de valeur déclarée du bien
- Répartition des formules (Classique / Intégral) en Pays de la Loire

## Réalisations

![Schéma relationnel](images/schema_contrat_immo.jpeg)
*Schéma relationnel*

**Top 10 des départements avec la cotisation mensuelle moyenne la plus élevée (SQL)**

```sql
SELECT r.cod_dep, AVG(c.Prix_cotisation_mensuel) AS moyenne_cotisation
FROM contrat c
JOIN region r ON c.Code_dep_code_commune = r.Code_dep_code_commune_region
GROUP BY r.cod_dep
ORDER BY moyenne_cotisation DESC
LIMIT 10;
```

![Résultat requête](images/resultat_requete.png)
*Résultat de la requête*

**Import des données avec Python (extrait)**

```python
reader = csv.DictReader(file, delimiter=';')
reader.fieldnames = [f.replace('\ufeff', '') for f in reader.fieldnames]  # suppression du BOM
```

## Stack

`MySQL` `SQL Power Architect` `Python (mysql.connector, csv)` `Excel`

[Voir le projet complet sur GitHub →]()
[Retour à la liste de projets →]()
