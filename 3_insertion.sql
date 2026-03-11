/*
Provide the insertion queries used to populate the database, whose relational model is as
follows:
CREATE DATABASE IF NOT EXISTS DATA_PROJECT;
USE DATA_PROJECT;


CREATE TABLE Product(
   ID_Product INT PRIMARY KEY,
   Pr_Name VARCHAR(50) UNIQUE,
   Pr_Description VARCHAR(50),
   Pr_Category VARCHAR(50),
   Pr_Format VARCHAR(50),
   Pr_Calories DECIMAL(15,2) ,
   Price INT
);

CREATE TABLE Ingredient(
   ID_Ingredient INT PRIMARY KEY,
   Ing_Name VARCHAR(50),
   Ing_Stock_Quant DECIMAL(15,2) 
);

CREATE TABLE Allergen(
   ID_Allergen INT PRIMARY KEY,
   Al_Name VARCHAR(50),
   Al_Severity VARCHAR(50) 
   );

CREATE TABLE Supplier(
   ID_Supplier INT PRIMARY KEY,
   Sup_Name VARCHAR(50),
   Sup_email VARCHAR(50) ,
   Sup_phone VARCHAR(50)
);

CREATE TABLE Address(
   ID_Address INT PRIMARY KEY,
   Country VARCHAR(50),
   City VARCHAR(50),
   Street VARCHAR(50),
   Number VARCHAR(50)
);


CREATE TABLE Promotion(
   ID_Promotion INT PRIMARY KEY,
   Promo_Discount INT ,
   Promo_Begining_Date DATE,
   Promo_End_Date DATE,
   ID_Product INT NOT NULL UNIQUE,
   FOREIGN KEY(ID_Product) REFERENCES Product(ID_Product) 
     ON DELETE CASCADE 
     ON UPDATE CASCADE
);

CREATE TABLE Shop(
   ID_Shop INT ,
   Shop_Income DECIMAL(15,2),
   Shop_Size DECIMAL(15,2) CHECK (Shop_Size > 0),
   Shop_Employees_Number INT,
   ID_Address INT NOT NULL UNIQUE,
   PRIMARY KEY(ID_Shop),
   FOREIGN KEY(ID_Address) REFERENCES Address(ID_Address) 
     ON DELETE CASCADE 
     ON UPDATE CASCADE
);

CREATE TABLE Employee(
   ID_Employee INT PRIMARY KEY,
   Emp_Job_Title VARCHAR(50),
   Emp_Hire_Date DATE,
   ID_Employee_manager INT, 
   ID_Shop INT NOT NULL,
   FOREIGN KEY(ID_Employee_manager) REFERENCES Employee(ID_Employee) 
     ON DELETE SET NULL 
     ON UPDATE CASCADE,
   FOREIGN KEY(ID_Shop) REFERENCES Shop(ID_Shop) 
     ON DELETE CASCADE 
     ON UPDATE CASCADE
);


CREATE TABLE contains(
   ID_Ingredient INT,
   ID_Allergen INT,
   PRIMARY KEY(ID_Ingredient, ID_Allergen),
   FOREIGN KEY(ID_Ingredient) REFERENCES Ingredient(ID_Ingredient) 
		ON DELETE CASCADE,
   FOREIGN KEY(ID_Allergen) REFERENCES Allergen(ID_Allergen) 
		ON DELETE CASCADE
);

CREATE TABLE Has(
   ID_Product INT,
   ID_Ingredient INT,
   PRIMARY KEY(ID_Product, ID_Ingredient),
   FOREIGN KEY(ID_Product) REFERENCES Product(ID_Product) 
		ON DELETE CASCADE,
   FOREIGN KEY(ID_Ingredient) REFERENCES Ingredient(ID_Ingredient) 
		ON DELETE CASCADE
);


CREATE TABLE delivery(
   ID_Product INT,
   ID_Supplier INT,
   ID_Shop INT,
   PRIMARY KEY(ID_Product, ID_Supplier, ID_Shop),
   FOREIGN KEY(ID_Product) REFERENCES Product(ID_Product) 
		ON DELETE CASCADE,
   FOREIGN KEY(ID_Supplier) REFERENCES Supplier(ID_Supplier)
		ON DELETE CASCADE,
   FOREIGN KEY(ID_Shop) REFERENCES Shop(ID_Shop) 
		ON DELETE CASCADE
);


There must be: 25 products, enough ingredients to make all this products, with the correspondings allergen, 
There must be 4 different shop,3 in france 1 in spain each one with their adress, 7 different suppliers and 5 employee with 1 manager per shop.
 You also need to add 4 promotions
 Foreign keys must refer to existing primary keys: provide the lines starting with
filling in the tables in which there are no foreign keys, then the tables in
which the foreign keys refer to primary keys in tables that have already been
filled in. 
 
The data must comply with the following validation constraints:

 ALTER TABLE Product ADD CONSTRAINT CHECK (Pr_Calories >= 0);
ALTER TABLE Product ADD CONSTRAINT CHECK (Price >= 0);
ALTER TABLE Ingredient ADD CONSTRAINT CHECK (Ing_Stock_Quant >= 0);
ALTER TABLE Allergen ADD CONSTRAINT CHECK (Al_Severity IN ('Low', 'Moderate', 'High', 'Severe'));
ALTER TABLE Supplier ADD CONSTRAINT CHECK (Sup_email LIKE '%@%.%');
ALTER TABLE Promotion ADD CONSTRAINT CHECK (Promo_Discount BETWEEN 1 AND 100);
ALTER TABLE Shop ADD CONSTRAINT CHECK (Shop_Employees_Number >= 0);
ALTER TABLE Promotion ADD CONSTRAINT CHK_Promo_Dates CHECK (Promo_End_Date >= Promo_Begining_Date);

Make sur that the origins and genre of the employees are diversified.
Provide the set in the form of an SQL script ready to be executed.
*/


-- What Gemini said :

USE DATA_PROJECT;

-- ======================================================
-- 1. INDEPENDENT TABLES (No Foreign Keys)
-- ======================================================

-- Populating Product (25 entries)
INSERT INTO Product (ID_Product, Pr_Name, Pr_Description, Pr_Category, Pr_Format, Pr_Calories, Price) VALUES
(1, 'Classic Baguette', 'Traditional French bread', 'Bakery', 'Unit', 250.00, 1),
(2, 'Croissant', 'Buttery pastry', 'Bakery', 'Unit', 406.00, 2),
(3, 'Pain au Chocolat', 'Chocolate filled pastry', 'Bakery', 'Unit', 420.00, 2),
(4, 'Espresso', 'Strong black coffee', 'Beverage', 'Small', 5.00, 2),
(5, 'Cappuccino', 'Coffee with milk foam', 'Beverage', 'Medium', 120.00, 4),
(6, 'Macaron Box', 'Assorted almond cookies', 'Confectionery', 'Box', 800.00, 15),
(7, 'Eclair', 'Chocolate glazed cream puff', 'Bakery', 'Unit', 300.00, 4),
(8, 'Quiche Lorraine', 'Savory bacon and egg tart', 'Savory', 'Slice', 450.00, 6),
(9, 'Greek Salad', 'Fresh veg with feta', 'Savory', 'Bowl', 210.00, 8),
(10, 'Caesar Wrap', 'Chicken and romaine', 'Savory', 'Unit', 520.00, 7),
(11, 'Fruit Tart', 'Seasonal fruit with custard', 'Bakery', 'Unit', 320.00, 5),
(12, 'Iced Tea', 'Peach infused tea', 'Beverage', 'Large', 90.00, 3),
(13, 'Sourdough Loaf', 'Fermented wheat bread', 'Bakery', 'Unit', 600.00, 5),
(14, 'Chocolate Cake', 'Rich dark chocolate', 'Bakery', 'Slice', 400.00, 6),
(15, 'Lemonade', 'Freshly squeezed', 'Beverage', 'Medium', 150.00, 4),
(16, 'Ham Sandwich', 'Parisian style ham and butter', 'Savory', 'Unit', 480.00, 6),
(17, 'Tomato Soup', 'Creamy basil and tomato', 'Savory', 'Bowl', 180.00, 5),
(18, 'Blueberry Muffin', 'Real wild blueberries', 'Bakery', 'Unit', 350.00, 3),
(19, 'Orange Juice', '100% pure squeezed', 'Beverage', 'Small', 110.00, 4),
(20, 'Cheese Board', 'Selection of 3 cheeses', 'Savory', 'Platter', 700.00, 12),
(21, 'Club Sandwich', 'Turkey and bacon', 'Savory', 'Unit', 580.00, 9),
(22, 'Hot Chocolate', 'Belgian cocoa and milk', 'Beverage', 'Medium', 280.00, 5),
(23, 'Almond Croissant', 'Filled with almond cream', 'Bakery', 'Unit', 450.00, 3),
(24, 'Veggie Burger', 'Plant-based patty', 'Savory', 'Unit', 420.00, 10),
(25, 'Carrot Cake', 'With walnut and frosting', 'Bakery', 'Slice', 380.00, 5);

-- Populating Ingredient
INSERT INTO Ingredient (ID_Ingredient, Ing_Name, Ing_Stock_Quant) VALUES
(1, 'Wheat Flour', 1000.00),
(2, 'Butter', 500.00),
(3, 'Dark Chocolate', 200.00),
(4, 'Milk', 300.00),
(5, 'Coffee Beans', 150.00),
(6, 'Eggs', 400.00),
(7, 'Sugar', 600.00),
(8, 'Almonds', 100.00),
(9, 'Ham', 80.00),
(10, 'Cheese', 120.00);

-- Populating Allergen
INSERT INTO Allergen (ID_Allergen, Al_Name, Al_Severity) VALUES
(1, 'Gluten', 'Moderate'),
(2, 'Dairy', 'High'),
(3, 'Nuts', 'Severe'),
(4, 'Eggs', 'Moderate'),
(5, 'Soy', 'Low');

-- Populating Supplier (7 entries)
INSERT INTO Supplier (ID_Supplier, Sup_Name, Sup_email, Sup_phone) VALUES
(1, 'EuroFlour Ltd', 'contact@euroflour.com', '+33 1 23 45 67 89'),
(2, 'Dairy Gold', 'sales@dairygold.ie', '+353 1 98 76 54'),
(3, 'ChocoWorld', 'info@chocoworld.be', '+32 2 44 55 66'),
(4, 'Global Bean Co', 'orders@globalbean.com', '+1 555 0101'),
(5, 'Fresh Farms', 'fresh@farms.es', '+34 91 234 56 78'),
(6, 'Sweet Supply', 'hello@sweetsupply.fr', '+33 6 11 22 33 44'),
(7, 'Packaging Pro', 'support@packpro.com', '+44 20 7946 0000');

-- Populating Address (4 shops)
INSERT INTO Address (ID_Address, Country, City, Street, Number) VALUES
(1, 'France', 'Paris', 'Rue de Rivoli', '105'),
(2, 'France', 'Lyon', 'Rue de la République', '22'),
(3, 'France', 'Nice', 'Promenade des Anglais', '15'),
(4, 'Spain', 'Madrid', 'Calle Mayor', '45');

-- ======================================================
-- 2. TABLES WITH FOREIGN KEYS
-- ======================================================

-- Populating Promotion (4 entries)
INSERT INTO Promotion (ID_Promotion, Promo_Discount, Promo_Begining_Date, Promo_End_Date, ID_Product) VALUES
(1, 20, '2025-03-01', '2025-03-31', 1),
(2, 50, '2025-04-10', '2025-04-15', 6),
(3, 10, '2025-01-01', '2025-12-31', 25),
(4, 15, '2025-05-20', '2025-06-20', 10);

-- Populating Shop (4 entries)
INSERT INTO Shop (ID_Shop, Shop_Income, Shop_Size, Shop_Employees_Number, ID_Address) VALUES
(1, 50000.00, 120.50, 5, 1),
(2, 35000.00, 85.00, 5, 2),
(3, 42000.00, 95.00, 5, 3),
(4, 28000.00, 70.00, 5, 4);

-- Populating Employee (5 per shop, diversified, with 1 manager per shop)
-- Format: ID, Title, HireDate, ManagerID, ShopID
INSERT INTO Employee (ID_Employee, Emp_Job_Title, Emp_Hire_Date, ID_Employee_manager, ID_Shop) VALUES
-- Shop 1 (Paris)
(1, 'Store Manager', '2020-01-10', NULL, 1),
(2, 'Baker', '2021-03-15', 1, 1),
(3, 'Barista', '2022-06-20', 1, 1),
(4, 'Sales Assistant', '2023-01-05', 1, 1),
(5, 'Pastry Chef', '2021-11-12', 1, 1),
-- Shop 2 (Lyon)
(6, 'Store Manager', '2019-05-20', NULL, 2),
(7, 'Baker', '2022-02-10', 6, 2),
(8, 'Barista', '2023-08-01', 6, 2),
(9, 'Sales Assistant', '2024-01-15', 6, 2),
(10, 'Pastry Chef', '2020-10-30', 6, 2),
-- Shop 3 (Nice)
(11, 'Store Manager', '2018-12-01', NULL, 3),
(12, 'Baker', '2021-07-22', 11, 3),
(13, 'Barista', '2023-03-12', 11, 3),
(14, 'Sales Assistant', '2024-02-01', 11, 3),
(15, 'Pastry Chef', '2022-09-18', 11, 3),
-- Shop 4 (Madrid)
(16, 'Store Manager', '2021-01-15', NULL, 4),
(17, 'Baker', '2022-04-05', 16, 4),
(18, 'Barista', '2023-05-20', 16, 4),
(19, 'Sales Assistant', '2024-01-10', 16, 4),
(20, 'Pastry Chef', '2022-11-25', 16, 4);

-- ======================================================
-- 3. ASSOCIATION TABLES (Many-to-Many)
-- ======================================================

-- contains (Ingredients -> Allergens)
INSERT INTO contains (ID_Ingredient, ID_Allergen) VALUES
(1, 1), -- Flour contains Gluten
(2, 2), -- Butter contains Dairy
(4, 2), -- Milk contains Dairy
(6, 4), -- Eggs contains Eggs
(8, 3); -- Almonds contains Nuts

-- Has (Products -> Ingredients)
INSERT INTO Has (ID_Product, ID_Ingredient) VALUES
(1, 1), (2, 1), (2, 2), (3, 1), (3, 2), (3, 3), -- Baguette, Croissant, Pain Choc
(4, 5), (5, 5), (5, 4), -- Coffee items
(23, 1), (23, 2), (23, 8); -- Almond Croissant

-- delivery (Product -> Supplier -> Shop)
INSERT INTO delivery (ID_Product, ID_Supplier, ID_Shop) VALUES
(1, 1, 1), (1, 1, 2), (1, 1, 3), (1, 1, 4), -- Flour related
(4, 4, 1), (4, 4, 4),                     -- Coffee to Paris & Madrid
(3, 3, 1), (3, 3, 2);                     -- Chocolate to Paris & Lyon