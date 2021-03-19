/*
Write an SQL query to get a list of all buildings with the number of open requests (status='open')
In order to asnwer this question we need to follow the follwing steps:
1. From Requests table select all the apartments where Status is open.
2. From the result of query (1) we need to get the apartment IDs. It can be used to join with Apartments table to obtain the BuildingID
3. We need to join the output of query (2) and Apartments table. Then group by Building ID to get unique rows per Building. At the same time we need to aggregate the rows by counting the number of apartments in each building
Combining the above we get:
*/
select BuildingID, count(a.AptID)
from Requests r
inner join Apartments a
on r.AptID = a.AptID
where r.Status = 'Open'
group by BuildingID;

/*
Select an SQL query to get a list of tenants who are renting more than one apartment.
In order to asnwer this question we need to remember:
1. When selecting data from a table, table must be specified with From statement -> Option 1 is wrong
2. Having statement goes after grouping -> Option 2 is wrong.
3. Alias created on Select step can't be used before grouping. -> Option 4 is wrong
4. Group by statement goes after Where statement -> Options 5, 6 is wrong

Finally, we have only 1 option left. This query follows all the rules and executes correct statement. Hence, it is the correct answer.
*/
Select tenantid, count(aptid) as number
From apttenants
Group by tenantid
Having number>1