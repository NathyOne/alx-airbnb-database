SELECT b.booking_id, b.booking_date, u.first_name, u.last_name, u.email, p.property_name, p.property_id, pay.payment_id, pay.amount, pay.payment_date
FROM
    Booking b
    INNER JOIN Users u ON b.user_id = u.user_id
    INNER JOIN Property p ON b.property_id = p.property_id
    INNER JOIN payment pay ON b.payment_id = pay.payment_id
ORDER BY b.booking_date DESC;