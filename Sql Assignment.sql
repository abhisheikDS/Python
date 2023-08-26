#1.To list all the candidates who posses all the skills
#creating table and loading data into the table

create database student_db;

create table candidates(id int, technology varchar(30));

insert into candidates values
(1,'Data Science'),
(2,'Tabulae'),
(1,'Python'),
(1,'Sql'),
(1,'R'),
(1,'Tabulae'),
(2,'ML');

select id from candidates
where technology in ('Data Science', 'Tabulae', 'Python', 'Sql')
group by id
having count(distinct technology) = 4;

------------------------------------------------------------------------------------

#2. Query to return ids of product info that has 0 likes
#creating product info table and loading the data into table

create table product_info(product_id int,product_name varchar(30));
insert into product_info(product_id, product_name)
values(1001,'Blog'),
      (1002,'Youtube'),
      (1003,'Education');

#creating product_info_likes table and loading the data into table
create table product_info_likes(user_id int,product_id int,liked_date date);
insert into product_info_likes(user_id, product_id, liked_date)
values(1,1001,'2023-08-19'),
      (2,1003,'2023-08-18');

#Retrieving the data from the table  
SELECT *
FROM product_info
WHERE product_id NOT IN
    (SELECT DISTINCT product_id
     FROM product_info_likes);
     
SELECT pi.product_id
FROM product_info pi
LEFT JOIN product_info_likes pil ON pi.product_id = pil.product_id
WHERE pil.product_id IS NULL;

