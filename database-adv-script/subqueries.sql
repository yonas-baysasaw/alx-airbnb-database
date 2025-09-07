-- Correlated subquery: Users who have made more than 3 bookings
SELECT u.user_id, u.name, u.email
FROM Users u
WHERE (
    SELECT COUNT(*)
    FROM Bookings b
    WHERE b.user_id = u.user_id
) > 3
ORDER BY u.user_id;
