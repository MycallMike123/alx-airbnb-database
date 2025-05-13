-- Find all properties where the average rating is greater than 4.0
SELECT
    properties.id,
    properties.title
FROM
    properties
WHERE
    (
        SELECT
            AVG(rating)
        FROM
            reviews
        WHERE
            reviews.property_id = properties.id
    ) > 4.0
ORDER BY
    properties.id;

-- Find users who have made more than 3 bookings (correlated subquery)
SELECT
    id,
    name
FROM
    users
WHERE
    (
        SELECT
            COUNT(*)
        FROM
            bookings
        WHERE
            bookings.user_id = users.id
    ) > 3
ORDER BY
    id;
