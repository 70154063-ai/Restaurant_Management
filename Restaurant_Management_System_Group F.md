**Database Management Systems Project - Restaurant Management System** 

## **RESTAURANT MANAGEMENT SYSTEM Database Management Project - Phase 3** 

SQL Features, Queries, Executed Outputs, and Final Summary 

|**Item**|**Description**|
|---|---|
|Course|Database Management Systems|
|Project Phase|Phase 3 - Feature Queries and Output Documentation|
|Project Type|Restaurant Management System|
|Prepared By|Aliya Nadeem, Hira Fatima & Hina Tariq (Group F)|
|Submitted To|Mam Ambreen Akmal|
|Submission Date|Wednesday -10th-June|



In This document We  present a complete Phase 3 database project report for a restaurant management system. It includes the database design, core modules, at least fifteen practical features, SQL queries for each feature, and screenshots of the executed outputs. 

Restaurant Management System Phase 3 | Page 1 

**Database Management Systems Project - Restaurant Management System** 

## **1. Project Abstract** 

The Restaurant Management System is a relational database project designed to manage restaurant operations such as customer records, reservations, dining tables, staff, orders, order items, menu items, payments, suppliers, inventory, purchase orders, and customer feedback. The purpose of Phase 3 is to demonstrate how the database supports real business features through executable SQL queries and useful outputs. 

The system stores data in normalized tables and connects them through primary keys and foreign keys. This makes the data reliable, reduces duplication, and allows the restaurant to generate reports quickly. The project is suitable for a dine-in, takeaway, and delivery restaurant where management needs accurate information for billing, service, stock control, staff performance, and decision-making. 

## **1.1 Phase 3 Objectives** 

- List the major functional features of the restaurant management database. 

- Write SQL queries for each selected feature and show the executed output. 

- Use joins, grouping, aggregation, filtering, common table expressions, and window functions where suitable. 

- Show how the system supports daily operations such as reservations, billing, inventory alerts, and payments. 

- Provide a final summary explaining the value and future improvement scope of the system. 

## **1.2 Important Note About Execution** 

The SQL output screenshots in this report were generated from an actually executed sample restaurant database. The demonstration database uses SQLite for local execution, while the design follows standard relational database principles and can be implemented in PostgreSQL, MySQL, SQL Server, or Oracle with minor syntax adjustments for date and formatting functions. 

Restaurant Management System Phase 3 | Page 2 

**Database Management Systems Project - Restaurant Management System** 

## **2. System Scope and Main Modules** 

The system is designed for restaurant owners, managers, cashiers, waiters, kitchen staff, and hosts. It supports the full flow of a restaurant transaction: a customer can reserve a table, visit the restaurant, place an order, receive food, pay the bill, and submit feedback. At the same time, management can monitor stock, suppliers, staff performance, and revenue trends. 

## **2.1 Main Users** 

|**User Role**|**Main Responsibilities in the System**|
|---|---|
|Manager|Reviews sales, staff performance, inventory, supplier purchases, and feedback reports.|
|Cashier|Generates bills, records payments, checks pending payments, and reconciles daily<br>collections.|
|Waiter|Creates orders, adds order items, tracks order status, and serves tables.|
|Host|Manages table reservation, table allocation, and customer seating.|
|Kitchen Staff|Uses order details and menu items to prepare food and monitor ingredient needs.|



## **2.2 Functional Modules** 

- Customer management and loyalty history. 

- Reservation management and table allocation. 

- Menu category and menu item management. 

- Order entry, order item detail, and bill calculation. 

- Payment processing and payment-method reporting. 

- Inventory stock monitoring and low-stock alerts. 

- Supplier and purchase order management. 

- Staff performance and service reporting. 

- Feedback management and customer satisfaction analysis. 

Restaurant Management System Phase 3 | Page 3 

**Database Management Systems Project - Restaurant Management System** 

## **3. Phase 3 Feature List** 

The following fifteen features were selected for Phase 3. Each feature is demonstrated later with an SQL query and an executed output screenshot. 

|**ID**|**Feature**|**Purpose**|
|---|---|---|
|F01|Active Menu Catalogue|Shows all active menu items grouped by category so the restaurant can maintain the<br>customer-facing menu and quickly verify prices.|
|F02|Reservation and Table Allocation|Lists reservations for a selected date with table number and capacity, helping the host<br>avoid double booking and seat customers correctly.|
|F03|Order Bill Calculation|Calculates each line item and the complete bill total for a specific order, which is needed<br>by waiters and cashiers.|
|F04|Daily Sales Report|Summarizes total orders, item quantity, and gross sales by date for management reporting<br>and closing-day reconciliation.|
|F05|Best-Selling Menu Items|Finds the most popular dishes by units sold and revenue, supporting menu planning,<br>promotions, and ingredient purchase decisions.|
|F06|Category Revenue Analysis|Shows how much revenue each food category contributes, helping managers decide which<br>menu groups deserve focus.|
|F07|Customer Loyalty Ranking|Ranks customers by lifetime spending and visits, helping the restaurant identify loyal<br>customers for discounts and offers.|
|F08|Inventory Low-Stock Alerts|Detects ingredients below or equal to reorder level so the kitchen can avoid stockouts<br>during service hours.|
|F09|Supplier Restocking Summary|Summarizes purchase orders by supplier to track supplier dependency, ordering frequency,<br>and total purchase value.|
|F10|Staff Performance Report|Measures orders and revenue handled by each staff member, supporting performance<br>review and shift planning.|
|F11|Payment Method Analysis|Breaks paid transactions into cash, card, and digital wallet amounts to support cashier<br>reconciliation.|
|F12|Table Utilization Report|Shows which tables generate the most orders and revenue so managers can understand<br>seating performance.|
|F13|Pending and Unpaid Order<br>Monitoring|Identifies orders that are still open, preparing, or not fully paid so the cashier can follow up<br>before closing.|
|F14|Monthly Revenue Trend|Compares monthly sales and average bill size, giving management a high-level view of<br>business growth.|
|F15|Customer Feedback Insights|Groups feedback by category to identify customer satisfaction patterns and improvement<br>areas.|



Restaurant Management System Phase 3 | Page 4 

**Database Management Systems Project - Restaurant Management System** 

## **4. Database Design and Table Dictionary** 

The database is normalized around the restaurant transaction cycle. Each table stores one main entity, and relationships are created through foreign keys. This structure allows the system to answer operational and managerial questions through SQL joins and reports. 

## **4.1 Core Operational Tables** 

|**Table**|**Description**|
|---|---|
|restaurant|Stores restaurant branch profile such as name, address, and phone.|
|customer|Stores customer identity, contact details, email, and joining date.|
|staff|Stores employee details including role, shift, and salary.|
|dining_table|Stores restaurant table number, seating capacity, location, and current status.|
|menu_category|Stores categories such as Starters, BBQ, Rice, Desserts, Beverages, and Deals.|
|menu_item|Stores food item name, category, price, preparation time, and active status.|
|reservation|Stores customer reservations with date, time, table, party size, and status.|



## **4.2 Transaction, Inventory, and Reporting Tables** 

|**Table**|**Description**|
|---|---|
|orders|Stores customer orders, order type, date/time, staff member, table, and order status.|
|order_item|Stores each item inside an order with quantity and selling price.|
|payment|Stores payment method, amount, date, and payment status for each order.|
|supplier|Stores supplier name, city, and phone number.|
|inventory_item|Stores ingredient stock, unit, reorder level, cost, and linked supplier.|
|purchase_order|Stores restocking orders placed to suppliers.|
|purchase_order_item|Stores ingredients and quantities included in a purchase order.|
|feedback|Stores rating and comments submitted by customers after orders.|



Restaurant Management System Phase 3 | Page 5 

**Database Management Systems Project - Restaurant Management System** 

## **5. Keys, Relationships, and Business Rules** 

## **5.1 Primary Keys and Foreign Keys** 

|**Key**|**Relationship Use**|
|---|---|
|customer.customer_id|Primary key used by reservation, orders, and feedback.|
|dining_table.table_id|Primary key used by reservation and orders.|
|staff.staff_id|Primary key used by orders to show who handled the order.|
|menu_category.category_id|Primary key used by menu_item.|
|menu_item.item_id|Primary key used by order_item.|
|orders.order_id|Primary key used by order_item, payment, and feedback.|
|supplier.supplier_id|Primary key used by inventory_item and purchase_order.|
|purchase_order.po_id|Primary key used by purchase_order_item.|



## **5.2 Business Rules** 

- A customer can have many reservations and many orders. 

- One table can be reserved many times on different dates and times. 

- One order can contain many order items, but each order item belongs to one order. 

- One menu category can contain many menu items. 

- Payment is linked to the order for billing and reconciliation. 

- Inventory items are linked to suppliers so low stock can trigger restocking decisions. 

- Feedback is linked to a completed order and customer to support satisfaction analysis. 

Restaurant Management System Phase 3 | Page 6 

**Database Management Systems Project - Restaurant Management System** 

## **6. Entity Relationship Diagram** 

The ERD below shows the main relational structure of the Restaurant Management System. It highlights one-to-many relationships between customers and orders, orders and order items, menu categories and menu items, suppliers and inventory, and purchase orders and purchase order items. 

_Figure 1: Entity Relationship Diagram of the Restaurant Management System_ 

Restaurant Management System Phase 3 | Page 7 

**Database Management Systems Project - Restaurant Management System** 

## **7. SQL Implementation Overview** 

The project uses a relational schema with primary keys, foreign keys, not-null constraints, and check constraints where needed. The full sample database contains realistic data for customers, reservations, tables, staff, menu items, orders, payments, suppliers, inventory, purchase orders, and feedback. 

## **7.1 Main SQL DDL Excerpt** 

|**DDL Component**|**SQL Statement**|
|---|---|
|Orders and Order Items|CREATE TABLE orders (<br>order_id INTEGER PRIMARY KEY,<br>customer_id INTEGER,<br>table_id INTEGER,<br>staff_id INTEGER NOT NULL,<br>order_date TEXT NOT NULL,<br>order_time TEXT NOT NULL,<br>order_type TEXT NOT NULL,<br>status TEXT NOT NULL,<br>FOREIGN KEY (customer_id) REFERENCES customer(customer_id),<br>FOREIGN KEY (table_id) REFERENCES dining_table(table_id),<br>FOREIGN KEY (staff_id) REFERENCES staff(staff_id)<br>);<br>CREATE TABLE order_item (<br>order_item_id INTEGER PRIMARY KEY,<br>order_id INTEGER NOT NULL,<br>item_id INTEGER NOT NULL,<br>quantity INTEGER NOT NULL,<br>unit_price REAL NOT NULL,<br>FOREIGN KEY (order_id) REFERENCES orders(order_id),<br>FOREIGN KEY (item_id) REFERENCES menu_item(item_id)<br>);|



## **7.2 Sample Data Used for Query Execution** 

|**Entity**|**Sample Record Count**|
|---|---|
|Customers|12|
|Staff|8|
|Dining Tables|12|
|Menu Items|25|
|Reservations|8|
|Orders|28|
|Order Items|80|
|Payments|27|
|Suppliers|5|
|Inventory Items|14|
|Purchase Orders|6|
|Feedback Records|18|



Restaurant Management System Phase 3 | Page 8 

**Database Management Systems Project - Restaurant Management System** 

## **8.1 Feature F01: Active Menu Catalogue** 

Shows all active menu items grouped by category so the restaurant can maintain the customer-facing menu and quickly verify prices. 

## **SQL Query** 

|**Field**|**Details**|
|---|---|
|Feature ID|F01|
|Feature Name|Active Menu Catalogue|
|Purpose|Shows all active menu items grouped by category so the restaurant can maintain the customer-facing menu and<br>quickly verify prices.|
|SQL Query|SELECT mc.category_name,<br>mi.item_name,<br>printf('%.2f', mi.price) AS price,<br>mi.prep_time_min AS prep_min,<br>CASE WHEN mi.is_active = 1 THEN 'Available' ELSE 'Hidden' END AS status<br>FROM menu_item mi<br>JOIN menu_category mc ON mc.category_id = mi.category_id<br>WHERE mi.is_active = 1<br>ORDER BY mc.category_name, mi.item_name<br>LIMIT 15;|



## **Executed Output Screenshot** 

_Figure 2: Executed SQL output for F01 - Active Menu Catalogue (15 rows returned)_ 

_Interpretation: The output converts raw database records into useful information for restaurant staff and management decision-making._ 

Restaurant Management System Phase 3 | Page 9 

**Database Management Systems Project - Restaurant Management System** 

## **8.2 Feature F02: Reservation and Table Allocation** 

## Lists reservations for a selected date with table number and capacity, helping the host avoid double booking and seat customers correctly. 

## **SQL Query** 

|**Field**|**Details**|
|---|---|
|Feature ID|F02|
|Feature Name|Reservation and Table Allocation|
|Purpose|Lists reservations for a selected date with table number and capacity, helping the host avoid double booking and<br>seat customers correctly.|
|SQL Query|SELECT r.reservation_id,<br>c.customer_name,<br>dt.table_no,<br>dt.capacity,<br>r.reservation_time,<br>r.party_size,<br>r.status<br>FROM reservation r<br>JOIN customer c ON c.customer_id = r.customer_id<br>JOIN dining_table dt ON dt.table_id = r.table_id<br>WHERE r.reservation_date = '2026-05-10'<br>ORDER BY r.reservation_time;|



## **Executed Output Screenshot** 

_Figure 3: Executed SQL output for F02 - Reservation and Table Allocation (3 rows returned)_ 

_Interpretation: The output converts raw database records into useful information for restaurant staff and management decision-making._ 

Restaurant Management System Phase 3 | Page 10 

**Database Management Systems Project - Restaurant Management System** 

## **8.3 Feature F03: Order Bill Calculation** 

Calculates each line item and the complete bill total for a specific order, which is needed by waiters and cashiers. 

## **SQL Query** 

|**Field**|**Details**|
|---|---|
|Feature ID|F03|
|Feature Name|Order Bill Calculation|
|Purpose|Calculates each line item and the complete bill total for a specific order, which is needed by waiters and<br>cashiers.|
|SQL Query|SELECT o.order_id,<br>c.customer_name,<br>dt.table_no,<br>mi.item_name,<br>oi.quantity,<br>printf('%.2f', oi.unit_price) AS unit_price,<br>printf('%.2f', oi.quantity * oi.unit_price) AS line_total,<br>printf('%.2f', SUM(oi.quantity * oi.unit_price) OVER (PARTITION BY o.order_id)) AS order_total<br>FROM orders o<br>JOIN customer c ON c.customer_id = o.customer_id<br>JOIN dining_table dt ON dt.table_id = o.table_id<br>JOIN order_item oi ON oi.order_id = o.order_id<br>JOIN menu_item mi ON mi.item_id = oi.item_id<br>WHERE o.order_id = 1007<br>ORDER BY mi.item_name;|



## **Executed Output Screenshot** 

_Figure 4: Executed SQL output for F03 - Order Bill Calculation (5 rows returned)_ 

_Interpretation: The output converts raw database records into useful information for restaurant staff and management decision-making._ 

Restaurant Management System Phase 3 | Page 11 

**Database Management Systems Project - Restaurant Management System** 

## **8.4 Feature F04: Daily Sales Report** 

## Summarizes total orders, item quantity, and gross sales by date for management reporting and closing-day reconciliation. 

## **SQL Query** 

|**Field**|**Details**|
|---|---|
|Feature ID|F04|
|Feature Name|Daily Sales Report|
|Purpose|Summarizes total orders, item quantity, and gross sales by date for management reporting and closing-day<br>reconciliation.|
|SQL Query|SELECT o.order_date,<br>COUNT(DISTINCT o.order_id) AS total_orders,<br>SUM(oi.quantity) AS items_sold,<br>printf('%.2f', SUM(oi.quantity * oi.unit_price)) AS gross_sales<br>FROM orders o<br>JOIN order_item oi ON oi.order_id = o.order_id<br>WHERE o.status <> 'Cancelled'<br>GROUP BY o.order_date<br>ORDER BY o.order_date;|



## **Executed Output Screenshot** 

_Figure 5: Executed SQL output for F04 - Daily Sales Report (22 rows returned)_ 

_Interpretation: The output converts raw database records into useful information for restaurant staff and management decision-making._ 

Restaurant Management System Phase 3 | Page 12 

**Database Management Systems Project - Restaurant Management System** 

## **8.5 Feature F05: Best-Selling Menu Items** 

Finds the most popular dishes by units sold and revenue, supporting menu planning, promotions, and ingredient purchase decisions. 

## **SQL Query** 

|**Field**|**Details**|
|---|---|
|Feature ID|F05|
|Feature Name|Best-Selling Menu Items|
|Purpose|Finds the most popular dishes by units sold and revenue, supporting menu planning, promotions, and ingredient<br>purchase decisions.|
|SQL Query|SELECT mi.item_name,<br>SUM(oi.quantity) AS units_sold,<br>printf('%.2f', SUM(oi.quantity * oi.unit_price)) AS revenue<br>FROM order_item oi<br>JOIN menu_item mi ON mi.item_id = oi.item_id<br>JOIN orders o ON o.order_id = oi.order_id<br>WHERE o.status <> 'Cancelled'<br>GROUP BY mi.item_name<br>ORDER BY units_sold DESC, revenue DESC<br>LIMIT 10;|



## **Executed Output Screenshot** 

_Figure 6: Executed SQL output for F05 - Best-Selling Menu Items (10 rows returned)_ 

_Interpretation: The output converts raw database records into useful information for restaurant staff and management decision-making._ 

Restaurant Management System Phase 3 | Page 13 

**Database Management Systems Project - Restaurant Management System** 

## **8.6 Feature F06: Category Revenue Analysis** 

Shows how much revenue each food category contributes, helping managers decide which menu groups deserve focus. 

## **SQL Query** 

|**Field**|**Details**|
|---|---|
|Feature ID|F06|
|Feature Name|Category Revenue Analysis|
|Purpose|Shows how much revenue each food category contributes, helping managers decide which menu groups deserve<br>focus.|
|SQL Query|SELECT mc.category_name,<br>COUNT(DISTINCT o.order_id) AS orders_count,<br>SUM(oi.quantity) AS quantity_sold,<br>printf('%.2f', SUM(oi.quantity * oi.unit_price)) AS revenue<br>FROM menu_category mc<br>JOIN menu_item mi ON mi.category_id = mc.category_id<br>JOIN order_item oi ON oi.item_id = mi.item_id<br>JOIN orders o ON o.order_id = oi.order_id<br>WHERE o.status <> 'Cancelled'<br>GROUP BY mc.category_name<br>ORDER BY SUM(oi.quantity * oi.unit_price) DESC;|



## **Executed Output Screenshot** 

_Figure 7: Executed SQL output for F06 - Category Revenue Analysis (7 rows returned)_ 

_Interpretation: The output converts raw database records into useful information for restaurant staff and management decision-making._ 

Restaurant Management System Phase 3 | Page 14 

**Database Management Systems Project - Restaurant Management System** 

## **8.7 Feature F07: Customer Loyalty Ranking** 

Ranks customers by lifetime spending and visits, helping the restaurant identify loyal customers for discounts and offers. 

## **SQL Query** 

|**Field**|**Details**|
|---|---|
|Feature ID|F07|
|Feature Name|Customer Loyalty Ranking|
|Purpose|Ranks customers by lifetime spending and visits, helping the restaurant identify loyal customers for discounts<br>and offers.|
|SQL Query|SELECT c.customer_id,<br>c.customer_name,<br>COUNT(DISTINCT o.order_id) AS visits,<br>printf('%.2f', SUM(oi.quantity * oi.unit_price)) AS total_spent,<br>MAX(o.order_date) AS last_visit<br>FROM customer c<br>JOIN orders o ON o.customer_id = c.customer_id<br>JOIN order_item oi ON oi.order_id = o.order_id<br>WHERE o.status <> 'Cancelled'<br>GROUP BY c.customer_id, c.customer_name<br>ORDER BY SUM(oi.quantity * oi.unit_price) DESC<br>LIMIT 10;|



## **Executed Output Screenshot** 

_Figure 8: Executed SQL output for F07 - Customer Loyalty Ranking (10 rows returned) Interpretation: The output converts raw database records into useful information for restaurant staff and management decision-making._ 

Restaurant Management System Phase 3 | Page 15 

**Database Management Systems Project - Restaurant Management System** 

## **8.8 Feature F08: Inventory Low-Stock Alerts** 

Detects ingredients below or equal to reorder level so the kitchen can avoid stockouts during service hours. 

## **SQL Query** 

|**Field**|**Details**|
|---|---|
|Feature ID|F08|
|Feature Name|Inventory Low-Stock Alerts|
|Purpose|Detects ingredients below or equal to reorder level so the kitchen can avoid stockouts during service hours.|
|SQL Query|SELECT ii.item_name,<br>ii.stock_qty,<br>ii.reorder_level,<br>ii.unit,<br>s.supplier_name,<br>ROUND(ii.reorder_level - ii.stock_qty, 2) AS shortage_qty<br>FROM inventory_item ii<br>LEFT JOIN supplier s ON s.supplier_id = ii.supplier_id<br>WHERE ii.stock_qty <= ii.reorder_level<br>ORDER BY shortage_qty DESC, ii.item_name;|



## **Executed Output Screenshot** 

_Figure 9: Executed SQL output for F08 - Inventory Low-Stock Alerts (9 rows returned)_ 

_Interpretation: The output converts raw database records into useful information for restaurant staff and management decision-making._ 

Restaurant Management System Phase 3 | Page 16 

**Database Management Systems Project - Restaurant Management System** 

## **8.9 Feature F09: Supplier Restocking Summary** 

Summarizes purchase orders by supplier to track supplier dependency, ordering frequency, and total purchase value. 

## **SQL Query** 

|**Field**|**Details**|
|---|---|
|Feature ID|F09|
|Feature Name|Supplier Restocking Summary|
|Purpose|Summarizes purchase orders by supplier to track supplier dependency, ordering frequency, and total purchase<br>value.|
|SQL Query|SELECT s.supplier_name,<br>COUNT(DISTINCT po.po_id) AS purchase_orders,<br>SUM(poi.quantity) AS total_units_ordered,<br>printf('%.2f', SUM(poi.quantity * poi.unit_cost)) AS purchase_value,<br>MAX(po.order_date) AS last_order_date<br>FROM supplier s<br>JOIN purchase_order po ON po.supplier_id = s.supplier_id<br>JOIN purchase_order_item poi ON poi.po_id = po.po_id<br>GROUP BY s.supplier_name<br>ORDER BY SUM(poi.quantity * poi.unit_cost) DESC;|



## **Executed Output Screenshot** 

_Figure 10: Executed SQL output for F09 - Supplier Restocking Summary (5 rows returned)_ 

_Interpretation: The output converts raw database records into useful information for restaurant staff and management decision-making._ 

Restaurant Management System Phase 3 | Page 17 

**Database Management Systems Project - Restaurant Management System** 

## **8.10 Feature F10: Staff Performance Report** 

Measures orders and revenue handled by each staff member, supporting performance review and shift planning. 

## **SQL Query** 

|**Field**|**Details**|
|---|---|
|Feature ID|F10|
|Feature Name|Staff Performance Report|
|Purpose|Measures orders and revenue handled by each staff member, supporting performance review and shift planning.|
|SQL Query|SELECT st.staff_name,<br>st.role,<br>COUNT(DISTINCT o.order_id) AS orders_handled,<br>printf('%.2f', SUM(oi.quantity * oi.unit_price)) AS revenue_handled,<br>printf('%.2f', AVG(f.rating)) AS avg_feedback_rating<br>FROM staff st<br>JOIN orders o ON o.staff_id = st.staff_id<br>JOIN order_item oi ON oi.order_id = o.order_id<br>LEFT JOIN feedback f ON f.order_id = o.order_id<br>WHERE o.status <> 'Cancelled'<br>GROUP BY st.staff_id, st.staff_name, st.role<br>ORDER BY SUM(oi.quantity * oi.unit_price) DESC;|



## **Executed Output Screenshot** 

_Figure 11: Executed SQL output for F10 - Staff Performance Report (3 rows returned)_ 

_Interpretation: The output converts raw database records into useful information for restaurant staff and management decision-making._ 

Restaurant Management System Phase 3 | Page 18 

**Database Management Systems Project - Restaurant Management System** 

## **8.11 Feature F11: Payment Method Analysis** 

Breaks paid transactions into cash, card, and digital wallet amounts to support cashier reconciliation. 

## **SQL Query** 

|**Field**|**Details**|
|---|---|
|Feature ID|F11|
|Feature Name|Payment Method Analysis|
|Purpose|Breaks paid transactions into cash, card, and digital wallet amounts to support cashier reconciliation.|
|SQL Query|SELECT payment_method,<br>COUNT(*) AS transactions,<br>printf('%.2f', SUM(amount)) AS amount_collected,<br>printf('%.2f', 100.0 * SUM(amount) / SUM(SUM(amount)) OVER ()) AS percent_of_total<br>FROM payment<br>WHERE payment_status = 'Paid'<br>GROUP BY payment_method<br>ORDER BY SUM(amount) DESC;|



## **Executed Output Screenshot** 

_Figure 12: Executed SQL output for F11 - Payment Method Analysis (4 rows returned)_ 

_Interpretation: The output converts raw database records into useful information for restaurant staff and management decision-making._ 

Restaurant Management System Phase 3 | Page 19 

**Database Management Systems Project - Restaurant Management System** 

## **8.12 Feature F12: Table Utilization Report** 

Shows which tables generate the most orders and revenue so managers can understand seating performance. 

## **SQL Query** 

|**Field**|**Details**|
|---|---|
|Feature ID|F12|
|Feature Name|Table Utilization Report|
|Purpose|Shows which tables generate the most orders and revenue so managers can understand seating performance.|
|SQL Query|SELECT dt.table_no,<br>dt.capacity,<br>dt.location,<br>COUNT(DISTINCT o.order_id) AS served_orders,<br>printf('%.2f', SUM(oi.quantity * oi.unit_price)) AS revenue_generated<br>FROM dining_table dt<br>JOIN orders o ON o.table_id = dt.table_id<br>JOIN order_item oi ON oi.order_id = o.order_id<br>WHERE o.status <> 'Cancelled'<br>GROUP BY dt.table_id, dt.table_no, dt.capacity, dt.location<br>ORDER BY COUNT(DISTINCT o.order_id) DESC, SUM(oi.quantity * oi.unit_price) DESC;|



## **Executed Output Screenshot** 

_Figure 13: Executed SQL output for F12 - Table Utilization Report (10 rows returned)_ 

_Interpretation: The output converts raw database records into useful information for restaurant staff and management decision-making._ 

Restaurant Management System Phase 3 | Page 20 

**Database Management Systems Project - Restaurant Management System** 

## **8.13 Feature F13: Pending and Unpaid Order Monitoring** 

Identifies orders that are still open, preparing, or not fully paid so the cashier can follow up before closing. 

## **SQL Query** 

|**Field**|**Details**|
|---|---|
|Feature ID|F13|
|Feature Name|Pending and Unpaid Order Monitoring|
|Purpose|Identifies orders that are still open, preparing, or not fully paid so the cashier can follow up before closing.|
|SQL Query|SELECT o.order_id,<br>c.customer_name,<br>COALESCE(dt.table_no, 'Takeaway/Delivery') AS table_no,<br>o.order_date,<br>o.status AS order_status,<br>printf('%.2f', SUM(oi.quantity * oi.unit_price)) AS bill_amount,<br>COALESCE(p.payment_status, 'Not Paid') AS payment_status<br>FROM orders o<br>LEFT JOIN customer c ON c.customer_id = o.customer_id<br>LEFT JOIN dining_table dt ON dt.table_id = o.table_id<br>JOIN order_item oi ON oi.order_id = o.order_id<br>LEFT JOIN payment p ON p.order_id = o.order_id<br>WHERE o.status IN ('Open', 'Preparing') OR p.payment_status IS NULL OR p.payment_status <> 'Paid'<br>GROUP BY o.order_id, c.customer_name, dt.table_no, o.order_date, o.status, p.payment_status<br>ORDER BY o.order_date, o.order_id;|



## **Executed Output Screenshot** 

_Figure 14: Executed SQL output for F13 - Pending and Unpaid Order Monitoring (3 rows returned)_ 

_Interpretation: The output converts raw database records into useful information for restaurant staff and management decision-making._ 

Restaurant Management System Phase 3 | Page 21 

**Database Management Systems Project - Restaurant Management System** 

## **8.14 Feature F14: Monthly Revenue Trend** 

Compares monthly sales and average bill size, giving management a high-level view of business growth. 

## **SQL Query** 

|**Field**|**Details**|
|---|---|
|Feature ID|F14|
|Feature Name|Monthly Revenue Trend|
|Purpose|Compares monthly sales and average bill size, giving management a high-level view of business growth.|
|SQL Query|WITH order_totals AS (<br>SELECT o.order_id,<br>o.order_date,<br>SUM(oi.quantity * oi.unit_price) AS order_total<br>FROM orders o<br>JOIN order_item oi ON oi.order_id = o.order_id<br>WHERE o.status <> 'Cancelled'<br>GROUP BY o.order_id, o.order_date<br>)<br>SELECT strftime('%Y-%m', order_date) AS sales_month,<br>COUNT(order_id) AS total_orders,<br>printf('%.2f', SUM(order_total)) AS monthly_revenue,<br>printf('%.2f', AVG(order_total)) AS average_bill<br>FROM order_totals<br>GROUP BY strftime('%Y-%m', order_date)<br>ORDER BY sales_month;|



## **Executed Output Screenshot** 

_Figure 15: Executed SQL output for F14 - Monthly Revenue Trend (3 rows returned)_ 

_Interpretation: The output converts raw database records into useful information for restaurant staff and management decision-making._ 

Restaurant Management System Phase 3 | Page 22 

**Database Management Systems Project - Restaurant Management System** 

## **8.15 Feature F15: Customer Feedback Insights** 

Groups feedback by category to identify customer satisfaction patterns and improvement areas. 

## **SQL Query** 

|**Field**|**Details**|
|---|---|
|Feature ID|F15|
|Feature Name|Customer Feedback Insights|
|Purpose|Groups feedback by category to identify customer satisfaction patterns and improvement areas.|
|SQL Query|SELECT mc.category_name,<br>COUNT(DISTINCT f.feedback_id) AS feedback_count,<br>printf('%.2f', AVG(f.rating)) AS avg_rating,<br>SUM(CASE WHEN f.rating <= 3 THEN 1 ELSE 0 END) AS improvement_alerts<br>FROM feedback f<br>JOIN orders o ON o.order_id = f.order_id<br>JOIN order_item oi ON oi.order_id = o.order_id<br>JOIN menu_item mi ON mi.item_id = oi.item_id<br>JOIN menu_category mc ON mc.category_id = mi.category_id<br>GROUP BY mc.category_name<br>ORDER BY AVG(f.rating) ASC, feedback_count DESC;|



## **Executed Output Screenshot** 

_Figure 16: Executed SQL output for F15 - Customer Feedback Insights (7 rows returned)_ 

_Interpretation: The output converts raw database records into useful information for restaurant staff and management decision-making._ 

Restaurant Management System Phase 3 | Page 23 

**Database Management Systems Project - Restaurant Management System** 

## **9. Final Summary of the Restaurant Management System** 

The Restaurant Management System database project successfully models the important operations of a modern restaurant. It organizes information about customers, staff, tables, reservations, menus, orders, payments, suppliers, inventory, purchase orders, and feedback in a structured relational database. The design reduces duplicate data and supports accurate reporting through primary key and foreign key relationships. 

The Phase 3 queries prove that the database can do more than store records. It can generate real operational reports such as active menu lists, table reservation schedules, live bill calculations, daily sales reports, best-selling items, category revenue, customer loyalty rankings, low-stock alerts, supplier summaries, staff performance reports, payment analysis, table utilization, pending payment tracking, monthly revenue trends, and feedback insights. 

From a business perspective, this system helps managers make faster and better decisions. Sales reports show which items and categories produce the highest revenue. Inventory alerts protect the restaurant from running out of ingredients. Payment reports help cashiers reconcile collections. Staff reports support fair performance review. Feedback reports help improve customer satisfaction and service quality. 

## **9.1 Future Enhancement Scope** 

- Add a login and role-based access control system for managers, cashiers, waiters, and kitchen staff. 

- Connect the database to a web or desktop front end for real-time order entry and payment processing. 

- Add automatic stock deduction when orders are completed. 

- Create invoice printing and digital receipt features. 

- Add dashboard charts for revenue, inventory, staff performance, and feedback trends. 

- Add online reservation and delivery integration for customers. 

Overall, the project demonstrates how a well-designed database can support restaurant efficiency, accuracy, customer service, and management control. 

**GITHUB LINK: - (https://github.com/70154063 ai/Restaurant_Management)** 

## **THANK YOU!** 

Restaurant Management System Phase 3 | Page 24 

