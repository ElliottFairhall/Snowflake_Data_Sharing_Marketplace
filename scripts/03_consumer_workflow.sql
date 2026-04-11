-- =============================================================================
-- 03_CONSUMER_WORKFLOW
-- =============================================================================
-- Purpose:    Mount and query shared data as a consumer
-- =============================================================================

-- 1. Create a database from the share
-- CREATE OR REPLACE DATABASE shared_customer_data FROM SHARE provider_org.provider_account.customer_analytics_share;

-- 2. Query the shared data
-- SELECT * FROM shared_customer_data.marts.shared_customer_summary;
