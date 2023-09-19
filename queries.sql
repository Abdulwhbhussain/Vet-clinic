/*Queries that provide answers to the questions from all projects.*/
SELECT *
from animals
WHERE name LIKE '%mon';
SELECT name
from animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name
from animals
WHERE neutered = 'true'
  AND escape_attempts < 3;
SELECT date_of_birth
from animals
WHERE name = 'Agumon'
  OR name = 'Pikachu';
SELECT name,
  escape_attempts
from animals
WHERE weight_kg > 10.5;
SELECT *
from animals
WHERE neutered = 'true';
SELECT *
from animals
WHERE name NOT IN ('Gabumon');
SELECT *
from animals
WHERE weight_kg BETWEEN 10.4 and 17.3;
/* Pull Request #2 */
BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT *
FROM animals;
ROLLBACK;
SELECT *
FROM animals;
BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species is NULL;
SELECT *
from animals;
COMMIT;
SELECT *
FROM animals;