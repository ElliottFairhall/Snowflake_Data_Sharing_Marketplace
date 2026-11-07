-- =============================================================================
-- 02_SECURE_SHARING_VIEWS
-- =============================================================================
-- Purpose:    Implement secure views for governed data sharing
-- =============================================================================

-- 1. Create a secure view for sharing
CREATE OR REPLACE SECURE VIEW sharing_analytics.marts.shared_customer_summary AS
SELECT
    customer_segment,
    COUNT(*) AS customer_count,
    SUM(lifetime_revenue) AS total_revenue
FROM sharing_analytics.marts.dim_customers
GROUP BY customer_segment;

-- 2. Grant access to the share (the only object the share exposes)
GRANT SELECT ON VIEW sharing_analytics.marts.shared_customer_summary TO SHARE customer_analytics_share;
