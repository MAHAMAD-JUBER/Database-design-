create database hotel_management_system;
use hotel_management_system;
CREATE TABLE Hotel (
    hotel_code INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    manager_id INT,
    num_rooms INT,
    star_rating INT
    
);

CREATE TABLE Room (
    room_number INT,
    hotel_code INT,
    type VARCHAR(50),
    price_per_night DECIMAL(10,2),
    availability_status VARCHAR(20),
    PRIMARY KEY (room_number, hotel_code),
    FOREIGN KEY (hotel_code) REFERENCES Hotel(hotel_code)
);

CREATE TABLE Guest (
    guest_id INT PRIMARY KEY,
    name VARCHAR(100),
    loyalty_level VARCHAR(50)
);

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    guest_id INT,
    hotel_code INT,
    room_number INT,
    check_in_date DATE,
    check_out_date DATE,
    total_bill DECIMAL(10,2),
    FOREIGN KEY (guest_id) REFERENCES Guest(guest_id),
    FOREIGN KEY (hotel_code, room_number) REFERENCES Room(hotel_code, room_number)
);

CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY,
    booking_id INT,
    guest_id INT,
    rating INT,
    comments VARCHAR(255),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    FOREIGN KEY (guest_id) REFERENCES Guest(guest_id)
);

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    role VARCHAR(50),
    hotel_code INT,
    shift_details VARCHAR(100),
    FOREIGN KEY (hotel_code) REFERENCES Hotel(hotel_code)
);

INSERT INTO Employee VALUES (101, 'Amit Rao', 'Manager', 1, 'Day');
INSERT INTO Employee VALUES (102, 'Priya Singh', 'Receptionist', 1, 'Night');
INSERT INTO Employee VALUES (103, 'Rahul Verma', 'Manager', 2, 'Day');
INSERT INTO Employee VALUES (104, 'Neha Kapoor', 'Housekeeping', 2, 'Day');

-- Insert Hotels
INSERT INTO Hotel VALUES (1, 'Grand Palace', 'Delhi', 101, 50, 5);
INSERT INTO Hotel VALUES (2, 'Seaside Resort', 'Mumbai', 103, 30, 4);

-- Insert Rooms
INSERT INTO Room VALUES (101, 1, 'Deluxe', 3500.00, 'Available');
INSERT INTO Room VALUES (102, 1, 'Suite', 5000.00, 'Occupied');
INSERT INTO Room VALUES (201, 2, 'Standard', 2500.00, 'Available');
INSERT INTO Room VALUES (202, 2, 'Deluxe', 3200.00, 'Available');

-- Insert Guests
INSERT INTO Guest VALUES (1001, 'Karan Mehta', 'Silver');
INSERT INTO Guest VALUES (1002, 'Sneha Reddy', 'Gold');

-- Insert Bookings
INSERT INTO Booking VALUES (501, 1001, 1, 102, '2025-06-10', '2025-06-13', 15000.00);
INSERT INTO Booking VALUES (502, 1002, 2, 201, '2025-06-12', '2025-06-14', 5000.00);

-- Insert Feedback
INSERT INTO Feedback VALUES (301, 501, 1001, 4, 'Great experience!');
INSERT INTO Feedback VALUES (302, 502, 1002, 5, 'Loved the hospitality!');