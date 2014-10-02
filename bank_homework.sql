-- In case there is already a bank_homework database, drop it
DROP DATABASE IF EXISTS bank_homework;

-- Create a bank_homework database
CREATE DATABASE bank_homework;

-- Connect to the bank_homework databases
\c bank_homework

-- Create a payments table
--  The table should have columns of id, created_at, amount, payer_name,
--  recipient_name, and description with the appropriate datatypes

CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  created_at DATE,
  amount DECIMAL,
  payer_name VARCHAR(80),
  recipient_name VARCHAR(80),
  description TEXT
);

-- Alter the payments table, add the column of `zipcode`
-- to specify where the transaction was made
ALTER TABLE payments
  ADD zipcode INTEGER;

-- Insert 20 rows into the payments table
-- The first of these payments should be deposits
-- try to keep the accounts positive and have at least three different payers.
\echo 'Payment 1'
INSERT INTO payments 
  (created_at, amount, payer_name, recipient_name, description, zipcode)
  VALUES
  ('2014-10-01',4500.00,'Mr. Spence','Mr. Wharff','Stages Learning Website design and development',02138);

\echo 'Payment 2'
INSERT INTO payments 
  (created_at, amount, payer_name, recipient_name, description, zipcode)
  VALUES
  ('2014-09-18',1419.18,'C4','Mr. Wharff','Direct Deposit',02494);

\echo 'Payment 3'
INSERT INTO payments 
  (created_at, amount, payer_name, recipient_name, description, zipcode)
  VALUES
  ('2014-09-06',1419.18,'C4','Mr. Wharff','Direct Deposit',02494);

\echo 'Payment 4'
INSERT INTO payments 
  (created_at, amount, payer_name, recipient_name, description, zipcode)
  VALUES
  ('2014-08-25',1419.18,'C4','Mr. Wharff','Direct Deposit',02494);

\echo 'Payment 5'
INSERT INTO payments 
  (created_at, amount, payer_name, recipient_name, description, zipcode)
  VALUES
  ('2014-08-04',2500.00,'Mr. Spence','Mr. Wharff','EMS Contract Work',02138);

-- You receive notice that the payment with id of 4 is $10 too low.
-- Alter that row so that it is corrected
UPDATE payments
  SET amount =  amount + 10
  WHERE id = 4;

-- Delete all payments with an amount under $2
DELETE FROM payments
WHERE amount < 2;

-- Select all entries from the payments table
SELECT * FROM payments;

-- In a single query, output all payments ordered from the largest to the smallest
SELECT * FROM payments 
  ORDER BY amount DESC;

-- In a single query, output the names of all distinct recipients
SELECT DISTINCT recipient_name
  FROM payments;

-- In a single query, select all payments created in the past week
SELECT * FROM payments WHERE created_at > current_date - 7;

  -- WHERE date >= curdate() - INTERVAL DAYOFWEEK(curdate())+6 DAY
-- AND date < curdate() - INTERVAL DAYOFWEEK(curdate())-1 DAY

-- In a single query, select all payments with a blank description
SELECT * FROM payments
  WHERE description = '';

-- In a single query, select all payments matching the name of one of the payers (choose any single one)
SELECT * FROM payments
  WHERE payer_name = 'Mr. Spence';


















