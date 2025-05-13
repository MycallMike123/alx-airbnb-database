-- Initial complex query: Retrieve bookings with related user, property, and payment details
-- Filtered for bookings after a certain date and for completed payments

SELECT
    bookings.id AS booking_id,
    users.name AS user_name,
    properties.title AS property_title,
    bookings.start_date,
    bookings.end_date,
    payments.amount,
    payments.payment_date
FROM
    bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON payments.booking_id = bookings.id
WHERE
    bookings.start_date >= '2024-01-01'
    AND payments.status = 'completed';

-- Analyze the performance of the filtered query
EXPLAIN ANALYZE
SELECT
    bookings.id AS booking_id,
    users.name AS user_name,
    properties.title AS property_title,
    bookings.start_date,
    bookings.end_date,
    payments.amount,
    payments.payment_date
FROM
    bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON payments.booking_id = bookings.id
WHERE
    bookings.start_date >= '2024-01-01'
    AND payments.status = 'completed';
