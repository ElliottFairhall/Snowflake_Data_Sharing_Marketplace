-- =============================================================================
-- 01_PROVIDER_SHARE_SETUP
-- =============================================================================
-- Purpose:    Create and configure a secure data share as a provider
-- =============================================================================

-- 1. Create a share object (IF NOT EXISTS: replacing a share would drop every grant already made to it)
CREATE SHARE IF NOT EXISTS customer_analytics_share;

-- 2. Grant access to the database and schema
GRANT USAGE ON DATABASE sharing_analytics TO SHARE customer_analytics_share;
GRANT USAGE ON SCHEMA sharing_analytics.marts TO SHARE customer_analytics_share;

-- 3. Objects are added in 02_secure_sharing_views.sql, which grants a secure view.
-- Do NOT grant the base tables directly: that would expose every customer row to the consumer.
-- GRANT SELECT ON TABLE sharing_analytics.marts.dim_customers TO SHARE customer_analytics_share;  -- anti-pattern

-- 4. Add consumer accounts
-- ALTER SHARE customer_analytics_share ADD ACCOUNTS = org1.consumer_account;
