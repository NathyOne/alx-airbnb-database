-- Insert sample data into User table (all attributes)
INSERT INTO
    User (
        user_id,
        first_name,
        last_name,
        email,
        password_hash,
        phone_number,
        role,
        created_at
    )
VALUES (
        1,
        'Bob',
        'Johnson',
        'bob.johnson@example.com',
        'hash456',
        '555-0102',
        'host',
        '2025-01-01 10:00:00'
    ),
    (
        2,
        'Carol',
        'Williams',
        'carol.williams@example.com',
        'hash789',
        NULL,
        'guest',
        '2025-01-02 12:00:00'
    );

-- Insert sample Assets into Property table (all attributes)
INSERT INTO
    Property (
        property_id,
        host_id,
        name,
        description,
        location,
        pricepernight,
        created_at,
        updated_at
    )
VALUES (
        1,
        1,
        'Cozy Beach Cottage',
        'A charming 2-bedroom cottage by the sea.',
        'Miami, FL',
        150.00,
        '2025-02-01 09:00:00',
        '2025-02-01 09:00:00'
    ),
    (
        2,
        1,
        'Mountain Retreat',
        'A serene cabin with stunning mountain views.',
        'Aspen, CO',
        200.00,
        '2025-02-02 11:00:00',
        '2025-02-02 11:00:00'
    );

-- Insert sample data into Booking table (all attributes)
INSERT INTO
    Booking (
        booking_id,
        property_id,
        user_id,
        start_date,
        end_date,
        total_price,
        status,
        created_at
    )
VALUES (
        1,
        1,
        2,
        '2025-03-01',
        '2025-03-03',
        300.00,
        'confirmed',
        '2025-02-15 10:00:00'
    ),
    (
        2,
        2,
        2,
        '2025-04-01',
        '2025-04-04',
        600.00,
        'pending',
        '2025-03-01 12:00:00'
    );

-- Insert sample data into Payment table (all attributes)
INSERT INTO
    Payment (
        payment_id,
        booking_id,
        amount,
        payment_date,
        payment_method
    )
VALUES (
        1,
        1,
        300.00,
        '2025-02-16 10:30:00',
        'credit_card'
    ),
    (
        2,
        2,
        600.00,
        '2025-03-02 12:30:00',
        'paypal'
    );

-- Insert sample data into Review table (all attributes)
INSERT INTO
    Review (
        review_id,
        property_id,
        user_id,
        rating,
        comment,
        created_at
    )
VALUES (
        1,
        1,
        2,
        4,
        'Great location, very cozy!',
        '2025-03-04 09:00:00'
    ),
    (
        2,
        2,
        2,
        5,
        'Amazing views, highly recommend!',
        '2025-04-02 11:00:00'
    );

-- Insert sample data into Message table (all attributes)
INSERT INTO
    Message (
        message_id,
        sender_id,
        recipient_id,
        message_body,
        sent_at
    )
VALUES (
        1,
        2,
        1,
        'Is the cottage available for next month?',
        '2025-02-10 08:00:00'
    ),
    (
        2,
        1,
        2,
        'Yes, it’s available. Let me know your dates!',
        '2025-02-10 09:00:00'
    );