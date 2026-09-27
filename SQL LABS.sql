/* 
    LAB 1
*/

create database bankingdb;
use bankingdb;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AccountCreationDate DATE
);
-- insert values
insert into customers (CustomerID,FirstName,LastName,Email,Phone)
values
(1001,"Mangesh","Kunte","mangeshkunte523@gmail.com",9834139071);
-- fetch data from table
select * from customers;

/* 
lab 2

*/
Create database Banking_DB;

Use Banking_DB;

Create table Customers(
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- Insert values

select * from Customers;

create table accounts (
	account_id int,
    account_type varchar(20),
    balance decimal(10,2)
    );
    
create table transactions (
	transaction_id int,
    transaction_date date,
    amount decimal(10,2),
    transaction_type varchar(20)
    );
    
    CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);
    
CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);


CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

-- alter add
ALTER TABLE Customers
ADD DateOfBirth DATE;

select * from customers;

-- alter modify
ALTER TABLE Customers
MODIFY Phone VARCHAR(20);

select * from customers;

-- alter + add constraint + check 
ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

select * from accounts;

-- Task 3: Delete Tables using DROP
DROP TABLE AccountBranches;

-- Task 4: Apply Constraints for Banking Business Rules
ALTER TABLE Customers
ADD PRIMARY KEY (CustomerID);

ALTER TABLE Accounts
ADD CustomerID INT;

alter table Branches
add primary key (BranchID);

alter table Accounts
add primary key (Account_ID);


-- connect account and customer id
ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE Customers
MODIFY FirstName VARCHAR(50) NOT NULL;

ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);

-- Accounts connect with branch
alter table Accounts
add BranchID int;

alter table Accounts
add constraint FK_Accounts_Branch
foreign key (BranchID)
references Branches(BranchID);

-- Transaction connect with Accounts
alter table Transactions
add AccountID int;

alter table Transactions
add constraint FK_Transaction_Account
foreign key (AccountID)
references Accounts(account_ID); 
select * from Accounts;
select * from Transactions;

-- Loans connect with Customers
alter table Loans 
add CustomerID int;

alter table Loans
add constraint FK_Loans_Customers
foreign key (CustomerID)
references Customers(CustomerID);

------------------------------------------------------------------------------------------------------------
/* 
	-----  lab 3  -------------
*/

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','1998-04-15');

INSERT INTO Accounts
(Account_ID, CustomerID, Account_Type, Balance)
VALUES
(201,101,'Savings',25000);

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(102, 'Priya', 'Patil', 'priya@gmail.com', '9988776655', '2000-09-20'),
(103, 'Amit', 'Patel', 'amit.patel@gmail.com', '9876500001', '1995-06-18'),
(104, 'Sneha', 'Joshi', 'sneha.joshi@gmail.com', '9876500002', '1997-09-12'),
(105, 'Rohan', 'Kulkarni', 'rohan.k@gmail.com', '9876500003', '1993-11-25');

INSERT INTO Accounts
(Account_ID, CustomerID, Account_Type, Balance)
VALUES
(202, 102, 'Current', 40000),
(203, 103, 'Savings', 35000),
(204, 104, 'Current', 60000),
(205, 105, 'Savings', 45000);

INSERT INTO Transactions
(Transaction_ID, AccountID, Transaction_Date, Amount, Transaction_Type)
VALUES
(301, 201, '2025-05-10', 5000, 'Deposit'),
(302, 202, '2025-05-11', 2500, 'Withdraw'),
(303, 203, '2025-05-12', 10000, 'Deposit'),
(304, 204, '2025-05-13', 3000, 'Withdraw'),
(305, 205, '2025-05-14', 7000, 'Deposit');

INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
(1, 'Mumbai Branch', 'Andheri, Mumbai', '0221111111'),
(2, 'Pune Branch', 'Shivaji Nagar, Pune', '0202222222'),
(3, 'Nashik Branch', 'College Road, Nashik', '0253222222'),
(4, 'Nagpur Branch', 'Sitabuldi, Nagpur', '0712333333'),
(5, 'Navi Mumbai Branch', 'Vashi, Navi Mumbai', '0224444444');

INSERT INTO Loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID)
VALUES
(301, 500000, 8.50, '2025-01-15', '2030-01-15', 101),
(302, 300000, 9.25, '2025-02-10', '2028-02-10', 102),
(303, 750000, 8.75, '2025-03-20', '2032-03-20', 103),
(304, 250000, 10.00, '2025-04-05', '2029-04-05', 104),
(305, 1000000, 7.95, '2025-05-12', '2035-05-12', 105);


SET SQL_SAFE_UPDATES=0;

update Customers
SET Phone = "9999999999"
WHERE CustomerID=101;

SELECT * FROM Customers
WHERE CustomerID = 101;

UPDATE Customers
SET Email='rahul.sharma@gmail.com'
WHERE CustomerID=101;

SELECT * FROM Customers
WHERE CustomerID = 101;

-- update
update accounts
set balance = 30000
where account_id = 201;

select * from accounts;

-- delete
DELETE FROM Transactions
WHERE Transaction_ID = 302;

SELECT * FROM Transactions;

DELETE FROM Accounts
WHERE Account_ID = 202;

SELECT * FROM Accounts;


/*
		LAB 4 
*/
select * from customers;
SELECT FirstName, LastName, Email, Phone
FROM Customers;
select Account_ID, Account_Type, Balance
from Accounts;

SELECT *FROM Accounts WHERE Account_Type = 'Savings';
SELECT * FROM Accounts WHERE Balance > 25000;
SELECT * FROM Transactions WHERE Amount BETWEEN 5000 AND 20000;
SELECT * FROM Customers WHERE CustomerID IN (101,102,103);
SELECT * FROM Customers WHERE FirstName LIKE 'R%';

-- 1.Retrieve all current account records
SELECT * FROM Accounts;
-- 2.Find accounts with balance less than 15000
select * from accounts where balance < 15000;
-- 3. Display transactions between 1000 and 10000
select * from Transactions where amount between 1000 and 10000;
-- 4. Retrieve customer records for CustomerID 104 and 105
select * from customers where CustomerID in (104,105);
-- 5. Display customers whose last name starts with S
select * from customers where lastname like 'S%';


SELECT * FROM Customers ORDER BY FirstName ASC;
SELECT * FROM Accounts ORDER BY Balance DESC;
SELECT DISTINCT Account_Type FROM Accounts;
SELECT * FROM Accounts ORDER BY Balance DESC LIMIT 3;
SELECT * FROM Transactions LIMIT 5 OFFSET 2;

-- task 3.
-- 1. Display customers sorted by LastName
select * from customers order by lastname asc;
-- 2.Retrieve top 5 transactions with highest amount
select * from transactions where amount order by amount limit 5 ;
-- 3.Display unique transaction types
SELECT DISTINCT transaction_type FROM transactions;
-- 4.Skip the first 3 transaction records and display the next 4 records
select * from transactions limit 4 offset 3;

-- Task 4: Identify Missing Banking Information

--   q1.  Find Customers Without Phone Numbers
SELECT * FROM Customers WHERE Phone IS NULL;

--   q2.  Find Customers Having Email Addresses
SELECT * FROM Customers WHERE Email IS NOT NULL;

-- q3.  Find customers without email addresses
select * from customers where email is null;

-- Display all accounts where balance information is available
select * from accounts where balance is not null;

-- Task 5: Categorize Customer Accounts Based on Balance

--  q1.  Categorize Accounts Using Balance

SELECT Account_ID,
       Balance,
       CASE
           WHEN Balance >= 50000 THEN 'Premium Account'
           WHEN Balance >= 25000 THEN 'Standard Account'
           ELSE 'Basic Account'
       END AS AccountCategory
FROM Accounts;

/*-- q2.   Create a report that categorizes transactions as:

High Transaction
Medium Transaction
Low Transaction
based on transaction amount.
*/
SELECT 
    transaction_id,
    transaction_type,
    amount,
    CASE
        WHEN amount >= 10000 THEN 'High Transaction'
        WHEN amount >= 5000 THEN 'Medium Transaction'
        ELSE 'Low Transaction'
    END AS transaction_category
FROM transactions;

-- Task 6: Analyze Customer Transactions Using Window Functions
-- q1.  Assign Rank Based on Account Balance

SELECT Account_ID,
       Balance,
       RANK() OVER (ORDER BY Balance DESC) AS BalanceRank
FROM Accounts;

-- q2.  Calculate Running Total of Transactions

SELECT Transaction_ID,
       Amount,
       SUM(Amount) OVER (ORDER BY Transaction_Date) AS RunningTotal
FROM Transactions;

-- q3.  Display Average Transaction Amount
SELECT Transaction_ID,
       Amount,
       AVG(Amount) OVER () AS AverageTransaction
FROM Transactions;

-- q4.    Rank customers based on account balance
select customerid , balance , rank() over (order by balance desc) as balancerank from accounts;
-- q5 Generate running total for account balances
select account_id , balance , sum(balance) over (order by account_id) as runningtotal from accounts;
-- q6.  Display maximum transaction amount using a window function
select transaction_id, amount, max(amount) over () as maxtransactionamount from transactions;

/*
		LAB 5 
*/
-- Task 1: Search Customers Based on Name

-- q1. Search Customers Whose First Name Starts with “A”
SELECT * FROM Customers WHERE FirstName LIKE 'A%';

-- q2. Search Customers Whose Email Contains “gmail”
SELECT * FROM Customers WHERE Email LIKE '%gmail%';

-- q3. Search Customers Whose Last Name Ends with “kar”

SELECT * FROM Customers WHERE LastName LIKE '%kar';

-- q4  Display customers whose first name starts with R
select * from customers where firstname like 'R%';

-- q5 .  Find customers whose email contains yahoo
select * from customers where email = "yahoo";

-- q6 ..Display customers whose last name starts with P
select * from customers where lastname like "P%"; 

-- q7.   Search customers whose phone number ends with 99
select * from customers where phone like '%99';


-- Task 2: Filter Records for Selected Banking Categories
-- q1.  Retrieve Records for Selected Account Types

SELECT * FROM Accounts WHERE Account_Type IN ('Savings', 'Current');

-- q2.  Retrieve Transactions for Selected Transaction Types

SELECT * FROM Transactions WHERE Transaction_Type IN ('Deposit', 'Withdrawal');

-- q3.  Retrieve Records for Selected Customers

SELECT * FROM Customers WHERE CustomerID IN (101,102,105);

-- q4 .  Display accounts belonging to Salary and Savings account types
select * from accounts where account_type in ("salary" , "savings");
-- q5.   Retrieve transactions for Payment and Deposit categories
select * from transactions where transaction_type in ("payment" , "deposit");
-- q6.   Display customer records for CustomerID 103 and 104
select * from customers where customerid in(103, 104);
-- q7.   Retrieve selected account records using AccountID values
select * from accounts where account_id in (103,101);

-- Task 3: Generate Sorted Banking Reports
-- q1.Display Customers in Ascending Order of Last Name
SELECT * FROM Customers ORDER BY LastName ASC;

-- q2. Display Accounts with Highest Balance First
SELECT * FROM Accounts ORDER BY Balance DESC;

-- q3.  Display Transactions Sorted by Transaction Date
SELECT * FROM Transactions ORDER BY TransactionDate DESC;

-- q4.  Display customers sorted by FirstName
select * from customers order by firstname asc ;
-- q5   Display accounts sorted by AccountType
select * from accounts order by account_type asc;
-- q6   Display transactions sorted by Amount in descending order
select * from transactions order by amount desc ;
-- q7   Display customers sorted by DateOfBirth
select * from customers order by dateofbirth asc ;

-- Task 4: Control Result Size for Faster Review
-- q1.  Display Only Top 5 Highest Balance Accounts
SELECT * FROM Accounts ORDER BY Balance DESC LIMIT 5;

-- q2.  Display First 3 Customer Records
SELECT * FROM Customers LIMIT 3;

-- q3.  Skip Initial Transaction Records While Viewing Data
SELECT * FROM Transactions LIMIT 5 OFFSET 3;

-- q4. Display top 3 transactions with highest amount
select * from transactions order by amount desc limit 3 ;
-- q5.  Retrieve only 4 customer records
select * from customers limit 4 ;
-- q6.  Skip first 2 account records and display next 3 records
select * from accounts limit 3 offset 2;
-- q7.  Display top 5 latest transactions
select * from transactions ;


-- Task 5: Build Customer Search Reports for Banking
-- q1.Display Savings Account Customers Sorted by Balance
SELECT * FROM Accounts WHERE Account_Type = 'Savings'ORDER BY Balance DESC;

-- q2. Search Customers Using Partial Name and Limit Results
SELECT * FROM Customers WHERE FirstName LIKE 'S%' LIMIT 5;

-- q3.  Display Selected Transactions in Sorted Order
SELECT * FROM Transactions WHERE Transaction_Type IN ('Deposit','Withdrawal') ORDER BY Transaction_Date DESC;

/*
		LAB 6 
*/
select * from customers;
-- Display all customer FirstName in uppercase.
SELECT FirstName, UPPER(FirstName) AS UpperCaseName FROM customers;

-- Display all customer FirstName in lowercase.
SELECT FirstName, LOWER(FirstName) AS LowerCaseName FROM customers;

-- Find the total number of characters in each customer FirstName
SELECT FirstName, LENGTH(FirstName) AS NameLength FROM customers;

-- Display only the first three characters of customer FirstName
SELECT FirstName, LEFT(FirstName,3) AS Initials FROM customers;

-- Combine customer's FirstName with LastName
SELECT CONCAT(FirstName,' - ',LastName) AS FullName FROM customers;

-- ---------- Math Functions --------------

SELECT ROUND(1256.75) AS Rounded_Value;
SELECT CEIL(1256.25) AS Ceiling_Value;
SELECT FLOOR(1256.75) AS Floor_Value;
SELECT ABS(-2500) AS Absolute_Value;
SELECT MOD(25,4) AS Remainder;

select * from customers;
SELECT CURDATE(); 
SELECT NOW();
SELECT CustomerID, YEAR(DateOfBirth) AS BirthYear FROM customers;
SELECT CustomerID, MONTH(DateOfBirth) AS BirthMonth FROM customers;
SELECT CustomerID, DATEDIFF(CURDATE(),DateOfBirth) AS Days FROM customers;
SELECT
    FirstName,
    DateOfBirth,
    IF(YEAR(DateOfBirth) <= 1995,
       'Adult',
       'Young') AS Category 
	FROM Customers;

SELECT
    FirstName,
    IFNULL(Phone, 'Not Available') AS PhoneNumber
FROM Customers;
SELECT GREATEST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS LatestBirthDate;

SELECT LEAST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS EarliestBirthDate;

SELECT FirstName,
    NULLIF(FirstName,'Priya') AS Result
FROM Customers;


-- Task 2: Analyze Overall Banking Performance
SELECT SUM(Balance) as total_balance FROM Accounts;
SELECT AVG(Balance) AS average_balance FROM Accounts;
SELECT MAX(Balance) AS highest_balance FROM Accounts;
SELECT MIN(Balance) AS lowest_balance FROM Accounts;
SELECT COUNT(*) AS total_accounts FROM Accounts;


-- Task 3: Analyze Account-wise Performance
SELECT 
    Account_Type,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY Account_Type ;

-- Task 4: Identify High-Performing Categories
SELECT 
    Account_Type,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY Account_Type
HAVING SUM(Balance) > 25000;

/*
		LAB 7 
*/
-- Rank Customer Loans Using RANK()
Select
    LoanID,
    CustomerID, LoanAmount, RANK() OVER(
        ORDER BY LoanAmount DESC
    ) AS LoanRank
FROM Loans;

-- Rank Customer Loans Using DENSE_RANK()
SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    DENSE_RANK() OVER(
        ORDER BY LoanAmount DESC
    ) AS DenseRank
FROM Loans;

-- Assign Row Numbers Using ROW_NUMBER()
SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    ROW_NUMBER() OVER(
        ORDER BY LoanAmount DESC
    ) AS RowNumber
FROM Loans;

-- Understanding PARTITION BY
SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    ROW_NUMBER() OVER(
        PARTITION BY CustomerID
        ORDER BY LoanAmount DESC
    ) AS RowNum
FROM Loans;

-- Calculate Running Total Using SUM() OVER()
SELECT
    LoanID, CustomerID,LoanAmount,
    SUM(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS RunningTotal
FROM Loans;

-- Compare Previous Loan Records Using LAG()
SELECT
    LoanID,
    CustomerID,
    LoanAmount,
    LAG(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS PreviousLoanAmount
FROM Loans;

-- Compare Next Loan Records Using LEAD()
SELECT
    LoanID, CustomerID, LoanAmount,
    LEAD(LoanAmount) OVER(
        ORDER BY LoanAmount DESC
    ) AS NextLoanAmount
FROM Loans;

/*
		LAB 8 
*/

-- Task 1: Generate Accounts Transaction Reports (INNER JOIN)
SELECT
    a.Account_ID, a.Account_Type, a.Balance,
    t.Transaction_ID,
    t.Transaction_Date,
    t.Transaction_Type,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.Account_ID = t.AccountID;

-- Task 2: Display All Accounts Including Those Without Transactions
-- (LEFT JOIN)
select * from accounts a left join transactions t on a.account_id = t.accountid;

-- Task 3: Generate Deposit Transaction Reports (INNER JOIN)
select * from accounts a inner join transactions t on 
a.account_id = t.accountid 
where t.transaction_Type = 'deposit';

-- Task 4: Generate High Balance Account Transaction Reports
select * from accounts a inner join transactions t
	on a.account_id = t.accountid
    where a.balance > 30000
    order by a.balance desc;
    
    

