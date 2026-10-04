ALTER TABLE Contrat
ADD CONSTRAINT region_contrat_fk
FOREIGN KEY (Code_dep_code_commune)
REFERENCES Region (Code_dep_code_commune_region)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
