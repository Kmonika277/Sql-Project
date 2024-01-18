create eda_supermarket dataset

--1.Display all the dataset

  SELECT * FROM [dbo].[supermarket]

--2. Display the random 5 rows of dataset 

   SELECT * FROM [dbo].[supermarket]
   order by rand();
 
 --3.Display count values for a column in the dataset.
 
  SELECT count('gross_income') as total_count
  FROM [dbo].[supermarket] 

 
-- 4. Find the number of missing values.

  SELECT COUNT(*) FROM [dbo].[supermarket] 
  WHERE Branch is null;

 -- 5. Count the number of occurrences of each city.

  SELECT City, COUNT(City) as Total 
  FROM [dbo].[supermarket] 
  GROUP BY City;

 -- 6. Find the most frequently used payment method.

  SELECT Payment,COUNT(*) as Total_Count
  FROM [dbo].[supermarket] 
  GROUP BY Payment
  ORDER BY COUNT(*) DESC;


-- 7. Does The Cost of Goods Sold Affect The Ratings That The Customers Provide? 

  SELECT Invoice_ID,Rating,cogs
  FROM [dbo].[supermarket] 

-- 8. Find the most profitable branch as per gross income.

  SELECT Branch,round(sum('gross_income'),2) as sum_gross_income 
  FROM [dbo].[supermarket] 
  GROUP BY Branch
  order by sum_gross_income desc ;

  -- 9. Which gender spends more in supermarket?
  
  SELECT Gender,count('gross_income') as total_Spend
  FROM [dbo].[supermarket] 
  group by Gender;

  -- 10.  Find the most used payment method city-wise.
  SELECT * FROM [dbo].[supermarket]

   
   SELECT City,
     sum(case when Payment='Cash' then 1 else 0 end) as 'Cash',
     sum(case when Payment='Ewallet' then 1 else 0 end) as 'Ewallet',
     sum(case when Payment='Credit card' then 1 else 0 end) as 'Credit card'
   from [dbo].[supermarket]  
   group by City;