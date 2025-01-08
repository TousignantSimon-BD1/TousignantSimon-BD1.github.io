# Convention de nommage MySQL

Bien que MySQL n'a pas vraiment de convention de nommage officiel, voici certaines des règles les plus utilisées.

Ces règles sont **obligatoires** dans notre cours.

## Gardez en tête

- MySQL est sensible à la case

## Règles générales

- Pensez approche K.I.S.S.
- Toujours : noms des tables et des colonnes (champs) en **minuscule**. (Approche kiss, même pas besoin de faire "maj" avec le petit doigt.)
- Jamais d'espace, (remplacer par une barre de soulignement "_")
- Jamais de caractères accentués
- Jamais de nombres
- Aucun préfix (Ça complique inutilement le nom et nuit à la visibilité (ex.: etudiants_prenom))

## Nom des tables

- Toujours au pluriel (etudiants, enseignants, etc.)
- Toujours en minuscules (pas de *CamelCase*)
- Ne pas utiliser de préfix sauf si c'est inévitable.
- Le nom doit être clair et explicite
- Jamais d'abréviation

## Nom des champs

- Toujours en minuscule, sans espace et sans nombres
- On doit éviter les préfixes
- Utilisez un nom court, sans utiliser abréviation par contre
- Ne pas utiliser de mot réservé comme nom de champs, exemple "date".

## Clés étrangères

- Doit contenir le nom de la table et de sa clé primaire. Une clé étrangère vers la table usager dont la clé primaire est le champ id devrait être nommée usager_id

## Résumé pour les tables et les champs (colonnes)

- Utiliser seulement les caractères ascii 97 à 122 ("a-z") avec bonus le caractère 95 ("_") 
- Noms cours, complet, mais significatif
- Si c'est une table -> au pluriel
- Aucuns mots réservés à MySQL ( )

##références : 
- Ascii : https://fr.wikipedia.org/wiki/American_Standard_Code_for_Information_Interchange 
- Mots réservés MySQL: https://dev.mysql.com/doc/refman/8.4/en/keywords.html
