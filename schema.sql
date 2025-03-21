-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

CREATE TABLE "Athletes" (
    "AthleteID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "Name" TEXT NOT NULL,
    "Surname" TEXT NOT NULL,
    "Birth" DATE NOT NULL,
    "Gender" TEXT,
    "WeightClass" TEXT NOT NULL,
    "Experience" TEXT NOT NULL
);

CREATE TABLE "Workouts" (
    "WorkoutID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "AthleteID" INTEGER NOT NULL,
    "Date" DATE NOT NULL,
    "notes" TEXT NOT NULL,
    FOREIGN KEY ("AthleteID") REFERENCES "Athletes" ("AthleteID")
);

CREATE TABLE "Exercises" (
    "ExerciseID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "Name" TEXT NOT NULL,
    "Category" TEXT NOT NULL,
    "Musclegroup" TEXT NOT NULL
);

CREATE TABLE "WorkoutExercises" (
    "WorkoutExerciseID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "WorkoutID" INTEGER NOT NULL,
    "ExerciseID" INTEGER NOT NULL,
    "Sets" NUMERIC NOT NULL,
    "Reps" NUMERIC,
    "Weight" NUMERIC,
    "RPE" NUMERIC NOT NULL,
    FOREIGN KEY ("WorkoutID") REFERENCES "Workouts" ("WorkoutID"),
    FOREIGN KEY ("ExerciseID") REFERENCES "Exercises" ("ExerciseID")
);

CREATE TABLE "Competitions"  (
    "CompetitionID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "Name" TEXT NOT NULL,
    "Date" DATE NOT NULL,
    "Location" TEXT NOT NULL
);

CREATE TABLE "CompetitionResults" (
    "ResultID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "AthleteID" INTEGER NOT NULL,
    "CompetitionID" INTEGER NOT NULL,
    "Squat" NUMERIC NOT NULL,
    "Benchpress" NUMERIC NOT NULL,
    "Deadlift" NUMERIC NOT NULL,
    "Total" NUMERIC NOT NULL,
    "DOTS" NUMERIC NOT NULL,
    "Placement" INTEGER NOT NULL,
    FOREIGN KEY ("AthleteID") REFERENCES "Athletes" ("AthleteID"),
    FOREIGN KEY ("CompetitionID") REFERENCES "Competitions" ("CompetitionID")
);

CREATE INDEX idx_workouts_athleteid ON "Workouts" ("AthleteID");
CREATE INDEX idx_competitionresults_competitionid
             ON "CompetitionResults" ("CompetitionID");
CREATE INDEX idx_athletes_name ON "Athletes" ("Name");
