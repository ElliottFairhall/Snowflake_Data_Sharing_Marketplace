-- =============================================================================
-- 00_SETUP_ENVIRONMENT
-- =============================================================================
-- Purpose:    Provision the necessary databases, schemas, and sample data
--             required to execute the Data Sharing provider workflows.
-- =============================================================================

-- WARNING: this script uses CREATE OR REPLACE TABLE as a reset-to-sample-data step. It replaces the tables below,
-- so re-running it discards changes you made to them (Time Travel keeps the old version only while retention
-- allows). The database names carry the tutorial prefix SHARING_, so it does not touch another tutorial's tables.

USE ROLE SYSADMIN;

-- 1. Create base Database and Schema
CREATE DATABASE IF NOT EXISTS SHARING_ANALYTICS;
CREATE SCHEMA IF NOT EXISTS SHARING_ANALYTICS.MARTS;

-- 2. Create and populate Customer dimension
CREATE OR REPLACE TABLE SHARING_ANALYTICS.MARTS.DIM_CUSTOMERS (
    CUSTOMER_ID INT,
    CUSTOMER_NAME VARCHAR,
    CUSTOMER_SEGMENT VARCHAR,
    LIFETIME_REVENUE NUMBER
);

INSERT INTO SHARING_ANALYTICS.MARTS.DIM_CUSTOMERS VALUES
    (1, 'TechCorp Ltd', 'Enterprise', 150000),
    (2, 'Global Logistics', 'Enterprise', 210000),
    (3, 'Local Bakery', 'SMB', 12000),
    (4, 'Creative Agency', 'Mid-Market', 45000);

-- 3. Create and populate Orders fact table
CREATE OR REPLACE TABLE SHARING_ANALYTICS.MARTS.FCT_ORDERS (
    ORDER_ID INT,
    CUSTOMER_ID INT,
    ORDER_DATE DATE,
    TOTAL_AMOUNT NUMBER
);

INSERT INTO SHARING_ANALYTICS.MARTS.FCT_ORDERS VALUES
    (1001, 1, '2026-03-01', 5000),
    (1002, 1, '2026-03-15', 7500),
    (1003, 3, '2026-03-20', 120),
    (1004, 4, '2026-04-05', 2100);
