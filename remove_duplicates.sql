-- 1. Remove duplicates

-- duplicate_cte
WITH duplicate_cte AS (
	SELECT
		*,
		ROW_NUMBER() OVER(
			PARTITION BY 
				company,
				location,
				industry,
				total_laid_off,
				percentage_laid_off,
				`date`,
                stage,
                country,
                funds_raised_millions) AS row_num
	FROM layoffs_staging_01
)

-- duplicates
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

-- check one of duplicates
SELECT *
FROM layoffs_staging_01
WHERE company = 'Casper';

-- create another staging table
CREATE TABLE `layoffs_staging_02` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- check staging table
SELECT *
FROM layoffs_staging_02;

-- insert data into satging table
INSERT INTO layoffs_staging_02
SELECT
	*,
	ROW_NUMBER() OVER(
		PARTITION BY 
			company,
			location,
			industry,
			total_laid_off,
			percentage_laid_off,
			`date`,
			stage,
			country,
			funds_raised_millions) AS row_num
FROM layoffs_staging_01;

-- check staging table data
SELECT *
from layoffs_staging_02
LIMIT 10;

-- duplicates
SELECT *
FROM layoffs_staging_02
WHERE row_num > 1;

-- remove duplicates
DELETE
FROM layoffs_staging_02
WHERE row_num > 1;