-- =============================================================================
-- 01_PROVIDER_SHARE_SETUP
-- =============================================================================
-- Purpose:    Create and configure a secure data share as a provider
-- =============================================================================

-- 1. Create a share object
CREATE OR REPLACE SHARE customer_analytics_share;

-- 2. Grant access to the database and schema
GRANT USAGE ON DATABASE analytics TO SHARE customer_analytics_share;
GRANT USAGE ON SCHEMA analytics.marts TO SHARE customer_analytics_share;

-- 3. Grant access to specific objects
GRANT SELECT ON TABLE analytics.marts.dim_customers TO SHARE customer_analytics_share;
GRANT SELECT ON TABLE analytics.marts.fct_orders TO SHARE customer_analytics_share;

-- 4. Add consumer accounts
-- ALTER SHARE customer_analytics_share ADD ACCOUNTS = org1.consumer_account;
