-- import database.sql
source database.sql;

--Q1
select oisbn from OrderBook GROUP BY oisbn HAVING COUNT(*) > 2;

--Q2
select ocid from OrderBook WHERE qty > 4;select qty_in_stock from Book where qty_in_stock
    <any(select qty_in_stock from Book)

--Q3
select ocid from OrderBook GROUP BY ocid HAVING timestampdiff(year, max(orderdate), curdate()) < 7;

--Q4
select ocid from OrderBook WHERE oisbn = (select isbn from Book WHERE title = "Operating Systems");

--Q5
select cname from Customer WHERE cid IN 
  (select ocid from OrderBook WHERE oisbn IN (
    select isbn from Book WHERE title = "Operating Systems"
    ))
  AND cid IN
  (select ocid from OrderBook WHERE oisbn IN (
    select isbn from Book WHERE title = "Data Structures and Algorithms"));

--Q6
select ocid from OrderBook WHERE
  ocid NOT IN
    (select ocid from OrderBook WHERE 
      ocid IN(
          select ocid from OrderBook WHERE oisbn IN (
          select isbn from Book WHERE title = "Operating Systems"
        ))
        AND
        ocid IN(
        (select ocid from OrderBook WHERE oisbn IN (
          select isbn from Book WHERE title = "Data Structures and Algorithms"
    ))));

--Q7
select ocid from OrderBook WHERE
ocid IN
(
ocid NOT IN(
          select ocid from OrderBook WHERE oisbn IN (
          select isbn from Book WHERE title = "Operating Systems"
        ))
AND
ocid NOT IN(
          select ocid from OrderBook WHERE oisbn IN (
          select isbn from Book WHERE title = "Data Structures and Algorithms"
        ))
)
GROUP BY ocid;

--Q8
select ocid from OrderBook
WHERE ocid NOT IN
(ocid IN
  (
  ocid NOT IN(
            select ocid from OrderBook WHERE oisbn IN (
            select isbn from Book WHERE title = "Operating Systems"
          ))
  AND
  ocid NOT IN(
            select ocid from OrderBook WHERE oisbn IN (
            select isbn from Book WHERE title = "Data Structures and Algorithms"
          ))
  )
AND
ocid NOT IN
    (select ocid from OrderBook WHERE 
      ocid IN(
          select ocid from OrderBook WHERE oisbn IN (
          select isbn from Book WHERE title = "Operating Systems"
          )
        )
        AND
        ocid IN(
        select ocid from OrderBook WHERE oisbn IN (
          select isbn from Book WHERE title = "Data Structures and Algorithms"
        )
      )
  )
)
GROUP BY ocid;

--Q9
select cname from Customer WHERE cid IN(
  select ocid from OrderBook GROUP BY ocid HAVING SUM(qty) < 4
);

--Q10
select isbn, qty_in_stock from (
  select isbn, qty_in_stock from Book where qty_in_stock
  <any(select qty_in_stock from Book)
  ) as T1
   WHERE T1.qty_in_stock
    >=all(select qty_in_stock from Book where qty_in_stock
    <any(select qty_in_stock from Book)
);