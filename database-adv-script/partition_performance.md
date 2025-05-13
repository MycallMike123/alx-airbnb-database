# Partitioning Performance Report

## Objective
To optimize query performance on the large `bookings` table using table partitioning based on the `start_date` column.

## Implementation
- A new `bookings_partitioned` table was created using PostgreSQL's `RANGE` partitioning.
- Two partitions were created:
  - `bookings_2023` for dates in 2023
  - `bookings_2024` for dates in 2024
- Queries filtering by date range were run using `EXPLAIN ANALYZE`.

## Observations
- **Before partitioning:** Full table scan on `bookings` even for limited date ranges.
- **After partitioning:** Query planner only scans the relevant partition (`bookings_2024`), significantly reducing I/O and execution time.
- **Improvement:** On test data with thousands of records, execution time dropped by ~50% for filtered queries.

## Conclusion
Partitioning the `bookings` table improves performance for date-based queries and should be adopted for production datasets.
