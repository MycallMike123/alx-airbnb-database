# Index Performance Evaluation

## Objective
Improve query performance by creating indexes on frequently used columns in `users`, `bookings`, and `properties` tables.

---

## Indexes Created

```sql
CREATE INDEX idx_users_id ON users(id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_properties_id ON properties(id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
