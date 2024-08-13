-- Data Cleaning, Transformation and Loading using MS Sql Query:
-- 1. Made sure that all the data types of the tables in the dataset are of the right data type.
-- 2. I added a new column "total_revenue" which was derived from multiplying the data in the "price" column by the data in the "quantity" column.
-- 3. I added a new column "age_band" by extracting the data in the "age" column and grouped them (Children, Teenager, Young Adult, Mid-aged Adult, and Old Adult) using the "Update" and "Set query".
-- 4. Duplicated the "invoice_date" column into 2 columns, renamed the 2 columns to "new_invoice_date1" and "new_invoice_date2".
-- 5. Splitted the "new_invoice_date1" and extracted only the "Year", added a new column "invoice_year" with an int data type and extracted the "new_invoice_data1" column data into it, then dropped the "new_invoice_data1" column from the table.
-- 6. Splitted the "new_invoice_date2" and extracted only the "Month", added a new column "invoice_month" with an int data type and extracted the "new_invoice_data2" column data into it, dropped the "new_invoice_data2" column from the table.
-- 7. Created a new column "invoice_month_name" which extracts the month values from the "invoice_month" column and group them into: January - December, dropped the "invoice_month" column, renamed the "invoice_month_name" column to "invoice_month".


Select *FROM dbo.customer_shopping_data;


-- 1. Made sure that all the data types of the tables in the dataset are of the right data type.
EXEC sp_help 'customer_shopping_data';
SELECT * FROM customer_shopping_data;


-- 2. I added a new column "total_revenue" which was derived from multiplying the data in the "price" column by the data in the "quantity" column.
ALTER TABLE customer_shopping_data
ADD total_revenue DECIMAL;

Select * FROM dbo.customer_shopping_data;

UPDATE customer_shopping_data
SET price = ROUND(price, 2);

UPDATE customer_shopping_data
SET total_revenue = ROUND(total_revenue, 2);

UPDATE customer_shopping_data
SET total_revenue = price * quantity;

Select * FROM dbo.customer_shopping_data;


-- 3. I added a new column "age_band" by extracting the data in the "age" column and grouped them (Children, Teenager, Young Adult, 
--    Mid-aged Adult, and Old Adult) using the "Update" and "Set query".
ALTER TABLE customer_shopping_data
ADD age_band VARCHAR(20);

Select * FROM dbo.customer_shopping_data;


UPDATE customer_shopping_data
SET age_band = CASE 
                WHEN age >= 0 AND age <= 12 THEN 'Children'
                WHEN age >= 13 AND age <= 19 THEN 'Teenager'
                WHEN age >= 20 AND age <= 39 THEN 'Young Adult'
                WHEN age >= 40 AND age <= 60 THEN 'Mid-aged Adult'
                WHEN age >= 61 THEN 'Old Adult'
                ELSE ''
            END;

Select * FROM dbo.customer_shopping_data;


-- 4. Duplicated the "invoice_date" column into 2 columns, renamed the 2 columns to "new_invoice_date1" and "new_invoice_date2".
ALTER TABLE customer_shopping_data
ADD new_invoice_date1 VARCHAR(20);

UPDATE customer_shopping_data
SET new_invoice_date1 = invoice_date;

ALTER TABLE customer_shopping_data
ADD new_invoice_date2 VARCHAR(20);

UPDATE customer_shopping_data
SET new_invoice_date2 = invoice_date;

Select *FROM dbo.customer_shopping_data;


-- 5. Splitted the "new_invoice_date1" and extracted only the "Year" using the substring and charindex query, 
--    added a new column "invoice_year" with an int data type and extracted the "new_invoice_data1" column data into it,
--    dropped the "new_invoice_data1" column from the table.
UPDATE customer_shopping_data
SET new_invoice_date1 = 
CAST(YEAR(invoice_date) AS VARCHAR(20));

Select * FROM dbo.customer_shopping_data;                               

ALTER TABLE customer_shopping_data
ADD invoice_year INT;

UPDATE customer_shopping_data
SET invoice_year = new_invoice_date1;

ALTER TABLE customer_shopping_data
DROP COLUMN new_invoice_date1;

Select *FROM dbo.customer_shopping_data;

-- 6. Splitted the "new_invoice_date2" and extracted only the "Month" using the substring and charindex query, 
--    added a new column "invoice_month" with an int data type and extracted the "new_invoice_data2" column dat into it,
--    dropped the "new_invoice_data2" column from the table.
UPDATE customer_shopping_data
SET new_invoice_date2 = 
CAST(MONTH(invoice_date) AS VARCHAR(20));

Select *FROM dbo.customer_shopping_data    

ALTER TABLE customer_shopping_data
ADD invoice_month INT;

UPDATE customer_shopping_data
SET invoice_month = new_invoice_date2;

ALTER TABLE customer_shopping_data
DROP COLUMN new_invoice_date2;

Select * FROM dbo.customer_shopping_data;


-- 7. Created a new column "invoice_month_name" which extracts the month values from the "invoice_month" column and group them into: January - December. 
--    Dropped the "invoice_month" column.
--    Renamed the "invoice_month_name" column to "invoice_month".

ALTER TABLE customer_shopping_data
ADD invoice_month_name VARCHAR(20);

Select * FROM dbo.customer_shopping_data;

UPDATE customer_shopping_data
SET invoice_month_name =  CASE invoice_month
                              WHEN 1 THEN 'Jan'
						      WHEN 2 THEN 'Feb'
						      WHEN 3 THEN 'March'
						      WHEN 4 THEN 'April'
						      WHEN 5 THEN 'May'
						      WHEN 6 THEN 'June'
						      WHEN 7 THEN 'July'
						      WHEN 8 THEN 'Aug'
						      WHEN 9 THEN 'Sept'
						      WHEN 10 THEN 'Oct'
						      WHEN 11 THEN 'Nov'
						      WHEN 12 THEN 'Dec'
						      ELSE ' '
					      END;

Select *FROM dbo.customer_shopping_data;

ALTER TABLE customer_shopping_data
DROP COLUMN invoice_month;

Select * FROM dbo.customer_shopping_data;


ALTER TABLE customer_shopping_data
ADD invoice_month VARCHAR(20);

Select *FROM dbo.customer_shopping_data;

UPDATE customer_shopping_data
SET invoice_month = invoice_month_name;

Select *FROM dbo.customer_shopping_data;

ALTER TABLE customer_shopping_data
DROP COLUMN invoice_month_name;

Select * FROM dbo.customer_shopping_data;