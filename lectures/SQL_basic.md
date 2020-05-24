# SQL
## SELECT
```
SELECT
  one or more columns (or all columns with *)
FROM
  one (or more tables, joined with JOIN)
WHERE
  one (or more conditions, joined with AND/OR);
```
例子：
```
SELECT
  *
FROM
  users
WHERE
  name = 'Ned';

SELECT
  account_number, account_type
FROM
  accounts
WHERE
  (customer_id = 5 AND account_type = 'checking');
```
## INSERT
```
INSERT INTO
  table name (column names)
VALUES
  (values);
  ```
例子：
```
INSERT INTO
  users (name, age, height_in_inches)
VALUES
  ('Santa Claus', 876, 34);

INSERT INTO
  accounts (account_number, customer_id, account_type)
VALUES
  (12345, 76, 'savings');
```

## UPDATE
```
UPDATE
  table_name
SET
  col_name1 = value1,
  col_name2 = value2
WHERE
  conditions
```
例子：
```
UPDATE
  users
SET
  name = 'Eddard Stark', house = 'Winterfell'
WHERE
  name = 'Ned Stark';

UPDATE
  accounts
SET
  balance = 30
WHERE
  id = 6;
```
## DELETE
```
DELETE FROM
  table_name
WHERE
  conditions
```
例子：
```
DELETE FROM
  users
WHERE
  (name = 'Eddard Stark' AND house = 'Winterfell');

DELETE FROM
  accounts
WHERE
  customer_id = 666;
```
## Join
 FULL OUTER JOIN   
 INNER JOIN    
 LEFT JOIN /RIGHT JOIN   如果只想要A表里有，但是B里没有的： 
 ```
 SELECT * FROM TableA
LEFT OUTER JOIN TableB
ON TableA.name = TableB.name
WHERE TableB.id IS null

id  name       id     name

2   Monkey     null   null

4   Spaghetti  null   null
```
CROSS JOIN   
SELF JOIN 用两个暂时的名代替然后自己join自己。两个相同副本之间执行的联接  
## CASE
有点像if/else的语句。
```
CASE
WHEN value_1 THEN
	result_1
WHEN value_2 THEN
	result_2 
[WHEN ...]
ELSE
	result_n
END;
```
## COALESCE
返回参数里第一个非NULL的值。（从左至右）
```
INSERT INTO items (product, price, discount)
VALUES
	('A', 1000 ,10),
	('B', 1500 ,20),
	('C', 800 ,5),
	('D', 500, NULL);

SELECT
	product,
	(price - COALESCE(discount,0)) AS net_price
FROM
	items;
    ##也可以用CASE来写：

SELECT
	product,
	(
		price - CASE
		WHEN discount IS NULL THEN
			0
		ELSE
			discount
		END
	) AS net_price
FROM
	items;
```
## 建立数据库 DB
```
psql CREATE DATABASE my_first_db;
```
## 建立SQL file
```
~$ touch my_tables.sql
~$ code my_tables.sql
```
## SQL写的时候Query顺序
```
SELECT DISTINCT column, AGG_FUNC(column_or_expression), …
FROM mytable
    JOIN another_table
      ON mytable.column = another_table.column
    WHERE constraint_expression
    GROUP BY column
    HAVING constraint_expression
    ORDER BY column ASC/DESC
    LIMIT count OFFSET COUNT;
```
1. 先FROM JOINs （先确定什么表）
2. WHERE （确定条件）
3. GROUP BY （Additional）
4. HAVING （Additional）
5. SELECT （先条件，再选取）
6. DISTINCT （去重）
7. ORDER BY （排序放后面，因为数据都拿到后才能排序）
8. LIMIT / OFFSET (最后摘取特定条件)
