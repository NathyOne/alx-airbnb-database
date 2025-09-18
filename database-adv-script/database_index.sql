CREATE INDEX idx_property_id ON Property (property_id);

CREATE INDEX idx_booking_id ON Booking (booking_id);

CREATE INDEX idx_payment_id ON Payment (payment_id);

CREATE INDEX idx_review_id ON Review (review_id);

CREATE INDEX idx_message_id ON Message (message_id);

EXPLAIN ANALYZE
CREATE INDEX idx_property_id ON Property (property_id);

CREATE INDEX idx_booking_id ON Booking (booking_id);

CREATE INDEX idx_payment_id ON Payment (payment_id);

CREATE INDEX idx_review_id ON Review (review_id);

CREATE INDEX idx_message_id ON Message (message_id);