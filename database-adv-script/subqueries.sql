-- properties where the average rating is greater than 4.0
SELECT *
FROM Property
WHERE property_id IN (
    SELECT property_id
    FROM Reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);


--correlated subquery to find users who have made more than 3 bookings.
SELECT u.*
FROM User u
WHERE (
    SELECT COUNT(*)
    FROM Bookings b
    WHERE b.user_id = u.user_id
) > 3;