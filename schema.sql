/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id INT NOT NULL,
	name VARCHAR(25),
	dateOfBirth date,
	escapeAttempts INT,
	neutered BOOLEAN,
	weightKg DECIMAL
);
