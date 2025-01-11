# Data Cleaning with MySQL

## Overview

This project demonstrates how I cleaned and transformed a messy dataset using MySQL as part of a learning experience inspired by a [YouTube tutorial](https://www.youtube.com/watch?v=4UltKCnnnTA). The goal was to enhance my skills in writing efficient SQL queries and applying best practices for data cleaning.

## Key Features

- Identifying and removing duplicate records.
- Handling NULL values and inconsistent data entries.
- Transforming data to improve structure and usability for analysis.
- Writing optimized SQL queries to process large datasets efficiently.

## Skills Gained

- Proficiency in MySQL for data cleaning and transformation.
- Understanding of common data quality issues and solutions.
- Writing structured and maintainable SQL scripts.

## Project Files

| File Name                     | Description                                         |
|-------------------------------|-----------------------------------------------------|
| `README.md`                   | Comprehensive documentation for the project.        |
| `layoffs.csv`                 | Raw dataset used for the data cleaning process.     |
| `explore_data.sql`            | Queries to explore and understand the dataset.      |
| `remove_duplicates.sql`       | Queries to identify and remove duplicate records.   |
| `null_or_blank_values.sql`    | Queries to handle NULL or blank values effectively. |
| `standardize_data.sql`        | Queries to standardize and ensure consistent data.  |
| `remove_unnecessary_data.sql` | Queries to identify and delete unnecessary data.    |

## Sample Queries

### Remove Duplicates

```sql
DELETE
FROM layoffs_staging_02
WHERE row_num > 1;
```

### Handle NULL Values

```sql
UPDATE layoffs_staging_02 AS t1
JOIN layoffs_staging_02 AS t2
    ON t1.company = t2.company
    AND t1.location = t2.location
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;
```

## Connect with Me

- [LinkedIn](https://www.linkedin.com/in/mi7773/)
- [GitHub](https://github.com/mi7773)
- [X](https://x.com/mi7773)
- [Discord](https://discordapp.com/users/1106153071706394677)
- [Email](mailto:mahmoudismailabdelrazek@gmail.com)
- [WhatsApp](https://wa.me/201282244419)

## Acknowledgments  
I would like to thank [Alex The Analyst](https://www.youtube.com/@AlexTheAnalyst) for their insightful tutorial, which served as the foundation for this project. Their guidance made learning data cleaning with MySQL much easier and more enjoyable.
