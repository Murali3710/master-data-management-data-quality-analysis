# Master Data Management & Data Quality Analysis

## 1. Project Overview

Master data is core information used across business processes and reporting. Examples include customer, product, vendor, and pricing information.

When master data contains missing values, duplicate information, invalid values, inconsistent formats, or incorrect attributes, it can affect reporting accuracy, operational processes, and downstream analysis.

This project focuses on analyzing and improving the quality of four master-data domains:

- Customer Master
- Product Master
- Vendor Master
- Pricing Master

The project demonstrates an end-to-end Master Data Management and Data Quality workflow using:

**Excel → Power Query → MySQL → Power BI → PowerPoint**

The objective was to profile the raw master data, identify data-quality problems, clean and standardize the data, apply validation rules, independently verify selected issues using SQL, and present the final results through an interactive Power BI dashboard.

---

# 2. Problem Statement

Organizations depend on accurate and consistent master data for day-to-day operations, reporting, analytics, and decision-making.

However, master data can become inconsistent when information is entered or maintained without sufficient validation controls.

Typical examples include:

- Customer records with missing email or phone information
- Duplicate customer contact details
- Invalid phone numbers
- Product records with invalid standard costs
- Inconsistent product categories or names
- Vendor records with missing contact information
- Duplicate vendor contact details
- Pricing records with invalid unit prices
- Incorrect or inconsistent master-data formats
- Invalid identifiers
- Date-related data-quality problems

These issues can reduce data reliability and make downstream reporting and analysis less dependable.

### Project Problem

The project was designed to answer the following question:

> **How can the quality of Customer, Product, Vendor, and Pricing master data be systematically analyzed, validated, reported, and improved using practical data-analysis tools?**

The project therefore focused on building a structured process to:

1. Understand the raw master data.
2. Profile the data and identify quality issues.
3. Clean and standardize applicable fields.
4. Apply business and structural validation rules.
5. Classify records according to their quality status.
6. Independently verify selected issues using SQL.
7. Create consolidated data-quality reports.
8. Build a Power BI dashboard for monitoring and analysis.
9. Identify process-improvement areas based on the findings.

---

# 3. Project Objective

The primary objective was to create a practical data-quality analysis framework for master data.

### Specific Objectives

- Analyze Customer, Product, Vendor, and Pricing master data.
- Identify missing values and duplicate information.
- Identify invalid values and standardization issues.
- Clean and standardize the applicable master-data fields.
- Validate master-data identifiers and business attributes.
- Apply validation rules based on the structure of each master.
- Classify records as Good, Issues Found, or Missing Information.
- Perform independent database-level quality checks using MySQL.
- Build an Excel-based data-quality report.
- Build an interactive Power BI dashboard.
- Identify important data-quality issues and process-improvement areas.
- Document the complete analysis for reproducibility and presentation.

---

# 4. Project Scope

The project covered four master-data domains.

| Master | Purpose |
|---|---|
| Customer Master | Customer and contact information |
| Product Master | Product and product-attribute information |
| Vendor Master | Supplier/vendor information |
| Pricing Master | Product/vendor pricing information |

The analysis covered:

- Data profiling
- Data cleaning
- Data standardization
- Data validation
- Duplicate analysis
- Missing-value analysis
- Business-rule validation
- SQL data-quality checks
- Quality reporting
- Power BI visualization
- Process-improvement analysis

---

# 5. Data Volume

The project contained **3,097 master-data records** across four domains.

| Master Data | Records |
|---|---:|
| Customer | 1,225 |
| Product | 512 |
| Vendor | 360 |
| Pricing | 1,000 |
| **Total** | **3,097** |

The raw data was maintained separately from the cleaned and validated data so that the original records could be compared against the prepared data.

---

# 6. Technology Stack

| Tool | Purpose |
|---|---|
| Microsoft Excel | Data profiling, analysis and quality reporting |
| Power Query | Data cleaning, transformation and validation |
| MySQL / MySQL Workbench | Independent database-level data-quality checks |
| Power BI | Dashboard, KPI reporting and visualization |
| Microsoft PowerPoint | Project presentation and documentation |
| GitHub | Project version control and portfolio presentation |

---

# 7. End-to-End Project Workflow

The complete workflow followed this process:

```text
Raw Master Data
       ↓
Data Profiling
       ↓
Data Cleaning
       ↓
Data Standardization
       ↓
Data Validation
       ↓
Data Quality Classification
       ↓
SQL Data Quality Verification
       ↓
Excel Quality Reporting
       ↓
Power BI Dashboard
       ↓
Findings & Process Improvement
# 8. Raw Data Profiling

The first step was to understand the quality and structure of the raw master data before making any changes.

The profiling process looked for:

- Missing values
- Duplicate records
- Duplicate contact information
- Invalid values
- Invalid identifiers
- Standardization issues
- Invalid costs and prices
- Inconsistent categories
- Inconsistent statuses
- Date-related issues

The purpose of profiling was to understand **what was wrong with the data before cleaning it**.

This distinction was important because the raw data was retained as the reference point for the analysis.

---

# 9. Customer Master Analysis

## 9.1 Customer Master Structure

The Customer Master contained:

- `Customer_ID`
- `Customer_Name`
- `Email`
- `Phone`
- `City`
- `State`
- `Country`
- `Customer_Type`
- `Status`
- `Created_Date`

**Total records: 1,225**

---

## 9.2 Customer Data Profiling

The following issues were identified during profiling:

| Data Quality Check | Result |
|---|---:|
| Total Records | 1,225 |
| Missing Email | 32 |
| Missing Phone | 26 |
| Duplicate Emails | 46 |
| Duplicate Phones | 59 |
| Invalid Phone | 13 |
| Name Standardization Issues | 36 |
| Duplicate Customer IDs | 0 |
| Future Created Dates | 590 |

---

## 9.3 Customer Data Cleaning

Power Query was used to:

- Remove exact duplicate rows.
- Trim unnecessary spaces.
- Clean text values.
- Standardize applicable customer-type values.
- Standardize status values.
- Convert fields to appropriate data types.
- Convert `Created_Date` into a proper date field.
- Retain missing information where business follow-up was required.

Missing values were not filled with invented information.

---

## 9.4 Customer Validation

Validation checks included:

- Customer ID format
- Email format
- Phone number format
- Customer name
- Customer type
- Status
- Created date
- Future-date validation

The validation process classified records into:

- **Good**
- **Issues Found**
- **Missing Information**

---

# 10. Product Master Analysis

## 10.1 Product Master Structure

The Product Master contained:

- `Product_ID`
- `Product_Name`
- `Category`
- `Brand`
- `Unit_of_Measure`
- `Status`
- `Standard_Cost`

**Total records: 512**
