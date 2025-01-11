-- 4. remove unnecessary data

-- total_laid_off and percentage_laid_off columns
SELECT *
FROM layoffs_staging_02
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- remove total_laid_off and percentage_laid_off null rows
DELETE
FROM layoffs_staging_02
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- remove row_num column
ALTER TABLE layoffs_staging_02
DROP COLUMN row_num;

-- check the whole table
SELECT *
FROM layoffs_staging_02;