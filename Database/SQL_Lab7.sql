-- Q1
select count(*) AS No_of_Payments, SUM(payment_total) AS Total_Payment_Amount, 
	AVG(payment_total) AS Average_Amount, Min(payment_total) AS Mini_Payment, 
    MAX(payment_total) AS Maximum_Payment
from ap.invoices
WHERE payment_total > 0;

-- Q1a
select vendor_id, count(*), SUM(payment_total) AS Total_Payment_Amount, 
	AVG(payment_total) AS Average_Amount, Min(payment_total) AS Mini_Payment, 
    MAX(payment_total) AS Maximum_Payment
from ap.invoices
WHERE payment_total > 0
group by vendor_id;

-- Q1b
select v.vendor_id, v.vendor_name, count(*), SUM(payment_total) AS Total_Payment_Amount, 
	AVG(payment_total) AS Average_Amount, Min(payment_total) AS Mini_Payment, 
    MAX(payment_total) AS Maximum_Payment
from ap.invoices i
INNER JOIN ap.vendors v
	ON v.vendor_id = i.vendor_id
WHERE payment_total > 0
group by v.vendor_id;

-- Q2
select vendor_state, count(distinct v.vendor_id),
	SUM(payment_total)
from ap.vendors v
INNER JOIN ap.invoices i
	ON v.vendor_id = i.vendor_id
GROUP BY v.vendor_state;

-- Q2a
select vendor_state, vendor_city, vendor_zip_code,
	count(distinct v.vendor_id), SUM(payment_total)
from ap.vendors v
INNER JOIN ap.invoices i
	ON v.vendor_id = i.vendor_id
GROUP BY vendor_state, vendor_city, vendor_zip_code;

-- Q3
select CONCAT(customer_last_name, ', ', customer_first_name) AS Customers_Name,
	order_date, count(*) AS No_of_Orders_placed
from om.customers c
INNER JOIN om.orders o
	ON c.customer_id = o.customer_id
INNER JOIN om.order_details od
	ON od.order_id = o.order_id
INNER JOIN om.items i
	ON i.item_id = od.item_id
GROUP BY Customers_Name, order_date
HAVING count(*) > 1;

-- Q4
select department_name, count(*)
from ex.departments d
INNER JOIN ex.employees e
	ON e.department_number = d.department_number
GROUP BY department_name;

-- 4a
select IFNULL(department_name, 'Total = '), count(*)
from ex.departments d
INNER JOIN ex.employees e
	ON e.department_number = d.department_number
GROUP BY department_name with rollup;
