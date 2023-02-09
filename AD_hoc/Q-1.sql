
-- Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region. 
select DISTINCT(market) 
from dim_customer
where region = "APAC"
and Customer = "Atliq Exclusive";