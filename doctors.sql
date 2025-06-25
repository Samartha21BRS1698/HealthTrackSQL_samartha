CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE
);
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