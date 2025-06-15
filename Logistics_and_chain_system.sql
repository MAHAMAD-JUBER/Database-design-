CREATE DATABASE Logistics_and_supply_chain_management_system;

USE Logistics_and_supply_chain_management_system;


CREATE TABLE Shipment(
    shipment_id INT PRIMARY KEY,
    destination VARCHAR(250),
    weight VARCHAR(250),
    content_description VARCHAR(500),
    shipment_date DATE
);


CREATE TABLE Warehouse(
    warehouse_id INT PRIMARY KEY,
    location VARCHAR(300),
    capacity VARCHAR(250),
    shipment_id INT,
    FOREIGN KEY (shipment_id) REFERENCES Shipment(shipment_id)
);


CREATE TABLE Carriers(
    carrier_id INT PRIMARY KEY,
    name VARCHAR(250),
    type VARCHAR(250),
    contact BIGINT
);


CREATE TABLE Clients(
    client_id INT PRIMARY KEY,
    name VARCHAR(250),
    address VARCHAR(300),
    shipment_id INT,
    FOREIGN KEY (shipment_id) REFERENCES Shipment(shipment_id)
);


CREATE TABLE Employees(
    employee_id INT PRIMARY KEY,
    name VARCHAR(250),
    warehouse_id INT,
    carrier_id INT,
    rolee VARCHAR(250),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouse(warehouse_id),
    FOREIGN KEY (carrier_id) REFERENCES Carriers(carrier_id)
);


CREATE TABLE Address(
    shipment_id INT,
    carrier_id INT,
    client_id INT,
    city VARCHAR(250),
    village VARCHAR(250),
    FOREIGN KEY (shipment_id) REFERENCES Shipment(shipment_id),
    FOREIGN KEY (carrier_id) REFERENCES Carriers(carrier_id),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);


INSERT INTO Shipment (shipment_id, destination, weight, content_description, shipment_date) VALUES
(1, 'Delhi', '120kg', 'Electronics items', '2025-06-01'),
(2, 'Mumbai', '250kg', 'Furniture', '2025-06-05'),
(3, 'Bangalore', '180kg', 'Pharmaceuticals', '2025-06-07');

INSERT INTO Warehouse (warehouse_id, location, capacity, shipment_id) VALUES
(101, 'Delhi Industrial Zone', '500kg', 1),
(102, 'Mumbai Dockyard', '1000kg', 2),
(103, 'Bangalore Tech Park', '700kg', 3);

INSERT INTO Carriers (carrier_id, name, type, contact) VALUES
(201, 'Blue Dart', 'Air', 9876543210),
(202, 'GATI Ltd.', 'Road', 9123456780),
(203, 'DHL Express', 'Rail', 9988776655);

INSERT INTO Clients (client_id, name, address, shipment_id) VALUES
(301, 'Reliance Retail', 'Mumbai Central', 2),
(302, 'Apollo Hospitals', 'Bangalore North', 3),
(303, 'Flipkart India', 'Delhi NCR', 1);

INSERT INTO Employees (employee_id, name, warehouse_id, carrier_id, rolee) VALUES
(401, 'Ravi Kumar', 101, 201, 'Warehouse Manager'),
(402, 'Sneha Roy', 102, 202, 'Transport Supervisor'),
(403, 'Ajay Mehta', 103, 203, 'Logistics Coordinator');

INSERT INTO Address (shipment_id, carrier_id, client_id, city, village) VALUES
(1, 201, 303, 'Delhi', 'Kalkaji'),
(2, 202, 301, 'Mumbai', 'Wadala'),
(3, 203, 302, 'Bangalore', 'Whitefield');
