-- Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? 
-- The final output contains these fields. division,product_code

with cte as (select p.division ,p.product,p.product_code,sum(s.sold_quantity) total_sold_qty
from dim_product p
join fact_sales_monthly s
on p.product_code = s.product_code
where fiscal_year = "2021"
group by p.product_code)

select * from(
select cte.*,
dense_rank() over(partition by division order by total_sold_qty desc) as drnk
from cte) x
where  x.drnk <= 3 ; 




