-- CUSTOMER MASTER DATA QUALITY CHECKS
-- DATABASE SETUP

-- Create database
CREATE DATABASE MDM_Data_Quality;
-- Select database
USE MDM_Data_Quality;

-- Create Customer Master table

CREATE TABLE Customer_Master (
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Email VARCHAR(150),
    Phone VARCHAR(20),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    Customer_Type VARCHAR(50),
    Status VARCHAR(20),
    Created_Date DATE
);

-- View Customer Master data
SELECT *
FROM Customer_Master;

-- Create Product Master table

CREATE TABLE Product_Master (
    Product_ID VARCHAR(20),
    Product_Name VARCHAR(100),
    Category VARCHAR(100),
    Brand VARCHAR(100),
    Unit_of_Measure VARCHAR(20),
    Status VARCHAR(20),
    Standard_Cost DECIMAL(12,2)
);

-- View Product Master data
SELECT *
FROM Product_Master;

-- Create Vendor Master table

CREATE TABLE Vendor_Master (
    Vendor_ID VARCHAR(20),
    Vendor_Name VARCHAR(100),
    Email VARCHAR(150),
    Phone VARCHAR(20),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    Vendor_Type VARCHAR(50),
    Status VARCHAR(20)
);

-- View Vendor Master data
SELECT *
FROM Vendor_Master;

-- Create Pricing Master table

CREATE TABLE Pricing_Master (
    Price_ID VARCHAR(20),
    Product_ID VARCHAR(20),
    Vendor_ID VARCHAR(20),
    Currency VARCHAR(10),
    Unit_Price DECIMAL(12,2),
    Effective_From DATE,
    Effective_To VARCHAR(20),
    Price_Status VARCHAR(20)
);

select * from Pricing_Master;

-- Customer Master Data Quality Checks
-- In this section, I check the quality of customer master data.
-- The checks include missing values, duplicates, invalid formats, and data validation.

-- Checking missing values in Customer Master
SELECT
    COUNT(*) 
    AS Total_Records,
    SUM(Customer_ID IS NULL OR Customer_ID = '') AS Missing_Customer_ID,
    SUM(Customer_Name IS NULL OR Customer_Name = '') AS Missing_Name,
    SUM(Email IS NULL OR Email = '') AS Missing_Email,
    SUM(Phone IS NULL OR Phone = '') AS Missing_Phone,
    SUM(City IS NULL OR City = '') AS Missing_City,
    SUM(State IS NULL OR State = '') AS Missing_State,
    SUM(Country IS NULL OR Country = '') AS Missing_Country,
    SUM(Customer_Type IS NULL OR Customer_Type = '') AS Missing_Customer_Type,
    SUM(Status IS NULL OR Status = '') AS Missing_Status,
    SUM(Created_Date IS NULL) AS Missing_Created_Date
FROM Customer_Master;


-- Check duplicate customer details
-- Check if customer ID, email or phone is repeated

SELECT
    COUNT(*) - COUNT(DISTINCT Customer_ID) AS Duplicate_Customer_IDs,
    COUNT(*) - COUNT(DISTINCT Email) AS Duplicate_Emails,
    COUNT(*) - COUNT(DISTINCT Phone) AS Duplicate_Phones
FROM Customer_Master;

-- Check invalid email and phone formats
-- Check if email format is correct
-- Check if phone number has 10 digits

SELECT
    SUM(Email IS NOT NULL AND Email NOT LIKE '%@%.%') AS Invalid_Emails,
    SUM(Phone IS NOT NULL AND (LENGTH(Phone) <> 10 OR Phone REGEXP '[^0-9]')) AS Invalid_Phones
FROM Customer_Master;

-- Check customer ID and created date
-- Check if customer ID is correct
-- Check if created date is not future date
SELECT
    SUM(Customer_ID IS NULL OR Customer_ID NOT REGEXP '^C[0-9]{4}$') AS Invalid_Customer_IDs,
    SUM(Created_Date IS NULL OR Created_Date > CURDATE()) AS Invalid_Created_Dates
FROM Customer_Master;

-- Check customer names with extra spaces
-- Check if customer name has extra spaces

SELECT COUNT(*) AS Name_Issues
FROM Customer_Master
WHERE Customer_Name <> TRIM(Customer_Name);

-- Check customer type and status values
-- Check customer type values
-- Check status values

SELECT DISTINCT Customer_Type, Status
FROM Customer_Master;

-- Check future created dates
-- Check if any created date is future date

SELECT COUNT(*) AS Future_Dates
FROM Customer_Master
WHERE Created_Date > CURDATE();



-- Check missing values in Product Master
-- Check if any product details are missing

SELECT
    COUNT(*) AS Total_Records,
    SUM(Product_ID IS NULL OR Product_ID = '') AS Missing_Product_ID,
    SUM(Product_Name IS NULL OR Product_Name = '') AS Missing_Product_Name,
    SUM(Category IS NULL OR Category = '') AS Missing_Category,
    SUM(Brand IS NULL OR Brand = '') AS Missing_Brand,
    SUM(Unit_of_Measure IS NULL OR Unit_of_Measure = '') AS Missing_Unit,
    SUM(Status IS NULL OR Status = '') AS Missing_Status,
    SUM(Standard_Cost IS NULL) AS Missing_Cost
FROM 
    Product_Master;

-- Check duplicate product details
-- Check if product ID or product name is repeated

SELECT
    COUNT(*) - COUNT(DISTINCT Product_ID) AS Duplicate_Product_IDs,
    COUNT(*) - COUNT(DISTINCT Product_Name) AS Duplicate_Product_Names
FROM
      Product_Master;


-- Check invalid standard cost
-- Check if standard cost is zero or negative

SELECT 
       COUNT(*) AS Invalid_Cost
FROM 
	Product_Master
WHERE 
	 Standard_Cost <= 0;
     
-- Check product ID and category
-- Check if product ID is correct
-- Check if category values are correct

SELECT
    SUM(Product_ID IS NULL OR Product_ID NOT REGEXP '^P[0-9]{4}$') AS Invalid_Product_IDs,
    SUM(Category IS NULL OR 
	Category NOT IN (
					 'Electronics',
                     'Furniture',
                     'Groceries',
                     'Home Appliances',
					 'Office Supplies',
					 'Personal Care')
   ) AS Invalid_Categories
FROM Product_Master;

-- Check unit and status values
-- Check if unit of measure values are correct
-- Check if status values are correct

SELECT
    SUM(Unit_of_Measure IS NULL OR Unit_of_Measure NOT IN ('Box', 'EA', 'KG')) AS Invalid_Units,
    SUM(Status IS NULL OR Status NOT IN ('Active', 'Inactive')) AS Invalid_Status
FROM Product_Master;

-- Check product names with extra spaces
-- Check if product name has extra spaces

SELECT COUNT(*) AS Name_Issues
FROM Product_Master
WHERE Product_Name <> TRIM(Product_Name);



-- Check missing values in Vendor Master
-- Check if any vendor details are missing

SELECT
    COUNT(*) AS Total_Records,
    SUM(Vendor_ID IS NULL OR Vendor_ID = '') AS Missing_Vendor_ID,
    SUM(Vendor_Name IS NULL OR Vendor_Name = '') AS Missing_Vendor_Name,
    SUM(Email IS NULL OR Email = '') AS Missing_Email,
    SUM(Phone IS NULL OR Phone = '') AS Missing_Phone,
    SUM(City IS NULL OR City = '') AS Missing_City,
    SUM(State IS NULL OR State = '') AS Missing_State,
    SUM(Country IS NULL OR Country = '') AS Missing_Country,
    SUM(Vendor_Type IS NULL OR Vendor_Type = '') AS Missing_Vendor_Type,
    SUM(Status IS NULL OR Status = '') AS Missing_Status
FROM Vendor_Master;

-- Check duplicate vendor details
-- Check if vendor ID, email or phone is repeated

SELECT
    COUNT(*) - COUNT(DISTINCT Vendor_ID) AS Duplicate_Vendor_IDs,
    COUNT(*) - COUNT(DISTINCT Email) AS Duplicate_Emails,
    COUNT(*) - COUNT(DISTINCT Phone) AS Duplicate_Phones
FROM Vendor_Master;


-- Check invalid email and phone formats
-- Check if email format is correct
-- Check if phone number has 10 digits

SELECT
    SUM(Email IS NOT NULL AND Email NOT LIKE '%@%.%') AS Invalid_Emails,
    SUM(Phone IS NOT NULL AND (LENGTH(Phone) <> 10 OR Phone REGEXP '[^0-9]')) AS Invalid_Phones
FROM Vendor_Master;

-- Check vendor ID, type and status
-- Check if vendor ID is correct
-- Check if vendor type values are correct
-- Check if status values are correct

SELECT
    SUM(Vendor_ID IS NULL OR Vendor_ID NOT REGEXP '^V[0-9]{4}$') AS Invalid_Vendor_IDs,
    SUM(Vendor_Type IS NULL OR Vendor_Type NOT IN (
        'Distributor',
        'Manufacturer',
        'Service',
        'Wholesaler'
    )) AS Invalid_Vendor_Types,
    SUM(Status IS NULL OR Status NOT IN ('Active', 'Inactive')) AS Invalid_Status
FROM Vendor_Master;


-- Check vendor names with extra spaces
-- Check if vendor name has extra spaces

SELECT COUNT(*) AS Name_Issues
FROM Vendor_Master
WHERE Vendor_Name <> TRIM(Vendor_Name);



-- Check missing values in Pricing Master
-- Check if any pricing details are missing

SELECT
    COUNT(*) AS Total_Records,
    SUM(Price_ID IS NULL OR Price_ID = '') AS Missing_Price_ID,
    SUM(Product_ID IS NULL OR Product_ID = '') AS Missing_Product_ID,
    SUM(Vendor_ID IS NULL OR Vendor_ID = '') AS Missing_Vendor_ID,
    SUM(Currency IS NULL OR Currency = '') AS Missing_Currency,
    SUM(Unit_Price IS NULL) AS Missing_Unit_Price,
    SUM(Effective_From IS NULL) AS Missing_Effective_From,
    SUM(Effective_To IS NULL OR Effective_To = '') AS Missing_Effective_To,
    SUM(Price_Status IS NULL OR Price_Status = '') AS Missing_Price_Status
FROM Pricing_Master;

-- Check duplicate pricing details
-- Check if price ID is repeated
-- Product ID and vendor ID can repeat because they can have multiple prices

SELECT
    COUNT(*) - COUNT(DISTINCT Price_ID) AS Duplicate_Price_IDs
FROM Pricing_Master;


-- Check invalid unit price
-- Check if unit price is zero or negative

SELECT COUNT(*) AS Invalid_Unit_Price
FROM Pricing_Master
WHERE Unit_Price <= 0;

-- Check pricing ID, currency and status
-- Check if price ID is correct
-- Check if currency value is correct
-- Check if price status is correct

SELECT
    SUM(Price_ID IS NULL OR Price_ID NOT REGEXP '^PR[0-9]{4}$') AS Invalid_Price_IDs,
    SUM(Currency IS NULL OR Currency <> 'INR') AS Invalid_Currency,
    SUM(Price_Status IS NULL OR Price_Status NOT IN ('Active', 'Expired')) AS Invalid_Price_Status
FROM Pricing_Master;

-- Check product ID, vendor ID and pricing dates
-- Check if product ID is correct
-- Check if vendor ID is correct
-- Check if pricing dates are correct

SELECT
    SUM(Product_ID IS NULL OR Product_ID NOT REGEXP '^P[0-9]{4}$') AS Invalid_Product_IDs,
    SUM(Vendor_ID IS NULL OR Vendor_ID NOT REGEXP '^V[0-9]{4}$') AS Invalid_Vendor_IDs,
    SUM(Effective_From IS NULL OR Effective_From > CURDATE()) AS Invalid_Effective_From
FROM Pricing_Master;

-- Check pricing date range
-- Check if effective to date is before effective from date

SELECT COUNT(*) AS Invalid_Date_Ranges
FROM Pricing_Master
WHERE Effective_To <> ''
  AND STR_TO_DATE(Effective_To, '%Y-%m-%d') < Effective_From;
  

-- Final record count of all master tables
-- Check total records in each master table

SELECT 'Customer Master' AS Master_Name, COUNT(*) AS Total_Records
FROM Customer_Master

UNION ALL

SELECT 'Product Master', COUNT(*)
FROM Product_Master

UNION ALL

SELECT 'Vendor Master', COUNT(*)
FROM Vendor_Master

UNION ALL

SELECT 'Pricing Master', COUNT(*)
FROM Pricing_Master;


-- Final data quality summary
-- Check the main issues in each master table

SELECT
    'Customer Master' AS Master_Name,
    SUM(Email IS NULL OR Email = '') AS Missing_Email,
    SUM(Phone IS NULL OR Phone = '') AS Missing_Phone
FROM Customer_Master

UNION ALL

SELECT
    'Product Master',
    0,
    SUM(Standard_Cost <= 0)
FROM Product_Master

UNION ALL

SELECT
    'Vendor Master',
    SUM(Email IS NULL OR Email = ''),
    SUM(Phone IS NULL OR Phone = '')
FROM Vendor_Master

UNION ALL

SELECT
    'Pricing Master',
    0,
    SUM(Unit_Price <= 0)
FROM Pricing_Master;