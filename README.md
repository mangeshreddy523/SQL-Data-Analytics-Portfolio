# SQL-Data-Analytics-Portfolio
Hands-on MySQL Banking SQL Labs covering database design, DDL, DML, DQL, constraints, filtering, functions, aggregation, window functions, and joins.
# 🏦 SQL Banking Labs – MySQL

A practical **MySQL SQL Labs project** based on a Banking Database.

This repository contains SQL practice from **Lab 1 to Lab 8**, covering database creation, table design, constraints, data manipulation, filtering, sorting, functions, aggregation, window functions, and joins.

The project uses a banking database with tables such as **Customers, Accounts, Transactions, Branches, and Loans**.

---

## 📌 Project Overview

The main objective of this project is to build and analyze a relational banking database using MySQL.

The labs progress from basic SQL concepts to more advanced topics such as:

* Database & Table Creation
* DDL Commands
* DML Commands
* Constraints
* Primary Keys & Foreign Keys
* Data Filtering
* Sorting & Pagination
* CASE Statements
* String Functions
* Mathematical Functions
* Date Functions
* Aggregate Functions
* GROUP BY & HAVING
* Window Functions
* Ranking Functions
* LAG & LEAD
* SQL Joins

---

# 🗂️ Database Tables

The project works with the following banking tables:

### 👤 Customers

Stores customer information such as:

* CustomerID
* FirstName
* LastName
* Email
* Phone
* DateOfBirth

### 💳 Accounts

Stores account information:

* Account_ID
* CustomerID
* Account_Type
* Balance
* BranchID

### 💰 Transactions

Stores banking transactions:

* Transaction_ID
* AccountID
* Transaction_Date
* Amount
* Transaction_Type

### 🏦 Branches

Stores bank branch details:

* BranchID
* BranchName
* BranchAddress
* BranchPhone

### 💵 Loans

Stores customer loan information:

* LoanID
* CustomerID
* LoanAmount
* InterestRate
* StartDate
* EndDate

Relationships between these tables are created using **Primary Keys and Foreign Keys**.

---

# 📚 Labs Covered

## 🔹 Lab 1 – Database & Customer Table

Topics:

* `CREATE DATABASE`
* `USE`
* `CREATE TABLE`
* Primary Key
* `INSERT`
* `SELECT`

A banking database is created and the Customers table is introduced with customer information.

---

## 🔹 Lab 2 – Database Design & Constraints

Topics:

* Creating multiple tables
* `ALTER TABLE`
* Adding columns
* Modifying columns
* `CHECK`
* `PRIMARY KEY`
* `FOREIGN KEY`
* `UNIQUE`
* `NOT NULL`
* Table relationships
* `DROP TABLE`

The lab establishes relationships between Customers, Accounts, Transactions, Branches, and Loans.

---

## 🔹 Lab 3 – INSERT, UPDATE & DELETE

Topics:

* Insert single records
* Insert multiple records
* Update records
* Delete records
* Working with banking data

Sample customers, accounts, transactions, branches, and loans are inserted into the database.

Example:

```sql
UPDATE Accounts
SET Balance = 30000
WHERE Account_ID = 201;
```

---

## 🔹 Lab 4 – Filtering, Sorting & Window Functions

Topics:

* `WHERE`
* `BETWEEN`
* `IN`
* `LIKE`
* `ORDER BY`
* `DISTINCT`
* `LIMIT`
* `OFFSET`
* `IS NULL`
* `IS NOT NULL`
* `CASE`
* Window Functions

Example:

```sql
SELECT *
FROM Accounts
WHERE Balance > 25000;
```

The lab also categorizes accounts and transactions using `CASE`.

---

## 🔹 Lab 5 – Search & Report Queries

Topics:

### Pattern Matching

```sql
LIKE 'A%'
LIKE '%gmail%'
LIKE '%kar'
LIKE '%99'
```

### IN Operator

```sql
WHERE Account_Type IN ('Savings', 'Current');
```

### Sorting

```sql
ORDER BY Balance DESC;
```

### Result Limiting

```sql
LIMIT 5;
```

### Pagination

```sql
LIMIT 3 OFFSET 2;
```

These queries are used to create different customer, account, and transaction reports.

---

## 🔹 Lab 6 – SQL Functions & Aggregation

### String Functions

* `UPPER()`
* `LOWER()`
* `LENGTH()`
* `LEFT()`
* `CONCAT()`

### Mathematical Functions

* `ROUND()`
* `CEIL()`
* `FLOOR()`
* `ABS()`
* `MOD()`

### Date Functions

* `CURDATE()`
* `NOW()`
* `YEAR()`
* `MONTH()`
* `DATEDIFF()`

### Conditional Functions

* `IF()`
* `IFNULL()`
* `NULLIF()`
* `GREATEST()`
* `LEAST()`

### Aggregate Functions

* `SUM()`
* `AVG()`
* `MAX()`
* `MIN()`
* `COUNT()`

The lab also uses `GROUP BY` and `HAVING` to analyze account types.

---

## 🔹 Lab 7 – Advanced Window Functions

This lab focuses on analyzing customer loans using window functions.

### RANK()

```sql
RANK() OVER (
    ORDER BY LoanAmount DESC
)
```

### DENSE_RANK()

```sql
DENSE_RANK() OVER (
    ORDER BY LoanAmount DESC
)
```

### ROW_NUMBER()

```sql
ROW_NUMBER() OVER (
    ORDER BY LoanAmount DESC
)
```

### PARTITION BY

```sql
ROW_NUMBER() OVER (
    PARTITION BY CustomerID
    ORDER BY LoanAmount DESC
)
```

### Running Total

```sql
SUM(LoanAmount) OVER (
    ORDER BY LoanAmount DESC
)
```

### LAG()

Used to compare the current loan with the previous loan.

### LEAD()

Used to compare the current loan with the next loan.

These concepts are demonstrated using the Loans table.

---

## 🔹 Lab 8 – SQL Joins

The final lab focuses on combining data from multiple banking tables.

### INNER JOIN

Used to generate account transaction reports.

```sql
SELECT
    a.Account_ID,
    a.Account_Type,
    a.Balance,
    t.Transaction_ID,
    t.Transaction_Date,
    t.Transaction_Type,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.Account_ID = t.AccountID;
```

### LEFT JOIN

Used to display all accounts, including accounts without transactions.

```sql
SELECT *
FROM Accounts a
LEFT JOIN Transactions t
ON a.Account_ID = t.AccountID;
```

The lab also demonstrates filtering joined data and finding transactions associated with high-balance accounts.

---

# 🧠 SQL Concepts Practiced

| Category        | Concepts                                          |
| --------------- | ------------------------------------------------- |
| Database        | CREATE DATABASE, USE                              |
| DDL             | CREATE, ALTER, DROP                               |
| DML             | INSERT, UPDATE, DELETE                            |
| DQL             | SELECT                                            |
| Constraints     | PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK |
| Filtering       | WHERE, IN, BETWEEN, LIKE                          |
| Sorting         | ORDER BY                                          |
| Pagination      | LIMIT, OFFSET                                     |
| Conditional     | CASE, IF                                          |
| String          | UPPER, LOWER, LENGTH, LEFT, CONCAT                |
| Math            | ROUND, CEIL, FLOOR, ABS, MOD                      |
| Date            | CURDATE, NOW, YEAR, MONTH, DATEDIFF               |
| Aggregate       | SUM, AVG, MAX, MIN, COUNT                         |
| Grouping        | GROUP BY, HAVING                                  |
| Window          | RANK, DENSE_RANK, ROW_NUMBER                      |
| Advanced Window | PARTITION BY, LAG, LEAD                           |
| Joins           | INNER JOIN, LEFT JOIN                             |

---

# 🛠️ Tools Used

* **MySQL**
* **MySQL Workbench**
* **SQL**

---

# 📁 Repository Structure

```text
SQL-Banking-Labs/
│
├── SQL LABS.sql
└── README.md
```

---

# 🎯 Learning Objectives

Through this project, I practiced how to:

* Design a relational database
* Create and modify tables
* Apply SQL constraints
* Establish table relationships
* Insert, update, and delete records
* Filter and sort data
* Search using pattern matching
* Work with NULL values
* Categorize data using CASE
* Use SQL functions
* Perform aggregate analysis
* Use GROUP BY and HAVING
* Analyze data using window functions
* Compare records using LAG and LEAD
* Combine tables using SQL joins

---

# 👨‍💻 Author

**Mangesh Kunte**

### 📊 Data Analytics Learning Portfolio

This project is part of my journey of learning **SQL and Data Analytics**, with a focus on developing practical MySQL skills through hands-on banking datasets and SQL labs.

---

⭐ **If you find this repository useful, feel free to explore the queries and practice them in MySQL Workbench.**
