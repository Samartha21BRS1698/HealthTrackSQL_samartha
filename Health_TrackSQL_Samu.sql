CREATE DATABASE HealthTrackSQL_Samu;
USE HealthTrackSQL_Samu;

SHOW DATABASES;
SELECT DATABASE();

CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    gender ENUM('M', 'F', 'Other') NOT NULL,
    address TEXT,
    phone VARCHAR(15) UNIQUE
);
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE
);
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    head_doctor_id INT,
    FOREIGN KEY (head_doctor_id) REFERENCES Doctors(doctor_id)
);
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
CREATE TABLE Visits (
    visit_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    diagnosis VARCHAR(255),
    treatment TEXT,
    visit_date DATE NOT NULL,
    duration_days INT CHECK (duration_days >= 0),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);
CREATE TABLE Vitals (
    vital_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    recorded_on DATETIME NOT NULL,
    bp INT,  -- blood pressure
    heart_rate INT,
    temperature DECIMAL(4,2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);
CREATE TABLE Billing (
    billing_id INT AUTO_INCREMENT PRIMARY KEY,
    visit_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL CHECK (amount >= 0),
    payment_status ENUM('Pending', 'Paid', 'Cancelled') DEFAULT 'Pending',
    paid_on DATE,
    FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
);
CREATE TABLE Doctor_Schedule (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT NOT NULL,
    available_day ENUM('Mon','Tue','Wed','Thu','Fri','Sat','Sun') NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
SHOW TABLES;

-- Doctors
INSERT INTO Doctors (name, specialization, phone, email) VALUES ('Karen Perry', 'Dermatology', '1398412668', 'tammy58@hotmail.com');
INSERT INTO Doctors (name, specialization, phone, email) VALUES ('David Lara', 'Orthopedics', '7949571164', 'uknight@gmail.com');
INSERT INTO Doctors (name, specialization, phone, email) VALUES ('Joshua Smith', 'Cardiology', '9447517237', 'brookemartin@perkins.com');
INSERT INTO Doctors (name, specialization, phone, email) VALUES ('Brian Walters', 'Dermatology', '5835248084', 'ellenmalone@gmail.com');
INSERT INTO Doctors (name, specialization, phone, email) VALUES ('Dana Jimenez', 'Dermatology', '8950617300', 'elizabethflores@yahoo.com');
INSERT INTO Doctors (name, specialization, phone, email) VALUES ('Emma Shaw', 'Cardiology', '7346391966', 'rodneyjones@gmail.com');
INSERT INTO Doctors (name, specialization, phone, email) VALUES ('Jon Guzman', 'Orthopedics', '2168081862', 'lori96@yahoo.com');
INSERT INTO Doctors (name, specialization, phone, email) VALUES ('Renee Kim', 'Neurology', '3080795492', 'yhurley@gmail.com');
INSERT INTO Doctors (name, specialization, phone, email) VALUES ('Natasha Whitaker', 'Dermatology', '7562184339', 'fgarner@nguyen.biz');
INSERT INTO Doctors (name, specialization, phone, email) VALUES ('Richard Henderson', 'Pediatrics', '9692109070', 'tuckerhaley@robertson.net');
-- Patients
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Mark Gamble', '2020-02-12', 'M', '25481 Melinda Villages Suite 009, Jenniferville, MA 20235', '9420182378');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Jason Andrews', '1990-01-14', 'M', '72536 Sanders Pike, Lake Christopherton, MS 09965', '7298056082');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Tiffany Chandler', '2011-04-16', 'M', '97554 Kelley Unions Apt. 111, East Jeffrey, TX 96034', '2544526134');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Hannah Jackson', '1983-04-23', 'F', 'Unit 7906 Box 7588, DPO AA 33762', '1352906852');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Jessica Cortez', '1977-03-21', 'M', '979 Duke Park, New Desireeshire, LA 55449', '8470603355');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Kristen Thomas', '1957-01-06', 'M', '80568 Jensen Squares, Clarkhaven, IA 65890', '0163759328');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Gloria Johnson', '1950-09-16', 'Other', '123 Horne Green, South Richard, OH 26176', '0464835871');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Julia Adams', '1972-07-21', 'Other', '56123 Robert Squares, Reesemouth, CT 77213', '2426233672');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Mary Reed', '1942-09-26', 'Other', '162 Robert Harbors, South Sarahmouth, LA 52820', '3562480468');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Anita Harrell', '1993-10-02', 'Other', '47031 Dixon Rest, Scotthaven, NJ 33794', '9587264513');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Paula Kim', '2004-04-20', 'Other', '777 Marks Field Suite 016, Lake Patricia, HI 98776', '4011488011');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Ann Reed', '1937-07-08', 'M', '789 Leon Wells Suite 156, Robertsfurt, GA 72153', '7549859347');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Brett Davis', '1978-02-10', 'M', '327 Ryan Meadow Suite 867, Brandonville, WV 78093', '8414761204');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Alexis Gonzalez', '2024-06-13', 'Other', '82893 Lauren Expressway, Susanfort, LA 08682', '8529068551');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('James Martin DDS', '2007-01-01', 'F', '616 Silva Glens Suite 893, West Amandabury, IN 70356', '1416120054');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Jodi Hill', '1950-11-27', 'M', '922 Kelly Spurs, Joshuamouth, PA 68061', '8655112955');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Dr. Christina Stevens', '2020-03-04', 'M', '24016 Hines Throughway, Lake Mark, WV 21868', '5766673116');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Sandra Yu', '1967-02-05', 'M', '51239 Sanchez Court Suite 855, North Johnfurt, ID 15419', '0195010256');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Amber Bradford', '1984-10-20', 'Other', '84750 Robert Spring Apt. 766, Greenfort, IA 70229', '5591389523');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Julie Richardson', '1954-12-05', 'M', '66359 Haley Terrace Suite 199, West James, NH 14208', '4542314994');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Dalton Jensen', '2019-03-11', 'Other', '6767 Jones Loaf, East Julie, AR 86672', '8388684839');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Mary Garcia', '1978-04-03', 'Other', '58046 Karina Glens, Mendozahaven, KS 91824', '9726213930');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Benjamin Romero', '1940-05-18', 'Other', '93303 Jonathan Bridge, Port David, OR 14865', '1775039861');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Paul Massey', '2020-01-22', 'M', '5864 Blake Union, Lopezview, AK 72764', '4495022200');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Troy Obrien', '1962-12-25', 'Other', '59331 Roy Hills, New Emilyberg, HI 92094', '4704044440');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Eric Decker', '1993-05-31', 'F', '0314 Jessica Tunnel, East Nathantown, NY 12681', '2266402713');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Brenda Oliver', '1960-01-29', 'M', 'PSC 0824, Box 1588, APO AP 13353', '6173999010');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Steven Lewis', '1978-05-12', 'M', '6262 Fields Cove Suite 408, Hendersonside, SC 80596', '2816850274');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Hannah Watson', '1998-07-06', 'M', '16257 Brenda Extensions, West Amanda, IN 54473', '0682057394');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Kaylee Harris', '1980-06-12', 'M', '116 Karen Mews, Santiagotown, DC 80205', '4803562596');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Christopher Hernandez', '1994-02-11', 'F', '3440 Theresa Isle, Lake Michaelside, UT 36604', '2206585764');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Amy Leon', '1936-01-07', 'M', '7872 Katie Plains, Phyllisbury, CO 46187', '7374357512');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Jane Sosa', '2017-11-18', 'M', '80155 Carroll Mountains, West Josephtown, CA 82169', '3830534930');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Alison Lutz', '2009-09-15', 'F', '10775 John Views, North Mary, VT 85563', '6827564581');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Olivia Evans', '1992-01-23', 'M', '24537 Morton Mission, New Briannashire, ME 21908', '5081277036');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('William Edwards', '1986-06-23', 'F', 'PSC 0870, Box 6761, APO AE 01949', '5175239610');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Christy Fitzgerald', '2013-01-28', 'F', 'Unit 1884 Box 2823, DPO AP 74510', '3781105349');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Craig Chavez', '1979-03-29', 'Other', '28086 Snyder Shoals, North Edward, NM 09746', '3507188665');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Marc Copeland', '1945-08-09', 'F', 'PSC 1438, Box 9692, APO AP 66823', '9159068222');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Richard Owen', '1997-09-09', 'M', '2381 Crawford Roads, Davistown, DC 91055', '0443864556');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Kimberly Lloyd', '1991-03-07', 'Other', '455 Cardenas Courts, Chambersburgh, SC 90476', '6816286077');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Michael Petersen', '1940-08-29', 'F', '2042 Frost Stream Apt. 841, Lake Timothy, CT 99401', '0836737648');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Henry Fry', '2014-12-19', 'Other', '7297 Kyle Shore, Port Dianetown, SD 51043', '4555029486');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Jason Kerr', '1962-07-06', 'M', '171 Weber Locks Suite 645, Huntmouth, ID 86332', '3311136618');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Joseph Smith', '1986-07-22', 'F', '233 Jerry Inlet Apt. 291, West Tracyville, PA 53818', '0988952470');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Sarah Chan', '1954-07-11', 'M', '9869 Jeremy Springs Suite 878, South Adamburgh, HI 58665', '6922151465');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Elizabeth Cross', '1996-02-17', 'M', '6472 Rebecca Gardens, North Laurenport, GA 26159', '7417921111');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Angela Sullivan', '1995-11-22', 'Other', '68450 Vargas Loop Suite 857, South Thomas, KY 33100', '1542976333');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Tommy Vercetti', '1976-12-17', 'M', '6472 Rebecca Gardens, North Laurenport, GA 26159', '2017965811');
INSERT INTO Patients (name, dob, gender, address, phone) VALUES ('Lance Vance', '1985-01-20', 'M', '68450 Vargas Loop Suite 857, South Thomas, KY 33100', '1454276333');

SELECT COUNT(*) FROM doctors;
SELECT COUNT(*) FROM Patients;

SELECT patient_id FROM Patients ORDER BY patient_id;

-- Insert 100 appointment records in increasing order of appointment_id
INSERT INTO Appointments (patient_id, doctor_id, date, status) VALUES 
(1, 1, '2024-06-01 10:00:00', 'Scheduled'),
(2, 2, '2024-06-02 10:00:00', 'Completed'),
(3, 3, '2024-06-03 10:00:00', 'Scheduled'),
(4, 4, '2024-06-04 10:00:00', 'Cancelled'),
(5, 5, '2024-06-05 10:00:00', 'Completed'),
(6, 6, '2024-06-06 10:00:00', 'Scheduled'),
(7, 7, '2024-06-07 10:00:00', 'Completed'),
(8, 8, '2024-06-08 10:00:00', 'Scheduled'),
(9, 9, '2024-06-09 10:00:00', 'Scheduled'),
(10, 10, '2024-06-10 10:00:00', 'Cancelled'),

(11, 1, '2024-06-11 10:00:00', 'Scheduled'),
(12, 2, '2024-06-12 10:00:00', 'Completed'),
(13, 3, '2024-06-13 10:00:00', 'Completed'),
(14, 4, '2024-06-14 10:00:00', 'Scheduled'),
(15, 5, '2024-06-15 10:00:00', 'Scheduled'),
(16, 6, '2024-06-16 10:00:00', 'Completed'),
(17, 7, '2024-06-17 10:00:00', 'Scheduled'),
(18, 8, '2024-06-18 10:00:00', 'Scheduled'),
(19, 9, '2024-06-19 10:00:00', 'Cancelled'),
(20, 10, '2024-06-20 10:00:00', 'Scheduled'),

(21, 1, '2024-06-21 10:00:00', 'Completed'),
(22, 2, '2024-06-22 10:00:00', 'Scheduled'),
(23, 3, '2024-06-23 10:00:00', 'Completed'),
(24, 4, '2024-06-24 10:00:00', 'Scheduled'),
(25, 5, '2024-06-25 10:00:00', 'Cancelled'),
(26, 6, '2024-06-26 10:00:00', 'Scheduled'),
(27, 7, '2024-06-27 10:00:00', 'Completed'),
(28, 8, '2024-06-28 10:00:00', 'Scheduled'),
(29, 9, '2024-06-29 10:00:00', 'Completed'),
(30, 10, '2024-06-30 10:00:00', 'Scheduled'),

(31, 1, '2024-07-01 10:00:00', 'Scheduled'),
(32, 2, '2024-07-02 10:00:00', 'Scheduled'),
(33, 3, '2024-07-03 10:00:00', 'Completed'),
(34, 4, '2024-07-04 10:00:00', 'Cancelled'),
(35, 5, '2024-07-05 10:00:00', 'Scheduled'),
(36, 6, '2024-07-06 10:00:00', 'Scheduled'),
(37, 7, '2024-07-07 10:00:00', 'Completed'),
(38, 8, '2024-07-08 10:00:00', 'Scheduled'),
(39, 9, '2024-07-09 10:00:00', 'Cancelled'),
(40, 10, '2024-07-10 10:00:00', 'Scheduled'),

(41, 1, '2024-07-11 10:00:00', 'Completed'),
(42, 2, '2024-07-12 10:00:00', 'Completed'),
(43, 3, '2024-07-13 10:00:00', 'Scheduled'),
(44, 4, '2024-07-14 10:00:00', 'Scheduled'),
(45, 5, '2024-07-15 10:00:00', 'Completed'),
(46, 6, '2024-07-16 10:00:00', 'Scheduled'),
(47, 7, '2024-07-17 10:00:00', 'Scheduled'),
(48, 8, '2024-07-18 10:00:00', 'Completed'),
(49, 9, '2024-07-19 10:00:00', 'Cancelled'),
(50, 10, '2024-07-20 10:00:00', 'Scheduled');

SELECT COUNT(*) FROM Appointments;

INSERT INTO Appointments (patient_id, doctor_id, date, status) VALUES 
(1, 2, '2024-06-01 10:00:00', 'Scheduled'),
(2, 3, '2024-06-02 10:00:00', 'Completed'),
(3, 4, '2024-06-03 10:00:00', 'Scheduled'),
(4, 5, '2024-06-04 10:00:00', 'Cancelled'),
(5, 6, '2024-06-05 10:00:00', 'Completed'),
(6, 7, '2024-06-06 10:00:00', 'Scheduled'),
(7, 8, '2024-06-07 10:00:00', 'Completed'),
(8, 9, '2024-06-08 10:00:00', 'Scheduled'),
(9, 10, '2024-06-09 10:00:00', 'Scheduled'),
(10, 1, '2024-06-10 10:00:00', 'Cancelled');

INSERT INTO Appointments (patient_id, doctor_id, date, status) VALUES 
(11, 2, '2024-06-01 10:00:00', 'Scheduled'),
(12, 3, '2024-06-02 10:00:00', 'Completed'),
(13, 4, '2024-06-03 10:00:00', 'Scheduled'),
(14, 5, '2024-06-04 10:00:00', 'Cancelled'),
(15, 6, '2024-06-05 10:00:00', 'Completed'),
(16, 7, '2024-06-06 10:00:00', 'Scheduled'),
(17, 8, '2024-06-07 10:00:00', 'Completed'),
(18, 9, '2024-06-08 10:00:00', 'Scheduled'),
(19, 10, '2024-06-09 10:00:00', 'Scheduled'),
(20, 1, '2024-06-10 10:00:00', 'Cancelled');

INSERT INTO Appointments (patient_id, doctor_id, date, status) VALUES 
(21, 2, '2024-06-21 10:00:00', 'Completed'),
(22, 3, '2024-06-22 10:00:00', 'Scheduled'),
(23, 4, '2024-06-23 10:00:00', 'Completed'),
(24, 5, '2024-06-24 10:00:00', 'Scheduled'),
(25, 6, '2024-06-25 10:00:00', 'Cancelled'),
(26, 7, '2024-06-26 10:00:00', 'Scheduled'),
(27, 8, '2024-06-27 10:00:00', 'Completed'),
(28, 9, '2024-06-28 10:00:00', 'Scheduled'),
(29, 10, '2024-06-29 10:00:00', 'Completed'),
(30, 1, '2024-06-30 10:00:00', 'Scheduled'),

(31, 2, '2024-07-01 10:00:00', 'Scheduled'),
(32, 3, '2024-07-02 10:00:00', 'Scheduled'),
(33, 4, '2024-07-03 10:00:00', 'Completed'),
(34, 5, '2024-07-04 10:00:00', 'Cancelled'),
(35, 6, '2024-07-05 10:00:00', 'Scheduled'),
(36, 7, '2024-07-06 10:00:00', 'Scheduled'),
(37, 8, '2024-07-07 10:00:00', 'Completed'),
(38, 9, '2024-07-08 10:00:00', 'Scheduled'),
(39, 10, '2024-07-09 10:00:00', 'Cancelled'),
(40, 1, '2024-07-10 10:00:00', 'Scheduled'),

(41, 2, '2024-07-11 10:00:00', 'Completed'),
(42, 3, '2024-07-12 10:00:00', 'Completed'),
(43, 4, '2024-07-13 10:00:00', 'Scheduled'),
(44, 5, '2024-07-14 10:00:00', 'Scheduled'),
(45, 6, '2024-07-15 10:00:00', 'Completed'),
(46, 7, '2024-07-16 10:00:00', 'Scheduled'),
(47, 8, '2024-07-17 10:00:00', 'Scheduled'),
(48, 9, '2024-07-18 10:00:00', 'Completed'),
(49, 10, '2024-07-19 10:00:00', 'Cancelled'),
(50, 1, '2024-07-20 10:00:00', 'Scheduled');

SELECT COUNT(*) FROM Appointments;
SELECT appointment_id FROM Appointments ORDER BY appointment_id;

INSERT INTO Visits (appointment_id, diagnosis, treatment, visit_date, duration_days) VALUES
(181, 'Flu', 'Prescribed antiviral medication', '2024-06-01', 2),
(182, 'High Blood Pressure', 'Recommended diet and exercise plan', '2024-06-02', 0),
(183, 'Migraine', 'Prescribed painkillers', '2024-06-03', 1),
(184, 'Routine Checkup', 'Vitals normal, advised healthy routine', '2024-06-04', 0),
(185, 'Diabetes', 'Adjusted insulin dosage', '2024-06-05', 1),
(186, 'Asthma', 'Given inhaler and allergy prevention tips', '2024-06-06', 1),
(187, 'Anxiety', 'Prescribed mild sedatives, advised therapy', '2024-06-07', 2),
(188, 'Sprained Ankle', 'Applied bandage, suggested physiotherapy', '2024-06-08', 7),
(189, 'Skin Rash', 'Applied topical ointment', '2024-06-09', 3),
(190, 'Cough & Cold', 'Prescribed syrup and rest', '2024-06-10', 2),

(191, 'Routine Checkup', 'No issues, advised regular follow-up', '2024-06-11', 0),
(192, 'Eye Irritation', 'Prescribed eye drops', '2024-06-12', 1),
(193, 'Allergy', 'Started antihistamines', '2024-06-13', 3),
(194, 'Fever', 'Blood test advised, given paracetamol', '2024-06-14', 1),
(195, 'Back Pain', 'Advised ergonomic exercises', '2024-06-15', 7),
(196, 'Thyroid Checkup', 'No change in medication', '2024-06-16', 0),
(197, 'Toothache', 'Referred to dentist, given painkillers', '2024-06-17', 1),
(198, 'Chest Pain', 'ECG normal, suggested stress test', '2024-06-18', 2),
(199, 'Hair Loss', 'Prescribed supplements', '2024-06-19', 30),
(200, 'Routine Checkup', 'All parameters normal', '2024-06-20', 0),

(201, 'UTI', 'Prescribed antibiotics', '2024-06-21', 3),
(202, 'Knee Pain', 'Advised X-ray, prescribed analgesics', '2024-06-22', 5),
(203, 'Infection', 'Started antibiotic course', '2024-06-23', 5),
(204, 'Cramps', 'Prescribed magnesium, increased water intake', '2024-06-24', 1),
(205, 'Acne', 'Given topical cream, advised hygiene', '2024-06-25', 30);

INSERT INTO Visits (appointment_id, diagnosis, treatment, visit_date, duration_days) VALUES
(206, 'Hypertension', 'Increased medication dosage', '2024-06-26', 3),
(207, 'Fracture Follow-up', 'Cast removed, physiotherapy advised', '2024-06-27', 10),
(208, 'Sinusitis', 'Prescribed nasal spray and antibiotics', '2024-06-28', 5),
(209, 'Depression', 'Continued counseling and medication', '2024-06-29', 30),
(210, 'PCOS', 'Prescribed hormone therapy', '2024-06-30', 21),
(211, 'High Cholesterol', 'Diet and exercise plan advised', '2024-07-01', 0),
(212, 'Viral Fever', 'Prescribed fluids and rest', '2024-07-02', 3),
(213, 'Ear Pain', 'Diagnosed ear infection, prescribed drops', '2024-07-03', 5),
(214, 'Burn Injury', 'Applied ointment, dressing changes advised', '2024-07-04', 14),
(215, 'Constipation', 'Prescribed fiber-rich diet and mild laxative', '2024-07-05', 2),

(216, 'Obesity', 'Started weight loss program', '2024-07-06', 90),
(217, 'Gastritis', 'Prescribed antacid and H. pylori test', '2024-07-07', 7),
(218, 'Sore Throat', 'Prescribed lozenges and antibiotics', '2024-07-08', 3),
(219, 'Arthritis', 'Pain management and physiotherapy suggested', '2024-07-09', 30),
(220, 'Routine Pregnancy Check', 'Everything normal, next follow-up in 2 weeks', '2024-07-10', 0),
(221, 'Stomach Ache', 'Recommended ultrasound, prescribed pain relief', '2024-07-11', 2),
(222, 'Vertigo', 'Given vestibular exercises and medication', '2024-07-12', 5),
(223, 'Dental Cavity', 'Temporary filling done, referred to dentist', '2024-07-13', 1),
(224, 'Hand Pain', 'Applied ice pack, advised rest', '2024-07-14', 4),
(225, 'Itching', 'Prescribed antihistamines and topical cream', '2024-07-15', 3),

(226, 'Anemia', 'Prescribed iron supplements and diet changes', '2024-07-16', 15),
(227, 'Throat Infection', 'Antibiotics course started', '2024-07-17', 5),
(228, 'Dehydration', 'IV fluids administered', '2024-07-18', 1),
(229, 'Kidney Stone', 'Referred to specialist, started hydration therapy', '2024-07-19', 20),
(230, 'Routine Blood Work', 'All values normal, next review in 6 months', '2024-07-20', 0);

SELECT COUNT(*) FROM Visits;
ALTER TABLE Vitals MODIFY COLUMN temperature DECIMAL(5,2);

INSERT INTO Vitals (patient_id, recorded_on, bp, heart_rate, temperature) VALUES
(1, '2024-06-01 08:30:00', 120, 80, 98.60),
(1, '2024-06-04 09:00:00', 122, 78, 98.20),
(1, '2024-06-07 10:15:00', 118, 76, 98.10),
(1, '2024-06-10 08:45:00', 125, 82, 99.00),
(1, '2024-06-14 09:30:00', 130, 85, 99.20),
(1, '2024-06-17 11:00:00', 110, 74, 98.00),

(2, '2024-06-01 09:30:00', 140, 90, 99.10),
(2, '2024-06-03 08:00:00', 145, 92, 99.30),
(2, '2024-06-06 08:15:00', 138, 88, 98.90),
(2, '2024-06-09 10:45:00', 136, 86, 99.00),
(2, '2024-06-12 11:15:00', 142, 93, 99.50),
(2, '2024-06-15 07:45:00', 144, 94, 99.40),

(3, '2024-06-01 08:15:00', 115, 70, 97.80),
(3, '2024-06-04 09:45:00', 117, 72, 98.00),
(3, '2024-06-07 08:30:00', 116, 75, 98.40),
(3, '2024-06-10 10:00:00', 120, 78, 98.50),
(3, '2024-06-13 09:00:00', 119, 76, 98.30),
(3, '2024-06-16 10:30:00', 121, 79, 98.60),

(4, '2024-06-02 07:45:00', 125, 82, 98.70),
(4, '2024-06-05 08:15:00', 130, 85, 98.90),
(4, '2024-06-08 09:30:00', 128, 83, 99.00),
(4, '2024-06-11 10:15:00', 135, 87, 99.10),
(4, '2024-06-14 08:30:00', 138, 89, 99.30),
(4, '2024-06-17 09:45:00', 132, 84, 98.80),

(5, '2024-06-03 08:00:00', 110, 72, 98.10),
(5, '2024-06-06 09:30:00', 108, 70, 98.00),
(5, '2024-06-09 08:45:00', 112, 74, 98.40),
(5, '2024-06-12 09:00:00', 115, 75, 98.30),
(5, '2024-06-15 10:15:00', 117, 77, 98.60),
(5, '2024-06-18 07:45:00', 119, 78, 98.50),

(6, '2024-06-01 07:30:00', 150, 96, 100.00),
(6, '2024-06-04 09:00:00', 148, 94, 99.80),
(6, '2024-06-07 10:15:00', 152, 97, 100.20),
(6, '2024-06-10 08:45:00', 155, 98, 100.30),
(6, '2024-06-13 09:30:00', 151, 95, 100.10),
(6, '2024-06-16 11:00:00', 149, 93, 99.90),

(7, '2024-06-02 08:30:00', 132, 88, 98.70),
(7, '2024-06-05 09:15:00', 134, 86, 98.90),
(7, '2024-06-08 08:00:00', 130, 85, 98.80),
(7, '2024-06-11 10:30:00', 129, 84, 98.60),
(7, '2024-06-14 09:00:00', 131, 86, 98.90),
(7, '2024-06-17 08:45:00', 133, 87, 99.00),

(8, '2024-06-03 07:45:00', 145, 92, 99.10),
(8, '2024-06-06 08:15:00', 147, 94, 99.20),
(8, '2024-06-09 09:30:00', 144, 91, 99.00),
(8, '2024-06-12 10:15:00', 143, 90, 98.90),
(8, '2024-06-15 08:30:00', 146, 93, 99.10),
(8, '2024-06-18 09:45:00', 148, 95, 99.30),

(9, '2024-06-04 08:00:00', 118, 76, 98.30),
(9, '2024-06-07 09:30:00', 120, 78, 98.40),
(9, '2024-06-10 08:45:00', 122, 80, 98.60),
(9, '2024-06-13 09:00:00', 119, 77, 98.50),
(9, '2024-06-16 10:15:00', 121, 79, 98.70),
(9, '2024-06-19 07:45:00', 123, 81, 98.80),

(10, '2024-06-05 07:30:00', 135, 85, 99.10),
(10, '2024-06-08 09:00:00', 138, 87, 99.30),
(10, '2024-06-11 10:15:00', 136, 86, 99.00),
(10, '2024-06-14 08:45:00', 137, 88, 99.20),
(10, '2024-06-17 09:30:00', 139, 89, 99.40),
(10, '2024-06-20 11:00:00', 141, 90, 99.50);

INSERT INTO Vitals (patient_id, recorded_on, bp, heart_rate, temperature) VALUES
(11, '2024-06-01 08:00:00', 124, 82, 98.70),
(11, '2024-06-04 09:30:00', 122, 80, 98.60),
(11, '2024-06-07 10:15:00', 126, 83, 98.90),
(11, '2024-06-10 08:45:00', 125, 81, 98.80),
(11, '2024-06-13 09:15:00', 128, 84, 99.00),
(11, '2024-06-16 07:30:00', 127, 85, 99.10),

(12, '2024-06-02 08:15:00', 138, 88, 99.20),
(12, '2024-06-05 09:00:00', 136, 86, 98.90),
(12, '2024-06-08 08:30:00', 137, 89, 99.10),
(12, '2024-06-11 10:00:00', 140, 90, 99.30),
(12, '2024-06-14 08:45:00', 141, 91, 99.40),
(12, '2024-06-17 09:15:00', 139, 87, 99.20),

(13, '2024-06-01 09:00:00', 118, 76, 98.40),
(13, '2024-06-04 08:30:00', 119, 75, 98.30),
(13, '2024-06-07 09:45:00', 117, 74, 98.20),
(13, '2024-06-10 07:15:00', 120, 78, 98.50),
(13, '2024-06-13 08:00:00', 121, 77, 98.60),
(13, '2024-06-16 10:30:00', 122, 79, 98.70),

(14, '2024-06-03 08:30:00', 132, 84, 98.90),
(14, '2024-06-06 09:00:00', 134, 85, 99.00),
(14, '2024-06-09 08:15:00', 135, 87, 99.10),
(14, '2024-06-12 10:00:00', 133, 86, 99.20),
(14, '2024-06-15 09:45:00', 131, 84, 99.00),
(14, '2024-06-18 08:30:00', 130, 83, 98.90),

(15, '2024-06-01 07:45:00', 140, 92, 99.20),
(15, '2024-06-04 08:15:00', 142, 93, 99.30),
(15, '2024-06-07 09:30:00', 144, 94, 99.40),
(15, '2024-06-10 08:00:00', 141, 90, 99.10),
(15, '2024-06-13 10:15:00', 143, 91, 99.20),
(15, '2024-06-16 09:00:00', 145, 95, 99.50),

(16, '2024-06-02 09:15:00', 112, 72, 98.10),
(16, '2024-06-05 10:00:00', 114, 74, 98.30),
(16, '2024-06-08 08:30:00', 115, 75, 98.20),
(16, '2024-06-11 09:45:00', 113, 73, 98.10),
(16, '2024-06-14 08:00:00', 116, 76, 98.40),
(16, '2024-06-17 07:30:00', 117, 78, 98.50),

(17, '2024-06-03 08:00:00', 134, 88, 99.00),
(17, '2024-06-06 08:45:00', 136, 89, 99.10),
(17, '2024-06-09 09:15:00', 138, 90, 99.20),
(17, '2024-06-12 08:30:00', 137, 88, 99.10),
(17, '2024-06-15 10:00:00', 135, 86, 98.90),
(17, '2024-06-18 07:45:00', 133, 85, 98.80),

(18, '2024-06-01 09:30:00', 128, 80, 98.60),
(18, '2024-06-04 10:00:00', 126, 78, 98.50),
(18, '2024-06-07 08:15:00', 127, 79, 98.60),
(18, '2024-06-10 09:45:00', 129, 81, 98.70),
(18, '2024-06-13 07:30:00', 130, 82, 98.90),
(18, '2024-06-16 08:30:00', 131, 84, 99.00),

(19, '2024-06-02 08:30:00', 122, 77, 98.40),
(19, '2024-06-05 09:00:00', 120, 76, 98.30),
(19, '2024-06-08 09:45:00', 124, 79, 98.60),
(19, '2024-06-11 07:15:00', 123, 78, 98.50),
(19, '2024-06-14 10:00:00', 121, 75, 98.20),
(19, '2024-06-17 08:45:00', 125, 80, 98.70),

(20, '2024-06-03 07:30:00', 136, 88, 99.20),
(20, '2024-06-06 08:00:00', 138, 90, 99.30),
(20, '2024-06-09 08:30:00', 140, 91, 99.40),
(20, '2024-06-12 09:00:00', 137, 89, 99.10),
(20, '2024-06-15 09:30:00', 139, 92, 99.20),
(20, '2024-06-18 10:15:00', 141, 93, 99.50);

INSERT INTO Vitals (patient_id, recorded_on, bp, heart_rate, temperature) VALUES
(21, '2024-06-01 08:00:00', 122, 78, 98.60),
(21, '2024-06-04 09:30:00', 124, 80, 98.70),
(21, '2024-06-07 10:00:00', 121, 76, 98.50),
(21, '2024-06-10 08:30:00', 125, 82, 98.80),
(21, '2024-06-13 09:15:00', 127, 84, 98.90),
(21, '2024-06-16 10:45:00', 126, 83, 99.00),

(22, '2024-06-02 07:45:00', 135, 88, 99.10),
(22, '2024-06-05 08:30:00', 137, 89, 99.20),
(22, '2024-06-08 09:00:00', 139, 90, 99.30),
(22, '2024-06-11 10:15:00', 136, 87, 99.10),
(22, '2024-06-14 09:45:00', 138, 89, 99.20),
(22, '2024-06-17 08:15:00', 140, 91, 99.40),

(23, '2024-06-01 09:00:00', 118, 72, 98.10),
(23, '2024-06-04 10:30:00', 116, 70, 98.00),
(23, '2024-06-07 09:45:00', 117, 73, 98.20),
(23, '2024-06-10 07:15:00', 119, 74, 98.30),
(23, '2024-06-13 08:00:00', 120, 75, 98.50),
(23, '2024-06-16 10:00:00', 122, 77, 98.60),

(24, '2024-06-03 08:30:00', 130, 86, 99.00),
(24, '2024-06-06 09:15:00', 132, 87, 99.10),
(24, '2024-06-09 08:00:00', 131, 85, 98.90),
(24, '2024-06-12 09:30:00', 133, 88, 99.10),
(24, '2024-06-15 10:15:00', 134, 89, 99.20),
(24, '2024-06-18 07:45:00', 135, 90, 99.30),

(25, '2024-06-01 07:30:00', 145, 95, 99.50),
(25, '2024-06-04 08:00:00', 147, 96, 99.60),
(25, '2024-06-07 09:30:00', 149, 98, 99.70),
(25, '2024-06-10 10:00:00', 146, 94, 99.40),
(25, '2024-06-13 08:45:00', 148, 97, 99.60),
(25, '2024-06-16 09:15:00', 150, 99, 99.80),

(26, '2024-06-02 09:00:00', 115, 74, 98.10),
(26, '2024-06-05 09:45:00', 113, 72, 98.00),
(26, '2024-06-08 08:15:00', 116, 75, 98.20),
(26, '2024-06-11 10:30:00', 118, 77, 98.30),
(26, '2024-06-14 07:30:00', 117, 76, 98.40),
(26, '2024-06-17 08:30:00', 119, 78, 98.60),

(27, '2024-06-03 07:45:00', 132, 87, 99.00),
(27, '2024-06-06 09:30:00', 134, 88, 99.10),
(27, '2024-06-09 08:00:00', 133, 86, 99.00),
(27, '2024-06-12 10:15:00', 135, 89, 99.20),
(27, '2024-06-15 08:30:00', 137, 90, 99.30),
(27, '2024-06-18 09:45:00', 136, 91, 99.40),

(28, '2024-06-01 08:30:00', 128, 80, 98.60),
(28, '2024-06-04 09:15:00', 129, 82, 98.70),
(28, '2024-06-07 07:45:00', 131, 83, 98.90),
(28, '2024-06-10 08:30:00', 130, 81, 98.80),
(28, '2024-06-13 10:00:00', 132, 84, 99.00),
(28, '2024-06-16 09:00:00', 133, 85, 99.10),

(29, '2024-06-02 09:30:00', 123, 79, 98.40),
(29, '2024-06-05 10:00:00', 124, 80, 98.50),
(29, '2024-06-08 08:45:00', 122, 78, 98.30),
(29, '2024-06-11 09:15:00', 125, 81, 98.60),
(29, '2024-06-14 08:30:00', 126, 82, 98.70),
(29, '2024-06-17 10:30:00', 127, 83, 98.80),

(30, '2024-06-03 08:15:00', 138, 90, 99.20),
(30, '2024-06-06 07:30:00', 140, 91, 99.30),
(30, '2024-06-09 09:00:00', 139, 92, 99.40),
(30, '2024-06-12 08:00:00', 137, 89, 99.10),
(30, '2024-06-15 09:45:00', 141, 93, 99.50),
(30, '2024-06-18 10:00:00', 143, 94, 99.60);

INSERT INTO Vitals (patient_id, recorded_on, bp, heart_rate, temperature) VALUES
(31, '2024-06-01 08:00:00', 120, 80, 98.60),
(31, '2024-06-04 09:00:00', 122, 82, 98.70),
(31, '2024-06-07 10:00:00', 121, 79, 98.50),
(31, '2024-06-10 08:30:00', 123, 83, 98.90),
(31, '2024-06-13 09:45:00', 125, 85, 99.00),
(31, '2024-06-16 07:30:00', 124, 84, 98.80),

(32, '2024-06-02 09:30:00', 134, 88, 99.10),
(32, '2024-06-05 08:30:00', 136, 89, 99.20),
(32, '2024-06-08 07:45:00', 137, 91, 99.30),
(32, '2024-06-11 09:00:00', 135, 87, 99.00),
(32, '2024-06-14 08:00:00', 133, 86, 98.90),
(32, '2024-06-17 10:30:00', 132, 85, 98.80),

(33, '2024-06-01 07:45:00', 118, 74, 98.20),
(33, '2024-06-04 08:15:00', 117, 73, 98.10),
(33, '2024-06-07 09:30:00', 119, 76, 98.30),
(33, '2024-06-10 10:15:00', 120, 77, 98.40),
(33, '2024-06-13 08:30:00', 122, 78, 98.50),
(33, '2024-06-16 09:45:00', 121, 79, 98.60),

(34, '2024-06-03 08:30:00', 130, 86, 99.00),
(34, '2024-06-06 09:00:00', 132, 87, 99.10),
(34, '2024-06-09 10:00:00', 134, 89, 99.30),
(34, '2024-06-12 08:00:00', 131, 85, 99.00),
(34, '2024-06-15 09:30:00', 133, 88, 99.20),
(34, '2024-06-18 07:45:00', 135, 90, 99.40),

(35, '2024-06-01 09:00:00', 142, 92, 99.50),
(35, '2024-06-04 10:00:00', 144, 93, 99.60),
(35, '2024-06-07 08:15:00', 145, 95, 99.70),
(35, '2024-06-10 09:30:00', 143, 91, 99.40),
(35, '2024-06-13 07:45:00', 141, 90, 99.30),
(35, '2024-06-16 08:00:00', 140, 89, 99.20),

(36, '2024-06-02 08:30:00', 115, 75, 98.30),
(36, '2024-06-05 09:15:00', 117, 76, 98.40),
(36, '2024-06-08 10:00:00', 116, 74, 98.20),
(36, '2024-06-11 07:45:00', 118, 77, 98.50),
(36, '2024-06-14 08:30:00', 119, 78, 98.60),
(36, '2024-06-17 09:00:00', 121, 80, 98.70),

(37, '2024-06-03 07:30:00', 134, 89, 99.10),
(37, '2024-06-06 08:45:00', 135, 90, 99.20),
(37, '2024-06-09 09:30:00', 137, 91, 99.30),
(37, '2024-06-12 10:00:00', 136, 92, 99.40),
(37, '2024-06-15 08:15:00', 138, 93, 99.50),
(37, '2024-06-18 09:45:00', 139, 94, 99.60),

(38, '2024-06-01 08:15:00', 126, 82, 98.60),
(38, '2024-06-04 09:45:00', 127, 83, 98.70),
(38, '2024-06-07 08:30:00', 129, 85, 98.80),
(38, '2024-06-10 09:15:00', 128, 84, 98.90),
(38, '2024-06-13 10:30:00', 130, 86, 99.00),
(38, '2024-06-16 07:30:00', 131, 87, 99.10),

(39, '2024-06-02 09:00:00', 122, 78, 98.40),
(39, '2024-06-05 08:30:00', 123, 79, 98.50),
(39, '2024-06-08 07:45:00', 124, 80, 98.60),
(39, '2024-06-11 09:00:00', 126, 81, 98.70),
(39, '2024-06-14 08:00:00', 125, 82, 98.80),
(39, '2024-06-17 10:30:00', 127, 83, 98.90),

(40, '2024-06-03 09:15:00', 139, 91, 99.20),
(40, '2024-06-06 10:00:00', 140, 92, 99.30),
(40, '2024-06-09 08:45:00', 141, 93, 99.40),
(40, '2024-06-12 07:30:00', 138, 90, 99.10),
(40, '2024-06-15 08:30:00', 137, 89, 99.00),
(40, '2024-06-18 09:00:00', 136, 88, 98.90);

INSERT INTO Vitals (patient_id, recorded_on, bp, heart_rate, temperature) VALUES
(41, '2024-06-01 08:00:00', 120, 80, 98.60),
(41, '2024-06-04 09:00:00', 122, 82, 98.70),
(41, '2024-06-07 10:00:00', 121, 79, 98.50),
(41, '2024-06-10 08:30:00', 123, 83, 98.90),
(41, '2024-06-13 09:45:00', 125, 85, 99.00),
(41, '2024-06-16 07:30:00', 124, 84, 98.80),

(42, '2024-06-02 09:30:00', 134, 88, 99.10),
(42, '2024-06-05 08:30:00', 136, 89, 99.20),
(42, '2024-06-08 07:45:00', 137, 91, 99.30),
(42, '2024-06-11 09:00:00', 135, 87, 99.00),
(42, '2024-06-14 08:00:00', 133, 86, 98.90),
(42, '2024-06-17 10:30:00', 132, 85, 98.80),

(43, '2024-06-01 07:45:00', 118, 74, 98.20),
(43, '2024-06-04 08:15:00', 117, 73, 98.10),
(43, '2024-06-07 09:30:00', 119, 76, 98.30),
(43, '2024-06-10 10:15:00', 120, 77, 98.40),
(43, '2024-06-13 08:30:00', 122, 78, 98.50),
(43, '2024-06-16 09:45:00', 121, 79, 98.60),

(44, '2024-06-03 08:30:00', 130, 86, 99.00),
(44, '2024-06-06 09:00:00', 132, 87, 99.10),
(44, '2024-06-09 10:00:00', 134, 89, 99.30),
(44, '2024-06-12 08:00:00', 131, 85, 99.00),
(44, '2024-06-15 09:30:00', 133, 88, 99.20),
(44, '2024-06-18 07:45:00', 135, 90, 99.40),

(45, '2024-06-01 09:00:00', 142, 92, 99.50),
(45, '2024-06-04 10:00:00', 144, 93, 99.60),
(45, '2024-06-07 08:15:00', 145, 95, 99.70),
(45, '2024-06-10 09:30:00', 143, 91, 99.40),
(45, '2024-06-13 07:45:00', 141, 90, 99.30),
(45, '2024-06-16 08:00:00', 140, 89, 99.20),

(46, '2024-06-02 08:30:00', 115, 75, 98.30),
(46, '2024-06-05 09:15:00', 117, 76, 98.40),
(46, '2024-06-08 10:00:00', 116, 74, 98.20),
(46, '2024-06-11 07:45:00', 118, 77, 98.50),
(46, '2024-06-14 08:30:00', 119, 78, 98.60),
(46, '2024-06-17 09:00:00', 121, 80, 98.70),

(47, '2024-06-03 07:30:00', 134, 89, 99.10),
(47, '2024-06-06 08:45:00', 135, 90, 99.20),
(47, '2024-06-09 09:30:00', 137, 91, 99.30),
(47, '2024-06-12 10:00:00', 136, 92, 99.40),
(47, '2024-06-15 08:15:00', 138, 93, 99.50),
(47, '2024-06-18 09:45:00', 139, 94, 99.60),

(48, '2024-06-01 08:15:00', 126, 82, 98.60),
(48, '2024-06-04 09:45:00', 127, 83, 98.70),
(48, '2024-06-07 08:30:00', 129, 85, 98.80),
(48, '2024-06-10 09:15:00', 128, 84, 98.90),
(48, '2024-06-13 10:30:00', 130, 86, 99.00),
(48, '2024-06-16 07:30:00', 131, 87, 99.10),

(49, '2024-06-02 09:00:00', 122, 78, 98.40),
(49, '2024-06-05 08:30:00', 123, 79, 98.50),
(49, '2024-06-08 07:45:00', 124, 80, 98.60),
(49, '2024-06-11 09:00:00', 126, 81, 98.70),
(49, '2024-06-14 08:00:00', 125, 82, 98.80),
(49, '2024-06-17 10:30:00', 127, 83, 98.90),

(50, '2024-06-03 09:15:00', 139, 91, 99.20),
(50, '2024-06-06 10:00:00', 140, 92, 99.30),
(50, '2024-06-09 08:45:00', 141, 93, 99.40),
(50, '2024-06-12 07:30:00', 138, 90, 99.10),
(50, '2024-06-15 08:30:00', 137, 89, 99.00),
(50, '2024-06-18 09:00:00', 136, 88, 98.90);

SELECT COUNT(*) FROM Visits;
SELECT visit_id FROM Visits ORDER BY visit_id;

INSERT INTO Billing (visit_id, amount, payment_status, paid_on) VALUES
(26, 1200.00, 'Paid', '2024-06-02'),
(27, 900.00, 'Pending', NULL),
(28, 1500.00, 'Paid', '2024-06-04'),
(29, 800.00, 'Cancelled', NULL),
(30, 1000.00, 'Paid', '2024-06-06'),
(31, 950.00, 'Pending', NULL),
(32, 1100.00, 'Paid', '2024-06-07'),
(33, 700.00, 'Cancelled', NULL),
(34, 1250.00, 'Paid', '2024-06-08'),
(35, 850.00, 'Pending', NULL),

(36, 1050.00, 'Paid', '2024-06-10'),
(37, 990.00, 'Pending', NULL),
(38, 1400.00, 'Paid', '2024-06-11'),
(39, 760.00, 'Cancelled', NULL),
(40, 1120.00, 'Paid', '2024-06-12'),
(41, 920.00, 'Pending', NULL),
(42, 1300.00, 'Paid', '2024-06-13'),
(43, 875.00, 'Cancelled', NULL),
(44, 980.00, 'Paid', '2024-06-14'),
(45, 810.00, 'Pending', NULL),

(46, 1500.00, 'Paid', '2024-06-15'),
(47, 880.00, 'Pending', NULL),
(48, 1350.00, 'Paid', '2024-06-16'),
(49, 725.00, 'Cancelled', NULL),
(50, 1150.00, 'Paid', '2024-06-17'),
(51, 940.00, 'Pending', NULL),
(52, 1080.00, 'Paid', '2024-06-18'),
(53, 845.00, 'Cancelled', NULL),
(54, 1000.00, 'Paid', '2024-06-19'),
(55, 895.00, 'Pending', NULL),

(56, 1235.00, 'Paid', '2024-06-20'),
(57, 975.00, 'Pending', NULL),
(58, 1275.00, 'Paid', '2024-06-21'),
(59, 760.00, 'Cancelled', NULL),
(60, 1125.00, 'Paid', '2024-06-22'),
(61, 880.00, 'Pending', NULL),
(62, 1340.00, 'Paid', '2024-06-23'),
(63, 790.00, 'Cancelled', NULL),
(64, 990.00, 'Paid', '2024-06-24'),
(65, 820.00, 'Pending', NULL),

(66, 1460.00, 'Paid', '2024-06-25'),
(67, 910.00, 'Pending', NULL),
(68, 1325.00, 'Paid', '2024-06-26'),
(69, 760.00, 'Cancelled', NULL),
(70, 1085.00, 'Paid', '2024-06-27'),
(71, 880.00, 'Pending', NULL),
(72, 1380.00, 'Paid', '2024-06-28'),
(73, 840.00, 'Cancelled', NULL),
(74, 970.00, 'Paid', '2024-06-29'),
(75, 890.00, 'Pending', NULL);

INSERT INTO Visits (appointment_id, diagnosis, treatment, visit_date, duration_days) VALUES
(231, 'Flu', 'Prescribed antiviral medication', '2024-06-01', 2),
(232, 'Back Pain', 'Physiotherapy recommended', '2024-06-02', 5),
(233, 'Hypertension', 'Blood pressure monitoring and medication', '2024-06-03', 7),
(234, 'Diabetes Checkup', 'Adjusted insulin dosage', '2024-06-04', 1),
(235, 'Fever', 'Paracetamol and rest advised', '2024-06-05', 3),
(236, 'Migraine', 'Prescribed painkillers and follow-up', '2024-06-06', 2),
(237, 'Fracture', 'X-ray done, cast applied', '2024-06-07', 14),
(238, 'Asthma', 'Inhaler prescribed, advised precautions', '2024-06-08', 4),
(239, 'Skin Rash', 'Topical ointment prescribed', '2024-06-09', 3),
(240, 'Allergy', 'Antihistamines and avoidance plan', '2024-06-10', 1),

(241, 'Ear Infection', 'Antibiotics for 5 days', '2024-06-11', 5),
(242, 'Eye Redness', 'Eye drops prescribed', '2024-06-12', 3),
(243, 'Stomach Pain', 'Ultrasound done, prescribed diet', '2024-06-13', 2),
(244, 'Thyroid Check', 'Thyroxine dose adjusted', '2024-06-14', 7),
(245, 'Knee Pain', 'Physiotherapy and pain relief meds', '2024-06-15', 6),
(246, 'Acidity', 'Antacids advised, dietary control', '2024-06-16', 2),
(247, 'Cold & Cough', 'Syrup and steam inhalation', '2024-06-17', 2),
(248, 'Burns', 'Dressing applied, antibiotics given', '2024-06-18', 10),
(249, 'Depression', 'Referred to mental health specialist', '2024-06-19', 15),
(250, 'Vitamin Deficiency', 'Supplements prescribed', '2024-06-20', 5),

(251, 'Injury', 'Dressing and tetanus shot', '2024-06-21', 1),
(252, 'Sore Throat', 'Salt water gargle, antibiotics', '2024-06-22', 3),
(253, 'UTI', 'Antibiotic course for 5 days', '2024-06-23', 5),
(254, 'High Cholesterol', 'Statin started, diet plan', '2024-06-24', 30),
(255, 'Low Blood Pressure', 'Fluids and rest advised', '2024-06-25', 2),
(256, 'Weight Gain', 'Referred to dietician', '2024-06-26', 10),
(257, 'Anxiety', 'CBT therapy sessions scheduled', '2024-06-27', 21),
(258, 'PCOS', 'Ultrasound and hormonal therapy', '2024-06-28', 15),
(259, 'Gastritis', 'PPI therapy and diet control', '2024-06-29', 7),
(260, 'Constipation', 'Fiber supplements and hydration', '2024-06-30', 4),

(261, 'Insomnia', 'Melatonin and relaxation tips', '2024-07-01', 7),
(262, 'Ear Wax', 'Irrigation performed', '2024-07-02', 1),
(263, 'Toothache', 'Referred to dentist', '2024-07-03', 2),
(264, 'Obesity', 'Weight loss counseling', '2024-07-04', 30),
(265, 'Tonsillitis', 'Antibiotics for 7 days', '2024-07-05', 7),
(266, 'Sprain', 'Compression bandage and rest', '2024-07-06', 5),
(267, 'Menstrual Cramps', 'Painkillers and heat therapy', '2024-07-07', 2),
(268, 'Fatigue', 'Blood tests ordered', '2024-07-08', 1),
(269, 'Cold', 'Advised rest and fluids', '2024-07-09', 2),
(270, 'Acne', 'Topical retinoid therapy', '2024-07-10', 10),

(271, 'Cough', 'Expectorant prescribed', '2024-07-11', 3),
(272, 'Joint Pain', 'X-ray and anti-inflammatory meds', '2024-07-12', 7),
(273, 'Sinusitis', 'Nasal spray and antibiotics', '2024-07-13', 5),
(274, 'Dengue', 'Hospitalization and IV fluids', '2024-07-14', 10),
(275, 'Dehydration', 'ORS and rest', '2024-07-15', 1),
(276, 'Bloating', 'Prescribed probiotics', '2024-07-16', 3),
(277, 'Migraine', 'Preventive meds started', '2024-07-17', 15),
(278, 'High Fever', 'Blood tests and antibiotics', '2024-07-18', 4),
(279, 'Hair Loss', 'Minoxidil and diet changes', '2024-07-19', 30),
(280, 'IBS', 'Antispasmodics and diet chart', '2024-07-20', 20);

INSERT INTO Billing (visit_id, amount, payment_status, paid_on) VALUES
(76, 1150.00, 'Paid', '2024-07-01'),
(77, 980.00, 'Pending', NULL),
(78, 1250.00, 'Paid', '2024-07-02'),
(79, 875.00, 'Cancelled', NULL),
(80, 1100.00, 'Paid', '2024-07-03'),
(81, 920.00, 'Pending', NULL),
(82, 1380.00, 'Paid', '2024-07-04'),
(83, 760.00, 'Cancelled', NULL),
(84, 1450.00, 'Paid', '2024-07-05'),
(85, 870.00, 'Pending', NULL),

(86, 1320.00, 'Paid', '2024-07-06'),
(87, 990.00, 'Pending', NULL),
(88, 1175.00, 'Paid', '2024-07-07'),
(89, 740.00, 'Cancelled', NULL),
(90, 1085.00, 'Paid', '2024-07-08'),
(91, 960.00, 'Pending', NULL),
(92, 1200.00, 'Paid', '2024-07-09'),
(93, 810.00, 'Cancelled', NULL),
(94, 1275.00, 'Paid', '2024-07-10'),
(95, 940.00, 'Pending', NULL),

(96, 1300.00, 'Paid', '2024-07-11'),
(97, 990.00, 'Pending', NULL),
(98, 1400.00, 'Paid', '2024-07-12'),
(99, 880.00, 'Cancelled', NULL),
(100, 1190.00, 'Paid', '2024-07-13'),
(101, 1025.00, 'Pending', NULL),
(102, 1350.00, 'Paid', '2024-07-14'),
(103, 890.00, 'Cancelled', NULL),
(104, 1130.00, 'Paid', '2024-07-15'),
(105, 950.00, 'Pending', NULL),

(106, 1225.00, 'Paid', '2024-07-16'),
(107, 995.00, 'Pending', NULL),
(108, 1280.00, 'Paid', '2024-07-17'),
(109, 810.00, 'Cancelled', NULL),
(110, 1165.00, 'Paid', '2024-07-18'),
(111, 930.00, 'Pending', NULL),
(112, 1395.00, 'Paid', '2024-07-19'),
(113, 850.00, 'Cancelled', NULL),
(114, 1420.00, 'Paid', '2024-07-20'),
(115, 910.00, 'Pending', NULL),

(116, 1375.00, 'Paid', '2024-07-21'),
(117, 990.00, 'Pending', NULL),
(118, 1260.00, 'Paid', '2024-07-22'),
(119, 830.00, 'Cancelled', NULL),
(120, 1180.00, 'Paid', '2024-07-23'),
(121, 970.00, 'Pending', NULL),
(122, 1335.00, 'Paid', '2024-07-24'),
(123, 790.00, 'Cancelled', NULL),
(124, 1110.00, 'Paid', '2024-07-25'),
(125, 945.00, 'Pending', NULL);

-- these are the use-case queries
-- Query 1: Most Common Diagnoses
SELECT 
    diagnosis,
    COUNT(*) AS occurrence_count
FROM Visits
GROUP BY diagnosis
ORDER BY occurrence_count DESC
LIMIT 5;

-- Query 2: Common Diagnoses by Gender
SELECT 
    p.gender,
    v.diagnosis,
    COUNT(*) AS count
FROM Visits v
JOIN Appointments a ON v.appointment_id = a.appointment_id
JOIN Patients p ON a.patient_id = p.patient_id
GROUP BY p.gender, v.diagnosis
ORDER BY count DESC;

-- Query 3: Doctor with Highest Patient Load
SELECT 
    d.doctor_id,
    d.name,
    COUNT(DISTINCT a.patient_id) AS total_patients
FROM Appointments a
JOIN Doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.doctor_id, d.name
ORDER BY total_patients DESC
LIMIT 5;

-- Query 4: Average Hospitalization Duration by Diagnosis
SELECT 
    diagnosis,
    ROUND(AVG(duration_days), 2) AS avg_stay_days
FROM Visits
GROUP BY diagnosis
ORDER BY avg_stay_days DESC
LIMIT 10;

-- Query 5: Pending Billing Count by Doctor
SELECT 
    d.doctor_id,
    d.name,
    COUNT(*) AS pending_bills
FROM Billing b
JOIN Visits v ON b.visit_id = v.visit_id
JOIN Appointments a ON v.appointment_id = a.appointment_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
WHERE b.payment_status = 'Pending'
GROUP BY d.doctor_id, d.name
ORDER BY pending_bills DESC;

-- Query 6: Identify Patients with Abnormal Vitals (BP > 140 or Temp > 100)
SELECT 
    p.patient_id,
    p.name,
    v.bp,
    v.temperature,
    v.recorded_on
FROM Vitals v
JOIN Patients p ON v.patient_id = p.patient_id
WHERE v.bp > 140 OR v.temperature > 100;

-- Query 7: Total Revenue from Paid Bills
SELECT 
    SUM(amount) AS total_revenue
FROM Billing
WHERE payment_status = 'Paid';

-- Query 8: Visit History of a Patient (for patient_id = 10)
SELECT 
    v.visit_date,
    v.diagnosis,
    v.treatment,
    b.amount,
    b.payment_status
FROM Visits v
JOIN Appointments a ON v.appointment_id = a.appointment_id
JOIN Billing b ON v.visit_id = b.visit_id
WHERE a.patient_id = 10
ORDER BY v.visit_date DESC;

-- Creating Views from Advanced Queries
--  View 1: Top Diagnoses Summary
CREATE VIEW view_top_diagnoses AS
SELECT 
    diagnosis,
    COUNT(*) AS occurrence_count
FROM Visits
GROUP BY diagnosis
ORDER BY occurrence_count DESC;

-- View 2: Diagnosis Count by Gender
CREATE VIEW view_diagnosis_by_gender AS
SELECT 
    p.gender,
    v.diagnosis,
    COUNT(*) AS count
FROM Visits v
JOIN Appointments a ON v.appointment_id = a.appointment_id
JOIN Patients p ON a.patient_id = p.patient_id
GROUP BY p.gender, v.diagnosis;

-- View 3: Doctor Patient Load
CREATE VIEW view_doctor_patient_load AS
SELECT 
    d.doctor_id,
    d.name,
    COUNT(DISTINCT a.patient_id) AS total_patients
FROM Appointments a
JOIN Doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.doctor_id, d.name;

-- View 4: Unpaid Bills by Doctor
CREATE VIEW view_pending_bills_by_doctor AS
SELECT 
    d.doctor_id,
    d.name,
    COUNT(*) AS pending_bills
FROM Billing b
JOIN Visits v ON b.visit_id = v.visit_id
JOIN Appointments a ON v.appointment_id = a.appointment_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
WHERE b.payment_status = 'Pending'
GROUP BY d.doctor_id, d.name;

-- Triggers & Stored Procedures

CREATE TABLE Vitals_Alerts (
    alert_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    recorded_on DATETIME,
    alert_type VARCHAR(100),
    alert_message TEXT
);

-- Trigger: Flag Critical Vitals (BP > 150 OR Temp > 102)
DELIMITER $$

CREATE TRIGGER trg_vitals_alert
AFTER INSERT ON Vitals
FOR EACH ROW
BEGIN
    IF NEW.bp > 140 THEN
        INSERT INTO Vitals_Alerts(patient_id, recorded_on, alert_type, alert_message)
        VALUES (NEW.patient_id, NEW.recorded_on, 'High BP', CONCAT('BP is ', NEW.bp));
    END IF;

    IF NEW.temperature > 100 THEN
        INSERT INTO Vitals_Alerts(patient_id, recorded_on, alert_type, alert_message)
        VALUES (NEW.patient_id, NEW.recorded_on, 'High Temperature', CONCAT('Temp is ', NEW.temperature));
    END IF;
END$$

DELIMITER ;

-- testing the trigger
INSERT INTO Vitals (patient_id, recorded_on, bp, heart_rate, temperature)
VALUES (5, '2024-07-02 08:30:00', 130, 88, 100.5);  -- This should now trigger an alert

SELECT * FROM Vitals_Alerts WHERE patient_id = 5;

-- Stored Procedure to Get Patient Visit Summary
DELIMITER $$

CREATE PROCEDURE sp_patient_visit_summary(IN p_id INT)
BEGIN
    SELECT 
        v.visit_date,
        v.diagnosis,
        v.treatment,
        b.amount,
        b.payment_status
    FROM Visits v
    JOIN Appointments a ON v.appointment_id = a.appointment_id
    LEFT JOIN Billing b ON v.visit_id = b.visit_id
    WHERE a.patient_id = p_id
    ORDER BY v.visit_date DESC;
END$$

DELIMITER ;

-- calling the stored procedure
CALL sp_patient_visit_summary(10);
