-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE "galaxies" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "stars" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "stellar_classification (OBAFGKM types)" text,
    "galaxy_id" INTEGER REFERENCES galaxies ON DELETE SET NULL
);

CREATE TABLE "planets" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "orbital_period_years" float,
    "orbital_star_id" INTEGER REFERENCES stars ON DELETE SET NULL ,
    "galaxy_id" INTEGER REFERENCES galaxies ON DELETE SET NULL
);

CREATE TABLE "moons" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "orbital_planet_id" INTEGER REFERENCES planets ON DELETE SET NULL, --this makes no sense conceptually. A moon can't be a moon without an orbital planet? Could swap to ON DELETE CASCADE
    "orbital_period_years" float,
    "galaxy_id" INTEGER REFERENCES galaxies ON DELETE SET NULL
);

CREATE INDEX galaxies_index ON galaxies (name);
CREATE INDEX stars_index ON stars (name);
CREATE INDEX planets_index ON planets (name);
CREATE INDEX moons_index ON moons (name);

--OLD SEED FILE
-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT
-- );

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');