SELECT i.Ing_name
FROM ingredient i
JOIN has h ON i.ID_Ingredient = h.ID_Ingredient 
JOIN product p ON h.ID_Product = p.ID_Product
WHERE p.Pr_name = 'Pain au Chocolat';
