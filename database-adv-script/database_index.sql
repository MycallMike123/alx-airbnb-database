-- Create indexes on frequently used columns

CREATE INDEX idx_users_id ON users(id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_properties_id ON properties(id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- Analyze performance of queries using EXPLAIN ANALYZE

-- Before or after indexing, you can measure with:
EXPLAIN ANALYZE
SELECT users.name, bookings.start_date
FROM users
JOIN bookings ON users.id = bookings.user_id;

EXPLAIN ANALYZE
SELECT properties.title, bookings.start_date
FROM properties
JOIN bookings ON properties.id = bookings.property_id;

EXPLAIN ANALYZE
SELECT properties.title, reviews.comment
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;
