
-- Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?
-- The final output contains these fields,channel , gross_sales_mln , percentage

With ct as (select c.channel , round(sum(s.sold_quantity*p.gross_price)/1000000, 3) AS gross_sales_mln
 from dim_customer c
 join fact_sales_monthly s
 on c.customer_code = s.customer_code
 join fact_gross_price p
 on p.product_code = s.product_code
 and p.fiscal_year = s.fiscal_year
where s.fiscal_year = "2021"
group  by c.channel
ORDER BY gross_sales_mln DESC)

,ct1 as(select sum(gross_sales_mln) as total_gross_sales_mln from ct)

select ct.*,
round((gross_sales_mln*100/total_gross_sales_mln),2) as percentage
from ct join 
ct1;





