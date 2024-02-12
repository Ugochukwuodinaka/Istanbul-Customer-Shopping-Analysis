# Istanbul-Customer-Shopping-(2021-2023)-Analysis
![](Istanbul_Customer_Shopping_image.jpg)

## Project Overview
### Introduction:
Welcome to the bustling shopping scene of Istanbul! This project delves into the rich shopping landscape of Istanbul, focusing on data collected from 10 prominent shopping malls spanning the years 2021 to 2023. Our comprehensive dataset encompasses a diverse range of shoppers, capturing insights from various age groups and genders to provide a holistic view of shopping habits in this vibrant city.

### Dataset Overview:
- The dataset comprises vital information crucial for understanding Istanbul's shopping dynamics. It includes details such as invoice numbers, customer IDs, age, gender, payment methods, product categories, quantity, price, order dates, and shopping mall locations.
- By analyzing this rich dataset, we aim to uncover hidden patterns, trends, and correlations that offer valuable insights into consumer behavior and shopping preferences across different demographics.

- This dataset is a CSV file made up of a single table named customer_shopping_data.csv and was provided by [Quantum Analytics](https://www.quantumanalyticsco.org/). You can click on this [link](Raw_Data) to access the raw data file. This dataset table is made up of 10 columns and 99,547 rows of data.  

Here's an overview of the table columns along with explanations of the column names:
- __invoice_no:__ This column represents the unique identifier assigned to each invoice or transaction made by a customer. It serves as a reference number to track and identify individual purchases within the dataset.
- __customer_id:__ This column contains the unique identifier assigned to each customer. It allows for the tracking and analysis of shopping behavior and preferences of individual customers across multiple transactions.
- __gender:__ This column indicates the gender of the customer involved in the transaction. It provides insights into the demographic composition of shoppers and allows for gender-based analysis of shopping habits and preferences.
- __age:__ This column represents the age of the customer involved in the transaction. It enables age-based segmentation and analysis of shopping behavior, allowing for insights into how different age groups interact with products and brands.
- __category:__ This column specifies the category or type of product purchased in the transaction. It categorizes products into distinct groups based on their characteristics or functions, facilitating analysis of sales trends and preferences across different product categories.
- __quantity:__ This column indicates the quantity of the product purchased in the transaction. It represents the number of units or items bought by the customer, providing insights into purchasing patterns and consumption habits.
- __price:__ This column denotes the price of the product per unit or item. It represents the cost of the product purchased by the customer, allowing for analysis of transaction values, pricing strategies, and revenue generation.
- __payment_method:__ This column specifies the method of payment used for the transaction. It includes different payment options such as cash, credit card, debit card, mobile payment, etc., providing insights into payment preferences and transactional behaviors.
- __invoice_date:__ This column indicates the date and time when the transaction took place. It records the timestamp of each purchase, enabling analysis of sales trends over time, seasonality, and temporal patterns in shopping behavior.
- __shopping_mall:__ This column identifies the shopping mall or retail location where the transaction occurred. It allows for analysis of shopping preferences and behaviors across different mall locations, as well as assessment of the performance of individual malls in terms of foot traffic and sales.

## Objectives:
- Gain insights into the total revenue by product categories.
- Analyze variations in shopping behavior based on shopping mall locations.
- Gain insights into the total number of customers across shopping malls.
- Analyze variations in shopping behavior based on payment methods.
- Analyze variations in shopping behavior based on shopping by gender.
- Explore correlations between demographic factors such as age band, gender, and shopping habits.
- Gain insights into shopping trends and patterns across different age groups, genders, and total revenue generated.
- Analyze variations in shopping behavior based on Total Revenue by age band and product category.


## Expected Outcomes:
Through meticulous analysis and interpretation of the dataset, the project anticipates generating valuable insights into Istanbul's dynamic shopping ecosystem. These insights can inform various stakeholders, including retailers, marketers, and urban planners, enabling them to make data-driven decisions to enhance customer experiences, optimize inventory management, and drive business growth.


### Tools Used
1. Power Query Editor
    - Was used to:
        1. Extract,
        2. Transform, and
        3. Load all the datasets for this analysis.
           
2. Power BI (Was used to create reports and dashboard for this analysis)
    - The following Power BI Features were incorporated:
        1. DAX
        2. Quick Measures
        3. Filters
        4. Tooltips


### Data Cleaning, Transformation and Loading using the Power Query Editor:
1. I transformed all column data types to the right data types
2. I added a new column __"total_revenue"__ which was derived from multiplying the cata in the __"price"__ column by the data in the __"quantity"__ column.
3. I added a new column __"age_band"__ by extracting the data in the the __"age"__ column and grouping them (Children, Teenager, Young Adult, Mid-aged Adult, and Old Adult) using the "If function".
4. Duplicated the __"invoice_date"__ column into 2 columns, renamed the 2 columns to __invoice_date1__ and __invoice_daste2__.
5. Splitted the __"invoice_date1"__ using the delimiter into day/month/year, changed the name of the splitted column for year to __"invoice_year"__, and changed type to int64.
6. Splitted the __"invoice_date2"__ using the delimiter into day/month/year, changed the name of the splitted column for minth to __"month"__, and changed the type to int64.
7. Created a new column __"invoice_month"__ and filled it up by extracting the data from the __"month"__ , used the "if function" to convert them into months of the year (Jan- Dec) and chnaged the data type to text.
8. removed all the initial duplicated/Splitted columns leaving only the newly created __"invoice_year"__ and __"invoice_month"__ columns to join the other columns already existing.
9. Reordered all coulmns
10. Changed the __"total_revenue"__ data type to Decimal Number.

**Raw Data**
- Below a screenshot of a part of the raw data in .csv file format. You can download the dataset [here](customer_shopping_data.csv).

![](Raw_Data_Image.png)

**Final Power Query Editor screenshot**
- Below is a screenshot of a part of the cleaned data in power query editor. You can access the full Power BI project document [here](https://github.com/Ugochukwuodinaka/Istanbul-Customer-Shopping-Analysis/blob/main/ISTANBUL%20CUSTOMER%20SHOPPING%20ANALYSIS%20(2021%20-%202023).pbix).

![](Final_Power_Query_Editor_Screenshot.png)


## Data Modelling
No data modelling was required since we need just a table for the analysis.

## Visualization in Power BI:
#### Report 1
![](Istanbul_Customer_Shopping_(2021-2023)_Analysis_Dashboard.jpg)

### Project Analysis:
From the analysis, i made the Key Performance findings below:
- The Total Revenue is from all the Shopping Malls is __₺251,505,794M__.
- The Number of Shopping Malls for this analysis is __10__.
- The Number of Product Categories is __8__.
- Total Number of Customers is __99,457__.
- Number of Male Customers is __39.975__.
- Number of Female Customers is __59,482__.
- The Average Revenue By Customer is __₺2,529__.
- The Average Age of Customers is __43__.
