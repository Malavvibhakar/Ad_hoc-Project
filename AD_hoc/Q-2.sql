
-- What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields,
 -- unique_products_2020 ,unique_products_2021,percentage_chg

with  cte_20 as (select count(distinct(product_code)) as unique_products_2020
FROM fact_sales_monthly
where fiscal_year = 2020)
,cte_21 as (select count(distinct(product_code)) as unique_products_2021
FROM fact_sales_monthly
where fiscal_year = 2021)

select cte_20. * , cte_21. * ,
ROUND(( cte_21.unique_products_2021- cte_20.unique_products_2020) *100/ cte_20.unique_products_2020,2) as percentage_chg
from cte_20  join cte_21;




