

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