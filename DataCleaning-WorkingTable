## Performing the Step 1: Creating a separate table

#### Created a separate table `layoffs_staging` exactly like the `layoffs` table
CREATE TABLE layoffs_staging
LIKE layoffs;
<br /><br />

#### Displaying the empty `layoffs_staging` table to confirm whether it was created or not
SELECT *
FROM world_layoffs.layoffs_staging;
<br /><br />

#### Pick all records from `layoffs` table and Insert them into corresponding columns of the `layoffs_staging` table
INSERT layoffs_staging
SELECT *
FROM world_layoffs.layoffs;
