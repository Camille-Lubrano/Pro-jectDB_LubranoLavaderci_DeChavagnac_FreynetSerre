--Scenario 1

-- Lists products with prices bellow 4€
SELECT Pr_Name, Price
FROM Product
WHERE Price < 4
ORDER BY Price DESC;

-- Lists products with cake in their name
SELECT *
FROM Product
WHERE Pr_Name LIKE '%cake%';

-- Select the least caloric product
SELECT Pr_Name, Pr_Calories
FROM Product
WHERE Pr_Calories <= ALL (SELECT Pr_Calories FROM Product);

-- Lists products from Bakery
Select Pr_Name, Pr_Category
FROM Product
WHERE Pr_Category IN ('Bakery');

-- Lists products with more than 5 articles in it (mass promotion)
SELECT Pr_Category, COUNT(*) AS Nb_Prod 
FROM Product
GROUP BY Pr_Category
HAVING COUNT(*) > 5;

-- Products without allergens
SELECT Pr_Name
FROM Product p
WHERE NOT EXISTS (SELECT * FROM Has h JOIN contains c ON h.ID_Ingredient = c.ID_Ingredient 
                  WHERE h.ID_Product = p.ID_Product);

-- Most expensive product
SELECT Pr_Name, Price
FROM Product 
WHERE Price >= ALL (SELECT Price FROM Product);

-- Final price after the reduction
SELECT p.Pr_Name, (p.Price - pr.Promo_Discount) AS Final_Price 
FROM Product p
JOIN Promotion pr ON p.ID_Product = pr.ID_Product;

-- Counts number of products by category
SELECT Pr_Category, COUNT(*) AS Nb_products
FROM Product
GROUP BY Pr_Category;

-- Lists all the products which have en entry in the promotion table
SELECT Pr_Name 
FROM Product 
WHERE ID_Product IN (SELECT ID_Product FROM Promotion);


--Scenario 2 

-- Lists ingredients of a certain product
SELECT i.Ing_name
FROM ingredient i
JOIN has h ON i.ID_Ingredient = h.ID_Ingredient 
JOIN product p ON h.ID_Product = p.ID_Product
WHERE p.Pr_name = 'Pain au Chocolat';

-- Find all the allergens in the products
SELECT i.Ing_Name, a.Al_Name
FROM Ingredient i
LEFT OUTER JOIN contains c ON i.ID_Ingredient = c.ID_Ingredient
LEFT OUTER JOIN Allergen a ON c.ID_Allergen = a.ID_Allergen;

-- Average price for each category
SELECT Pr_Category, AVG(Price) AS Prix_Moyen
FROM Product
GROUP BY Pr_Category
HAVING AVG(Price) > 3;

-- Total stock of each ingredient grouped by name
SELECT Ing_Name, SUM(Ing_Stock_Quant)
FROM Ingredient
GROUP BY Ing_Name;

-- Lists all employees of a shop
SELECT e.ID_Employee AS Staff, m.ID_Employee AS Manager 
FROM Employee e
JOIN Employee m ON e.ID_Employee_manager = m.ID_Employee;

-- Lists all the countries in which there are shops, and how much of them are there
SELECT Country, COUNT(ID_Shop) AS Nombre_Magasins
FROM Shop s
JOIN Address a ON s.ID_Address = a.ID_Address
GROUP BY Country;

-- Lists the suppliers who have at least one existing delivery
SELECT Sup_Name 
FROM Supplier s
WHERE EXISTS (SELECT * FROM delivery d WHERE d.ID_Supplier = s.ID_Supplier);




