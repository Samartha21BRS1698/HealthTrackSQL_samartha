CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    gender ENUM('M', 'F', 'Other') NOT NULL,
    address TEXT,
    phone VARCHAR(15) UNIQUE
);

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
