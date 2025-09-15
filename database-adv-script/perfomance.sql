#Write an initial query that retrieves all bookings along with the user details, property details, and payment details and save it on
SELECT b.booking_id, u.first_name,u.last_name, p.propery_name p.property_id, pay.payment_id, pay.amount FROM Booking b  INNER JOIN  Users u ON b.user_id = u.user_id
INNER JOIN  p Property ON b.property_id = p.property_id
LEFT JOIN pay payment ON b.payment_id = pay.payment_id;