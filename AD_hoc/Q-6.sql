
-- Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the
-- Indian market. The final output contains these fields, customer_code,customer,average_discount_percentag

select c.customer_code, c.customer, round(p.pre_invoice_discount_pct*100,2) AS average_discount_percentage
from fact_pre_invoice_deductions p
join dim_customer c on
p.customer_code = c.customer_code
where p.pre_invoice_discount_pct > (select avg(pre_invoice_discount_pct) from fact_pre_invoice_deductions)
and c.market = "India" and fiscal_year =2021
order by average_discount_percentage desc
limit 5;