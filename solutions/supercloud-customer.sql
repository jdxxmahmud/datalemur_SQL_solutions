# Problem Link: https://datalemur.com/questions/supercloud-customer

WITH cte1 AS
(
  SELECT
    cc.customer_id,
    cc.product_id,
    p.product_category
  FROM 
    customer_contracts cc
    LEFT JOIN
    products p
  ON
    cc.product_id = p.product_id
),
cte2 AS
(
  SELECT 
    customer_id, 
    count(DISTINCT product_category)
  FROM cte1
  GROUP BY 
    customer_id
  ORDER BY
    customer_id
)

SELECT 
  customer_id
FROM 
  cte2
WHERE
  count = (SELECT COUNT(DISTINCT product_category)
          FROM products)
