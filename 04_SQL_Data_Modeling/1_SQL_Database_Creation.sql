CREATE DATABASE black_friday_db;
USE black_friday_db;
CREATE TABLE black_friday_data (
    
    User_ID INT NOT NULL,
    
    Product_ID VARCHAR(20) NOT NULL,
    
    Gender VARCHAR(10),
    
    Age VARCHAR(20),
    
    Occupation INT,
    
    City_Category VARCHAR(5),
    
    Stay_In_Current_City_Years VARCHAR(10),
    
    Marital_Status INT,
    
    Product_Category_1 INT,
    
    Product_Category_2 varchar(20),
    
    Product_Category_3 varchar(20),
    
    Purchase INT NOT NULL,
    
    CHECK (Purchase > 0)
);

drop table black_friday_data ;

CREATE TABLE black_friday_data (
    
    Transaction_ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    
    User_ID INT NOT NULL,
    
    Product_ID VARCHAR(20) NOT NULL,
    
    Gender VARCHAR(10),
    
    Age VARCHAR(20),
    
    Occupation INT,
    
    City_Category VARCHAR(5),
    
    Stay_In_Current_City_Years VARCHAR(10),
    
    Marital_Status INT,
    
    Product_Category_1 INT,
    
    Product_Category_2 varchar(20),
    
    Product_Category_3 varchar(20),
    
    Purchase INT NOT NULL,
    
    CHECK (Purchase > 0)
);

show tables;
DESCRIBE black_friday_data;

