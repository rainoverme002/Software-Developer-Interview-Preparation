-- Select all data of the transaction
SELECT * FROM transactions

-- Select email from id 1
SELECT email FROM transactions WHERE id = 1

-- Select transaction where the email = tommy@mail.com
SELECT * FROM transactions WHERE email like "tommy@mail.com"

-- Select distinct email only
SELECT DISTINCT email FROM transactions

-- Select the transaction_no and person_id where email = tommy@mail.com
SELECT transaction_no, person_id FROM transactions WHERE email like "tommy@mail.com"

-- Select the address where the transaction_no 10001 and 10003
SELECT address FROM transactions WHERE transaction_no IN(10001,10003)

-- Select the transactions_no WHERE address contain "pramuka"
SELECT transaction_no FROM transactions WHERE address LIKE "%Pramuka%"

-- Select the address WHERE transaction_no > 10002
SELECT address FROM transactions WHERE transaction_no > 10002

-- Select the transaction_no, address WHERE transaction_no between 10001 and 10004
SELECT transaction_no, address FROM transactions WHERE transaction_no > 10001 AND transaction_no < 10004

-- Select the remaining and original amount and make new column that discount 20% of the remaining and original amount in #temporary_database
SELECT remaining, original_amount, remaining*20% AS discounted_remaining , original_amount*20% AS discounted_original_amount INTO #temporary_database FROM transactions

-- Update the email of the person_id 1
UPDATE transactions
SET email = "tommy@gmail.com"
WHERE email = "tommy@mail.com"

-- Select and count the remaining
SELECT COUNT(remaining) FROM transactions

-- Select Average of the remaining
SELECT AVG(remaining) FROM transactions

-- Select and Sum the remaining
SELECT SUM(remaining) FROM transactions

-- Select and seek for the min value of the remaining
SELECT MIN(remaining) FROM transactions

-- Select and seek for the max value of the remaining
SELECT MAX(remaining) FROM transactions

-- Print and Concat two strings
PRINT CONCAT('String 1', ' String 2')

-- Select and Give only five char of string from left
SELECT email, LEFT(email, 5) FROM transactions

-- Select and Give only 3 char of the string from the right
SELECT email, RIGHT(email, 3) FROM transactions

-- Select and Substring from the third char, as much as 5 number
SELECT email, SUBSTRING(email, 3, 5) FROM transactions

-- Select and get the length of the string
SELECT email, LEN(email) FROM transactions







