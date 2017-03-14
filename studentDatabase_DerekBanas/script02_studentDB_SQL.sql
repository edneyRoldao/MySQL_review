select first_name, last_name
	from students
    where state = "SP";

# We could use >, <, >=, <=, !=, =
select first_name, last_name, birth_date
	from students
    where year(birth_date) >= 1980;


# We could use (OR, ||), (AND, &&), (NOT, !)
select first_name, last_name, birth_date
	from students
	where month(birth_date) = 2 or state = "LA";


select first_name, last_name, birth_date
	from students
	where day(birth_date) >= 2 AND (state = "LA" OR state = "SC");


select first_name, last_name
	from students
    where last_name is not null;

    
select first_name, last_name
	from students
    where last_name is null;


select first_name, last_name
	from students
    order by last_name;

    
select first_name, last_name
	from students
    order by last_name desc;

    
select first_name, last_name
	from students
    limit 5;

    
select first_name, last_name
	from students
    limit 5, 10;

    
select concat(first_name, " ", last_name) as 'NAME',
	   concat(city, " ", state) as 'HOME'
   from students;
