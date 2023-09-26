CREATE DATABASE patient_clinic;
CREATE TABLE patients(
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  name VARCHAR(250) NOT NULL,
  date_of_birth DATE NOT NULL
);
CREATE TABLE treatments(
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  type VARCHAR(250) NOT NULL,
  name VARCHAR(250) NOT NULL
);
CREATE TABLE medical_histories(
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  admitted_at TIMESTAMP NOT NULL,
  patient_id INT REFERENCES patients(id),
  status VARCHAR(250) NOT NULL
);
CREATE TABLE invoices(
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  total_amount DECIMAL(8, 2) NOT NULL,
  generated_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP NOT NULL,
  medical_history__id INT NOT NULL REFERENCES medical_histories(id)
);
CREATE TABLE invoice_items(
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  unit_price DECIMAL(8, 2) NOT NULL,
  quantity INT NOT NULL,
  total_price DECIMAL(8, 2) NOT NULL,
  invoice_id INT REFERENCES invoices(id),
  treatment_id INT REFERENCES treatments(id)
);
CREATE TABLE treatments_histories(
  history_id INT REFERENCES medical_histories(id),
  treatment_id INT REFERENCES treatments(id)
);
CREATE INDEX idx_animal_id ON visits(animal_id);
CREATE INDEX idx_vet_id ON visits (vet_id);
CREATE INDEX idx_email ON owners(email);