SELECT 
    b.booking_id,
    b.date,
    u.user_id,
    u.name,
    u.email
FROM Bookings b
INNER JOIN Users u
    ON b.user_id = u.user_id;
