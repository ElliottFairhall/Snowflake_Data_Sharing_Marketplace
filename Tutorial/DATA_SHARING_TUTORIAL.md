# 🚀 Snowflake Data Sharing & Marketplace Tutorial

## 🎯 Learning Objectives

1. 🧠 Understand the concept of Secure Data Sharing and how it enables real-time, governed data exchange within
   Snowflake.

2. 🛠️ Master the creation and management of shares, including provider and consumer workflows.

3. 🔗 Learn how the Snowflake Marketplace connects data providers and consumers for discovery and monetisation.

## 📚 Table of Contents

- [🚀 Snowflake Data Sharing & Marketplace Tutorial](#-snowflake-data-sharing--marketplace-tutorial)
  - [🎯 Learning Objectives](#-learning-objectives)
  - [📚 Table of Contents](#-table-of-contents)
    - [🎉 Introduction](#-introduction)
    - [📝 Introduction to Secure Data Sharing](#-introduction-to-secure-data-sharing)
    - [📤 Provider Workflow — Creating a Share](#-provider-workflow--creating-a-share)
    - [📥 Consumer Workflow — Accessing Shared Data](#-consumer-workflow--accessing-shared-data)
    - [🏪 Snowflake Marketplace](#-snowflake-marketplace)
    - [🔒 Governance and Access Control](#-governance-and-access-control)
  - [💡 Tutorial](#-tutorial)
  - [🎈 Conclusion](#-conclusion)
  - [📖 Additional Resources](#-additional-resources)
  - [⚠️ Disclaimer](#%EF%B8%8F-disclaimer)

### 🎉 Introduction

Welcome to this tutorial on Snowflake Data Sharing and the Snowflake Marketplace! This tutorial is designed to help you
understand and implement secure, real-time data sharing between Snowflake accounts. By the end of this tutorial, you'll
be able to confidently share data with external partners, consume shared datasets, and explore the Marketplace. So,
let's dive in! 🏊‍♀️

### 📝 Introduction to Secure Data Sharing

Secure Data Sharing is one of Snowflake's most distinctive features. It allows you to share live, read-only data between
Snowflake accounts without copying or moving the data. The consumer accesses the provider's data in place, meaning
updates made by the provider are immediately visible to the consumer.

Key characteristics include:

- **Zero-copy**: No data is physically transferred or duplicated — consumers query the provider's storage directly.
- **Real-time**: Changes to the source data are reflected immediately for all consumers.
- **Governed**: Providers retain full control over what is shared, to whom, and can revoke access at any time.
- **Cross-region / cross-cloud**: Data can be shared across Snowflake regions and cloud providers using data
  replication.

There are two primary sharing models:

| Model            | Description                                              | Use Case                         |
| ---------------- | -------------------------------------------------------- | -------------------------------- |
| **Direct Share** | Share between specific Snowflake accounts                | Known partners, internal teams   |
| **Listing**      | Publish to the Snowflake Marketplace (public or private) | Broad distribution, monetisation |

### 📤 Provider Workflow — Creating a Share

As a data provider, you create a **share** object and add the database objects (tables, views, UDFs) you wish to make
available.

```sql
-- Step 1: Create a share
CREATE OR REPLACE SHARE customer_analytics_share;

-- Step 2: Grant access to the database and schema
GRANT USAGE ON DATABASE analytics TO SHARE customer_analytics_share;
GRANT USAGE ON SCHEMA analytics.marts TO SHARE customer_analytics_share;

-- Step 3: Grant access to specific objects
GRANT SELECT ON TABLE analytics.marts.dim_customers TO SHARE customer_analytics_share;
GRANT SELECT ON TABLE analytics.marts.fct_orders TO SHARE customer_analytics_share;

-- Step 4: Add consumer accounts
ALTER SHARE customer_analytics_share ADD ACCOUNTS = org1.consumer_account;
```

It is best practice to share **secure views** rather than raw tables, as this allows you to apply row-level filtering
and column masking:

```sql
-- Create a secure view for sharing
CREATE OR REPLACE SECURE VIEW analytics.marts.shared_customer_summary AS
SELECT
    customer_segment,
    COUNT(*) AS customer_count,
    SUM(lifetime_revenue) AS total_revenue
FROM analytics.marts.dim_customers
GROUP BY customer_segment;

GRANT SELECT ON VIEW analytics.marts.shared_customer_summary TO SHARE customer_analytics_share;
```

### 📥 Consumer Workflow — Accessing Shared Data

As a data consumer, you create a **database from a share** to access the shared objects. The data appears as a read-only
database in your account.

```sql
-- Create a database from the share
CREATE OR REPLACE DATABASE shared_customer_data FROM SHARE provider_org.provider_account.customer_analytics_share;

-- Query the shared data
SELECT * FROM shared_customer_data.marts.shared_customer_summary;
```

The consumer does not need to manage storage, run ETL pipelines, or worry about data freshness — the data is always
live.

### 🏪 Snowflake Marketplace

The Snowflake Marketplace is a platform where data providers can publish **listings** — curated datasets, data services,
or Snowflake Native Apps — for discovery by other Snowflake users.

Key concepts:

- **Free listings**: Available at no cost (e.g., public reference data, weather data).
- **Paid listings**: Monetised datasets with usage-based or subscription pricing.
- **Private listings**: Shared with specific accounts only (ideal for B2B data exchange).
- **Data products**: Can include tables, views, UDFs, stored procedures, or full Native Apps.

Providers manage listings through the Snowflake web interface (Snowsight) under **Data Products > Provider Studio**.

### 🔒 Governance and Access Control

Secure Data Sharing integrates with Snowflake's governance framework:

- **Role-based access control (RBAC)**: The consumer's administrators grant roles to users who need access to the shared
  database.
- **Secure views**: Ensure consumers cannot see the underlying table definitions or data they should not access.
- **Data Clean Rooms**: Enable privacy-preserving analytics where multiple parties can jointly analyse data without
  exposing raw records.

```sql
-- Consumer grants access to shared data
GRANT IMPORTED PRIVILEGES ON DATABASE shared_customer_data TO ROLE analyst;
```

## 💡 Tutorial

In this tutorial, we'll be exploring how to set up a data sharing workflow between two Snowflake accounts. We'll create
a share as a provider, configure secure views for governed access, and consume the shared data as a consumer — all
without any data movement or ETL.

By the end of this tutorial, you'll have gained a comprehensive understanding of how to leverage Snowflake's data
sharing capabilities to enable real-time, governed data collaboration with partners and teams.

## 🎈 Conclusion

In conclusion, Secure Data Sharing and the Snowflake Marketplace are transformative features that enable real-time,
zero-copy data collaboration across organisations. Whether you're sharing data with a known partner via a direct share
or publishing datasets to the broader Marketplace, Snowflake provides the governance, security, and simplicity needed to
make data exchange seamless. These capabilities make Snowflake not just a data warehouse, but a true data collaboration
platform.

## 📖 Additional Resources

- [Secure Data Sharing Documentation](https://docs.snowflake.com/en/user-guide/data-sharing-intro)
- [Snowflake Marketplace](https://app.snowflake.com/marketplace)
- [Quick Start - Getting Started with Data Sharing](https://quickstarts.snowflake.com/guide/getting_started_with_data_sharing/)
- [Data Clean Rooms](https://docs.snowflake.com/en/user-guide/cleanrooms)

## ⚠️ Disclaimer

Please note that whilst we strive to keep this tutorial up-to-date, Snowflake's features and capabilities may change
over time. Always refer to the [official Snowflake documentation](https://docs.snowflake.com/) for the most accurate and
current information.
