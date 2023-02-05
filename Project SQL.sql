--select payment transactions geater than $5 and order by staff_id
select* from payment
where amount>5
order by staff_id;

--count of transactions greater than $5
select count(*) from payment
where amount>5;

--count of actors having firstname starting with letter "P"
select count(*) from actor
where  first_name like  'P%';

--count of unique districts customers are from
select count( distinct ( district)) from address;

--retriving names from the previous list
select  distinct ( district) from address;

---Count of films having rate of 'R' and a replacement cost between 5 and 15
select count (*) from film
where rating = 'R'and replacement_cost between 5 and 15;

-- count of films having truman in their titles
select * from film
where title ilike '%truman%';

---staff who gets bonus with highest number of payments
select staff_id, count(amount) from payment
group by staff_id;

---checking average replacement cost for  movie rating
select  rating, round(avg( replacement_cost),2)  from film
group by rating;

---Finding customer_id of top 5 spending customer
select customer_id, sum(amount) from payment
group by customer_id
order by sum(amount) desc
limit 5;
--Assigning Platinum status to customers that made transactions more than 40
select customer_id, count( amount) from payment
group by customer_id
having count( amount)>=40;
---finding customer who spent more than 100$ with staff_id 2
select  customer_id, sum(amount) from payment
where staff_id=2
group by customer_id
having sum(amount)>100;
--count of films begin with letter J
select title from film
where title like 'J%';
---Finiding customer with highest customer_id and has a name starting with E and address id lower than 500
select customer_id, first_name, address_id from customer
where first_name like 'E%' and address_id<500
order by customer_id desc;
---Finding email id's of the customers living in california
select customer.email from customer
inner join address
on customer. address_id = address. address_id
where district like 'California';

--finding list of all movies acted by actor 'Nick Wahlberg'
select title, first_name, last_name  from film
inner join film_actor
on film.film_id = film_actor.film_id
inner join actor
on film_actor.actor_id = actor.actor_id
where first_name like 'Nick' and last_name like 'Wahlberg';


---Finding which months the payment occur
select distinct(To_Char( payment_date,'Month')) from payment;

--Finding how many payments happened in week of Monday( assuming as per doc monday counted as 1st day of week)
Select count(*) from payment
where extract(dow from payment_date)= 1
