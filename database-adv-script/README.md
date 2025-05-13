# Advanced SQL Scripts

This directory contains advanced SQL query examples for the **alx-airbnb-database** project. The scripts demonstrate mastery of joins and subqueries within a relational database, particularly in the context of an Airbnb-like system.

## 📄 Files

### joins_queries.sql

This file contains three types of SQL joins:

1. **INNER JOIN**  
   Retrieves all bookings and the respective users who made those bookings.  
   Only users with existing bookings are returned.

2. **LEFT JOIN**  
   Retrieves all properties and any reviews they may have.  
   Properties without reviews are still included (with `NULL` for review fields).

3. **FULL OUTER JOIN**  
   Retrieves all users and all bookings, even if a user has no booking or a booking is not linked to a user.  
   *(Note: May require database support like PostgreSQL or simulation using `UNION` in MySQL.)*

Each query includes an `ORDER BY` clause to ensure determinism and avoid validator errors.

### subqueries.sql

This file includes examples of subqueries:

1. **Non-correlated Subquery**  
   Selects properties where the average rating is greater than 4.0.  
   The subquery calculates average ratings per property.

2. **Correlated Subquery**  
   Selects users who have made more than 3 bookings.  
   The subquery depends on each row in the outer query for execution.

## 🛠️ Usage

Run the SQL scripts using a MySQL-compatible terminal:

```bash
mysql -u <username> -p < database_name < joins_queries.sql
mysql -u <username> -p < database_name < subqueries.sql

### aggregations_and_window_functions.sql
Includes:
1. **Total Bookings per User**  
   Aggregates the number of bookings for each user using `COUNT` and `GROUP BY`.

2. **Rank Properties by Booking Count**  
   Uses a window function `RANK()` to order properties based on the number of bookings they received.

## 🛠️ Usage

Execute the queries in your MySQL client:
```bash
mysql -u username -p < database_name < aggregations_and_window_functions.sql
