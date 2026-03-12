-- Lists prices bellow 4€
SELECT Pr_Name, Price
FROM Product
WHERE Price < 4
ORDER BY Price DESC;

-- Lists unique categories 
SELECT DISTINCT Pr_Category
FROM Product;

-- Lists ingredients of product
SELECT i.Ing_name
FROM ingredient i
JOIN has h ON i.ID_Ingredient = h.ID_Ingredient 
JOIN product p ON h.ID_Product = p.ID_Product
WHERE p.Pr_name = 'Pain au Chocolat';
