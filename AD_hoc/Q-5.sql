
-- Get the products that have the highest and lowest manufacturing costs. 
-- The final output should contain these fields, product_code,product,manufacturing_cost

select m.product_code,
p.product,
round(m. manufacturing_cost,2) as manufacturing_cost
from fact_manufacturing_cost m
join dim_product p
on  m.product_code = p.product_code
where m.manufacturing_cost =  (select max(m.manufacturing_cost) FROM fact_manufacturing_cost m)
union all
select m.product_code, p.product,
round(m. manufacturing_cost ,2)
from fact_manufacturing_cost m
join dim_product p
on  m.product_code = p.product_code
where m.manufacturing_cost =  (select min(m.manufacturing_cost) FROM fact_manufacturing_cost m);

