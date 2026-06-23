use pizzadb;
select *from pizza_sales;
-- KPI'S
select sum(total_price) as total_revenue from pizza_sales;
select sum(total_price)/ count(distinct order_id) as Avg_order_value from pizza_sales;
select sum(quantity) as Total_pizza_ordered from pizza_sales;
select count(distinct order_id) as Total_order from pizza_sales;
select sum(quantity)/ count(distinct order_id) as Avg_pizza_per_order from pizza_sales;

-- CHARTS
select *from pizza_sales;
select dayname(str_to_date(order_date, '%d-%m-%y')) as order_day, count(distinct order_id) as Total_orders
from pizza_sales
group by dayname(str_to_date(order_date, '%d-%m-%y'));

select monthname(str_to_date(order_date, '%d-%m-%y')) as month_name, 
count(distinct order_id) as Total_orders
from pizza_sales
group by month_name;

select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_sales, 
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_size
order by PCT desc;

select *from pizza_sales;
select pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue
limit 5;

select pizza_name, sum(quantity) as Total_quantity from pizza_sales
group by pizza_name
order by total_quantity
limit 5;

select pizza_name, count(distinct order_id) as total_order from pizza_sales
group by pizza_name
order by total_order
limit 5;