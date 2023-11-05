select * from order_lines

--Total Order Lines
select count(order_id) as Total_Order_Lines
from order_lines
-->57096

--Line Fill Rate --Number of order lines shipped In Full Quantity / Total Order Lines
select round(cast(
		(select count([In Full]) from order_lines where [In Full] = 1) as decimal(10,4))/
		(select count(order_id) from order_lines)
		*100,2) as LIFR_perc;
-->65.96

--Volume Fill Rate --Total Quantity shipped / Total Quantity Ordered
select round(sum(delivery_qty)/sum(order_qty) *100,2) as VOFR_perc
from order_lines
-->96.59

--Total Orders
select count(order_id) as Total_Orders
from orders_aggregate
-->31729

--On Time Delivery %
select round(cast(
		(select count(on_time) from orders_aggregate where on_time = 1) as decimal(10,4))/
		(select count(order_id) from orders_aggregate) 
		*100,2) as OT_perc;
-->59.03

--In Full Delivery %
select round(cast(
		(select count(in_full) from orders_aggregate where in_full = 1) as decimal(10,4))/
		(select count(order_id) from orders_aggregate) 
		*100,2) as IF_perc;
-->52.78

--On Time In Full %
select round(cast(
		(select count(otif) from orders_aggregate where otif = 1) as decimal(10,4))/
		(select count(order_id) from orders_aggregate) 
		*100,2) as OTIF_perc;
-->29.02

--On Time Target
select round(avg([ontime_target%]),2) as Ontime_Target
from targets_orders
-->86.09

--In Full Target
select round(avg([infull_target%]),2) as Infull_Target
from targets_orders
-->76.51

--On Time In Full Target
select round(avg([otif_target%]),2) as OTIF_Target
from targets_orders
-->65.91

--- Total orders Not delivered OTIF
select count(order_id) as Total_Not_OTIF 
from orders_aggregate
where in_full = 0 and on_time = 0
-->5460

----Not OTIF by City
select c.city, count(OG.order_id) as Not_OTIF_by_City
from orders_aggregate as OG 
left join customers c 
on  OG.customer_id = c.customer_id
where OG.in_full = 0 and OG.on_time = 0
group by c.city

/*Vadodara	2001
Ahmedabad	1877
Surat	1582
*/

--Not OTIF by Month
select datename(month,d.mmm_yy) as Month, count(OG.order_id) as Not_OTIF_by_Month
from orders_aggregate as OG 
left join date d
on  OG.order_placement_date = d.date
where OG.in_full = 0 and OG.on_time = 0
group by d.mmm_yy
order by month(d.mmm_yy)

/*March	917
April	882
May	919
June	947
July	933
August	862
*/

--Difference in Ordered quantity and Delivered Quantity using CTE
with diff_in_qty as (select order_qty, delivery_qty, order_qty-delivery_qty as diff
from order_lines)
select * from diff_in_qty
where diff !=0

-- Difference in Ordered quantity and Delivered Quantity by Month
select datename(month,d.mmm_yy) as Month,
	   sum(OL.order_qty) as Order_Qty,
	   sum(OL.delivery_qty) as Delivery_Qty,
	   sum(OL.order_qty-OL.delivery_qty) as Difference
from order_lines OL
left join date d
on  OL.order_placement_date = d.date
group by d.mmm_yy
order by month(d.mmm_yy)

/*March	2289498	2211756	77742
April	2200996	2125780	75216
May	2298831	2220444	78387
June	2196371	2119661	76710
July	2279870	2202316	77554
August	2161370	2089200	72170
*/

