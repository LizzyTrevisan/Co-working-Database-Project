
--query_database.sql File
--Bilikis Lawal, Kajal, Leiziane Trevisan Dardin

--Altering Table Property into Pu PublicTransport to CHAR(1)
ALTER TABLE Property
Alter Column PublicTransport CHAR(1);

-- Step 2: Updating Column PublicTransport from BIT to CHAR from 1/0 to 'Y'/'N'
UPDATE Property
SET PublicTransport = CASE 
  WHEN PublicTransport = 1 THEN 'Y'
  WHEN PublicTransport = 0 THEN 'N'
END;


ALTER TABLE Property
Alter Column Parking CHAR(1);

UPDATE Property
SET Parking = CASE 
  WHEN Parking = 1 THEN 'Y'
  WHEN Parking = 0 THEN 'N'
END;







USE [Coworking App]

GO;

-- Query 1: Retrieve all users who are owners
SELECT 
    *,
CASE 
  WHEN RoleID = 1 THEN 'Owner' 
  WHEN RoleID = 2 THEN 'Co-Worker' 
END AS RoleName
FROM 
    [User]
WHERE 
    RoleID IN (1, 2);





-- Query 2: Retrieve properties owned by a specific user
SELECT * FROM Property WHERE OwnerID = 1;





-- Query 3: Retrieve workspaces available for lease this month 

SELECT
   w.WorkspaceID,
   w.PropertyID,
   wt.TypeName,
   w.Seats,
   w.AvailableDate,
   l.LeaseName,
   w.Price
FROM
   Workspace w
JOIN
   WorkspaceType wt ON w.TypeID = wt.TypeId
JOIN
   LeaseTerms l ON l.LeaseID = w.LeaseID
WHERE
   MONTH(w.AvailableDate) = MONTH(GETDATE())
   AND YEAR(w.AvailableDate) = YEAR(GETDATE());





-- Query 4: Retrieve properties with parking available
SELECT * FROM Property WHERE Parking = 'Y';



-- Query 5: Retrieve users who own properties with transport facilities
SELECT DISTINCT u.*
FROM [User] u
JOIN Property p ON u.UserID = p.OwnerID
WHERE p.PublicTransport = 'Y';




-- Query 6: Retrieve all workspaces of type 'Private Office'
SELECT * FROM WorkspaceType WHERE TypeName = 'Private Office';



-- Query 7: Retrieve properties with areas greater than 200 square meters
SELECT * FROM Property WHERE [Area (In Square Meters)] > 200;




-- Query 8: Retrieve all users and their associated properties
SELECT u.*, p.*
FROM [User] u
LEFT JOIN Property up ON u.UserID = up.OwnerID
LEFT JOIN Property p ON up.PropertyID = p.PropertyID;




-- Query 9: Retrieve the total number of seats available across all workspaces
SELECT SUM(Seats) AS TotalSeats FROM WORKSPACE;



-- Query 10: Retrieve properties with workspaces available for lease
SELECT p.*, w.*
FROM Property p
JOIN WORKSPACE w ON p.PropertyID = w.PropertyID;
