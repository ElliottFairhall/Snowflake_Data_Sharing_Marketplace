# 🤝 Snowflake Data Sharing & Marketplace

[![Snowflake](https://img.shields.io/badge/Snowflake-Cloud%20Data%20Platform-29B5E8?style=flat&logo=snowflake)](https://www.snowflake.com/)
[![SQL](https://img.shields.io/badge/SQL-Snowflake%20Dialect-lightgrey)](https://docs.snowflake.com/)
[![Status](https://img.shields.io/badge/Status-Educational-success)](https://github.com/ElliottFairhall/Snowflake_Data_Sharing_Marketplace)

A guide to mastering **Secure Data Sharing** and the **Snowflake Marketplace**. This project focuses on zero-copy data
exchange, provider/consumer workflows, and secure view implementation for governed B2B data collaboration.

______________________________________________________________________

## Key Features

- **Provider Workflow**: Creating shares and granting object-level permissions.
- **Secure Views**: Using views as a governance layer for shared data.
- **Consumer Workflow**: Mounting shared databases and real-time querying.
- **Marketplace**: Understanding public/private listings and monetisation.

______________________________________________________________________

## Project Structure

```text
Snowflake_Data_Sharing_Marketplace/
├── README.md               # You are here
├── Tutorial/
│   └── DATA_SHARING_TUTORIAL.md # Step-by-step walkthrough
├── scripts/                # Extracted SQL scripts
│   ├── 01_provider_share_setup.sql
│   ├── 02_secure_sharing_views.sql
│   ├── 03_consumer_workflow.sql
│   └── 04_governance_grants.sql
└── data/                   # Sample listing metadata
```

______________________________________________________________________

## Getting Started

> **Environment Setup:** Before beginning, execute `scripts/00_setup_environment.sql` to provision the necessary
> databases, schemas, and sample data for this project.

1. Follow the [Tutorial](Tutorial/DATA_SHARING_TUTORIAL.md).
2. Ensure you have access to two Snowflake accounts (or a trial account with reader account capability) to test the
   provider/consumer roles.

______________________________________________________________________

## Author

**Elliott Fairhall** *Data Engineering Educational Series*
