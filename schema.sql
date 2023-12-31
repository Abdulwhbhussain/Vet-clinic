/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;
CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    name VARCHAR(250) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);
/* Pull Request no.2 */
ALTER TABLE animals
ADD species VARCHAR(50);
/* Pull Request no.3 */
CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    full_name VARCHAR(250) NOT NULL,
    age INT NOT NULL
);
CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    name VARCHAR(250) NOT NULL
);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals
ADD species_id INT;
ALTER TABLE animals
ADD owner_id INT;
ALTER TABLE animals
ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals
ADD CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES owners(id);
/* Pull request no. 4 */
CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    name VARCHAR(250) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE
);
CREATE TABLE specializations(
    species_id INT REFERENCES species(id),
    vet_id INT REFERENCES vets(id)
);
CREATE TABLE visits(
    animal_id INT REFERENCES animals(id),
    vet_id INT REFERENCES vets(id),
    visit_date DATE
);
/* Pull request no. 5 */
ALTER TABLE owners
ADD COLUMN email VARCHAR(120);
ALTER TABLE owners
ALTER COLUMN age DROP NOT NULL;
CREATE INDEX idx_animal_id ON visits(animal_id);
CREATE INDEX idx_vet_id ON visits (vet_id);
CREATE INDEX idx_email ON owners(email);