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
 
