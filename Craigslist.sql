-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/FqizaY
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP DATABASE IF EXISTS craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;

CREATE TABLE regions 
(
    id SERIAL PRIMARY KEY,
    city TEXT  NOT NULL
);

CREATE TABLE "users" (
    "id" SERIAL PRIMARY KEY,
    "username" VARCHAR(15) NOT NULL UNIQUE,
    "password" VARCHAR(15) NOT NULL,
    "pref_region" INTEGER NOT NULL REFERENCES regions ON DELETE CASCADE 
);

CREATE TABLE "categories" (
    "id" SERIAL PRIMARY KEY,
    "cat_name" text NOT NULL,
    "cat_info" text NOT NULL
);

CREATE TABLE "posts" (
    "id" SERIAL PRIMARY KEY,
    "post_title" TEXT NOT NULL,
    "post_text" TEXT NOT NULL,
    "user_id" INTEGER REFERENCES users ON DELETE SET NULL,
    "region_id" INTEGER REFERENCES regions ON DELETE SET NULL,
    "cat_id" INTEGER REFERENCES categories ON DELETE SET NULL
);

CREATE INDEX Users_index ON users (username);
CREATE INDEX Categories_index ON categories (cat_name);
CREATE INDEX Posts_index ON posts (post_title);
