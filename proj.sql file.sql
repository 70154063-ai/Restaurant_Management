CREATE TABLE orders 
SELECT mc.category_name, 
mi.item_name, 
printf('%.2f', mi.price) AS price, 
mi.prep_time_min AS prep_min, 
CASE WHEN mi.is_active = 1 THEN 'Available' ELSE 'Hidden' END AS status 
FROM menu_item mi 
JOIN menu_category mc ON mc.category_id = mi.category_id 
WHERE mi.is_active = 1 
ORDER BY mc.category_name, mi.item_name 
LIMIT 15;
SELECT o.order_id, 
c.customer_name, 
dt.table_no, 
mi.item_name, 
oi.quantity, 
printf('%.2f', oi.unit_price) AS unit_price, 
printf('%.2f', oi.quantity * oi.unit_price) AS line_total, 
printf('%.2f', SUM(oi.quantity * oi.unit_price) OVER (PARTITION BY o.order_id)) AS order_total 
FROM orders o 
JOIN customer c ON c.customer_id = o.customer_id 
JOIN dining_table dt ON dt.table_id = o.table_id 
JOIN order_item oi ON oi.order_id = o.order_id 
JOIN menu_item mi ON mi.item_id = oi.item_id 
WHERE o.order_id = 1007 
ORDER BY mi.item_name;
SELECT o.order_date, 
COUNT(DISTINCT o.order_id) AS total_orders, 
SUM(oi.quantity) AS items_sold, 
printf('%.2f', SUM(oi.quantity * oi.unit_price)) AS gross_sales 
FROM orders o 
JOIN order_item oi ON oi.order_id = o.order_id 
WHERE o.status <> 'Cancelled' 
GROUP BY o.order_date 
ORDER BY o.order_date;
SELECT mi.item_name, 
SUM(oi.quantity) AS units_sold, 
printf('%.2f', SUM(oi.quantity * oi.unit_price)) AS revenue 
FROM order_item oi 
JOIN menu_item mi ON mi.item_id = oi.item_id 
JOIN orders o ON o.order_id = oi.order_id 
WHERE o.status <> 'Cancelled' 
GROUP BY mi.item_name 
ORDER BY units_sold DESC, revenue DESC 
LIMIT 10;
SELECT mc.category_name, 
COUNT(DISTINCT o.order_id) AS orders_count, 
SUM(oi.quantity) AS quantity_sold, 
printf('%.2f', SUM(oi.quantity * oi.unit_price)) AS revenue 
FROM menu_category mc 
JOIN menu_item mi ON mi.category_id = mc.category_id 
JOIN order_item oi ON oi.item_id = mi.item_id 
JOIN orders o ON o.order_id = oi.order_id 
WHERE o.status <> 'Cancelled' 
GROUP BY mc.category_name 
ORDER BY SUM(oi.quantity * oi.unit_price) DESC;
SELECT c.customer_id, 
c.customer_name, 
COUNT(DISTINCT o.order_id) AS visits, 
printf('%.2f', SUM(oi.quantity * oi.unit_price)) AS total_spent, 
MAX(o.order_date) AS last_visit 
FROM customer c 
JOIN orders o ON o.customer_id = c.customer_id 
JOIN order_item oi ON oi.order_id = o.order_id 
WHERE o.status <> 'Cancelled' 
GROUP BY c.customer_id, c.customer_name 
ORDER BY SUM(oi.quantity * oi.unit_price) DESC 
LIMIT 10;
SELECT ii.item_name, 
ii.stock_qty, 
ii.reorder_level, 
ii.unit, 
s.supplier_name, 
ROUND(ii.reorder_level - ii.stock_qty, 2) AS shortage_qty 
FROM inventory_item ii 
LEFT JOIN supplier s ON s.supplier_id = ii.supplier_id 
WHERE ii.stock_qty <= ii.reorder_level 
ORDER BY shortage_qty DESC, ii.item_name;
value. 
SELECT s.supplier_name, 
COUNT(DISTINCT po.po_id) AS purchase_orders, 
SUM(poi.quantity) AS total_units_ordered, 
printf('%.2f', SUM(poi.quantity * poi.unit_cost)) AS purchase_value, 
MAX(po.order_date) AS last_order_date 
FROM supplier s 
JOIN purchase_order po ON po.supplier_id = s.supplier_id 
JOIN purchase_order_item poi ON poi.po_id = po.po_id 
GROUP BY s.supplier_name 
ORDER BY SUM(poi.quantity * poi.unit_cost) DESC;
SELECT st.staff_name, 
st.role, 
COUNT(DISTINCT o.order_id) AS orders_handled, 
printf('%.2f', SUM(oi.quantity * oi.unit_price)) AS revenue_handled, 
printf('%.2f', AVG(f.rating)) AS avg_feedback_rating 
FROM staff st 
JOIN orders o ON o.staff_id = st.staff_id 
JOIN order_item oi ON oi.order_id = o.order_id 
LEFT JOIN feedback f ON f.order_id = o.order_id 
WHERE o.status <> 'Cancelled' 
GROUP BY st.staff_id, st.staff_name, st.role 
ORDER BY SUM(oi.quantity * oi.unit_price) DESC;
SELECT dt.table_no, 
dt.capacity, 
dt.location, 
COUNT(DISTINCT o.order_id) AS served_orders, 
printf('%.2f', SUM(oi.quantity * oi.unit_price)) AS revenue_generated 
FROM dining_table dt 
JOIN orders o ON o.table_id = dt.table_id 
JOIN order_item oi ON oi.order_id = o.order_id 
WHERE o.status <> 'Cancelled' 
GROUP BY dt.table_id, dt.table_no, dt.capacity, dt.location 
ORDER BY COUNT(DISTINCT o.order_id) DESC, SUM(oi.quantity * oi.unit_price) DESC;
Identifies orders that are still open, preparing, or not fully paid so the cashier can follow up before closing. 
SELECT o.order_id, 
c.customer_name, 
COALESCE(dt.table_no, 'Takeaway/Delivery') AS table_no, 
o.order_date, 
o.status AS order_status, 
printf('%.2f', SUM(oi.quantity * oi.unit_price)) AS bill_amount, 
COALESCE(p.payment_status, 'Not Paid') AS payment_status 
FROM orders o 
LEFT JOIN customer c ON c.customer_id = o.customer_id 
LEFT JOIN dining_table dt ON dt.table_id = o.table_id 
JOIN order_item oi ON oi.order_id = o.order_id 
LEFT JOIN payment p ON p.order_id = o.order_id 
WHERE o.status IN ('Open', 'Preparing') OR p.payment_status IS NULL OR p.payment_status <> 'Paid' 
GROUP BY o.order_id, c.customer_name, dt.table_no, o.order_date, o.status, p.payment_status 
ORDER BY o.order_date, o.order_id;
WITH order_totals AS ( 
SELECT o.order_id, 
o.order_date, 
SUM(oi.quantity * oi.unit_price) AS order_total 
FROM orders o 
JOIN order_item oi ON oi.order_id = o.order_id 
WHERE o.status <> 'Cancelled' 
GROUP BY o.order_id, o.order_date 
) 
SELECT strftime('%Y-%m', order_date) AS sales_month, 
COUNT(order_id) AS total_orders, 
printf('%.2f', SUM(order_total)) AS monthly_revenue, 
printf('%.2f', AVG(order_total)) AS average_bill 
FROM order_totals 
GROUP BY strftime('%Y-%m', order_date) 
ORDER BY sales_month;
SELECT mc.category_name, 
COUNT(DISTINCT f.feedback_id) AS feedback_count, 
printf('%.2f', AVG(f.rating)) AS avg_rating, 
SUM(CASE WHEN f.rating <= 3 THEN 1 ELSE 0 END) AS improvement_alerts 
FROM feedback f 
JOIN orders o ON o.order_id = f.order_id 
JOIN order_item oi ON oi.order_id = o.order_id 
JOIN menu_item mi ON mi.item_id = oi.item_id 
JOIN menu_category mc ON mc.category_id = mi.category_id 
GROUP BY mc.category_name 
ORDER BY AVG(f.rating) ASC, feedback_count DESC;