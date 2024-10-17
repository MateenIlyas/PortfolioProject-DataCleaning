-- Performing the Step 3: Standardizing data

-- Working on the company column of the `layoffs_staging2` table
SELECT company
FROM world_layoffs.layoffs_staging2;

-- Checking if TRIM can remove all unnecessary whitespaces from the company column
SELECT company, TRIM(company)
FROM world_layoffs.layoffs_staging2;

-- Updating the `layoffs_staging2` table and removing whitespaces from the company column
UPDATE world_layoffs.layoffs_staging2
SET company = TRIM(company);


-- Working on the industry column of the `layoffs_staging2` table
SELECT DISTINCT industry
FROM world_layoffs.layoffs_staging2
ORDER BY 1;

-- Checking the industry column to make the 'Crypto' industry names exactly the same
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE industry LIKE 'Crypto%'
ORDER BY 1;

-- Updating the industry column to shorten the 'Crypto' industry names
UPDATE world_layoffs.layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- Checking the industry column to make the 'https://www.calcalistech.com/ctechnews/article/rysmrkfua' industry names exactly the same
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE industry LIKE 'https://www.calcalistech.com/ctechnews/article/rysmrkfua';

-- Updating the industry column with 'https://www.calcalistech.com/ctechnews/article/rysmrkfua' industry names to 'Retail'
UPDATE world_layoffs.layoffs_staging2
SET industry = 'Retail'
WHERE industry LIKE 'https://www.calcalistech.com/ctechnews/article/rysmrkfua';


-- Working on location column
-- Viewing all records of the `layoffs_staging2` table
SELECT *
FROM world_layoffs.layoffs_staging2;

-- Displaying all unique locations from the `layoffs_staging2` table to find any irregularities
SELECT DISTINCT location
FROM world_layoffs.layoffs_staging2
ORDER BY 1;


-- Working on the country column and displaying all unique country names from the `layoffs_staging2` table to find any irregularities
SELECT DISTINCT country
FROM world_layoffs.layoffs_staging2
ORDER BY 1;

-- Checking if TRIM can remove trailing dots of the country column from the `layoffs_staging2` table
SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM world_layoffs.layoffs_staging2
ORDER BY 1;

-- Removing the trailing dots of the country column by using TRIM from the `layoffs_staging2` table
UPDATE world_layoffs.layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE industry LIKE 'United States%';


-- Working on `date` column
-- Displaying the date column of the `layoffs_staging2` table
SELECT `date`
FROM world_layoffs.layoffs_staging2;

-- Displaying a second column to convert string to date format
SELECT `date`, STR_TO_DATE(`date`, '%Y-%m-%d')
FROM world_layoffs.layoffs_staging2;

-- Displaying a third column where formats of the date can be changed to m-d-Y instead of Y-m-d
SELECT `date`,
	STR_TO_DATE(`date`, '%Y-%m-%d'),
    DATE_FORMAT(STR_TO_DATE(`date`, '%Y-%m-%d'), '%m-%d-%Y')
FROM world_layoffs.layoffs_staging2;

-- Displaying a third column, changing the date format to m-d-Y, and adding the alias
SELECT `date`,
	STR_TO_DATE(`date`, '%Y-%m-%d') AS converted_date,
    DATE_FORMAT(STR_TO_DATE(`date`, '%Y-%m-%d'), '%m-%d-%Y') AS formatted_date
FROM world_layoffs.layoffs_staging2;

-- Updating the date column in the `layoffs_staging2` table to reflect the change of date format to Y-m-d
UPDATE world_layoffs.layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%Y-%m-%d');

-- Altering the table `layoffs_staging2` to change the data type of the date column from string to date
ALTER TABLE world_layoffs.layoffs_staging2
MODIFY COLUMN `date` DATE;
