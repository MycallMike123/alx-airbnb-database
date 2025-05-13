# Continuous Database Performance Monitoring

## Objective
To monitor the performance of frequent queries using `EXPLAIN ANALYZE`, identify bottlenecks, and implement schema improvements (indexes and structure).

---

## Step 1: Monitor Query Performance

### Query Analyzed
```sql
EXPLAIN ANALYZE
SELECT users.name, properties.title, bookings.start_date
FROM bookings
JOIN users ON users.id = bookings.user_id
JOIN properties ON properties.id = bookings.property_id
WHERE bookings.start_date >= '2024-01-01'
ORDER BY bookings.start_date DESC;
