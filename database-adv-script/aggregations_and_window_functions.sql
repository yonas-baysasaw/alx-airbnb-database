SELECT 
    u.user_id,
    u.name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    Users u
JOIN 
    Bookings b ON u.user_id = b.user_id
GROUP BY 
    u.user_id, u.name;



SELECT 
    property_id,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM (
    SELECT 
        p.property_id,
        COUNT(b.booking_id) AS total_bookings
    FROM 
        Properties p
    LEFT JOIN 
        Bookings b ON p.property_id = b.property_id
    GROUP BY 
        p.property_id
) AS property_booking_counts;


["ROW_NUMBER()"]