-- Performing the Step 5: Delete unnecessary rows/columns

-- Displaying all records of `layoffs_staging2` table where the columns total_laid_off and percentage_laid_off has Nulls
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- Deleting all records of `layoffs_staging2` table where the columns total_laid_off and percentage_laid_off has Nulls
DELETE
FROM world_layoffs.layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- Altering table `layoffs_staging2` to delete the column row_num
ALTER TABLE world_layoffs.layoffs_staging2
DROP COLUMN row_num;

-- Displaying all records of `layoffs_staging2` table
SELECT *
FROM world_layoffs.layoffs_staging2;
