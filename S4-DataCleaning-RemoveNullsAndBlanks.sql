-- Performing the Step 4: Removing NULLs or Blanks

-- Displaying all distinct industries to find any irregularities in an Ordered manner
SELECT DISTINCT industry
FROM world_layoffs.layoffs_staging2
ORDER BY 1;

-- Displaying all data with industry column having Nulls or Blanks
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE industry IS NULL OR industry = '';

-- Displaying all data with the company column having 'Appsmith'
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE company = 'Appsmith';

-- Updating the table `layoffs_staging2` by setting the industry as 'Product' for the 'Appsmith' company
UPDATE world_layoffs.layoffs_staging2
SET industry = 'Product'
WHERE company = 'Appsmith';

-- Updating the table `layoffs_staging2` by setting the industry as Blank for the 'Appsmith' company
UPDATE world_layoffs.layoffs_staging2
SET industry = ''
WHERE company = 'Appsmith';

-- Updating the table `layoffs_staging2` by giving the industry column Null values instead of Blanks
UPDATE world_layoffs.layoffs_staging2
SET industry = NULL
WHERE industry = '';

-- Joining all columns of the `layoffs_staging2` table to find multiple occurrences of the same company by comparing the industry column
SELECT *
FROM world_layoffs.layoffs_staging2 t1
JOIN world_layoffs.layoffs_staging2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE (t1.industry IS NULL OR t1.industry = '')
AND (t2.industry IS NOT NULL);

-- Joining only the company and industry columns of the `layoffs_staging2` table in such a way that the industry column is compared to find multiple occurrences of the same company
SELECT t1.company, t1.industry, t2.company, t2.industry
FROM world_layoffs.layoffs_staging2 t1
JOIN world_layoffs.layoffs_staging2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE (t1.industry IS NULL OR t1.industry = '')
AND (t2.industry IS NOT NULL);

-- Updating the industry column of the `layoffs_staging2` table by finding multiple occurrences of the same company after comparison of the industry column
UPDATE world_layoffs.layoffs_staging2 t1
JOIN world_layoffs.layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL OR t1.industry = '')
AND (t2.industry IS NOT NULL);

-- Joining only the company and industry columns of the `layoffs_staging2` table in such a way that the industry column is compared to find multiple occurrences of the same company
SELECT t1.company, t1.industry, t2.company, t2.industry
FROM world_layoffs.layoffs_staging2 t1
JOIN world_layoffs.layoffs_staging2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE (t1.industry IS NULL)
AND (t2.industry IS NOT NULL);

-- Updating the industry column of the `layoffs_staging2` table by finding multiple occurrences of the same company after comparison of the industry column
UPDATE world_layoffs.layoffs_staging2 t1
JOIN world_layoffs.layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL OR t1.industry = '')
AND (t2.industry IS NOT NULL);

-- Displaying all records where the column total_laid_off has Nulls or Blanks
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE total_laid_off IS NULL OR total_laid_off = '';

-- Displaying all records where the columns total_laid_off and percentage_laid_off has Nulls or Blanks
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE (total_laid_off IS NULL OR total_laid_off = '')
AND (percentage_laid_off IS NULL OR percentage_laid_off = '');

-- Updating the column total_laid_off of `layoffs_staging2` table with Nulls instead of Blanks 
UPDATE world_layoffs.layoffs_staging2
SET total_laid_off = NULL
WHERE total_laid_off = '';

-- Updating the column percentage_laid_off of `layoffs_staging2` table with Nulls instead of Blanks 
UPDATE world_layoffs.layoffs_staging2
SET percentage_laid_off = NULL
WHERE percentage_laid_off = '';

-- Updating the column funds_raised of `layoffs_staging2` table with Nulls instead of Blanks 
UPDATE world_layoffs.layoffs_staging2
SET funds_raised = NULL
WHERE funds_raised = '';

-- Updating the column location of the `layoffs_staging2` table with Nulls instead of Blanks 
UPDATE world_layoffs.layoffs_staging2
SET location = NULL
WHERE location = '';
