SELECT b.booking_id, u.first_name, u.last_name, p.property_name, p.property_id, pay.payment_id, pay.amount
FROM
    Booking b
    INNER JOIN Users u ON b.user_id = u.user_id
    INNER JOIN Property p ON b.property_id = p.property_id
    LEFT JOIN payment pay ON b.payment_id = pay.payment_id
WHERE
    b.status = 'confirmed'
    AND b.booking_date >= '2025-01-01'
    AND b.booking_date < '2025-12-31'
ORDER BY b.booking_id DESC;