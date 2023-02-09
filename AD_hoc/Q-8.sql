--  In which quarter of 2020, got the maximum total_sold_quantity? 
-- The final output contains these fields sorted by the total_sold_quantity, Quarter , total_sold_quantity

select sum(sold_quantity) as Total_sold_quantity,
case when month(date) in (09,10,11) THEN  "Q1" 
when month(date) in (12,01,02)  THEN  "Q2" 
when month(date) in (03,04,05)  THEN  "Q3" 
when month(date) in (06,07,08)  THEN  "Q4" 
END as Quarter
from fact_sales_monthly
Where fiscal_year = "2020"
group by Quarter
order by  Total_sold_quantity desc;





