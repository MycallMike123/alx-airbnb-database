-- Insert sample users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (uuid(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_pass_1', '1234567890', 'guest'),
  (uuid(), 'Bob', 'Smith', 'bob@example.com', 'hashed_pass_2', '2345678901', 'host'),
  (uuid(), 'Cathy', 'Lee', 'cathy@example.com', 'hashed_pass_3', '3456789012', 'guest'),
  (uuid(), 'David', 'Kim', 'david@example.com', 'hashed_pass_4', '4567890123', 'admin');

-- Insert sample properties (assuming Bob is the host)
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  (uuid(), (SELECT user_id FROM User WHERE email = 'bob@example.com'), 'Seaside Cottage', 'Cozy beach house with ocean view', 'Cape Town', 120.00),
  (uuid(), (SELECT user_id FROM User WHERE email = 'bob@example.com'), 'Mountain Cabin', 'Rustic cabin in the mountains', 'Drakensberg', 95.50);

-- Insert sample bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (
    uuid(),
    (SELECT property_id FROM Property WHERE name = 'Seaside Cottage'),
    (SELECT user_id FROM User WHERE email = 'alice@example.com'),
    '2025-06-01',
    '2025-06-05',
    480.00,
    'confirmed'
  ),
  (
    uuid(),
    (SELECT property_id FROM Property WHERE name = 'Mountain Cabin'),
    (SELECT user_id FROM User WHERE email = 'cathy@example.com'),
    '2025-07-10',
    '2025-07-15',
    477.50,
    'pending'
  );

-- Insert sample payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  (
    uuid(),
    (SELECT booking_id FROM Booking WHERE total_price = 480.00),
    480.00,
    'credit_card'
  );

-- Insert sample reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  (
    uuid(),
    (SELECT property_id FROM Property WHERE name = 'Seaside Cottage'),
    (SELECT user_id FROM User WHERE email = 'alice@example.com'),
    5,
    'Beautiful spot and amazing view!'
  );

-- Insert sample messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  (
    uuid(),
    (SELECT user_id FROM User WHERE email = 'alice@example.com'),
    (SELECT user_id FROM User WHERE email = 'bob@example.com'),
    'Hi Bob, is the cottage available in July?'
  );
