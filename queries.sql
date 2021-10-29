/*Queries that provide answers to the questions from all projects.*/

SELECT *
from animals 
WHERE name like '%mon';

SELECT name
from animals
WHERE dateOfBirth BETWEEN '1/01/2016' AND '1/01/2019';

SELECT name
from animals
WHERE neutered = true
AND escapeAttempts < 3;

SELECT dateOfBirth
from animals
WHERE name = 'Pikachu'
or name = 'Agumon';

SELECT name, escapeAttempts
from animals
WHERE weightKg > 10.5;

SELECT *
from animals 
WHERE neutered = true;

SELECT *
from animals 
WHERE name != 'Gabumon';

SELECT *
from animals
WHERE weightKg >= 10.4
AND weightKg <= 17.3;

BEGIN TRAN

UPDATE animals
SET species = 'unspecified';

SELECT species from animals;
ROLLBACK;

SELECT species from animals;



BEGIN TRAN

UPDATE animals 
SET species =  'digimon'
WHERE name like '%mon';

UPDATE animals
SET species =  'pokemon'
WHERE species IS NULL

COMMIT TRAN

BEGIN TRAN 

DELETE FROM animals
WHERE date_of_birth > '01/01/2022'
SAVEPOINT delete_animals;


UPDATE animals 
SET weight_kg = weight_kg * -1
ROLLBACK TO SAVEPOINT delete_animals;

UPDATE animals 
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

COMMIT TRAN

SELECT count(id) FROM animals;

SELECT COUNT(escape_attempts) FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT AVG(escape_attempts) FROM animals
WHERE neutered = true;

SELECT AVG(escape_attempts) FROM animals
WHERE neutered = false;

SELECT MAX(weight_kg) FROM animals;

SELECT MIN(weight_kg) FROM animal;

SELECT AVG(escape_attempts) FROM animals
WHERE date_of_brith BETWEEN '01/01/1999' AND '01/01/2000';

-- QUERY for animals belonging to Melody Pond
SELECT * FROM animals
LEFT JOIN owners
ON animals.owner_id = owners.id
WHERE full_name = 'Melody Pond';

-- QUERY for list of all animals that are pokemon (their type is Pokemon)
SELECT * FROM animals
LEFT JOIN species
ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

-- QUERY for listing all owners and their animals, including those that don't own any animal.
SELECT
full_name as owner_name,
name as animal_name
FROM owners
LEFT JOIN animals
ON owners.id = animals.owner_id;

-- QUERY for How many animals there are per species.
SELECT species.name, COUNT(*) FROM animals
LEFT JOIN species
ON animals.species_id = species.id
GROUP BY species.name

-- QUERY for listing all Digimon owned by Jennifer Orwell
SELECT animals.* FROM animals
LEFT JOIN owners
ON animals.owner_id = owners.id
LEFT JOIN species
ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell'
AND species.name = 'Digimon';

-- QUERY for listing all animals owned by Dean Winchester that haven't tried to escape
SELECT animals.* FROM animals
LEFT JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester'
AND animals.escapeAttempts = 0;

-- QUERY for owner the most animals
SELECT owners.full_name, COUNT(owners.full_name) FROM animals
LEFT JOIN owners
ON animals.species_id = owners.id
GROUP BY owners.full_name
ORDER BY COUNT(owners.full_name) DESC
