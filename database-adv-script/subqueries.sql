SELECT * FROM Property WHERE Rating >(SELECT AVG(rating) FROM Property);
SELECT * FROM Users u WHERE ( SELECT COUNT(*) FROM Booking b WHERE b.user_id = u.user_id)>3;