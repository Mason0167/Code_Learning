-- Q1(a)
select * 
from ap.vendors  
right join ap.invoices on vendors.vendor_id = invoices.invoice_id; 

-- Q1(b) 
select v.vendor_id, v.vendor_name, i.invoice_total
from ap.vendors v, ap.invoices i -- where i.vendor_id = v.vendor_id; 

-- Q1(c) 
select * 
from ap.vendors v 
natural join ap.invoices i; 

-- Q1(d) 
select v.vendor_id, v.vendor_name, i.invoice_number, i.invoice_total 
from ap.vendors v join ap.invoices i 
using (vendor_id); 

-- Q2 
select e.employee_id,  CONCAT(e.first_name, ' ', e.last_name) as Full_Name,  
      d.department_name -- from employees e 
 inner join departments AS d on e.department_number = d.department_number; 

-- Q3(a) 
select * 
from ex.employees e 
left join ex.departments d 
  on e.department_number = d.department_number; 

-- Q3(b) 
 select e.employee_id,  
 concat(e.first_name, ' ', e.last_name) as Full_Name, d.department_name 
from ex.employees e 
left outer join ex.departments d on e.department_number = d.department_number;

Q3(c) 
select * 
from ex.employees e 
left join ex.departments d 
on e.department_number = d.department_number
where d.department_name is null;  
or d.department_number is null 
  
-- Q3(d) 
select e.employee_id,  concat(e.first_name, ' ', e.last_name) as Full_Name, d.department_name 
from ex.employees e 
left join ex.departments d 
on e.department_number = d.department_number 
union  
select employee_id, last_name, first_name, department_name 
from ex.employees e; 

-- Q4 
select customer_zip,  
concat(customer_first_name, ' ', customer_last_name) as FullName, 
vendor_name 
from om.customers c 
inner join ap.vendors v 
on v.vendor_zip_code = c.customer_zip; 

-- Q5 
select concat(c.customer_first_name, ' ' , c.customer_last_name) as Full_name,  
  o.order_id, i.title, o.order_date, i.unit_price, od.order_qty, 
  i.unit_price * od.order_qty as total 
from om.customers c 
inner join om.orders o 
on c.customer_id = o.customer_id 
inner join om.order_details od 
on od.order_id = o.order_id 
inner join om.items i 
on i.item_id = od.item_id
