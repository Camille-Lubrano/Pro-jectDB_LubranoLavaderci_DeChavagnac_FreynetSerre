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

