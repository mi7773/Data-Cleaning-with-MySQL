-- 2. Standardize the data

-- company column
SELECT company, TRIM(company)
FROM layoffs_staging_02;

-- remove whitesapaces
UPDATE layoffs_staging_02
SET company = TRIM(company);

-- no whitespaces
SELECT company, TRIM(company)
FROM layoffs_staging_02;

-- industry column
SELECT DISTINCT industry
FROM layoffs_staging_02
ORDER BY industry;

-- inconsistent naming
SELECT *
FROM layoffs_staging_02
WHERE industry LIKE 'Crypto%';

-- uniforming naming
UPDATE layoffs_staging_02
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- consistent naming
SELECT DISTINCT industry
FROM layoffs_staging_02
ORDER BY industry;

-- location column
SELECT DISTINCT location
FROM layoffs_staging_02
ORDER BY location;

-- country column
SELECT DISTINCT country
FROM layoffs_staging_02
ORDER BY country;

-- inconsistent naming
SELECT *
FROM layoffs_staging_02
WHERE country LIKE 'United States%';

-- uniforming naming
UPDATE layoffs_staging_02
SET country = 'United States'
WHERE country LIKE  'United States%';

-- uniforming naming (another way)
UPDATE layoffs_staging_02
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

-- consistent naming
SELECT DISTINCT country
FROM layoffs_staging_02
ORDER BY country;

-- date column
SELECT `date`
FROM layoffs_staging_02;

-- text to date format
UPDATE layoffs_staging_02
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

-- date column with date format
SELECT `date`
FROM layoffs_staging_02;

-- change date column data type
ALTER TABLE layoffs_staging_02
MODIFY COLUMN `date` DATE;