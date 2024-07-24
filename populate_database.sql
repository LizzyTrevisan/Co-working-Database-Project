--populate_database.sql File
--Bilikis Lawal, Kajal, Leiziane Trevisan Dardin

INSERT INTO [dbo].[Role] (RoleName)
VALUES
('Owner'),
('Co-Worker');

INSERT INTO [dbo].[User] (FirstName, LastName, Phone, Email, RoleID)
VALUES
('Mary', 'Jane', '777-888-6565', 'm.jane@gmail.com', 1),
('John', 'Cash', '777-898-6060', 'j.cash@bustime.com', 2),
('Bryan', 'Lee', '777-890-3030', 'b.lee@bustime.com', 2),
('Johanne', 'Louis', '787-890-1212', 'johanne.louis@houseproperty.com', 1),
('Mary', 'Lou', '787-999-0000', 'mary.l@gmail.com', 1);

INSERT INTO [dbo].[Property] (OwnerID, Address, City, Province, PostalCode, Neighbourhood, [Area (In Square Meters)], Parking, PublicTransport)
VALUES 
(4, '453 Main St', 'Calgary', 'AB', 'T0M 0E0', 'Balzac', 200, 1, 0),
(5, '213 Queen St', 'Toronto', 'ON', 'M5H 2M9', 'Financial District', 160, 1, 0),
(3, '456 Granville St', 'Vancouver', 'BC', 'V6C 1V4', 'Downtown', 300, 0, 1),
(1, '331 Jasper Ave', 'Edmonton', 'AB', 'T5J 1N9', 'Oliver', 175, 0, 1),
(2, '202 Douglas St', 'Victoria', 'BC', 'V8V 2N8', 'James Bay', 100, 1, 1);

INSERT INTO [dbo].[WorkspaceType] (TypeName)
VALUES
('Meeting Room'),
('Private Office'),
('Desk');

INSERT INTO [dbo].[LeaseTerms] (LeaseName)
VALUES
('Day'),
('Week'),
('Month');

INSERT INTO [dbo].[Workspace] (PropertyID, TypeID, Seats, AvailableDate, LeaseID, Price)
VALUES
(1, 1, 8, '2024-07-01', 1, 50.00),
(2, 2, 2, '2024-06-15', 3, 100.00),
(3, 3, 1, '2024-06-01', 2, 20.00),
(4, 2, 4, '2024-08-15', 1, 80.00),
(5, 1, 10, '2024-08-20', 2, 40.00);