CREATE TABLE bronze.sales_detail (
    sls_ord_num     INT,            -- Order number
    sls_prd_key     INT,            -- Product key
    sls_cust_id     INT,            -- Customer ID
    sls_order_dt    DATE,           -- Order date
    sls_ship_dt     DATE,           -- Ship date
    sls_due_dt      DATE,           -- Due date
    sls_sales       DECIMAL(18,2),  -- Total sales amount
    sls_quantity    INT,            -- Quantity sold
    sls_price       DECIMAL(18,2)   -- Unit price
);
