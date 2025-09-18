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
)
PARTITION BY
    RANGE (YEAR(start_date)) (
        PARTITION P0
        VALUES
            LESS THAN (2019),
            PARTITION P1
        VALUES
            LESS THAN (2020),
            PARTITION P2
        VALUES
            LESS THAN (2021),
            PARTITION P3
        VALUES
            LESS THAN (2022)
    );

EXPLAIN
ALTER TABLE Booking
PARTITION BY
    RANGE (YEAR(start_date)) (
        PARTITION P0
        VALUES
            LESS THAN (2019),
            PARTITION P1
        VALUES
            LESS THAN (2020),
            PARTITION P2
        VALUES
            LESS THAN (2021),
            PARTITION P3
        VALUES
            LESS THAN (2022)
    );