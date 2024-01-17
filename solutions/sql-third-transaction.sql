WITH tab AS
  (SELECT *,
          RANK() OVER(
                   PARTITION BY user_id 
                   ORDER BY transaction_date
                     ) AS rankUser
  FROM transactions
  WHERE EXTRACT(YEAR from transaction_date) = 2022)

SELECT 
  user_id, 
  spend, 
  transaction_date
FROM tab
WHERE rankUser = 3
