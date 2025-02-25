<<<<<<< HEAD
DROP DATABASE IF EXISTS tododb;
CREATE DATABASE tododb;

\c tododb;


-- I delete the category table because I think one item only have
-- one category

DROP table IF EXISTS users;
CREATE TABLE users (
  user_id SERIAL NOT NULL PRIMARY KEY,
  user_email TEXT NOT NULL UNIQUE
);

-- one users may have many calendars
DROP table IF EXISTS calendars;
CREATE TABLE calendars (
  calendar_id SERIAL NOT NULL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  calendar_owner VARCHAR(64) NOT NULL,
  CONSTRAINT fk_user
      FOREIGN KEY(user_id)
        REFERENCES users(user_id)
);

--  one calendars may have many todotiems
DROP table IF EXISTS todoitems;
CREATE TABLE todoitems (
  item_id SERIAL NOT NULL PRIMARY KEY,
  calendar_id INTEGER NOT NULL,
  item_title TEXT NULL,
  item_description text NOT NULL,
  item_category VARCHAR(64) NOT NULL,
  item_duration INTERVAL NOT NULL,
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP NOT NULL,
   CONSTRAINT fk_calendar
      FOREIGN KEY(calendar_id)
        REFERENCES calendars(calendar_id)
);


CREATE INDEX ON users (user_id);

CREATE INDEX ON calendars (calendar_id);

CREATE INDEX ON todoitems (item_id);


SELECT setval('users_user_id_seq', max(user_id)) from users;

SELECT setval('calendars_calendar_id_seq', max(calendar_id)) from calendars;

=======
DROP DATABASE IF EXISTS "tododb";
CREATE DATABASE "tododb";

​\c tododb;

DROP table IF EXISTS "users";
CREATE TABLE "users" (
  "user_id" SERIAL NOT NULL PRIMARY KEY,
  "user_email" TEXT NOT NULL UNIQUE
);

DROP table IF EXISTS "categories";
CREATE TABLE "categories" (
  "category_id" SERIAL NOT NULL PRIMARY KEY,
  "user_id" INTEGER NOT NULL,
  "category" TEXT NOT NULL,
  PRIMARY KEY ("category_id"),
  CONSTRAINT fk_user
    FOREIGN KEY("user_id")
      REFERENCES users("user_id")
);

DROP table IF EXISTS "todoitems";
CREATE TABLE "todoitems" (
  "id" SERIAL NOT NULL PRIMARY KEY,
  "title" TEXT NOT NULL,
  "description" TEXT NOT NULL,
  "duration" INTERVAL NOT NULL,
  "start" TIMESTAMP NOT NULL,
  "end" TIMESTAMP NOT NULL,
  "in_calendar" BOOLEAN NOT NULL,
  "category_id" INTEGER NOT NULL,
  CONSTRAINT fk_category
    FOREIGN KEY("category_id")
      REFERENCES categories("category_id")
);


DROP table IF EXISTS "calendars";
CREATE TABLE "calendars" (
  "calendar_id" SERIAL NOT NULL PRIMARY KEY,
  "user_id" INTEGER NOT NULL,
  "calendar_owner" VARCHAR(64) NOT NULL,
  CONSTRAINT fk_user
      FOREIGN KEY("user_id")
        REFERENCES users("user_id")
);

CREATE INDEX ON "users" ("user_id");

CREATE INDEX ON "todoitems" ("id");

CREATE INDEX ON "categories" ("category_id");

SELECT setval('users_user_id_seq', max(user_id)) from users;
​
SELECT setval('calendars_calendar_id_seq', max(calendar_id)) from calendars;
​
>>>>>>> d076cc929d6e084bdcff248f17265ac20234cb75
SELECT setval('todoitems_item_id_seq', max(item_id)) from todoitems;