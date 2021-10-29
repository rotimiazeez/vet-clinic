/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id INT NOT NULL,
  name VARCHAR(25),
  dateOfBirth date,
  escapeAttempts INT,
  neutered BOOLEAN,
  weightKg DECIMAL,
  species VARCHAR(40);
);

CREATE TABLE owners (
   id SERIAL,
   full_name varchar(50),
   age int,
   PRIMARY KEY (id)
);

CREATE TABLE species (
   id SERIAL,
   name varchar(30),
   PRIMARY KEY (id)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals ADD species_id int REFERENCES species(id);
ALTER TABLE animals ADD owner_id int REFERENCES owners(id);

   CREATE TABLE vets (
   id SERIAL,
   name varchar(30),
   age int,
   date_of_graduation date,
   PRIMARY KEY (id)
   );

    CREATE TABLE specializations (
   species_id int,
   vet_id int
   );

 CREATE TABLE visits (
   animal_id int,
   vet_id int,
   visitDate date
   );
