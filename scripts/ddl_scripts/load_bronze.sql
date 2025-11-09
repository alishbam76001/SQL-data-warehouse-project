--TO EXECUTE THE STORED PROCEDURE
EXEC bronze.load_bronze;

PRINT('--------------------------------------------------------------')
CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN 
    DECLARE @batch_load_start_time DATETIME, @batch_load_end_time DATETIME
    SET @batch_load_start_time = GETDATE();
    TRUNCATE TABLE bronze.crm_cust_info;
    BULK INSERT bronze.crm_cust_info 
    FROM "C:\Users\00\Downloads\cust_info.csv"
    WITH (
	    FIRSTROW = 2,
	    FIELDTERMINATOR = ',',
	    TABLOCK
    )

    -- Truncate the sales table
    TRUNCATE TABLE bronze.crm_sales_details;

    -- Bulk insert from CSV
    BULK INSERT bronze.crm_sales_details
    FROM 'C:\Users\00\Downloads\sales_details.csv'
    WITH (
        FIRSTROW = 2,            -- Skip header row
        FIELDTERMINATOR = ',',    -- CSV delimiter
        TABLOCK                  -- Lock table for faster insert
    );

    -- Truncate the product info table
    TRUNCATE TABLE bronze.crm_prd_info;

    -- Bulk insert from CSV
    BULK INSERT bronze.crm_prd_info
    FROM 'C:\Users\00\Downloads\prd_info.csv'
    WITH (
        FIRSTROW = 2,            -- Skip header row
        FIELDTERMINATOR = ',',    -- CSV delimiter
        TABLOCK                  -- Lock table for faster insert
    );

    -- Truncate the ERP customer table
    TRUNCATE TABLE bronze.erp_cust_az12;

    -- Bulk insert from CSV
    BULK INSERT bronze.erp_cust_az12
    FROM 'C:\Users\00\Downloads\CUST_AZ12.csv'
    WITH (
        FIRSTROW = 2,            -- Skip header row
        FIELDTERMINATOR = ',',    -- CSV delimiter
        TABLOCK                  -- Lock table for faster insert
    );

    -- Truncate the ERP location table
    TRUNCATE TABLE bronze.erp_loc_a101;

    -- Bulk insert from CSV
    BULK INSERT bronze.erp_loc_a101
    FROM 'C:\Users\00\Downloads\LOC_A101.csv'
    WITH (
        FIRSTROW = 2,            -- Skip header row
        FIELDTERMINATOR = ',',    -- CSV delimiter
        TABLOCK                  -- Lock table for faster insert
    );


    -- Truncate the ERP product category table
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;

    -- Bulk insert from CSV
    BULK INSERT bronze.erp_px_cat_g1v2
    FROM 'C:\Users\00\Downloads\PX_CAT_G1V2.csv'
    WITH (
        FIRSTROW = 2,            -- Skip header row
        FIELDTERMINATOR = ',',    -- CSV delimiter
        TABLOCK                  -- Lock table for faster insert
    );
    SET @batch_load_end_time = GETDATE();
    PRINT('TOTAL LOAD TIME: ' + CAST(DATEDIFF(SECOND, @batch_load_start_time, @batch_load_end_time) AS VARCHAR(10)) + ' SECONDS') 
END
