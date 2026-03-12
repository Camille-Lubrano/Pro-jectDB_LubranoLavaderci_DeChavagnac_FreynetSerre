-- Lists prices bellow 4€
SELECT Pr_Name, Price
FROM Product
WHERE Price < 4
ORDER BY Price DESC;

-- Lists unique categories 
SELECT DISTINCT Pr_Category
FROM Product;

-- Lists products between 300 and 400
SELECT Pr_Name, Pr_Calories
FROM Product
WHERE Pr_ Calories BETWEEN 300 AND 400;

-- Lists products with cake in their name
SELECT *
FROM Product
WHERE Pr_Name LIKE '%cake%';

-- Lists products from Bakery
Select Pr_Name, Pr_Category
FROM Product
WHERE Pr_Categorie IN ('Bakery');

-- Lists ingredients of product
SELECT i.Ing_name
FROM ingredient i
JOIN has h ON i.ID_Ingredient = h.ID_Ingredient 
JOIN product p ON h.ID_Product = p.ID_Product
WHERE p.Pr_name = 'Pain au Chocolat';
