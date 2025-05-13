-- Query 1: Total number of bookings made by each user
SELECT
    users.id AS user_id,
    users.name,
    COUNT(bookings.id) AS total_bookings
FROM
    users
LEFT JOIN
    bookings ON users.id = bookings.user_id
GROUP BY
    users.id, users.name
ORDER BY
    total_bookings DESC;

-- Query 2: Rank properties based on total number of bookings using ROW_NUMBER()
WITH property_booking_counts AS (
    SELECT
        properties.id AS property_id,
        properties.title,
        COUNT(bookings.id) AS total_bookings
    FROM
        properties
    LEFT JOIN bookings ON properties.id = bookings.property_id
    GROUP BY
        properties.id, properties.title
)

SELECT
    property_id,
    title,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM
    property_booking_counts;
