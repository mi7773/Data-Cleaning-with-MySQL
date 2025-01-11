-- data cleaning
-- 1. remove duplicates
-- 2. standardize the data
-- 3. null values or blank values
-- 4. remove unnecessary data

-- explore data
SELECT *
FROM layoffs
LIMIT 10;

-- create staging table
CREATE TABLE layoffs_staging_01
LIKE layoffs;

-- check staging table
SELECT *
FROM layoffs_staging_01;

-- insert data into satging table
INSERT layoffs_staging_01
SELECT *
FROM layoffs;

-- check staging table data
SELECT *
from layoffs_staging_01
LIMIT 10;