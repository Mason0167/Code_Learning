show databases;
show tables;
use om;
-- Q1
select title, artist from om.items where artist = 'Umami';

-- Q2
select customer_first_name, customer_last_name, customer_zip
from om.customers
where customer_zip like '9%'
order by customer_first_name;

-- Q3
use ap;
select vendor_id, vendor_name
from ap.vendors
where vendor_name like 'N%'
order by vendor_name;

-- Q4
use ex;
select *
from ex.customers
where customer_phone like '(309)%';

-- Q5
use ap;
select invoice_id, invoice_total - payment_total - credit_total
AS balance
from ap.invoices
where invoice_total - payment_total - credit_total > 1000;

-- Q6
select invoice_id,
round(0.2 * invoice_total, 2) as discount,
round(0.8 * invoice_total, 2) as totel_due
from ap.invoices;

-- Q7
select customer_id, concat(customer_first_name, '-', customer_last_name) as
customer_full_name
from ex.customers
where customer_first_name like '%a%'
or customer_last_name like '%a%';

-- Q8
where shipped_date is null
AND order_date between '2014-01-01' and '2014-12-31';

-- Q9
select * from ap.invoices
where invoice_total between '1000' and '1500';

-- Q10
select vendor_name, vendor_state from ap.vendors
where vendor_state in ('DC', 'FL', 'NJ', 'WI')
order by vendor_name;

-- Q11
select distinct(vendor_city) from ap.vendors;

-- Q12
select * from ex.customers
limit 5;

-- Q13
select * from ap.invoices
limit 53, 3;
