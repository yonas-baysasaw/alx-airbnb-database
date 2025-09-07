
CREATE TABLE Bookings (
    booking_id UUID PRIMARY KEY,
    user_id INT,
    property_id INT,
    booking_date DATE,
    check_in DATE,
    check_out DATE,
    start_date DATE
) PARTITION BY RANGE (start_date);

CREATE TABLE Bookings_2022 PARTITION OF Bookings
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE Bookings_2023 PARTITION OF Bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Bookings_2024 PARTITION OF Bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
