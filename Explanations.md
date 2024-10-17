# PortfolioProject-DataCleaning

---

## First up, creating a schema "world_layoffs"
## Download layoffs.csv from "https://www.kaggle.com/datasets/swaptr/layoffs-2022"
## Import the CSV file onto the database

---

### Step 1:
Create a separate staging or working table where the computations will be performed instead of the original table

> This task is achieved using SQL statements such as CREATE TABLE [table_name], INSERT [table_name], as well as the LIKE [table_name]

<br />

### Step 2:
Removing Duplicates

> At first, we will attach a new column row_num, to identify multiple occurrences of the same records<br />
> This is done by using the ROW_NUMBER() function along with the OVER() with PARTITION BY inside it<br />
> After that, the rows where the row_num is greater than 1 are identified<br />
> This is done by using the CTE and then applying the WHERE condition<br />
> The duplicate rows will be removed<br />
> We will use CTE to fetch those records and then use the DELETE statement to delete them from the table.
> The next step is to create yet another new table and copy the distinct records<br />
> Further processes will be done on that new table

<br />

### Step 3:
Standardize the alphabet, numbers, or characters in the data

> Check to see if any column has extra whitespaces at the start or end of the actual data
> Remove the whitespaces by using the TRIM() function
> Check if the industry names are consistent across all rows by using the DISTINCT option
> Updating the table with changed data
> Check the data type as well as the formatting of the 'date' column
> Formatting can be changed by using the DATE_FORMAT() function
> It is important to convert the date by using the STR_TO_DATE() function
> Lastly, using ALTER TABLE [table_name] and MODIFY COLUMN to change the data type to 'date' from 'string'

<br />

### Step 4:
Removing all Nulls or blanks
<br /><br />

### Step 5:
Eliminating the unnecessary columns to reduce data size
<br /><br />

