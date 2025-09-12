-- Create ENUM type for role
CREATE TYPE user_role AS ENUM ('guest', 'host', 'admin');

-- Create ENUM type for booking status
CREATE TYPE booking_status AS ENUM ('pending', 'confirmed', 'canceled');

-- Create ENUM type for payment method
CREATE TYPE payment_method AS ENUM ('credit_card', 'paypal', 'stripe');

-- Create Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255),
    role user_role NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Property table
CREATE TABLE Property (
    property_id INT PRIMARY KEY,
    host_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES Users (user_id)
);

-- Create Booking table
CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    property_id INT NOT NULL,
    user_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status booking_status NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property (property_id),
    FOREIGN KEY (user_id) REFERENCES Users (user_id)
);

-- Create Payment table
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    booking_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method payment_method NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking (booking_id)
);

-- Create Review table
CREATE TABLE Review (
    review_id INT PRIMARY KEY,
    property_id INT NOT NULL,
    user_id INT NOT NULL,
    rating INTEGER NOT NULL CHECK (
        rating >= 1
        AND rating <= 5
    ),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property (property_id),
    FOREIGN KEY (user_id) REFERENCES Users (user_id)
);

-- Create Message table
CREATE TABLE Message (
    message_id INT PRIMARY KEY,
    sender_id INT NOT NULL,
    recipient_id INT NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES Users (user_id),
    FOREIGN KEY (recipient_id) REFERENCES Users (user_id)
);

-- Create indexes
CREATE INDEX idx_property_id ON Property (property_id);

CREATE INDEX idx_booking_id ON Booking (booking_id);

CREATE INDEX idx_payment_id ON Payment (payment_id);

CREATE INDEX idx_review_id ON Review (review_id);

CREATE INDEX idx_message_id ON Message (message_id);

-- Optional: Create a trigger function to update the updated_at column in Property
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create a trigger for the Property table
CREATE TRIGGER update_property_updated_at
BEFORE UPDATE ON Property
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();