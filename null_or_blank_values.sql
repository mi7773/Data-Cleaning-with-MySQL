-- 3. null values or blank values

-- total_laid_off and percentage_laid_off columns
SELECT *
FROM layoffs_staging_02
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- industry column
SELECT *
FROM layoffs_staging_02
WHERE industry IS NULL
OR industry = '';

-- Airbnb company
SELECT *
FROM layoffs_staging_02
WHERE company = 'Airbnb';

-- Carvana company
SELECT *
FROM layoffs_staging_02
WHERE company = 'Carvana';

-- convert industry blanks to nulls
UPDATE layoffs_staging_02
SET industry = NULL
WHERE industry = '';

-- fill null industry
UPDATE layoffs_staging_02 AS t1
JOIN layoffs_staging_02 AS t2
	ON t1.company = t2.company
    AND t1.location = t2.location
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

-- Bally's Interactive company
SELECT *
FROM layoffs_staging_02
WHERE company LIKE 'Bally%';