/* Populate database with sample data. */

INSERT INTO animals (id, name, dateOfBirth, escapeAttempts, neutered, weightKg)
VALUES (1, 'Agumon', '02/3/2020', 0, true, 10.23);
INSERT INTO animals (id, name, dateOfBirth, escapeAttempts, neutered, weightKg)
VALUES (2, 'Gabumon', '11/15/2018', 2, true, 8);
INSERT INTO animals (id, name, dateOfBirth, escapeAttempts, neutered, weightKg)
VALUES (3, 'Pikachu', '01/7/2012', 1, false, 15.04);
INSERT INTO animals (id, name, dateOfBirth, escapeAttempts, neutered, weightKg)
VALUES (4,'Devimon', '05/12/2017', 5, false, 11);
INSERT INTO animals (id, name, dateOfBirth, escapeAttempts, neutered, weightKg)
VALUES (5,'Charmander', '02/8/2020', 0, false, -11);
INSERT INTO animals (id, name, dateOfBirth, escapeAttempts, neutered, weightKg)
VALUES (6,'Plantmon', '11/15/2022', 2, true, -5.7);
INSERT INTO animals (id, name, dateOfBirth, escapeAttempts, neutered, weightKg)
VALUES (7,'Squirtle', '04/2/2020', 3, false, -12.13);
INSERT INTO animals (id, name, dateOfBirth, escapeAttempts, neutered, weightKg)
VALUES (8,'Angemon', '06/12/2015', 1, true, -45);
INSERT INTO animals (id, name, dateOfBirth, escapeAttempts, neutered, weightKg)
VALUES (9,'Boarmon', '06/7/2005', 7, true, 20.4);
INSERT INTO animals (id, name, dateOfBirth, escapeAttempts, neutered, weightKg)
VALUES (10,'Blossom', '10/13/1998', 3, true, 17);

INSERT INTO owners (full_name, age)
 VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age)
 VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age)
 VALUES ('Bob', 45);
INSERT INTO owners (full_name, age)
 VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age)
 VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age)
 VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name)
 VALUES ('Pokemon');
INSERT INTO species (name)
 VALUES ('Digimon');

UPDATE animals
SET species_id = (SELECT id from species WHERE name = 'Digimon')
WHERE name like '%mon';

UPDATE animals
SET species_id = (SELECT id from species WHERE name = 'Pokemon')
WHERE species_id IS NULL;

UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Jennifer Orwell')
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Bob')
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Melody Pond')
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Dean Winchester')
WHERE name = 'Angemon'  OR name = 'Boarmon';