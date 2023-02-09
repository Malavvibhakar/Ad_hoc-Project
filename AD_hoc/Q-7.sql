--  Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. 
-- This analysis helps to get an idea of low and high-performing months and take strategic decisions.
-- The final report contains these columns: Month,Year,Gross sales Amount

select c.customer, year(date) year , monthname(date) month,
round(sum(sold_quantity * gross_price /1000000),2) as Gross_sales_Amount 
from dim_customer c
join fact_sales_monthly s
on c.customer_code = s.customer_code
join fact_gross_price p
on p.product_code = s.product_code
where c.customer = "Atliq Exclusive"
group by month , year
order by year

