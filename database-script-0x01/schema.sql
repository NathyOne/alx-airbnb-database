CREATE TABLE user (
user_id: Primary Key UUID Indexed,
first_name: VARCHAR NOT NULL,
last_name: VARCHAR NOT NULL,
email: VARCHAR(255) UNIQUE NOT NULL,
password_hash: VARCHAR(255) NOT NULL,
phone_number: VARCHAR(255) NULL,
role: ENUM(guest, host, admin) NOT NULL,
created_at: TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE Property (
    property_id CHAR(36) PRIMARY KEY,
    host_id CHAR(36) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES User (user_id)
);

CREATE TABLE Booking (
    booking_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (
        status IN (
            'pending',
            'confirmed',
            'canceled'
        )
    ),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property (property_id),
    FOREIGN KEY (user_id) REFERENCES User (user_id)
);

CREATE TABLE Payment (
    payment_id CHAR(36) PRIMARY KEY,
    booking_id CHAR(36) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) NOT NULL CHECK (
        payment_method IN (
            'credit_card',
            'paypal',
            'stripe'
        )
    ),
    FOREIGN KEY (booking_id) REFERENCES Booking (booking_id)
);

CREATE TABLE Review (
    review_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    rating INTEGER NOT NULL CHECK (
        rating >= 1
        AND rating <= 5
    ),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property (property_id),
    FOREIGN KEY (user_id) REFERENCES User (user_id)
);

CREATE TABLE Message (
    message_id CHAR(36) PRIMARY KEY,
    sender_id CHAR(36) NOT NULL,
    recipient_id CHAR(36) NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES User (user_id),
    FOREIGN KEY (recipient_id) REFERENCES User (user_id)
);

CREATE INDEX idx_property_id ON Property (property_id);

CREATE INDEX idx_booking_id ON Booking (booking_id);

CREATE INDEX idx_payment_id ON Payment (payment_id);

CREATE INDEX idx_review_id ON Review (review_id);

CREATE INDEX idx_message_id ON Message (message_id);