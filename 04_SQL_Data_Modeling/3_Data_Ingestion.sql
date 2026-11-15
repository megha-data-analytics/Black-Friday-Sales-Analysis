USE black_friday_db;
CREATE TABLE black_friday_staging (
    User_ID INT,
    Product_ID VARCHAR(20),
    Gender VARCHAR(10),
    Age VARCHAR(20),
    Occupation INT,
    City_Category VARCHAR(5),
    Stay_In_Current_City_Years VARCHAR(10),
    Marital_Status INT,
    Product_Category_1 INT,
    Product_Category_2 varchar(20),
    Product_Category_3 varchar(20),
    Purchase INT
);

SHOW TABLES;

DESCRIBE black_friday_staging;

SHOW VARIABLES LIKE 'secure_file_priv';

USE black_friday_db;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Black Friday Data.csv'
INTO TABLE black_friday_staging
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS Total_Rows
FROM black_friday_staging;

SELECT COUNT(*) 
FROM black_friday_staging;

SELECT COUNT(DISTINCT User_ID) AS Total_Customers
FROM black_friday_staging;

SELECT COUNT(DISTINCT Product_ID) AS Total_Products
FROM black_friday_staging;

SELECT 
    MIN(Purchase) AS Minimum_Purchase,
    MAX(Purchase) AS Maximum_Purchase,
    AVG(Purchase) AS Average_Purchase,
    SUM(Purchase) AS Total_Sales
FROM black_friday_staging;

SELECT
    COUNT(*) AS Total_Rows,
    SUM(User_ID IS NULL) AS Missing_User_ID,
    SUM(Product_ID IS NULL) AS Missing_Product_ID,
    SUM(Gender IS NULL) AS Missing_Gender,
    SUM(Age IS NULL) AS Missing_Age,
    SUM(Purchase IS NULL) AS Missing_Purchase
FROM black_friday_staging;

SELECT 
    COUNT(*) AS Total_Rows,
    SUM(CASE WHEN Product_Category_2 IS NULL OR Product_Category_2 = '' OR Product_Category_2 = 0 THEN 1 ELSE 0 END) AS Missing_Category_2,
    SUM(CASE WHEN Product_Category_3 IS NULL OR Product_Category_3 = '' OR Product_Category_3 = 0 THEN 1 ELSE 0 END) AS Missing_Category_3
FROM black_friday_staging;

SELECT *
FROM black_friday_staging
ORDER BY RAND()
LIMIT 10;

INSERT INTO black_friday_data (
    User_ID,
    Product_ID,
    Gender,
    Age,
    Occupation,
    City_Category,
    Stay_In_Current_City_Years,
    Marital_Status,
    Product_Category_1,
    Product_Category_2,
    Product_Category_3,
    Purchase
)
SELECT
    User_ID,
    Product_ID,
    Gender,
    Age,
    Occupation,
    City_Category,
    Stay_In_Current_City_Years,
    Marital_Status,
    Product_Category_1,
    Product_Category_2,
    Product_Category_3,
    Purchase
FROM black_friday_staging;

SELECT COUNT(*) AS Total_Transactions
FROM black_friday_data;

SELECT *
FROM black_friday_data
LIMIT 10;

SELECT 
    Transaction_ID,
    User_ID,
    Product_ID,
    Purchase
FROM black_friday_data
LIMIT 10;

SELECT COUNT(*) AS Total_Transactions
FROM black_friday_data;

SELECT COUNT(DISTINCT User_ID) AS Unique_Customers
FROM black_friday_data;

SELECT COUNT(DISTINCT Product_ID) AS Unique_Products
FROM black_friday_data;

SELECT SUM(Purchase) AS Total_Sales
FROM black_friday_data;

SELECT AVG(Purchase) AS Average_Purchase
FROM black_friday_data;

SELECT 
    MIN(Purchase) AS Min_Purchase,
    MAX(Purchase) AS Max_Purchase
FROM black_friday_data;

SELECT 
    Transaction_ID,
    COUNT(*) AS Duplicate_Count
FROM black_friday_data
GROUP BY Transaction_ID
HAVING COUNT(*) > 1;

CREATE INDEX idx_user_id
ON black_friday_data(User_ID);

CREATE INDEX idx_product_id
ON black_friday_data(Product_ID);

CREATE INDEX idx_city_category
ON black_friday_data(City_Category);

CREATE INDEX idx_product_category
ON black_friday_data(Product_Category_1);



