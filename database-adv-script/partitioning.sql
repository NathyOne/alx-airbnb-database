# ssume the Booking table is large and query performance is slow. Implement partitioning on the Booking table based on the start_date column. Save the query in a file partitioning.sql

#Test the performance of queries on the partitioned table (e.g., fetching bookings by date range).

#Write a brief report on the improvements you observed.

-- PARTITION BY RANGE (YEAR(start_date))(
-- PARTITION P0 VALUES LESS THAN(2019),
-- PARTITION P0 VALUES LESS THAN(2020),
-- PARTITION P0 VALUES LESS THAN(2021),
-- PARTITION P0 VALUES LESS THAN(2022)
-- );

ALTER TABLE Booking
ADD PARTITION
PARTITION BY
    RANGE (YEAR(start_date)) (
        PARTITION P0
        VALUES
            LESS THAN (2019),
            PARTITION P0
        VALUES
            LESS THAN (2020),
            PARTITION P0
        VALUES
            LESS THAN (2021),
            PARTITION P0
        VALUES
            LESS THAN (2022)
    );