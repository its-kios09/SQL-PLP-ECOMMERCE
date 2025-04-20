# 📚 E-commerce SQL Database Project

[![CI - MySQL Schema Test](https://github.com/its-kios09/SQL-PLP-BOOKSTORE/actions/workflows/cicd.yml/badge.svg)](https://github.com/its-kios09/SQL-PLP-BOOKSTORE/actions)

---

## 🧠 Overview

This project simulates a real-world scenario where you're the database administrator for an e-commerce platform. You'll design and implement a MySQL database to manage products, categories, brands, orders, and more.

By the end of this project, you’ll gain hands-on experience in SQL, database design, and automation with CI/CD pipelines.

---

## 🎯 Project Objective

- Design a normalized, relational database for a bookstore.
- Create SQL schemas for tables and relationships.
- Insert sample data and run meaningful queries.
- Secure the database using users and roles.
- Automate validation using GitHub Actions.

---

## 🧰 Tools & Technologies

- Design a normalized, relational database for an e-commerce platform.
- Create SQL schemas for tables and relationships.
- Insert sample data and run meaningful queries.
- Secure the database using users and roles.
- Automate validation using GitHub Actions.

---

## 🗃️ Database Schema

Key tables included:

- `book`, `author`, `book_author`
- `book_language`, `publisher`
- `customer`, `address`, `customer_address`, `address_status`, `country`
- `cust_order`, `order_line`
- `order_status`, `order_history`
- `shipping_method`


- `product_image, color`,` product_category`
- `product`, `product_item`, `brand`
- `product_variation`, `size_category`, `size_option`
- `product_attribute`, `attribute_category`, `attribute_type`

Relational integrity (e.g. foreign keys and constraints) is enforced to ensure data consistency.

---

## 🛢 Diagram

![Screenshot from 2025-04-13 19-53-06](https://github.com/user-attachments/assets/6d55bb16-87d6-473c-979c-7f6ab221a411)


## 📂 Project Structure

```bash
SQL-PLP-ECOMMERCE/
├── .github/
│   └── workflows/
│       └── ci.yml               # GitHub Actions workflow for CI/CD
├── ecommerce_schema.sql         # Full SQL schema (DDL)
├── queries/                     # Folder to hold query files
│   └── test_queries.sql         # SQL SELECT/INSERT/UPDATE queries for testing
└── README.md                    # Project documentation

```

## ✅ How to Test the Schema
### 🖥️ For Linux/macOS Command Line
``` bash
# Step 1: Navigate to the directory where the SQL file is located
cd /path/to/your/schema/

# Step 2: Log in to MySQL and run the schema
mysql -u root -p < ecommerce_schema.sql
```
### 🪟 For Windows Command Line (Command Prompt or PowerShell)
```bash
# Step 1: Open CMD or PowerShell
# Step 2: Navigate to your schema folder
cd C:\path\to\your\schema\

# Step 3: Run the schema
mysql -u root -p <  ecommerce_schema.sql
```
### 🖱️ For MySQL Workbench (GUI Users)
- Open MySQL Workbench.

- Connect to your MySQL Server.

- Open File → Select  ecommerce_schema.sql.

- The file will open in a new SQL editor tab.

- Click the ⚡ Execute button or press Ctrl + Shift + Enter to run the script.




## 🚀 CI/CD Pipeline

Our GitHub Actions workflow automatically validates database changes and creates schema dumps:

### 🔧 What It Does
1. **Schema Validation**:
   - Spins up a MySQL 8.0 container
   - Applies ` ecommerce_schema.sql`
   - Runs all SQL files in `queries/` directory

2. **Artifact Generation**:
   - Creates timestamped database dumps on `main` branch updates
   - Stores dumps as downloadable artifacts for 7 days

## ✅ Features:
- Starts a temporary MySQL server

- Applies bookstore_schema.sql

Runs queries from the queries/ folder (e.g., insert_query_data.sql) to verify schema and logic

## 🔄 Triggered on:
- Pushes to main branch

- Pull requests to main

## 🧩 Steps in CI/CD:
- MySQL container is started.

- Schema is loaded into the MySQL database.

- Queries from the queries/insert_query_data.sql file are executed for validation.


## 🤝 How to Contribute

We welcome contributions from everyone! If you'd like to collaborate on this project, follow these steps:

### 1. Fork the repository
Start by **forking** the repository to your GitHub account.

- Go to the repository page: [SQL-PLP-BOOKSTORE](https://github.com/its-kios09/SQL-PLP-ECOMMERCE)
- Click the **Fork** button (top right corner) to create a copy under your GitHub account.

### 2. Clone your fork
Next, **clone** your forked repository to your local machine:

```bash
git clone https://github.com/its-kios09/SQL-PLP-ECOMMERCE.git
```

#### 3.  Create a New Branch for Your Changes

```bash
git checkout -b feature/add-product-table
```

### 4. Commit Your Changes

```bash
git add .
git commit -m "(feat) Added product table schema"
git commit -m "(refactor) change product table schema"
git commit -m "(chore) removed table"
```

### 5. Push Your Changes

```bash
git push origin feature/add-product-table
```
### 6. Open a Pull Request (PR)
Then one of the team members will review your changes
