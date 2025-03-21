CREATE SCHEMA IF NOT EXISTS `lifting`;
USE `lifting`;

CREATE TABLE IF NOT EXISTS `Athletes` (
    `AthleteID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(100) NOT NULL,
    `Surname`VARCHAR(100)NOT NULL,
    `Birth` DATE NOT NULL,
    `Gender` VARCHAR(50) NOT NULL,    
    `WeightClass` VARCHAR(20) NOT NULL,
    `Experience` VARCHAR(100) NOT NULL 
);

CREATE TABLE IF NOT EXISTS `Workouts` (
    `WorkoutID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `AthleteID` INT UNSIGNED NOT NULL,
    `Date` DATE NOT NULL,
    `notes` VARCHAR(255) NOT NULL,
    FOREIGN KEY (`AthleteID`) REFERENCES `Athletes` (`AthleteID`)
);

CREATE TABLE IF NOT EXISTS `Exercises` (
    `ExerciseID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL,
    `Category` VARCHAR(150) NOT NULL,
    `Musclegroup` VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS `WorkoutExercises` (
    `WorkoutExerciseID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `WorkoutID` INT UNSIGNED NOT NULL,
    `ExerciseID` INT UNSIGNED NOT NULL,
    `Sets` TINYINT NOT NULL,
    `Reps` SMALLINT NOT NULL,
    `Weight` DECIMAL(5,1) NOT NULL,
    `RPE` TINYINT NOT NULL,
     FOREIGN KEY (`WorkoutID`) REFERENCES `Workouts` (`WorkoutID`),
     FOREIGN KEY (`ExerciseID`) REFERENCES `Exercises` (`ExerciseID`)
);

CREATE TABLE IF NOT EXISTS `Competitions`  (
    `CompetitionID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(200) NOT NULL,
    `Date` DATE NOT NULL,
    `Location` VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS `CompetitionResults` (
    `ResultID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `AthleteID` INT UNSIGNED NOT NULL,
    `CompetitionID` INT UNSIGNED NOT NULL,
    `Squat` DECIMAL(5,1) NOT NULL,
    `Benchpress` DECIMAL(5,1) NOT NULL,
    `Deadlift` DECIMAL(5,1) NOT NULL,
    `Total` DECIMAL(5,1) NOT NULL,
    `DOTS` DECIMAL(5,1) NOT NULL,
    `Placement` INT NOT NULL,
     FOREIGN KEY (`AthleteID`) REFERENCES `Athletes` (`AthleteID`),
     FOREIGN KEY (`CompetitionID`) REFERENCES `Competitions` (`CompetitionID`)
);

INSERT INTO `Athletes` (`Name`, `Surname`, `Birth`, `Gender`, `WeightClass`, `Experience`)
VALUES
    ('Liam', 'Smith', '1990-01-15', 'M', '93 kg', 'Fortgeschrittener'),
    ('Olivia', 'Johnson', '1992-02-20', 'F', '63 kg', 'Anfänger'),
    ('Noah', 'Williams', '1988-03-10', 'M', '105 kg', 'Profi'),
    ('Emma', 'Jones', '1995-04-25', 'F', '72 kg', 'Fortgeschrittener'),
    ('William', 'Brown', '1985-05-30', 'M', '120 kg', 'Profi'),
    ('Ava', 'Davis', '1993-06-15', 'F', '84 kg', 'Anfänger'),
    ('James', 'Miller', '1991-07-20', 'M', '93 kg', 'Fortgeschrittener'),
    ('Sophia', 'Wilson', '1989-08-05', 'F', '63 kg', 'Profi'),
    ('Benjamin', 'Moore', '1990-09-25', 'M', '105 kg', 'Anfänger'),
    ('Isabella', 'Taylor', '1994-10-30', 'F', '72 kg', 'Fortgeschrittener'),
    ('Lucas', 'Anderson', '1996-11-15', 'M', '120 kg', 'Profi'),
    ('Mia', 'Thomas', '1997-12-20', 'F', '84 kg', 'Anfänger'),
    ('Henry', 'Jackson', '1987-01-10', 'M', '93 kg', 'Fortgeschrittener'),
    ('Amelia', 'White', '1988-02-25', 'F', '63 kg', 'Profi'),
    ('Alexander', 'Harris', '1986-03-30', 'M', '105 kg', 'Anfänger'),
    ('Harper', 'Martin', '1992-04-20', 'F', '72 kg', 'Fortgeschrittener'),
    ('Michael', 'Thompson', '1995-05-15', 'M', '120 kg', 'Profi'),
    ('Evelyn', 'Garcia', '1990-06-10', 'F', '84 kg', 'Anfänger'),
    ('Daniel', 'Martinez', '1989-07-25', 'M', '93 kg', 'Fortgeschrittener'),
    ('Abigail', 'Robinson', '1991-08-30', 'F', '63 kg', 'Profi'),
    ('Matthew', 'Clark', '1987-09-15', 'M', '105 kg', 'Anfänger'),
    ('Ella', 'Rodriguez', '1985-10-25', 'F', '72 kg', 'Fortgeschrittener'),
    ('Joseph', 'Lewis', '1994-11-30', 'M', '120 kg', 'Profi'),
    ('Scarlett', 'Lee', '1986-12-20', 'F', '84 kg', 'Anfänger'),
    ('David', 'Walker', '1992-01-05', 'M', '93 kg', 'Fortgeschrittener'),
    ('Grace', 'Hall', '1993-02-10', 'F', '63 kg', 'Profi'),
    ('Samuel', 'Allen', '1988-03-20', 'M', '105 kg', 'Anfänger'),
    ('Chloe', 'Young', '1991-04-25', 'F', '72 kg', 'Fortgeschrittener'),
    ('Logan', 'Hernandez', '1985-05-30', 'M', '120 kg', 'Profi'),
    ('Victoria', 'King', '1987-06-10', 'F', '84 kg', 'Anfänger'),
    ('Jackson', 'Wright', '1989-07-20', 'M', '93 kg', 'Fortgeschrittener'),
    ('Aria', 'Lopez', '1990-08-30', 'F', '63 kg', 'Profi'),
    ('Sebastian', 'Hill', '1994-09-10', 'M', '105 kg', 'Anfänger'),
    ('Avery', 'Scott', '1992-10-20', 'F', '72 kg', 'Fortgeschrittener'),
    ('Jack', 'Green', '1991-11-30', 'M', '120 kg', 'Profi'),
    ('Sofia', 'Adams', '1988-12-15', 'F', '84 kg', 'Anfänger'),
    ('Owen', 'Baker', '1986-01-25', 'M', '93 kg', 'Fortgeschrittener'),
    ('Riley', 'Nelson', '1989-02-10', 'F', '63 kg', 'Profi'),
    ('Levi', 'Carter', '1990-03-20', 'M', '105 kg', 'Anfänger'),
    ('Lily', 'Mitchell', '1993-04-25', 'F', '72 kg', 'Fortgeschrittener'),
    ('Wyatt', 'Perez', '1987-05-30', 'M', '120 kg', 'Profi'),
    ('Emily', 'Roberts', '1988-06-10', 'F', '84 kg', 'Anfänger'),
    ('Jayden', 'Turner', '1994-07-20', 'M', '93 kg', 'Fortgeschrittener'),
    ('Zoe', 'Phillips', '1995-08-30', 'F', '63 kg', 'Profi'),
    ('Gabriel', 'Campbell', '1986-09-10', 'M', '105 kg', 'Anfänger'),
    ('Penelope', 'Parker', '1991-10-20', 'F', '72 kg', 'Fortgeschrittener'),
    ('Carter', 'Evans', '1988-11-30', 'M', '120 kg', 'Profi'),
    ('Layla', 'Edwards', '1990-12-15', 'F', '84 kg', 'Anfänger'),
    ('Caleb', 'Collins', '1992-01-10', 'M', '93 kg', 'Fortgeschrittener'),
    ('Nora', 'Stewart', '1993-02-15', 'F', '63 kg', 'Profi');


INSERT INTO `Workouts` (`AthleteID`, `Date`, `notes`)
VALUES
    (5, '2024-01-10', 'Intense leg day'),
    (13, '2024-01-11', 'Upper body workout'),
    (22, '2024-01-12', 'Cardio session'),
    (9, '2024-01-13', 'Rest day'),
    (45, '2024-01-14', 'Full body workout'),
    (18, '2024-01-15', 'Strength training'),
    (29, '2024-01-16', 'Endurance training'),
    (2, '2024-01-17', 'Chest and back'),
    (34, '2024-01-18', 'Legs and abs'),
    (10, '2024-01-19', 'High intensity interval training'),
    (48, '2024-01-20', 'Yoga and stretching'),
    (25, '2024-01-21', 'Powerlifting'),
    (37, '2024-01-22', 'Bodyweight exercises'),
    (1, '2024-01-23', 'Swimming session'),
    (20, '2024-01-24', 'Cycling workout'),
    (31, '2024-01-25', 'Running session'),
    (6, '2024-01-26', 'Sprint intervals'),
    (43, '2024-01-27', 'Mobility training'),
    (28, '2024-01-28', 'Hiking'),
    (12, '2024-01-29', 'Strength and conditioning'),
    (40, '2024-01-30', 'Rowing workout'),
    (4, '2024-01-31', 'Plyometrics'),
    (17, '2024-02-01', 'Boxing training'),
    (21, '2024-02-02', 'Martial arts practice'),
    (49, '2024-02-03', 'Resistance band exercises'),
    (8, '2024-02-04', 'Kettlebell workout'),
    (27, '2024-02-05', 'Functional training'),
    (35, '2024-02-06', 'Agility drills'),
    (50, '2024-02-07', 'CrossFit WOD'),
    (3, '2024-02-08', 'Triathlon training'),
    (32, '2024-02-09', 'Balance exercises'),
    (15, '2024-02-10', 'Strength circuit'),
    (7, '2024-02-11', 'Endurance circuit'),
    (38, '2024-02-12', 'Upper body strength'),
    (24, '2024-02-13', 'Lower body strength'),
    (19, '2024-02-14', 'Flexibility session'),
    (44, '2024-02-15', 'Core strength'),
    (14, '2024-02-16', 'Speed training'),
    (33, '2024-02-17', 'Jump rope session'),
    (23, '2024-02-18', 'Rowing endurance'),
    (11, '2024-02-19', 'Swimming endurance'),
    (30, '2024-02-20', 'Cycling endurance'),
    (46, '2024-02-21', 'Running endurance'),
    (41, '2024-02-22', 'Sprint drills'),
    (26, '2024-02-23', 'Heavy lifting'),
    (16, '2024-02-24', 'Moderate lifting'),
    (36, '2024-02-25', 'Light lifting'),
    (47, '2024-02-26', 'Bodyweight circuit'),
    (39, '2024-02-27', 'Cardio circuit'),
    (5, '2024-02-28', 'Strength circuit'),
    (13, '2024-02-29', 'Explosive training'),
    (22, '2024-03-01', 'Functional circuit'),
    (9, '2024-03-02', 'Upper body circuit'),
    (45, '2024-03-03', 'Lower body circuit'),
    (18, '2024-03-04', 'Core circuit'),
    (29, '2024-03-05', 'HIIT circuit'),
    (2, '2024-03-06', 'Flexibility circuit'),
    (34, '2024-03-07', 'Power circuit'),
    (10, '2024-03-08', 'Agility circuit'),
    (48, '2024-03-09', 'Balance circuit'),
    (25, '2024-03-10', 'Endurance circuit'),
    (37, '2024-03-11', 'Speed circuit'),
    (1, '2024-03-12', 'Strength and speed'),
    (20, '2024-03-13', 'Endurance and agility'),
    (31, '2024-03-14', 'Strength and flexibility'),
    (6, '2024-03-15', 'Speed and agility'),
    (43, '2024-03-16', 'Strength and endurance'),
    (28, '2024-03-17', 'Functional strength'),
    (12, '2024-03-18', 'Functional endurance'),
    (40, '2024-03-19', 'Functional flexibility'),
    (4, '2024-03-20', 'Functional speed'),
    (17, '2024-03-21', 'Functional agility'),
    (21, '2024-03-22', 'Power and strength'),
    (49, '2024-03-23', 'Power and endurance'),
    (8, '2024-03-24', 'Power and flexibility'),
    (27, '2024-03-25', 'Power and speed'),
    (35, '2024-03-26', 'Power and agility'),
    (50, '2024-03-27', 'Endurance and speed'),
    (3, '2024-03-28', 'Endurance and power'),
    (32, '2024-03-29', 'Speed and power'),
    (15, '2024-03-30', 'Agility and power'),
    (7, '2024-03-31', 'Flexibility and power'),
    (38, '2024-04-01', 'Strength and power'),
    (24, '2024-04-02', 'Strength and agility'),
    (19, '2024-04-03', 'Strength and speed'),
    (44, '2024-04-04', 'Strength and endurance'),
    (14, '2024-04-05', 'Speed and flexibility'),
    (33, '2024-04-06', 'Speed and endurance'),
    (23, '2024-04-07', 'Agility and flexibility'),
    (11, '2024-04-08', 'Agility and endurance'),
    (30, '2024-04-09', 'Flexibility and endurance'),
    (46, '2024-04-10', 'Strength and speed'),
    (41, '2024-04-11', 'Speed and endurance'),
    (26, '2024-04-12', 'Speed and agility'),
    (16, '2024-04-13', 'Speed and flexibility'),
    (36, '2024-04-14', 'Agility and endurance'),
    (47, '2024-04-15', 'Flexibility and power'),
    (39, '2024-04-16', 'Strength and power'),
    (5, '2024-04-17', 'Speed and power'),
    (13, '2024-04-18', 'Agility and power');


INSERT INTO `Exercises` (`Name`, `Category`, `Musclegroup`)
VALUES
    ('Squat', 'Strength', 'Legs'),
    ('Bench Press', 'Strength', 'Chest'),
    ('Deadlift', 'Strength', 'Back'),
    ('Overhead Press', 'Strength', 'Shoulders'),
    ('Barbell Row', 'Strength', 'Back'),
    ('Pull-Up', 'Strength', 'Back'),
    ('Dip', 'Strength', 'Chest'),
    ('Leg Press', 'Strength', 'Legs'),
    ('Lunge', 'Strength', 'Legs'),
    ('Calf Raise', 'Strength', 'Legs'),
    ('Bicep Curl', 'Strength', 'Arms'),
    ('Tricep Extension', 'Strength', 'Arms'),
    ('Plank', 'Core', 'Abs'),
    ('Crunch', 'Core', 'Abs'),
    ('Russian Twist', 'Core', 'Abs'),
    ('Leg Raise', 'Core', 'Abs'),
    ('Mountain Climber', 'Cardio', 'Full Body'),
    ('Burpee', 'Cardio', 'Full Body'),
    ('Jump Rope', 'Cardio', 'Full Body'),
    ('Running', 'Cardio', 'Full Body'),
    ('Cycling', 'Cardio', 'Legs'),
    ('Swimming', 'Cardio', 'Full Body'),
    ('Box Jump', 'Plyometrics', 'Legs'),
    ('Medicine Ball Slam', 'Plyometrics', 'Full Body'),
    ('Kettlebell Swing', 'Plyometrics', 'Full Body'),
    ('Push-Up', 'Strength', 'Chest'),
    ('Sit-Up', 'Core', 'Abs'),
    ('Side Plank', 'Core', 'Abs'),
    ('Front Raise', 'Strength', 'Shoulders'),
    ('Lateral Raise', 'Strength', 'Shoulders'),
    ('Face Pull', 'Strength', 'Shoulders'),
    ('Chest Fly', 'Strength', 'Chest'),
    ('Incline Bench Press', 'Strength', 'Chest'),
    ('Decline Bench Press', 'Strength', 'Chest'),
    ('Seated Row', 'Strength', 'Back'),
    ('Lat Pulldown', 'Strength', 'Back'),
    ('Good Morning', 'Strength', 'Back'),
    ('Hip Thrust', 'Strength', 'Legs'),
    ('Leg Curl', 'Strength', 'Legs'),
    ('Leg Extension', 'Strength', 'Legs'),
    ('Arnold Press', 'Strength', 'Shoulders'),
    ('Farmers Walk', 'Strength', 'Full Body'),
    ('Pistol Squat', 'Strength', 'Legs'),
    ('Split Squat', 'Strength', 'Legs'),
    ('Romanian Deadlift', 'Strength', 'Legs'),
    ('Hack Squat', 'Strength', 'Legs'),
    ('Chest Press Machine', 'Strength', 'Chest'),
    ('Cable Fly', 'Strength', 'Chest'),
    ('Skull Crusher', 'Strength', 'Arms'),
    ('Hammer Curl', 'Strength', 'Arms');


INSERT INTO `Competitions`(`Name`, `Date`, `Location`)
VALUES
    ('European Powerlifting Championship', '2023-05-14', 'Berlin, Germany'),
    ('World Strongman Summit', '2023-08-22', 'Las Vegas, USA'),
    ('National Bodybuilding Classic', '2023-11-10', 'London, UK'),
    ('International Weightlifting Open', '2022-12-05', 'Paris, France'),
    ('American Strength Challenge', '2022-09-17', 'New York, USA'),
    ('Asian Powerlifting Meet', '2022-06-11', 'Tokyo, Japan'),
    ('Global Fitness Expo', '2021-10-20', 'Sydney, Australia'),
    ('Canadian Powerlifting Championship', '2021-04-15', 'Toronto, Canada'),
    ('UK Bodybuilding Pro Show', '2021-07-30', 'Manchester, UK'),
    ('World Powerlifting Grand Prix', '2021-11-22', 'Dubai, UAE');


INSERT INTO `CompetitionResults` (`AthleteID`, `CompetitionID`, `Squat`, `Benchpress`, `Deadlift`, `Total`, `DOTS`, `Placement`)
VALUES
    -- Competition 1: European Powerlifting Championship
    (5, 1, 180.0, 120.0, 220.0, 520.0, 450.0, 1),
    (23, 1, 170.0, 115.0, 210.0, 495.0, 430.0, 2),
    (8, 1, 160.0, 110.0, 200.0, 470.0, 410.0, 3),
    (32, 1, 150.0, 105.0, 190.0, 445.0, 400.0, 4),
    (47, 1, 140.0, 100.0, 180.0, 420.0, 385.0, 5),

    -- Competition 2: World Strongman Summit
    (15, 2, 210.0, 130.0, 240.0, 580.0, 470.0, 1),
    (37, 2, 200.0, 125.0, 230.0, 555.0, 460.0, 2),
    (3, 2, 190.0, 120.0, 220.0, 530.0, 445.0, 3),
    (26, 2, 180.0, 115.0, 210.0, 505.0, 430.0, 4),
    (12, 2, 170.0, 110.0, 200.0, 480.0, 415.0, 5),

    -- Competition 3: National Bodybuilding Classic
    (41, 3, 150.0, 130.0, 200.0, 480.0, 410.0, 1),
    (8, 3, 140.0, 125.0, 190.0, 455.0, 395.0, 2),
    (21, 3, 130.0, 120.0, 180.0, 430.0, 380.0, 3),
    (33, 3, 120.0, 115.0, 170.0, 405.0, 365.0, 4),
    (14, 3, 110.0, 110.0, 160.0, 380.0, 350.0, 5),

    -- Competition 4: International Weightlifting Open
    (4, 4, 200.0, 140.0, 230.0, 570.0, 460.0, 1),
    (38, 4, 190.0, 135.0, 220.0, 545.0, 445.0, 2),
    (29, 4, 180.0, 130.0, 210.0, 520.0, 430.0, 3),
    (46, 4, 170.0, 125.0, 200.0, 495.0, 415.0, 4),
    (13, 4, 160.0, 120.0, 190.0, 470.0, 400.0, 5),

    -- Competition 5: American Strength Challenge
    (7, 5, 170.0, 120.0, 210.0, 500.0, 420.0, 1),
    (25, 5, 160.0, 115.0, 200.0, 475.0, 405.0, 2),
    (18, 5, 150.0, 110.0, 190.0, 450.0, 390.0, 3),
    (30, 5, 140.0, 105.0, 180.0, 425.0, 375.0, 4),
    (19, 5, 130.0, 100.0, 170.0, 400.0, 360.0, 5),

    -- Competition 6: Asian Powerlifting Meet
    (12, 6, 220.0, 140.0, 250.0, 610.0, 475.0, 1),
    (20, 6, 210.0, 135.0, 240.0, 585.0, 460.0, 2),
    (8, 6, 200.0, 130.0, 230.0, 560.0, 445.0, 3),
    (34, 6, 190.0, 125.0, 220.0, 535.0, 430.0, 4),
    (5, 6, 180.0, 120.0, 210.0, 510.0, 415.0, 5),

    -- Competition 7: Global Fitness Expo
    (27, 7, 180.0, 120.0, 200.0, 500.0, 420.0, 1),
    (44, 7, 170.0, 115.0, 190.0, 475.0, 405.0, 2),
    (22, 7, 160.0, 110.0, 180.0, 450.0, 390.0, 3),
    (35, 7, 150.0, 105.0, 170.0, 425.0, 375.0, 4),
    (40, 7, 140.0, 100.0, 160.0, 400.0, 360.0, 5),

    -- Competition 8: Canadian Powerlifting Championship
    (3, 8, 190.0, 130.0, 220.0, 540.0, 430.0, 1),
    (15, 8, 180.0, 125.0, 210.0, 515.0, 415.0, 2),
    (33, 8, 170.0, 120.0, 200.0, 490.0, 400.0, 3),
    (27, 8, 160.0, 115.0, 190.0, 465.0, 385.0, 4),
    (10, 8, 150.0, 110.0, 180.0, 440.0, 370.0, 5),

    -- Competition 9: UK Bodybuilding Pro Show
    (41, 9, 160.0, 130.0, 200.0, 490.0, 410.0, 1),
    (48, 9, 150.0, 125.0, 190.0, 465.0, 395.0, 2),
    (39, 9, 140.0, 120.0, 180.0, 440.0, 380.0, 3),
    (2, 9, 130.0, 115.0, 170.0, 415.0, 365.0, 4),
    (8, 9, 120.0, 110.0, 160.0, 390.0, 350.0, 5),

    -- Competition 10: World Powerlifting Grand Prix
    (17, 10, 220.0, 140.0, 250.0, 610.0, 470.0, 1),
    (26, 10, 210.0, 135.0, 240.0, 585.0, 455.0, 2),
    (5, 10, 200.0, 130.0, 230.0, 560.0, 440.0, 3),
    (31, 10, 190.0, 125.0, 220.0, 535.0, 425.0, 4),
    (42, 10, 180.0, 120.0, 210.0, 510.0, 410.0, 5);


INSERT INTO `WorkoutExercises` (`WorkoutID`, `ExerciseID`, `Sets`, `Reps`, `Weight`, `RPE`)
VALUES
    -- Workout 1
    (1, 3, 3, 10, 100.0, 8),
    (1, 12, 3, 8, 50.0, 7),
    (1, 24, 4, 12, 70.0, 9),
    (1, 18, 5, 5, 60.0, 7),
    (1, 31, 3, 10, 40.0, 6),

    -- Workout 2
    (2, 15, 4, 10, 80.0, 8),
    (2, 29, 3, 12, 30.0, 6),
    (2, 22, 5, 8, 90.0, 9),
    (2, 38, 3, 15, 25.0, 7),
    (2, 11, 4, 10, 55.0, 8),

    -- Workout 3
    (3, 20, 4, 8, 65.0, 7),
    (3, 10, 3, 12, 35.0, 6),
    (3, 5, 5, 10, 85.0, 9),
    (3, 8, 4, 15, 45.0, 8),
    (3, 14, 3, 10, 50.0, 7),

    -- Workout 4
    (4, 6, 3, 12, 60.0, 8),
    (4, 2, 4, 10, 40.0, 6),
    (4, 28, 5, 8, 95.0, 9),
    (4, 16, 3, 15, 30.0, 7),
    (4, 26, 4, 12, 50.0, 8),

    -- Workout 5
    (5, 4, 3, 10, 75.0, 8),
    (5, 9, 4, 12, 35.0, 6),
    (5, 23, 5, 8, 85.0, 9),
    (5, 7, 3, 15, 25.0, 7),
    (5, 19, 4, 10, 45.0, 8),

    -- Workout 6
    (6, 13, 4, 8, 60.0, 7),
    (6, 25, 3, 12, 40.0, 6),
    (6, 32, 5, 10, 90.0, 9),
    (6, 40, 4, 15, 35.0, 8),
    (6, 21, 3, 10, 55.0, 7),

    -- Workout 7
    (7, 27, 3, 12, 70.0, 8),
    (7, 39, 4, 10, 50.0, 6),
    (7, 37, 5, 8, 100.0, 9),
    (7, 41, 3, 15, 30.0, 7),
    (7, 30, 4, 12, 60.0, 8),

    -- Workout 8
    (8, 1, 3, 10, 80.0, 8),
    (8, 7, 4, 12, 45.0, 6),
    (8, 26, 5, 8, 85.0, 9),
    (8, 17, 3, 15, 35.0, 7),
    (8, 34, 4, 10, 55.0, 8),

    -- Workout 9
    (9, 12, 4, 8, 65.0, 7),
    (9, 18, 3, 12, 30.0, 6),
    (9, 33, 5, 10, 75.0, 9),
    (9, 8, 4, 15, 45.0, 8),
    (9, 5, 3, 10, 50.0, 7),

    -- Workout 10
    (10, 16, 3, 12, 70.0, 8),
    (10, 22, 4, 10, 55.0, 6),
    (10, 14, 5, 8, 95.0, 9),
    (10, 39, 3, 15, 35.0, 7),
    (10, 24, 4, 12, 50.0, 8),

    -- Workout 11
    (11, 20, 3, 10, 75.0, 8),
    (11, 21, 4, 12, 45.0, 6),
    (11, 29, 5, 8, 85.0, 9),
    (11, 3, 3, 15, 25.0, 7),
    (11, 5, 4, 10, 55.0, 8),

    -- Workout 12
    (12, 12, 4, 8, 65.0, 7),
    (12, 38, 3, 12, 40.0, 6),
    (12, 27, 5, 10, 90.0, 9),
    (12, 1, 4, 15, 30.0, 8),
    (12, 32, 3, 10, 50.0, 7),

    -- Workout 13
    (13, 19, 3, 12, 60.0, 8),
    (13, 4, 4, 10, 35.0, 6),
    (13, 8, 5, 8, 95.0, 9),
    (13, 10, 3, 15, 25.0, 7),
    (13, 14, 4, 12, 55.0, 8),

    -- Workout 14
    (14, 5, 3, 10, 70.0, 8),
    (14, 25, 4, 12, 50.0, 6),
    (14, 21, 5, 8, 80.0, 9),
    (14, 9, 3, 15, 40.0, 7),
    (14, 11, 4, 10, 45.0, 8),

    -- Workout 15
    (15, 7, 4, 8, 65.0, 7),
    (15, 23, 3, 12, 35.0, 6),
    (15, 32, 5, 10, 85.0, 9),
    (15, 19, 4, 15, 45.0, 8),
    (15, 29, 3, 10, 55.0, 7),

    -- Workout 16
    (16, 10, 3, 12, 75.0, 8),
    (16, 33, 4, 10, 50.0, 6),
    (16, 26, 5, 8, 95.0, 9),
    (16, 8, 3, 15, 30.0, 7),
    (16, 24, 4, 12, 45.0, 8),

    -- Workout 17
    (17, 14, 3, 10, 80.0, 8),
    (17, 5, 4, 12, 40.0, 6),
    (17, 12, 5, 8, 85.0, 9),
    (17, 39, 3, 15, 25.0, 7),
    (17, 6, 4, 10, 60.0, 8),

    -- Workout 18
    (18, 28, 4, 8, 70.0, 7),
    (18, 15, 3, 12, 35.0, 6),
    (18, 29, 5, 10, 90.0, 9),
    (18, 13, 4, 15, 45.0, 8),
    (18, 21, 3, 10, 55.0, 7),

    -- Workout 19
    (19, 37, 3, 12, 75.0, 8),
    (19, 11, 4, 10, 50.0, 6),
    (19, 16, 5, 8, 95.0, 9),
    (19, 22, 3, 15, 30.0, 7),
    (19, 35, 4, 12, 60.0, 8),

    -- Workout 20
    (20, 8, 3, 10, 80.0, 8),
    (20, 12, 4, 12, 40.0, 6),
    (20, 27, 5, 8, 85.0, 9),
    (20, 19, 3, 15, 25.0, 7),
    (20, 33, 4, 10, 55.0, 8),
    
    -- Workout 21
    (21, 11, 3, 12, 70.0, 8),
    (21, 17, 4, 10, 45.0, 6),
    (21, 24, 5, 8, 85.0, 9),
    (21, 5, 3, 15, 30.0, 7),
    (21, 22, 4, 12, 60.0, 8),

    -- Workout 22
    (22, 12, 3, 10, 75.0, 8),
    (22, 6, 4, 12, 50.0, 6),
    (22, 20, 5, 8, 90.0, 9),
    (22, 39, 3, 15, 35.0, 7),
    (22, 1, 4, 10, 55.0, 8),

    -- Workout 23
    (23, 25, 3, 12, 80.0, 8),
    (23, 32, 4, 10, 55.0, 6),
    (23, 15, 5, 8, 85.0, 9),
    (23, 9, 3, 15, 40.0, 7),
    (23, 7, 4, 12, 45.0, 8),

    -- Workout 24
    (24, 16, 3, 10, 85.0, 8),
    (24, 18, 4, 12, 40.0, 6),
    (24, 27, 5, 8, 90.0, 9),
    (24, 11, 3, 15, 30.0, 7),
    (24, 13, 4, 10, 60.0, 8),

    -- Workout 25
    (25, 22, 3, 12, 75.0, 8),
    (25, 14, 4, 10, 50.0, 6),
    (25, 8, 5, 8, 80.0, 9),
    (25, 5, 3, 15, 35.0, 7),
    (25, 30, 4, 12, 55.0, 8),

    -- Workout 26
    (26, 19, 3, 10, 70.0, 8),
    (26, 24, 4, 12, 45.0, 6),
    (26, 32, 5, 8, 85.0, 9),
    (26, 28, 3, 15, 40.0, 7),
    (26, 9, 4, 10, 60.0, 8),

    -- Workout 27
    (27, 5, 3, 12, 80.0, 8),
    (27, 7, 4, 10, 50.0, 6),
    (27, 12, 5, 8, 90.0, 9),
    (27, 14, 3, 15, 35.0, 7),
    (27, 17, 4, 12, 55.0, 8),

    -- Workout 28
    (28, 26, 3, 10, 75.0, 8),
    (28, 33, 4, 12, 40.0, 6),
    (28, 21, 5, 8, 85.0, 9),
    (28, 19, 3, 15, 30.0, 7),
    (28, 22, 4, 10, 60.0, 8),

    -- Workout 29
    (29, 31, 3, 12, 80.0, 8),
    (29, 9, 4, 10, 55.0, 6),
    (29, 12, 5, 8, 90.0, 9),
    (29, 27, 3, 15, 35.0, 7),
    (29, 8, 4, 12, 65.0, 8),

    -- Workout 30
    (30, 13, 3, 10, 70.0, 8),
    (30, 18, 4, 12, 45.0, 6),
    (30, 5, 5, 8, 85.0, 9),
    (30, 39, 3, 15, 25.0, 7),
    (30, 24, 4, 10, 60.0, 8),
    
    -- Workout 31
    (31, 2, 3, 10, 75.0, 8),
    (31, 3, 4, 12, 50.0, 6),
    (31, 5, 5, 8, 85.0, 9),
    (31, 8, 3, 15, 35.0, 7),
    (31, 11, 4, 10, 60.0, 8),

    -- Workout 32
    (32, 15, 3, 12, 80.0, 8),
    (32, 17, 4, 10, 55.0, 6),
    (32, 20, 5, 8, 90.0, 9),
    (32, 22, 3, 15, 40.0, 7),
    (32, 25, 4, 12, 65.0, 8),

    -- Workout 33
    (33, 6, 3, 10, 70.0, 8),
    (33, 9, 4, 12, 45.0, 6),
    (33, 12, 5, 8, 85.0, 9),
    (33, 14, 3, 15, 35.0, 7),
    (33, 16, 4, 10, 60.0, 8),

    -- Workout 34
    (34, 18, 3, 10, 75.0, 8),
    (34, 21, 4, 12, 50.0, 6),
    (34, 24, 5, 8, 90.0, 9),
    (34, 27, 3, 15, 40.0, 7),
    (34, 30, 4, 12, 55.0, 8),

    -- Workout 35
    (35, 4, 3, 10, 80.0, 8),
    (35, 7, 4, 12, 55.0, 6),
    (35, 10, 5, 8, 85.0, 9),
    (35, 13, 3, 15, 45.0, 7),
    (35, 19, 4, 10, 60.0, 8),

    -- Workout 36
    (36, 12, 3, 10, 75.0, 8),
    (36, 16, 4, 12, 50.0, 6),
    (36, 20, 5, 8, 90.0, 9),
    (36, 22, 3, 15, 35.0, 7),
    (36, 24, 4, 12, 60.0, 8),

    -- Workout 37
    (37, 3, 3, 12, 80.0, 8),
    (37, 6, 4, 10, 55.0, 6),
    (37, 9, 5, 8, 85.0, 9),
    (37, 12, 3, 15, 40.0, 7),
    (37, 18, 4, 12, 65.0, 8),

    -- Workout 38
    (38, 7, 3, 10, 75.0, 8),
    (38, 11, 4, 12, 50.0, 6),
    (38, 14, 5, 8, 90.0, 9),
    (38, 17, 3, 15, 35.0, 7),
    (38, 21, 4, 10, 60.0, 8),

    -- Workout 39
    (39, 5, 3, 10, 80.0, 8),
    (39, 8, 4, 12, 55.0, 6),
    (39, 12, 5, 8, 85.0, 9),
    (39, 15, 3, 15, 45.0, 7),
    (39, 19, 4, 12, 60.0, 8),

    -- Workout 40
    (40, 10, 3, 10, 75.0, 8),
    (40, 13, 4, 12, 50.0, 6),
    (40, 16, 5, 8, 90.0, 9),
    (40, 19, 3, 15, 35.0, 7),
    (40, 22, 4, 12, 55.0, 8),

    -- Workout 41
    (41, 2, 3, 10, 70.0, 8),
    (41, 5, 4, 12, 45.0, 6),
    (41, 8, 5, 8, 85.0, 9),
    (41, 11, 3, 15, 30.0, 7),
    (41, 14, 4, 10, 60.0, 8),

    -- Workout 42
    (42, 17, 3, 12, 75.0, 8),
    (42, 20, 4, 10, 50.0, 6),
    (42, 23, 5, 8, 90.0, 9),
    (42, 26, 3, 15, 35.0, 7),
    (42, 29, 4, 12, 60.0, 8),

    -- Workout 43
    (43, 6, 3, 10, 80.0, 8),
    (43, 9, 4, 12, 55.0, 6),
    (43, 12, 5, 8, 85.0, 9),
    (43, 15, 3, 15, 45.0, 7),
    (43, 18, 4, 12, 65.0, 8),

    -- Workout 44
    (44, 25, 3, 10, 75.0, 8),
    (44, 28, 4, 12, 50.0, 6),
    (44, 31, 5, 8, 90.0, 9),
    (44, 34, 3, 15, 40.0, 7),
    (44, 37, 4, 12, 55.0, 8),

    -- Workout 45
    (45, 3, 3, 10, 80.0, 8),
    (45, 6, 4, 12, 55.0, 6),
    (45, 9, 5, 8, 85.0, 9),
    (45, 12, 3, 15, 35.0, 7),
    (45, 15, 4, 12, 60.0, 8),

    -- Workout 46
    (46, 17, 3, 10, 70.0, 8),
    (46, 20, 4, 12, 50.0, 6),
    (46, 23, 5, 8, 90.0, 9),
    (46, 26, 3, 15, 40.0, 7),
    (46, 29, 4, 12, 55.0, 8),

    -- Workout 47
    (47, 12, 3, 10, 75.0, 8),
    (47, 15, 4, 12, 55.0, 6),
    (47, 18, 5, 8, 85.0, 9),
    (47, 21, 3, 15, 30.0, 7),
    (47, 24, 4, 12, 60.0, 8),

    -- Workout 48
    (48, 8, 3, 10, 80.0, 8),
    (48, 11, 4, 12, 50.0, 6),
    (48, 14, 5, 8, 90.0, 9),
    (48, 17, 3, 15, 35.0, 7),
    (48, 20, 4, 12, 55.0, 8),

    -- Workout 49
    (49, 25, 3, 10, 70.0, 8),
    (49, 28, 4, 12, 45.0, 6),
    (49, 31, 5, 8, 85.0, 9),
    (49, 34, 3, 15, 40.0, 7),
    (49, 37, 4, 12, 60.0, 8),

    -- Workout 50
    (50, 3, 3, 10, 75.0, 8),
    (50, 6, 4, 12, 50.0, 6),
    (50, 9, 5, 8, 85.0, 9),
    (50, 12, 3, 15, 35.0, 7),
    (50, 15, 4, 12, 60.0, 8),

    -- Workout 51
    (51, 7, 3, 10, 80.0, 8),
    (51, 10, 4, 12, 55.0, 6),
    (51, 13, 5, 8, 90.0, 9),
    (51, 16, 3, 15, 40.0, 7),
    (51, 19, 4, 12, 65.0, 8),

    -- Workout 52
    (52, 8, 3, 10, 75.0, 8),
    (52, 11, 4, 12, 50.0, 6),
    (52, 14, 5, 8, 85.0, 9),
    (52, 17, 3, 15, 35.0, 7),
    (52, 20, 4, 12, 60.0, 8),

    -- Workout 53
    (53, 1, 3, 10, 70.0, 8),
    (53, 4, 4, 12, 55.0, 6),
    (53, 7, 5, 8, 85.0, 9),
    (53, 10, 3, 15, 40.0, 7),
    (53, 13, 4, 12, 65.0, 8),

    -- Workout 54
    (54, 2, 3, 10, 80.0, 8),
    (54, 5, 4, 12, 45.0, 6),
    (54, 8, 5, 8, 90.0, 9),
    (54, 11, 3, 15, 35.0, 7),
    (54, 14, 4, 12, 60.0, 8),

    -- Workout 55
    (55, 17, 3, 10, 75.0, 8),
    (55, 20, 4, 12, 50.0, 6),
    (55, 23, 5, 8, 85.0, 9),
    (55, 26, 3, 15, 30.0, 7),
    (55, 29, 4, 12, 60.0, 8),

    -- Workout 56
    (56, 6, 3, 10, 80.0, 8),
    (56, 9, 4, 12, 55.0, 6),
    (56, 12, 5, 8, 90.0, 9),
    (56, 15, 3, 15, 35.0, 7),
    (56, 18, 4, 12, 60.0, 8),

    -- Workout 57
    (57, 25, 3, 10, 75.0, 8),
    (57, 28, 4, 12, 50.0, 6),
    (57, 31, 5, 8, 85.0, 9),
    (57, 34, 3, 15, 40.0, 7),
    (57, 37, 4, 12, 60.0, 8),

    -- Workout 58
    (58, 1, 3, 10, 70.0, 8),
    (58, 4, 4, 12, 55.0, 6),
    (58, 7, 5, 8, 85.0, 9),
    (58, 10, 3, 15, 35.0, 7),
    (58, 13, 4, 12, 60.0, 8),

    -- Workout 59
    (59, 8, 3, 10, 75.0, 8),
    (59, 11, 4, 12, 50.0, 6),
    (59, 14, 5, 8, 85.0, 9),
    (59, 17, 3, 15, 40.0, 7),
    (59, 20, 4, 12, 60.0, 8),

    -- Workout 60
    (60, 6, 3, 10, 80.0, 8),
    (60, 9, 4, 12, 55.0, 6),
    (60, 12, 5, 8, 90.0, 9),
    (60, 15, 3, 15, 35.0, 7),
    (60, 18, 4, 12, 60.0, 8),
    
    -- Workout 61
    (61, 11, 3, 10, 70.0, 8),
    (61, 14, 4, 12, 50.0, 6),
    (61, 17, 5, 8, 85.0, 9),
    (61, 20, 3, 15, 40.0, 7),
    (61, 23, 4, 12, 55.0, 8),

    -- Workout 62
    (62, 8, 3, 10, 75.0, 8),
    (62, 12, 4, 12, 55.0, 6),
    (62, 16, 5, 8, 90.0, 9),
    (62, 19, 3, 15, 35.0, 7),
    (62, 22, 4, 12, 60.0, 8),

    -- Workout 63
    (63, 1, 3, 10, 80.0, 8),
    (63, 4, 4, 12, 50.0, 6),
    (63, 7, 5, 8, 85.0, 9),
    (63, 10, 3, 15, 30.0, 7),
    (63, 13, 4, 12, 65.0, 8),

    -- Workout 64
    (64, 5, 3, 10, 75.0, 8),
    (64, 9, 4, 12, 55.0, 6),
    (64, 12, 5, 8, 90.0, 9),
    (64, 15, 3, 15, 35.0, 7),
    (64, 18, 4, 12, 60.0, 8),

    -- Workout 65
    (65, 7, 3, 10, 80.0, 8),
    (65, 10, 4, 12, 50.0, 6),
    (65, 13, 5, 8, 85.0, 9),
    (65, 16, 3, 15, 40.0, 7),
    (65, 19, 4, 12, 55.0, 8),

    -- Workout 66
    (66, 6, 3, 10, 70.0, 8),
    (66, 9, 4, 12, 45.0, 6),
    (66, 12, 5, 8, 85.0, 9),
    (66, 15, 3, 15, 30.0, 7),
    (66, 18, 4, 12, 60.0, 8),

    -- Workout 67
    (67, 2, 3, 10, 75.0, 8),
    (67, 5, 4, 12, 50.0, 6),
    (67, 8, 5, 8, 90.0, 9),
    (67, 11, 3, 15, 40.0, 7),
    (67, 14, 4, 12, 65.0, 8),

    -- Workout 68
    (68, 17, 3, 10, 80.0, 8),
    (68, 20, 4, 12, 55.0, 6),
    (68, 23, 5, 8, 85.0, 9),
    (68, 26, 3, 15, 35.0, 7),
    (68, 29, 4, 12, 60.0, 8),

    -- Workout 69
    (69, 3, 3, 10, 70.0, 8),
    (69, 6, 4, 12, 50.0, 6),
    (69, 9, 5, 8, 85.0, 9),
    (69, 12, 3, 15, 40.0, 7),
    (69, 15, 4, 12, 55.0, 8),

    -- Workout 70
    (70, 8, 3, 10, 75.0, 8),
    (70, 11, 4, 12, 50.0, 6),
    (70, 14, 5, 8, 90.0, 9),
    (70, 17, 3, 15, 35.0, 7),
    (70, 20, 4, 12, 60.0, 8),

    -- Workout 71
    (71, 25, 3, 10, 80.0, 8),
    (71, 28, 4, 12, 55.0, 6),
    (71, 31, 5, 8, 85.0, 9),
    (71, 34, 3, 15, 45.0, 7),
    (71, 37, 4, 12, 60.0, 8),

    -- Workout 72
    (72, 12, 3, 10, 70.0, 8),
    (72, 15, 4, 12, 55.0, 6),
    (72, 18, 5, 8, 90.0, 9),
    (72, 21, 3, 15, 35.0, 7),
    (72, 24, 4, 12, 60.0, 8),

    -- Workout 73
    (73, 1, 3, 10, 75.0, 8),
    (73, 4, 4, 12, 50.0, 6),
    (73, 7, 5, 8, 85.0, 9),
    (73, 10, 3, 15, 30.0, 7),
    (73, 13, 4, 12, 65.0, 8),

    -- Workout 74
    (74, 5, 3, 10, 80.0, 8),
    (74, 8, 4, 12, 55.0, 6),
    (74, 11, 5, 8, 90.0, 9),
    (74, 14, 3, 15, 40.0, 7),
    (74, 17, 4, 12, 55.0, 8),

    -- Workout 75
    (75, 6, 3, 10, 70.0, 8),
    (75, 9, 4, 12, 50.0, 6),
    (75, 12, 5, 8, 85.0, 9),
    (75, 15, 3, 15, 35.0, 7),
    (75, 18, 4, 12, 60.0, 8),

    -- Workout 76
    (76, 25, 3, 10, 80.0, 8),
    (76, 28, 4, 12, 55.0, 6),
    (76, 31, 5, 8, 90.0, 9),
    (76, 34, 3, 15, 45.0, 7),
    (76, 37, 4, 12, 60.0, 8),

    -- Workout 77
    (77, 2, 3, 10, 75.0, 8),
    (77, 5, 4, 12, 50.0, 6),
    (77, 8, 5, 8, 85.0, 9),
    (77, 11, 3, 15, 35.0, 7),
    (77, 14, 4, 12, 60.0, 8),

    -- Workout 78
    (78, 3, 3, 10, 80.0, 8),
    (78, 6, 4, 12, 55.0, 6),
    (78, 9, 5, 8, 90.0, 9),
    (78, 12, 3, 15, 40.0, 7),
    (78, 15, 4, 12, 65.0, 8),

    -- Workout 79
    (79, 17, 3, 10, 75.0, 8),
    (79, 20, 4, 12, 50.0, 6),
    (79, 23, 5, 8, 85.0, 9),
    (79, 26, 3, 15, 35.0, 7),
    (79, 29, 4, 12, 60.0, 8),

    -- Workout 80
    (80, 8, 3, 10, 70.0, 8),
    (80, 11, 4, 12, 55.0, 6),
    (80, 14, 5, 8, 90.0, 9),
    (80, 17, 3, 15, 30.0, 7),
    (80, 20, 4, 12, 60.0, 8),

    -- Workout 81
    (81, 5, 3, 10, 75.0, 8),
    (81, 8, 4, 12, 50.0, 6),
    (81, 11, 5, 8, 85.0, 9),
    (81, 14, 3, 15, 40.0, 7),
    (81, 17, 4, 12, 60.0, 8),

    -- Workout 82
    (82, 6, 3, 10, 80.0, 8),
    (82, 9, 4, 12, 55.0, 6),
    (82, 12, 5, 8, 90.0, 9),
    (82, 15, 3, 15, 35.0, 7),
    (82, 18, 4, 12, 60.0, 8),

    -- Workout 83
    (83, 25, 3, 10, 75.0, 8),
    (83, 28, 4, 12, 50.0, 6),
    (83, 31, 5, 8, 85.0, 9),
    (83, 34, 3, 15, 35.0, 7),
    (83, 37, 4, 12, 60.0, 8),

    -- Workout 84
    (84, 1, 3, 10, 80.0, 8),
    (84, 4, 4, 12, 55.0, 6),
    (84, 7, 5, 8, 90.0, 9),
    (84, 10, 3, 15, 40.0, 7),
    (84, 13, 4, 12, 65.0, 8),

    -- Workout 85
    (85, 5, 3, 10, 70.0, 8),
    (85, 8, 4, 12, 50.0, 6),
    (85, 11, 5, 8, 85.0, 9),
    (85, 14, 3, 15, 30.0, 7),
    (85, 17, 4, 12, 60.0, 8),

    -- Workout 86
    (86, 6, 3, 10, 75.0, 8),
    (86, 9, 4, 12, 55.0, 6),
    (86, 12, 5, 8, 90.0, 9),
    (86, 15, 3, 15, 35.0, 7),
    (86, 18, 4, 12, 60.0, 8),

    -- Workout 87
    (87, 25, 3, 10, 80.0, 8),
    (87, 28, 4, 12, 55.0, 6),
    (87, 31, 5, 8, 85.0, 9),
    (87, 34, 3, 15, 45.0, 7),
    (87, 37, 4, 12, 60.0, 8),

    -- Workout 88
    (88, 2, 3, 10, 75.0, 8),
    (88, 5, 4, 12, 50.0, 6),
    (88, 8, 5, 8, 90.0, 9),
    (88, 11, 3, 15, 35.0, 7),
    (88, 14, 4, 12, 60.0, 8),

    -- Workout 89
    (89, 3, 3, 10, 80.0, 8),
    (89, 6, 4, 12, 55.0, 6),
    (89, 9, 5, 8, 90.0, 9),
    (89, 12, 3, 15, 40.0, 7),
    (89, 15, 4, 12, 65.0, 8),

    -- Workout 90
    (90, 17, 3, 10, 75.0, 8),
    (90, 20, 4, 12, 50.0, 6),
    (90, 23, 5, 8, 85.0, 9),
    (90, 26, 3, 15, 30.0, 7),
    (90, 29, 4, 12, 60.0, 8),
    
    -- Workout 91
     (91, 4, 3, 10, 80.0, 8),
    (91, 7, 4, 12, 55.0, 6),
    (91, 10, 5, 8, 90.0, 9),
    (91, 13, 3, 15, 35.0, 7),
    (91, 16, 4, 12, 60.0, 8),

    -- Workout 92
    (92, 5, 3, 10, 75.0, 8),
    (92, 8, 4, 12, 50.0, 6),
    (92, 11, 5, 8, 85.0, 9),
    (92, 14, 3, 15, 40.0, 7),
    (92, 17, 4, 12, 55.0, 8),

    -- Workout 93
    (93, 20, 3, 10, 70.0, 8),
    (93, 23, 4, 12, 55.0, 6),
    (93, 26, 5, 8, 90.0, 9),
    (93, 29, 3, 15, 30.0, 7),
    (93, 32, 4, 12, 60.0, 8),

    -- Workout 94
    (94, 1, 3, 10, 75.0, 8),
    (94, 4, 4, 12, 50.0, 6),
    (94, 7, 5, 8, 85.0, 9),
    (94, 10, 3, 15, 35.0, 7),
    (94, 13, 4, 12, 65.0, 8),

    -- Workout 95
    (95, 2, 3, 10, 80.0, 8),
    (95, 5, 4, 12, 55.0, 6),
    (95, 8, 5, 8, 90.0, 9),
    (95, 11, 3, 15, 40.0, 7),
    (95, 14, 4, 12, 60.0, 8),

    -- Workout 96
    (96, 3, 3, 10, 70.0, 8),
    (96, 6, 4, 12, 50.0, 6),
    (96, 9, 5, 8, 85.0, 9),
    (96, 12, 3, 15, 35.0, 7),
    (96, 15, 4, 12, 60.0, 8),

    -- Workout 97
    (97, 4, 3, 10, 75.0, 8),
    (97, 7, 4, 12, 55.0, 6),
    (97, 10, 5, 8, 90.0, 9),
    (97, 13, 3, 15, 30.0, 7),
    (97, 16, 4, 12, 65.0, 8),

    -- Workout 98
    (98, 5, 3, 10, 80.0, 8),
    (98, 8, 4, 12, 50.0, 6),
    (98, 11, 5, 8, 85.0, 9),
    (98, 14, 3, 15, 40.0, 7),
    (98, 17, 4, 12, 60.0, 8),

    -- Workout 99
    (99, 6, 3, 10, 75.0, 8),
    (99, 9, 4, 12, 55.0, 6),
    (99, 12, 5, 8, 90.0, 9),
    (99, 15, 3, 15, 35.0, 7),
    (99, 18, 4, 12, 60.0, 8),

    -- Workout 100
    (100, 25, 3, 10, 80.0, 8),
    (100, 28, 4, 12, 55.0, 6),
    (100, 31, 5, 8, 85.0, 9),
    (100, 34, 3, 15, 40.0, 7),
    (100, 37, 4, 12, 60.0, 8);
            

-- SPEZIELLE ABFRAGEN --   

SELECT * FROM `Athletes`
ORDER BY `experience`;

SELECT * FROM `Workouts`;

SELECT * FROM `WorkoutExercises`;

SELECT * FROM `Exercises`;

SELECT * FROM `Competitions`;

SELECT * FROM `CompetitionResults`;

SELECT * FROM `Athletes` WHERE `AthleteID` = 3; #Details eines bestimmten Athleten anzeigen   

SELECT * FROM `Workouts` WHERE `AthleteID` = 5; #Workouts für einen bestimmten Athleten anzeigen

SELECT * FROM `Exercises` WHERE `Category` = 'Cardio'; #Alle Übungen in einer bestimmten Kategorie anzeigen

SELECT `Exercises`.`name`,
AVG (`workoutexercises`.`Weight`) AS `AverageWeight` #Durchschnittliches Gewicht für eine Übung in einem Workout berechnen
FROM `WorkoutExercises`
JOIN `Exercises` ON `WorkoutExercises`.`ExerciseID` = `Exercises`.`ExerciseID`
GROUP BY `Exercises`.`name`;                        #zeigt den Durchschnitt für alle Übungen an
-- WHERE `workoutexercises`.`ExerciseID` = 5;       #könnte man nehmen und einzelen Übungen anzuzeigen anstellen von GROUP BY

SELECT `Exercises`.`Name`,                  #Übungen für einen bestimmten Workout-ID anzeigen
	   `WorkoutExercises`.`Sets`,
       `WorkoutExercises`.`Reps`,
       `WorkoutExercises`.`Weight`,
       `WorkoutExercises`.`RPE`  
FROM `WorkoutExercises` 
JOIN `Exercises` ON `WorkoutExercises`.`ExerciseID` = `Exercises`.`ExerciseID`
WHERE `WorkoutExercises`.`WorkoutID` = 2;    
    
SELECT `Athletes`.`Name`,                   #Ergebnisse eines bestimmten Wettbewerbs anzeigen
       `Athletes`.`Surname`, 
       `CompetitionResults`.`Squat`, 
       `CompetitionResults`.`Benchpress`, 
       `CompetitionResults`.`Deadlift`, 
       `CompetitionResults`.`Total`, 
       `CompetitionResults`.`DOTS`, 
       `CompetitionResults`.`Placement` 
FROM `CompetitionResults`
JOIN `Athletes` ON `CompetitionResults`.`AthleteID` = `Athletes`.`AthleteID`
WHERE `CompetitionResults`.`CompetitionID` = 1;

SELECT `Athletes`.`Name`,                  #Die besten Platzierungen in einem Wettbewerb anzeigen
       `Athletes`.`Surname`,
       `CompetitionResults`.`Placement`, 
       `CompetitionResults`.`Total` 
FROM `CompetitionResults` 
JOIN `Athletes` ON `CompetitionResults`.`AthleteID` = `Athletes`.`AthleteID`
WHERE `CompetitionResults`.`CompetitionID` = 1
ORDER BY `CompetitionResults`.`Placement`
LIMIT 3;

SELECT `Athletes`.`Name`,
	   `Athletes`.`Surname`, 
       `CompetitionResults`.`DOTS`     #Athleten mit dem höchsten DOTS-Wert in einem bestimmten Wettbewerb anzeigen
FROM `CompetitionResults`
JOIN `Athletes` ON `CompetitionResults`.`AthleteID` = `Athletes`.`AthleteID`
WHERE `CompetitionResults`.`CompetitionID` = 2
ORDER BY `CompetitionResults`.`DOTS` DESC
LIMIT 3;
  
SELECT `Athletes`.`Name`,                                         #zeigt die ersten drei Plätze einer bestimmten CompetitionID an
       `Athletes`.`Surname`, 
       `CompetitionResults`.`Placement`, 
       `CompetitionResults`.`Total`, 
       `Competitions`.`Date` AS `CompetitionDate`,
       `Competitions`.`Location` AS `CompetitionLocation` 
FROM `CompetitionResults`
JOIN `Athletes` ON `CompetitionResults`.`AthleteID` = `Athletes`.`AthleteID`
JOIN `Competitions` ON `CompetitionResults`.`CompetitionID` = `Competitions`.`CompetitionID`
WHERE `CompetitionResults`.`CompetitionID` = 1
ORDER BY `CompetitionResults`.`Placement`
LIMIT 3;  
    
SELECT `CompetitionResults`.`ResultID`,                        #zeigt alle Teilenhmer einer bestimmten Competition aus unserem Kader, mit Datum, Ort und ihren Werten an
       `Athletes`.`Name` AS `AthleteName`,
       `Athletes`.`Surname` AS `AthleteSurname`,
       `Competitions`.`Name` AS `CompetitionName`,
       `Competitions`.`Date` AS `CompetitionDate`,
       `Competitions`.`Location` AS `CompetitionLocation`,
       `CompetitionResults`.`Squat`,
       `CompetitionResults`.`Benchpress`,
       `CompetitionResults`.`Deadlift`,
       `CompetitionResults`.`Total`,
       `CompetitionResults`.`DOTS`,
       `CompetitionResults`.`Placement`
FROM 
    `CompetitionResults`
JOIN 
    `Athletes` ON `CompetitionResults`.`AthleteID` = `Athletes`.`AthleteID`
JOIN 
    `Competitions` ON `CompetitionResults`.`CompetitionID` = `Competitions`.`CompetitionID`;
  
