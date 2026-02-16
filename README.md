# Pro-jectDB_LubranoLavaderci_DeChavagnac_FreynetSerre

## Prompt used :

You work in the field of restauration. Your company is involved in the domain of cookingpastries . It is a company such as Ben&Jerry’s , milka, or even subway for a better quality of cookies. We want to collect datas of all product you sell such as the price, or the ingredients in form of attributes and data set. Take inspiration from the following website :marmiton, cookeo, cookienation, Wikipedia and so much more. Your company wants to apply MERISE to design an information system. You are responsible for the analysis part, i.e., gathering the company's requirements. It has called on a computer engineering student to carry out this project, and you must provide him with the necessary information so that he can then apply the following steps of database design and development himself. First, establish the data business rules for your company in the form of a bulleted list. It must correspond to the information provided by someone who knows how the company works, but not how an
information system is built. Next, based on these rules, provide a raw data dictionary with the following columns, grouped in a table: meaning of the data, type, size in number of characters or digits. There should be between 25 and 35 data items. It is used to provide additional information about each data item (size and type) but without any assumptions about how the data will be modeled later. Provide the business rules and the data dictionary.

## Part 1: Business Rules

These rules describe how our business functions on a daily basis, from the ovens to the cash registers.

    Each Product (cookie, ice cream, or pastry) must have a unique name and a specific category.

    We sell products in different Formats (e.g., Single, Box of 6, Pint, Scoop); the price is determined by the combination of the product and its format.

    Every product is made using multiple Ingredients, and we need to track exactly which ingredients go into which product.

    An Ingredient can be used in many different products (e.g., sea salt is in almost everything).

    For transparency and safety, we must list all Allergens associated with each ingredient.

    We source our ingredients from various Suppliers. A single ingredient might be provided by multiple suppliers, and one supplier usually provides several ingredients.

    We need to keep a record of every Purchase Order sent to suppliers, including the date and the total cost.

    Each Customer can place multiple Orders at our retail counters.

    An order can contain several different products in various quantities.

    We track our Employees (bakers and servers), noting who processed which customer order and who is responsible for which kitchen shift.

    Every Promotion (discount) has a start date, an end date, and a specific percentage off, which can be applied to specific products.

## Part 2: Raw Data Dictionary

This table contains the fundamental building blocks for the system. I’ve kept this "flat"—meaning I haven't grouped them into tables yet—so the student can decide on the best normalization.


-
|**Meaning of Data**|Type|Size (Chars/Digits)|
-
|**Unique Product ID**|Alphanumeric|10|
-
Product Commercial Name,Text,50
Product Description,Text,255
"Product Category (e.g., Cookie, Gelato)",Text,30
Calories per 100g,Numeric,4
"Format Name (e.g., Large Box, Single)",Text,20
Unit Selling Price,Decimal,"6,2"
Ingredient Unique Code,Alphanumeric,10
Ingredient Name,Text,50
Ingredient Stock Quantity,Numeric,8
"Ingredient Unit of Measure (g, ml, unit)",Text,10
"Allergen Name (e.g., Peanuts, Gluten)",Text,30
Allergen Severity Level,Text,15
Supplier Name,Text,100
Supplier Contact Email,Text,100
Supplier Phone Number,Text,15
Supplier Street Address,Text,150
Purchase Order Reference Number,Alphanumeric,12
Purchase Order Date,Date,10
Purchase Order Total Amount,Decimal,"10,2"
Customer Last Name,Text,50
Customer First Name,Text,50
Customer Loyalty Card Number,Alphanumeric,20
Customer Points Balance,Numeric,6
Order Transaction ID,Alphanumeric,15
Order Date and Time,DateTime,19
Quantity of Product Ordered,Numeric,3
Employee ID,Alphanumeric,8
Employee Job Title,Text,40
Employee Hire Date,Date,10
"Promotion Code (e.g., SUMMER25)",Alphanumeric,10
Promotion Discount Percentage,Numeric,3
Promotion Expiry Date,Date,10

Would you like me to draft a sample Conceptual Data Model (MCD) based on these rules to give the student a head start?
