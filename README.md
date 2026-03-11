# Pro-jectDB_LubranoLavaderci_DeChavagnac_FreynetSerre

## Prompt used :

You work in the field of restauration. Your company is involved in the domain of cookingpastries . It is a company such as Ben&Jerry’s , milka, or even subway for a better quality of cookies. We want to collect datas of all product you sell such as the price, or the ingredients in form of attributes and data set. Take inspiration from the following website :marmiton, cookeo, cookienation, Wikipedia and so much more. Your company wants to apply MERISE to design an information system. You are responsible for the analysis part, i.e., gathering the company's requirements. It has called on a computer engineering student to carry out this project, and you must provide him with the necessary information so that he can then apply the following steps of database design and development himself. First, establish the data business rules for your company in the form of a bulleted list. It must correspond to the information provided by someone who knows how the company works, but not how an
information system is built. Next, based on these rules, provide a raw data dictionary with the following columns, grouped in a table: meaning of the data, type, size in number of characters or digits. There should be between 25 and 35 data items. It is used to provide additional information about each data item (size and type) but without any assumptions about how the data will be modeled later. Provide the business rules and the data dictionary.

## Part 1: Business Rules

These rules describe how our business functions on a daily basis, from the ovens to the cash registers.

Each product must have a unique name and a specific category.
Products are sold in different formats such as single, box of 6, pint, or scoop.
A product can be made of multiple ingredients, and an ingredient can be used in many different products.
All allergens associated with each ingredient must be listed for transparency and safety.
Ingredients are sourced from various suppliers, where one supplier provides several ingredients and one ingredient can be provided by multiple suppliers.
Each customer can place multiple orders at retail counters.
An order can contain several different products in various quantities.
Every promotion has a start date, an end date, and a specific percentage off applied to specific products.
Product prices and calorie counts cannot be negative numbers.
Ingredient stock quantities must never drop below zero.
A promotion cannot end before its start date.
Promotion discounts must be restricted to a range between 1 and 100 percent.
Allergen severity levels must be restricted to 'Low', 'Moderate', 'High', or 'Severe'.
Supplier email addresses must contain an '@' symbol and a dot.
A shop must have a size greater than zero and a non-negative number of employees.
An employee cannot be affiliated with more than one department.
Employees must have a designated manager within the organizational hierarchy.
A department name must follow the format 'S' followed by a 2-digit number.

    

## Part 2: Raw Data Dictionary


Meaning of the Data,SQL Data Type,Size (Chars/Digits)

Unique Product ID,INT,Primary Key
Product Name,VARCHAR,50
Product Description,VARCHAR,50
Product Category,VARCHAR,50
Product Format,VARCHAR,50
Product Calories,DECIMAL,"15,2"
Product Selling Price,INT,-
Unique Ingredient ID,INT,Primary Key
Ingredient Name,VARCHAR,50
Ingredient Stock Quantity,DECIMAL,"15,2"
Unique Allergen ID,INT,Primary Key
Allergen Name,VARCHAR,50
Allergen Severity Level,VARCHAR,50
Unique Supplier ID,INT,Primary Key
Supplier Name,VARCHAR,50
Supplier Contact Email,VARCHAR,50
Supplier Phone Number,VARCHAR,50
Unique Address ID,INT,Primary Key
Address Country,VARCHAR,50
Address City,VARCHAR,50
Address Street,VARCHAR,50
Address Number,VARCHAR,50
Unique Promotion ID,INT,Primary Key
Promotion Discount,INT,-
Promotion Beginning Date,DATE,-
Promotion End Date,DATE,-
Unique Shop ID,INT,Primary Key
Shop Income,DECIMAL,"15,2"
Shop Size,DECIMAL,"15,2"
Number of Employees in Shop,INT,-
Unique Employee ID,INT,Primary Key
Employee Job Title,VARCHAR,50
Employee Hire Date,DATE,-






# MLD :
Product = (<u>ID_Product INT</u>, Pr_Name VARCHAR(50), Pr_Description VARCHAR(50), Pr_Category VARCHAR(50), Pr_Format VARCHAR(50), Pr_Calories DECIMAL(15,2), Price INT);
Ingredient = (<u>ID_Ingredient</u> INT, Ing_Name VARCHAR(50), Ing_Stock_Quant DECIMAL(15,2));
Allergen = (<u>ID_Allergen</u> INT, Al_Name VARCHAR(50), Al_Severity VARCHAR(50));
Supplier = (<u>ID_Supplier</u> INT, Sup_Name VARCHAR(50), Sup_email VARCHAR(50), Sup_phone VARCHAR(50));
Promotion = (<u>ID_Promotion</u> INT, Promo_Discount INT, Promo_Begining_Date DATE, Promo_End_Date DATE, #ID_Product);
Address = (<u>ID_Address</u> INT, Country VARCHAR(50), City VARCHAR(50), Street VARCHAR(50), Number VARCHAR(50));
Shop = (<u>ID_Shop</u> INT, Shop_Income DECIMAL(15,2), Shop_Size DECIMAL(15,2), Shop_Employees_Number INT, #ID_Address);
Employee = (<u>ID_Employee</u> INT, Emp_Job_Title VARCHAR(50), Emp_Hire_Date DATE, #ID_Employee_manager, #ID_Shop);
contains = (<u>#ID_Ingredient, #ID_Allergen</u>);
Has = (<u>#ID_Product, #ID_Ingredient</u>);
delivery = (<u>#ID_Product, #ID_Supplier, #ID_Shop</u>);
