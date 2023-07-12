-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/IVRqna
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Post" (
    "ID" int   NOT NULL,
    "title" text   NOT NULL,
    "text" text   NOT NULL,
    "location" text   NOT NULL,
    "user_id" int   NOT NULL,
    "region_id" int   NOT NULL,
    "category_id" int   NOT NULL,
    CONSTRAINT "pk_Post" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "User" (
    "ID" int   NOT NULL,
    "username" text   NOT NULL,
    "password" text   NOT NULL,
    "preferred_region_id" int   NOT NULL,
    CONSTRAINT "pk_User" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Category" (
    "ID" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Region" (
    "ID" int   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_user_id" FOREIGN KEY("user_id")
REFERENCES "User" ("ID");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_region_id" FOREIGN KEY("region_id")
REFERENCES "Region" ("ID");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_category_id" FOREIGN KEY("category_id")
REFERENCES "Category" ("ID");

