-- This query returns only users who have made bookings and excludes users without any booking records.

SELECT
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM
    users
INNER JOIN
    bookings ON users.id = bookings.user_id;


-- This includes all properties, even if they don’t have a corresponding review (review_id will be NULL if no review exists).

SELECT
    properties.id AS property_id,
    properties.title,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM
    properties
LEFT JOIN
    reviews ON properties.id = reviews.property_id;

-- This version ensures inclusion of users with no bookings and bookings with no user (e.g., due to orphaned data).

SELECT
    users.id AS user_id,
    users.name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date
FROM
    users
FULL OUTER JOIN
    bookings ON users.id = bookings.user_id;
