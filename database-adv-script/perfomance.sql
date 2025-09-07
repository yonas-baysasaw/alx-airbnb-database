
EXPLAIN
  SELECT 
    b.booking_id,
    b.user_id,
    u.first_name AS first_name,
    u.email AS user_email,
    b.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    b.start_date,
    b.end_date,
    b.status,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
 
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pay ON b.booking_id = pay.booking_id;






-- Indexes to support the join and filtering...using ids because they are the reference for the  joins
CREATE INDEX idx_bookings_user_id ON Booking(user_id);
CREATE INDEX idx_bookings_property_id ON Booking(property_id);
CREATE INDEX idx_payments_booking_id ON Payments(booking_id);
CREATE INDEX idx_user_user_id ON User(user_id);
CREATE INDEX idx_properties_property_id ON Property(property_id);




-- refactoring

SELECT 
    b.booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount,
    pay.payment_date
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payments pay ON b.booking_id = pay.booking_id
WHERE 
    b.booking_date >= CURRENT_DATE - INTERVAL '3 months'
    AND pay.status = 'Completed';

