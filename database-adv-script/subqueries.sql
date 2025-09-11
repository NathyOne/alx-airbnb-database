SELECT * FROM Property WHERE Rating >(SELECT AVG(rating) FROM Property)>4;
SELECT * FROM Users u WHERE ( SELECT COUNT(*) FROM Booking b WHERE b.user_id = u.user_id)>3;