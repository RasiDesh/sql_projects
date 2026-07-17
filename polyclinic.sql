-- creating database and initializing 
CREATE DATABASE polyclinic;
USE PolyClinic;

-- creating tables
CREATE TABLE Patient(
p_id VARCHAR(10) PRIMARY KEY, name VARCHAR(100) NOT NULL,
dob DATE, email VARCHAR(100) NOT NULL, phone_no VARCHAR(10) );

CREATE TABLE Doctor( 
d_id VARCHAR(10) PRIMARY KEY, name VARCHAR(50) NOT NULL, 
degree VARCHAR(50), specialization VARCHAR(50), email VARCHAR(50) UNIQUE,
contact VARCHAR(10) );

CREATE TABLE Pharmacy(
code_no VARCHAR(10) PRIMARY KEY, med_name VARCHAR(100) NOT NULL, 
quantity INT, price DECIMAL(10,2) );

CREATE TABLE Pathology(
t_id VARCHAR(10) PRIMARY KEY, t_name VARCHAR(100) UNIQUE, result TEXT,
date DATE );

-- inserting records in tables 
INSERT INTO Patient(p_id, name, dob, email, phone_no) VALUES 
('1001', "Rasika Deshpande", '2006-07-27', 'rasikad@pqr.com', '8237827369'),
('1002', "Kavita Deshpande", '1980-01-05', 'kavitad@pqr.com', '9552451959'),
('1003', "Sanjay Deshpande", '1973-11-17', 'sanjayd@pqr.com', '9922409396'),
('1004', "Aditya Mehta", '2001-09-10', 'adityam@pqr.com', '9123405678'),
('1005', "Pooja Nair", '1997-12-22', 'poojan@pqr.com', '9988123456'),
('1006', "Rohan Sharma", '2003-09-15', 'rohans@pqr.com', '4085230952'),
('1007', "Swati Shinde", '1999-07-21', 'sshinde@pqr.com', '6702398154'),
('1008', "Aarti Dixit", '1970-06-18', 'aartid@pqr.com', '8502166823'),
('1009', "Prasad Varma", '1990-03-12', 'prasadv@pqr.com', '9023456781'),
('1010', "Ananya Kulkarni", '2020-02-14', 'veenak@pqr.com', '9876543210');
SELECT  * FROM Patient;

INSERT INTO Doctor(d_id, name, degree, specialization, email, contact) VALUES
('10001', "Dr Neha Sharma", "MBBS, MD", "Pediatrics", 'nehas@abc.in', '7029841899'),
('10002', "Dr Priya Naik", "MBBS, MD", "Pediatrics", 'priyan@abc.in', '6908123429'),
('10003', "Dr Arjun Mehra", "BDS, DMD", "Dentist", 'arjunm@abc.in', '8193503411'),
('10004', "Dr Sameer Singh", "BDS, DDS", "Dentist, Orthodontics", 'sameers@abc.in', '2137045968'),
('10005', "Dr Kavya Joshi", "MBBS, DM", "Neurology", 'kavyaj@abc.in', '5592104114'),
('10006', "Dr Manish Verma", "MBBS, DM", "Neurology", 'manishv@abc.in', '4423156089'),
('10007', "Dr Ritu Kulkarni", "MBBS, DM", "Cardiology", 'rituk@abc.in', '7102938466'),
('10008', "Dr Sandeep Patil", "MBBS, DM", "Cardiology", 'sandeep@abc.in', '6641359728'),
('10009', "Dr Meera Desai", "MBBS, MS", "Gynecology", 'meerad@abc.in', '6810432651'),
('10010', "Dr Anjali Rao", "MBBS, MS", "Gynecology", 'anjalir@abc.in', '9938102620'),
('10011', "Dr Vikram Shetty", "MBBS, MS", "Ophthalmology", 'vikrams@abc.in', '3360987210'),
('10012', "Dr Snehal Patankar", "MBBS, MS", "ENT", 'snehalp@abc.in', '7760841294'),
('10013', "Dr Rohini Chavan", "MBBS, MS", "Orthopedic", 'rohinic@abc.in', '1020495331'),
('10014', "Dr Ajay Bhosale", "MBBS, DNB, DDV", "Dermatology", 'ajayb@abc.in', '4480625918'),
('10015', "Dr Shalini Iyer", "MBBS", "General Medicine, Physician", 'shalinii@abc.in', '5582104932');
SELECT * FROM Doctor;

INSERT INTO Pharmacy(code_no, med_name, quantity, price) VALUES
('M001', "Paracetamol 500mg", 120, 100.55),
('M002', "Adulsa Cough Syrup", 180, 84.43),
('M003', "Intas Amtas 2.5mg", 10, 43),
('M004', "Supradyn tablets", 90, 68),
('M005', "Maxtra Syrup 60ml", 100, 119),
('M006', "Refresh tears", 110, 500),
('M007', "Cansoft", 50, 129.23),
('M008', "Dersol tube", 60, 143.65),
('M009', "Amoxicillin 250mg", 80, 12.75),
('M010', "Hexidine Mouth wash 160ml", 70, 100.75),
('M011', "Trichoton Syrup 150ml", 40, 120.50),
('M012', "BP FREE 40mg", 190, 58.20);
SELECT * FROM Pharmacy;

INSERT INTO Pathology(t_id, t_name, result, date) VALUES
('T001', "Complete Blood Count (CBC)", "Hemoglobin: 12.5 g/dL, Normal", '2025-02-01'),
('T002', "Hormone Profile", "FSH: 6 IU/L, LH: 8 IU/L", '2025-06-21'),
('T003', "ECG", "Normal sinus rhythm", '2025-10-8'),
('T004', "Allergy Panel (IgE)", "Elevated IgE levels", '2025-07-12'),
('T005', "Vitamin B12", " Normal levels detected, adequate Vitamin B12", '2025-03-10'),
('T006', "Skin Biopsy", "No malignant cells detected", '2025-08-15'),
('T007',"Dental X-Ray (OPG)","Impacted wisdom tooth detected",'2025-05-05'),
('T008', "Lipid Profile", "LDL: 110 mg/dL, HDL: 45 mg/dL", '2025-08-09'),
('T009', "X-Ray Chest", "No abnormality detected, lungs clear", '2025-04-19'),
('T010', "COVID-19 RT-PCR", "Negative", '2020-03-19');
SELECT * FROM Pathology;


-- DDL statements 
-- Create 
CREATE TABLE Demo (id INT);

-- Alter
ALTER TABLE Demo ADD PRIMARY KEY( id); -- adding primary key
ALTER TABLE Demo DROP PRIMARY KEY; -- dropping primary key

ALTER TABLE Patient ADD address TEXT; -- adding column
ALTER TABLE Pathology ADD p_id VARCHAR(10); -- adding column

ALTER TABLE Pathology ADD CONSTRAINT fk_patient FOREIGN KEY (p_id) REFERENCES Patient(p_id); -- adding foreign key

ALTER TABLE Patient RENAME COLUMN phone_no TO contact; -- renaming column
ALTER TABLE Pathology RENAME COLUMN date TO date_of_testing;-- renaming column

ALTER TABLE Patient MODIFY name CHAR(100); -- modifying datatype

-- Drop
DROP TABLE demo;

-- Constraints
-- Unique
ALTER TABLE Pharmacy ADD CONSTRAINT UC_med_name UNIQUE(med_name);

-- Check
ALTER TABLE Pharmacy ADD CONSTRAINT quancheck CHECK (quantity >= 10);
SELECT CONSTRAINT_NAME, CHECK_CLAUSE
   FROM INFORMATION_SCHEMA.CHECK_CONSTRAINTS
   WHERE CONSTRAINT_NAME = 'quancheck';

-- Not Null
ALTER TABLE Doctor MODIFY degree VARCHAR(50) NOT NULL;

-- DML statements
-- Insert
INSERT INTO Patient(p_id, name, dob, email, contact) VALUES
('1011', "Shardul Pathak", '2013-12-23', 'shardulp@pqr.com', '2366379102');
SELECT * FROM Patient;

-- Select
SELECT * FROM Pharmacy WHERE quantity > 50;

-- Delete
DELETE FROM Patient WHERE p_id = 1010;

-- Update
UPDATE Patient SET address = 'Bavdhan, Pune' WHERE p_id = 1001;
UPDATE Patient SET address = 'Bavdhan, Pune' WHERE p_id = 1002;
UPDATE Patient SET address = 'Bavdhan, Pune' WHERE p_id = 1003;
UPDATE Patient SET address = 'Bavdhan, Pune' WHERE p_id = 1004;
UPDATE Patient SET address = 'Warje, Pune' WHERE p_id = 1005;
UPDATE Patient SET address = 'Mumbai, Maharashtra' WHERE p_id = 1006;
UPDATE Patient SET address = 'Mumbai, Maharashtra' WHERE p_id = 1007;
UPDATE Patient SET address = 'Kolhapur, Maharashtra' WHERE p_id = 1008;
UPDATE Patient SET address = 'Nashik, Maharashtra' WHERE p_id = 1009;
UPDATE Patient SET address = 'Satara, Maharashtra' WHERE p_id = 1011;
SELECT * FROM Patient;

-- OR 
UPDATE Patient
SET address = CASE p_id
    WHEN '1001' THEN 'Bavdhan, Pune'
    WHEN '1002' THEN 'Bavdhan, Pune'
    WHEN '1003' THEN 'Bavdhan, Pune'
    WHEN '1004' THEN 'Bavdhan, Pune'
    WHEN '1005' THEN 'Warje, Pune'
    WHEN '1006' THEN 'Mumbai, Maharashtra'
    WHEN '1007' THEN 'Mumbai, Maharashtra'
    WHEN '1008' THEN 'Kolhapur, Maharashtra'
    WHEN '1009' THEN 'Nashik, Maharashtra'
    WHEN '1011' THEN 'Satara, Maharashtra'
END
WHERE p_id IN ('1001','1002','1003','1004','1005','1006','1007','1008','1009','1011');

-- Index operations
-- Create index
CREATE INDEX idx_name ON Patient(name);

-- Verification: shows 'idx_name' details vertically
SHOW INDEX FROM Patient \G

-- Create Unique index
CREATE UNIQUE INDEX idx_doctor_name ON Doctor(name);

-- Verification: shows 'non-unique: 0' indicating it is unique
SHOW INDEX FROM Doctor \G

-- 3. Drop index
DROP INDEX idx_doctor_name ON Doctor;

-- Relational operators
-- 1.Greater than
SELECT * FROM Pharmacy WHERE price > 80;

-- 2.Less than
SELECT * FROM Pharmacy WHERE price < 50;

-- 3. Equal to
SELECT * FROM Pharmacy WHERE quantity = 90;

-- 4.Greater than equal to
SELECT * FROM Pharmacy WHERE quantity >= 100;

-- 5.Less than equal to
SELECT * FROM Pharmacy WHERE quantity <= 40;
SELECT * FROM Pharmacy WHERE quantity <= 80;

-- 6.Not equal to
SELECT * FROM Pharmacy WHERE price <> 500;

-- Boolean operators
-- AND
SELECT * FROM Patient WHERE dob > '2003-01-01' AND address = "Mumbai, Maharashtra";

-- OR
SELECT * FROM Patient WHERE address = "Mumbai, Maharashtra" OR address = "Satara, Maharashtra";

-- NOT
SELECT * FROM Patient WHERE NOT email = 'sshinde@pqr.com';

-- Pattern matching
-- 1.Matches any string with %word% format
-- word = Pediatrics
SELECT * FROM Doctor WHERE specialization LIKE '%Pediatrics%';

-- 2. Matches any string with %word format
-- word = Physician
SELECT * FROM Doctor WHERE specialization LIKE '%Physician';

-- 3. Matches any string with word% format
-- word = D
SELECT * FROM Doctor WHERE specialization LIKE 'D%';

-- 4.Matches exactly characters given in underscore with _____
SELECT * FROM Doctor WHERE degree LIKE '______MS';

-- Arithmetic operators
-- Addition
 SELECT med_name, price + 20 FROM Pharmacy;

-- Subtraction
SELECT med_name, price - 10 FROM Pharmacy;

-- Multiplication
SELECT med_name, quantity * 20 FROM Pharmacy;

-- Division
mysql> SELECT med_name, quantity / 10 FROM Pharmacy;

-- Modulo
SELECT code_no, med_name, quantity, 
    CASE
        WHEN quantity % 2 = 0 THEN 'Even'
        ELSE 'Odd'
    END AS quantity_type
FROM Pharmacy;

SELECT code_no, med_name, price,
   CASE
     WHEN price % 2 = 0 THEN 'Even'
     ELSE 'Odd'
   END AS price_type
FROM Pharmacy;

