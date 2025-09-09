SELECT * FROM Booking INNER JOIN Users ON Booking.host_id = user.user_id;
SELECT * FROM Property LEFT JOIN Review ON Property.property_id = Review.property_id ORDER BY Property.property_id;;
SELECT * FROM Users FULL OUTER JOIN Booking ON Users.user_id = Booking.user_id;