# Optimization Report

## Initial Query Analysis

We ran a query that joined `bookings`, `users`, `properties`, and `payments`. Using `EXPLAIN ANALYZE`, the query showed slow performance due to:

- Sequential scans on large tables
- No indexes on join keys

## Refactoring Strategy

To improve performance, we:

1. Added indexes to critical foreign keys:
   ```sql
   CREATE INDEX idx_bookings_user_id ON bookings(user_id);
   CREATE INDEX idx_bookings_property_id ON bookings(property_id);
   CREATE INDEX idx_payments_booking_id ON payments(booking_id);
