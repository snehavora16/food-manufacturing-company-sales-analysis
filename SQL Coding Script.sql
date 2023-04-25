/*Which type of outlet makes the maximum sales*/
SELECT Outlet_Type, ROUND(SUM(sales)) as sales
FROM food_manufacturing_company
group by Outlet_Type;

/*Location wise sales*/
SELECT Outlet_Location_Type,ROUND(SUM(sales)) as sales
FROM food_manufacturing_company
group by Outlet_Location_Type ORDER BY 2 desc;

/*Highest selling item in each location*/
SELECT f1.Outlet_Location_Type,round(SUM(f1.sales))AS sales,
(SELECT f2.Item_Type 
FROM food_manufacturing_company f2
WHERE f2.Outlet_Location_Type = f1.Outlet_Location_Type
GROUP BY f2.Item_Type
order by COUNT(*)DESC
LIMIT 1) AS Item
FROM food_manufacturing_company AS f1
GROUP BY f1.Outlet_Location_Type order by 1;

/*Top 5 outlets vs their sales*/
SELECT Outlet_Identifier,round(sum(sales)) as sales,Outlet_Type
from food_manufacturing_company
group by Outlet_Identifier order by 2 desc
limit 5;

/*Which item packaging sells out the most*/
select f1.Item_Type,round(sum(f1.sales)) as sales,
(select f2.Item_Weight
from food_manufacturing_company f2
where f2.Item_Type=f1.Item_Type
group by f2.Item_Weight
order by count(*) desc
limit 1) as weight
from food_manufacturing_company f1
group by f1.Item_Type

/*The fat content demanded for each item in every outlet location*/
select Outlet_Location_Type, Item_Fat_Content, round(sum(sales)) as sales
from food_manufacturing_company
group by Outlet_Location_Type,Item_Fat_Content
order by Outlet_Location_Type

/*How does outlet size affect sale*/
select Outlet_Size,round(sum(sales)) as sales
from food_manufacturing_company
group by Outlet_Size
order by 2 desc

/*How does outlet location affect sale*/
select Outlet_Location_Type,round(sum(sales)) as sales
from food_manufacturing_company
group by Outlet_Location_Type
order by 2 desc