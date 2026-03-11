use DATA_PROJECT;

ALTER TABLE Product ADD CONSTRAINT CHECK (Pr_Calories >= 0);
ALTER TABLE Product ADD CONSTRAINT CHECK (Price >= 0);
ALTER TABLE Ingredient ADD CONSTRAINT CHECK (Ing_Stock_Quant >= 0);
ALTER TABLE Allergen ADD CONSTRAINT CHECK (Al_Severity IN ('Low', 'Moderate', 'High', 'Severe'));
ALTER TABLE Supplier ADD CONSTRAINT CHECK (Sup_email LIKE '%@%.%');
ALTER TABLE Promotion ADD CONSTRAINT CHECK (Promo_Discount BETWEEN 1 AND 100);
ALTER TABLE Shop ADD CONSTRAINT CHECK (Shop_Employees_Number >= 0);
ALTER TABLE Promotion ADD CONSTRAINT CHK_Promo_Dates CHECK (Promo_End_Date >= Promo_Begining_Date);
