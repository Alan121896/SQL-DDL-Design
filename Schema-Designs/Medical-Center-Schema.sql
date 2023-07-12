-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/IVRqna
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Visit" (
    "ID" int   NOT NULL,
    "doctor_id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    "date" DATE   NOT NULL,
    CONSTRAINT "pk_Visit" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Doctor" (
    "ID" int   NOT NULL,
    "name" text   NOT NULL,
    "specialty" text   NOT NULL,
    CONSTRAINT "pk_Doctor" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Patient" (
    "ID" int   NOT NULL,
    "name" text   NOT NULL,
    "insurance" text   NOT NULL,
    "birthday" DATE   NOT NULL,
    CONSTRAINT "pk_Patient" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Diagnoses" (
    "ID" int   NOT NULL,
    "visit_id" int   NOT NULL,
    "disease_id" int   NOT NULL,
    "notes" text   NOT NULL,
    CONSTRAINT "pk_Diagnoses" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Dieseases" (
    "ID" int   NOT NULL,
    "name" text   NOT NULL,
    "description" text   NOT NULL,
    CONSTRAINT "pk_Dieseases" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Visit" ADD CONSTRAINT "fk_Visit_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "Doctor" ("ID");

ALTER TABLE "Visit" ADD CONSTRAINT "fk_Visit_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patient" ("ID");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_visit_id" FOREIGN KEY("visit_id")
REFERENCES "Visit" ("ID");

ALTER TABLE "Diagnoses" ADD CONSTRAINT "fk_Diagnoses_disease_id" FOREIGN KEY("disease_id")
REFERENCES "Dieseases" ("ID");

