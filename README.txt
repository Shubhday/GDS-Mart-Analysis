Hello Everyone

Project Name: GDS Mart Analysis

Project Description: GDS Mart is a growing FMCG manufacturer headquartered in Gujarat, India. It is currently operational in three cities Surat, Ahmedabad and Vadodara. They want to expand to other metro/tier1 cities in the next 2 years.

GDS Mart is currently facing a problem where a few key customers have not extended the annual contract due to service issues. It is speculated that some of the essential products were either not delivered on time or not delivered in full over a continued period, which could have resulted in bad customer service. Management wants to fix this issue before expanding to other cities and requested their supply chain analytics team to track the ’On time’ and ‘In Full’ delivery service level for all the customers on a daily basis so that they can respond swiftly to these issues.


Solution:

I have defined some key metrics using which the analysis will be done, they are:
Total Order Lines - Count of all order lines in fact_orders table					
Line Fill Rate - Number of order lines shipped In Full Quantity / Total Order Lines		
Volume Fill Rate - Total Quantity shipped / Total Quantity Ordered					
Total Orders - Total aggregated orders Count												
On Time Delivery % - Number of orders delivered On Time / Total Number of Orders			
In Full Delivery % - Number of orders delivered in Full quantity / Total Number of Orders		
On Time In Full % - Number of orders delivered both IN Full & On Time / Total Number of Orders	
On Time Target - Average of On-Time Target 							
In Full Target - Average of In-Full Target							
On Time In Full Target - Average of OTIF Target								

--The above solution is depicted in the form of Excel Pivots, SQL Queries and Power BI Dashboard.

How To Use:
The Repository contains 3 Folders
1. Dataset Folder
2. Power BI Dashboard Folder
3. SQL Queries Folder

Dataset Folder: This Project contains 1 Dataset Excel File with 6 Raw Data tables and 1 Pivot Table.

6 Raw Data Tables:

Column Description for dim_customers:
1. customer_id: Unique ID is given to each customer
2. customer_name: Name of the customer
3. city: It is the city where the customer is present

Column Description for dim_products:
1. product_name: It is the name of the product
2. product_id: Unique ID is given to each of the products
3. category: It is the class to which the product belongs

Column Description for dim_date:
1. date: date at the daily level
2. mmm_yy: date at the monthly level
3. week_no: week number of the year as per the date column

Column Description for dim_targets_orders:
1. customer_id: Unique ID that is given to each of the customers
2. ontime_target %: Target assigned for Ontime % for a given customer
3. infull_target %: Target assigned for infull % for a given customer
4. otif_target %:   Target assigned for otif % for a given customer

Column Description for fact_order_lines:
1. order_id: Unique ID for each order the customer placed
2. order_placement_date: It is the date when the customer placed the order
3. customer_id: Unique ID that is given to each of the customers
4. product_id: Unique ID that is given to each of the products
5. order_qty: It is the number of products requested by the customer to be delivered
6. agreed_delivery_date: It is the date agreed between the customer and GDS Mart to deliver the products
7. actual_delivery_date: It is the actual date GDS Mart delivered the product to the customer
8. delivered_qty: It is the number of products that are actually delivered to the customer

Column Description for fact_orders_aggregate:
1. order_id: Unique ID for each order the customer placed
2. customer_id: Unique ID that is given to each of the customers
3. order_placement_date: It is the date when the customer placed the order
4. on_time: '1' denotes the order is delivered on time. '0' denotes the order is not delivered on time.
5. in_full: '1' denotes the order is delivered in full quantity. '0' denotes the order is not delivered in full quantity.
6: otif: '1' denotes the order is delivered both on time and in full quantity. '0' denotes the order is either not delivered on time or not in full quantity.

Power BI Dashboard Folder:
This has the .pbix file as well as the screenshots of how the Dashboard looks like.
download the .pbix file and double click on the .pbix to run it on your computer, this will work as long as youhave installed Power BI Desktop app from Microsoft.

In the File you'll find 2 dashboards explaining the key metrics defined above in visual form. use filters and slicers to get the insights you need.

SQL Queries Folder:
This contains a .sql file download it and run it on any database management app like SSMS, SQL Workbench, etc...
The queries written explain the key metrics defined above, It also has the output written right below for cross verification if need be.
