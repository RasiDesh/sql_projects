-- Creation of database
CREATE DATABASE transactions;
USE transactions;

-- Creation of tables
CREATE TABLE paytable (
  customer_id INT PRIMARY KEY UNIQUE,
  customer VARCHAR(100),
  mode VARCHAR(50) NOT NULL, amount DECIMAL(10,2), payment_date DATE, city VARCHAR(100) NOT NULL );

-- Insertion of records
INSERT INTO paytable (customer_id, customer, mode, amount, payment_date, city) VALUES
('101', "Olivia Barrett", "Netbanking", 200 , '2025-07-15', "Portland"),
('102', "Ethan Sinclair", "Credit Card", 100 , '2025-02-01', "Miami"),
('103', "Maya Hernandez", "Credit Card", 300 , '2025-05-11', "Seattle"),
('104', "Liam Donovan", "Netbanking", 400 , '2025-04-05', "Denver"),
('105', "Sophia Nguyen", "Credit Card", 500 , '2025-03-09', "New Orleans"),
('106', "Caleb Foster", "Debit Card", 400 , '2025-06-19', "Minneapolis"),
('107', "Ava patel", "Debit Card", 700 , '2025-10-10', "Phoenix"),
('108', "Lucas Carter", "Netbanking", 600 , '2025-08-16', "Boston"),
('109', "Isabella Martinez", "Netbanking", 800 , '2025-01-20', "Nashville"),
('110', "Jackson Brooks", "Credit Card", 300 , '2025-09-25', "Boston");

SELECT * FROM paytable; -- to print the table

-- Stored Procedures
-- 1.
DELIMITER &&
CREATE PROCEDURE payment_mode ()
 BEGIN
   SELECT * FROM paytable WHERE mode = "Credit Card";
   SELECT COUNT(customer_id) AS Payers FROM paytable;
 END &&

DELIMITER ;
CALL payment_mode(); -- calling the stored procedure

-- 2.
DELIMITER $$
CREATE PROCEDURE netbanking()
  BEGIN
      SELECT * FROM paytable WHERE mode = "Netbanking";
  END$$

DELIMITER ;
CALL netbanking();

-- Stored Functions
-- 1.
DELIMITER //
CREATE FUNCTION max_payment() RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
       DECLARE max_amt DECIMAL(10, 2);
       SELECT MAX(amount) INTO max_amt FROM paytable;
       RETURN max_amt;
END //

DELIMITER ;
SELECT max_payment(); -- calling stored functions

-- 2.
DELIMITER %%
CREATE FUNCTION min_payment() RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE min_amt DECIMAL(10, 2);
    SELECT MIN(amount) INTO min_amt FROM paytable;
    RETURN min_amt;
END %%

DELIMITER ;
SELECT min_payment();

-- Triggers
-- Trigger 1: Before insert
delimiter //
DROP TRIGGER IF EXISTS validate_amount //

CREATE TRIGGER validate_amount
BEFORE INSERT ON paytable
FOR EACH ROW
 BEGIN
     IF NEW.amount <= 0 THEN
       SIGNAL SQLSTATE '45000'
          SET MESSAGE_TEXT ='Amount must be greater than zero';
     END IF;
  END;
//

-- Test Trigger 1
delimiter ;
INSERT INTO paytable (customer_id, customer, mode, amount, payment_date, city) VALUES( 201, "Marie Robins", "Credit Card", 100.00, '2025-11-01', "Chicago");
-- error message will appear

-- Trigger 2: After Update
-- Create audit table
CREATE TABLE paytable_audit (
   audit_id INT AUTO_INCREMENT PRIMARY KEY,
   customer_id INT, customer VARCHAR(50), old_amount DECIMAL(10,2),new_amount DECIMAL(10,2), change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger
delimiter //
DROP TRIGGER IF EXISTS log_payment_update //

CREATE TRIGGER log_payment_update
  AFTER UPDATE ON paytable
  FOR EACH ROW
  BEGIN
     INSERT INTO paytable_audit (customer_id, customer, old_amount, new_amount, change_date)
       VALUES (OLD.customer_id, OLD.customer, OLD.amount, NEW.amount, NOW());
   END;
//

-- Test Trigger 2
delimiter ;
UPDATE paytable
  SET amount = 350.00
  WHERE customer_id = 103 AND customer = 'Maya Hernandez';




