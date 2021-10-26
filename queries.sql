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
;
