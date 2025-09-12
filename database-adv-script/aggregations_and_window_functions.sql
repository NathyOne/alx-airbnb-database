SELECT * FROM COUNT(*) AS total_count FROM Booking GROUP BY user_id;


#Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
SELECT ROW_NUMBER OVER() AS RANK FROM Properties COUNT(*)
