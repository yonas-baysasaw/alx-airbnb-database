--Objective: Master SQL joins by writing complex queries using different types of joins.

--Retrieve all bookings and the respective users who made those bookings
SELECT 
    Booking.booking_id,
    Booking.start_date,
    User.user_id,
    User.first_name,
    User.email
FROM 
    Booking
INNER JOIN 
    User ON Booking.user_id = User.user_id;

--Retrieve all properties and their reviews, including properties that have no reviews
SELECT p.property_id, p.name, r.rating, r.comment
FROM Properties p
LEFT JOIN Reviews r ON p.property_id = r.property_id
ORDER BY r.rating DESC


--Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
SELECT
    User.user_id,
    User.first_name,
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date
FROM 
    User
FULL OUTER JOIN 
    Booking ON User.user_id = Booking.user_id;