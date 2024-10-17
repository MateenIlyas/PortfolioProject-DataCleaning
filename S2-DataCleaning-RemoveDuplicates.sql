-- Performing the Step 2: Removing Duplicates

-- Attaching a new column with row numbers which will be greater than 1 if same record appears multiple times
SELECT *, ROW_NUMBER() OVER (PARTITION BY
	company,  location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised
) AS row_num
FROM world_layoffs.layoffs_staging;

-- Same search result but only ordered in ascending manner on company column
SELECT *, ROW_NUMBER() OVER (PARTITION BY
	company,  location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised
) AS row_num
FROM world_layoffs.layoffs_staging
ORDER BY company ASC;

-- Making a duplicates CTE to find the row nums greater than 1
WITH duplicates_cte AS
(
SELECT *, ROW_NUMBER() OVER (PARTITION BY
	company,  location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised
) AS row_num
FROM world_layoffs.layoffs_staging
)
SELECT *
FROM duplicates_cte
WHERE row_num > 1;

-- Searching all records for a company called 'Cazoo'
SELECT *
FROM world_layoffs.layoffs_staging
WHERE company = 'Cazoo';

-- Attaching a new column with row numbers which will be greater than 1 if same record appears multiple times
WITH duplicates_cte AS
(
SELECT *, ROW_NUMBER() OVER (PARTITION BY
	company,  location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised
) AS row_num
FROM world_layoffs.layoffs_staging
)
DELETE
FROM duplicates_cte
WHERE row_num > 1;

-- Creating a new table `layoffs_staging2` for editing etc
CREATE TABLE `layoffs_staging2` (
	`company` text,
	`location` text,
	`industry` text,
	`total_laid_off` text,
	`percentage_laid_off` text,
	`date` text,
	`stage` text,
	`country` text,
	`funds_raised` text,
    `row_num` text
);

-- Displaying all records of the newly created `layoffs_staging2` table
SELECT *
FROM world_layoffs.layoffs_staging2;

-- Inserting all data from the `layoffs_staging` table into the `layoffs_staging2` table
INSERT INTO world_layoffs.layoffs_staging2
SELECT *, ROW_NUMBER() OVER (PARTITION BY
	company,  location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised
) AS row_num
FROM world_layoffs.layoffs_staging;

-- Checking to see which records are appearing multiple times
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE row_num > 1;

-- Deleting all of the duplicate records
DELETE
FROM world_layoffs.layoffs_staging2
WHERE row_num > 1;
