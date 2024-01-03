
DROP DATABASE doctor_db;
CREATE DATABASE doctor_db;
\c doctor_db;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    Speciality TEXT NOT NULL,
);

CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    DOB DATE  NOT NULL,
    insurance TEXT
);


CREATE TABLE visits(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    patient_id INTEGER NOT NULL REFERENCES patients ON DELETE CASCADE
);

CREATE TABLE diseases(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    information TEXT
);

CREATE TABLE diagnoses(
    id SERIAL PRIMARY KEY,
    disease_id INTEGER NOT NULL REFERENCES diseases ON DELETE CASCADE,
    visit_id INTEGER NOT NULL REFERENCES visits ON DELETE CASCADE
    
);

CREATE INDEX doctors_index ON doctors (name);
CREATE INDEX patients_index ON patients (name);
CREATE INDEX diseases_index ON diseases (name);

-- CREATE TABLE "Doctors" (
--     id SERIAL PRIMARY KEY NOT NULL,
--     "name" TEXT  NOT NULL,
--     Speciality text  NOT NULL,
--     CONSTRAINT "pk_Doctors" PRIMARY KEY (
--         "ID"
--      )
-- );

-- CREATE TABLE "Patients" (
--     "ID" int   NOT NULL,
--     "Name" text   NOT NULL,
--     "DOB" date   NOT NULL,
--     "Insurance" string   NOT NULL,
--     CONSTRAINT "pk_Patients" PRIMARY KEY (
--         "ID"
--      )
-- );

-- CREATE TABLE "Visits" (
--     "Visit_ID" int   NOT NULL,
--     "Doctor_ID" int   NOT NULL,
--     "Patient_ID" int   NOT NULL,
--     CONSTRAINT "pk_Visits" PRIMARY KEY (
--         "Visit_ID"
--      )
-- );

-- CREATE TABLE "Diseases" (
--     "ID" int   NOT NULL,
--     "Name" text   NOT NULL,
--     "Information" text   NOT NULL,
--     CONSTRAINT "pk_Diseases" PRIMARY KEY (
--         "ID"
--      )
-- );

-- CREATE TABLE "Diagnoses" (
--     "ID" int   NOT NULL,
--     "Disease_ID" int   NOT NULL,
--     "Visit_ID" int   NOT NULL,
--     CONSTRAINT "pk_Diagnoses" PRIMARY KEY (
--         "ID"
--      )
-- );

-- ALTER TABLE "Doctors" ADD CONSTRAINT "fk_Doctors_ID" FOREIGN KEY("ID")
-- REFERENCES "Visits" ("Doctor_ID");

-- ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_Patient_ID" FOREIGN KEY("Patient_ID")
-- REFERENCES "Patients" ("ID");

-- ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_Disease_ID" FOREIGN KEY("Disease_ID")
-- REFERENCES "Diseases" ("ID");

-- ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_Visit_ID" FOREIGN KEY("Visit_ID")
-- REFERENCES "Visits" ("Visit_ID");
