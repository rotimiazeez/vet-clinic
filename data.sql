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

   INSERT INTO vets (name, age, date_of_graduation)
   VALUES ('William Tatcher', 45, '2000-04-23');

   INSERT INTO vets (name, age, date_of_graduation)
   VALUES ('Maisy Smith', 26, '2019-01-17');

   INSERT INTO vets (name, age, date_of_graduation)
   VALUES ('Stephanie Mendez', 64, '2019-05-17');

   INSERT INTO vets (name, age, date_of_graduation)
   VALUES ('Jack Harknes', 38, '2008-06-08');

 INSERT INTO specializations (species_id, vet_id)
 VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM species WHERE name = 'Pokemon'));

 INSERT INTO specializations (species_id, vet_id)
 VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Pokemon'));

 INSERT INTO specializations (species_id, vet_id)
 VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Digimon'));

 INSERT INTO specializations (species_id, vet_id)
 VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM species WHERE name = 'Digimon'));

INSERT INTO visits (animal_id, vet_id, visitDate)
VALUES ((SELECT animals.id FROM animals WHERE animals.name = 'Agumon'),
(SELECT vets.id FROM vets WHERE vets.name = 'William Tatcher'), '2020-05-24');

 INSERT INTO visits (animal_id, vet_id, visitDate)
 VALUES ((SELECT id FROM animals WHERE name = 'Agumon'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22');
 INSERT INTO visits (animal_id, vet_id, visitDate)
 VALUES ((SELECT id FROM animals WHERE name = 'Gabumon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-02');

 INSERT INTO visits (animal_id, vet_id, visitDate)
 VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-01-05');
A
 INSERT INTO visits (animal_id, vet_id, visitDate)
 VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-03-08');

 INSERT INTO visits (animal_id, vet_id, visitDate)
 VALUES ((SELECT id FROM animals WHERE name = 'Pikachu'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-05-14');

 INSERT INTO visits (animal_id, vet_id, visitDate)
 VALUES ((SELECT id FROM animals WHERE name = 'Devimon'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-04');

 INSERT INTO visits (animal_id, vet_id, visitDate)
 VALUES ((SELECT id FROM animals WHERE name = 'Charmander'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-24');

 INSERT INTO visits (animal_id, vet_id, visitDate)
 VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21');

 INSERT INTO visits (animal_id, vet_id, visitDate)
 VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'),
(SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-08-10');

 INSERT INTO visits (animal_id, vet_id, visitDate)
 VALUES ((SELECT id FROM animals WHERE name = 'Plantmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07');

 INSERT INTO visits (animal_id, vet_id, visitDate)
 VALUES ((SELECT id FROM animals WHERE name = 'Squirtle'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-09-29');

 INSERT INTO visits (animal_id, vet_id, visitDate)
 VALUES ((SELECT id FROM animals WHERE name = 'Angemon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-03');

 INSERT INTO visits (animal_id, vet_id, visitDate)
 VALUES ((SELECT id FROM animals WHERE name = 'Angemon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04');

 INSERT INTO visits (animal_id, vet_id, visitDate)
 VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-01-24');

 INSERT INTO visits (animal_id, vet_id, visitDate)
 VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-05-15');

 INSERT INTO visits (animal_id, vet_id, visitDate)
 VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-02-27');

 INSERT INTO visits (animal_id, vet_id, visitDate)
 VALUES ((SELECT id FROM animals WHERE name = 'Boarmon'),
(SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-08-03');

 INSERT INTO visits (animal_id, vet_id, visitDate)
 VALUES ((SELECT id FROM animals WHERE name = 'Blossom'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-05-24');

 INSERT INTO visits (animal_id, vet_id, visitDate)
 VALUES ((SELECT id FROM animals WHERE name = 'Blossom'),
(SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-01-11');
