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
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT *
FROM animals;
BEGIN;
DELETE FROM animals
WHERE date_of_birth > DATE '2022-01-01';
SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;
SELECT *
FROM animals;
SELECT COUNT(*)
FROM animals;
SELECT COUNT(*)
FROM animalS
WHERE escape_attempts = 0;
SELECT AVG(weight_kg)
FROM animals;
SELECT neutered,
  AVG(escape_attempts) AS average
FROM animals
GROUP BY neutered
ORDER BY average DESC
LIMIT 1;
SELECT species,
  MIN(weight_kg) AS Minimun,
  MAX(weight_kg) AS Maximum
FROM animals
GROUP BY species;
SELECT species,
  AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
/* Pull Request #3 */
SELECT a.name
from owners AS o
  JOIN animals AS a ON o.id = a.owner_id
WHERE o.full_name = 'Melody Pond';
SELECT a.name
FROM species AS s
  JOIN animals AS a ON s.id = a.species_id
WHERE s.name = 'Pokemon';
SELECT o.full_name,
  a.name
FROM owners AS o
  LEFT JOIN animals AS a ON o.id = a.owner_id
ORDER BY o.full_name,
  a.name;
SELECT s.name,
  COUNT(a.name)
FROM species AS s
  JOIN animals AS a ON s.id = a.species_id
GROUP BY s.name;
SELECT a.name
FROM animals AS a
  JOIN species AS s ON a.species_id = s.id
  JOIN owners AS o ON a.owner_id = o.id
WHERE s.name = 'Digimon'
  AND o.full_name = 'Jennifer Orwell';
SELECT a.name
FROM animals AS a
  JOIN owners AS o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester'
  AND a.escape_attempts = 0;
SELECT o.full_name
FROM owners AS o
  JOIN animals AS a ON o.id = a.owner_id
GROUP BY o.full_name
ORDER BY COUNT(a.name) DESC
LIMIT 1;
/* Pull Request no.4 */