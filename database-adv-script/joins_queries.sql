-- 1. INNER JOIN: Retrieve all bookings and the users who made them
SELECT 
    b.booking_id,
    b.date,
    u.user_id,
    u.name,
    u.email
FROM Bookings b
INNER JOIN Users u
    ON b.user_id = u.user_id
ORDER BY b.booking_id;

-- 2. LEFT JOIN: Retrieve all properties and their reviews,
-- including properties that have no reviews
SELECT 
    p.property_id,
    p.name AS property_name,
    r.review_id,
    r.rating,
    r.comment
FROM Properties p
LEFT JOIN Reviews r
    ON p.property_id = r.property_id
ORDER BY p.property_id;

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings,
-- even if the user has no booking or a booking is not linked to a user
SELECT 
    u.user_id,
    u.name AS user_name,
    b.booking_id,
    b.date
FROM Users u
FULL OUTER JOIN Bookings b
    ON u.user_id = b.user_id
ORDER BY u.user_id, b.booking_id;
