# Index Performance Analysis

## Objective

Improve query speed by creating indexes on frequently accessed columns in the database.

---

## EXPLAIN Analysis

### Query: Get all bookings with user details

```sql
EXPLAIN ANALYZE
SELECT users.name, bookings.start_date
FROM users
JOIN bookings ON users.id = bookings.user_id;
