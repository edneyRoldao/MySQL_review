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


select first_name, last_name, birth_date
	from students
	where day(birth_date) >= 2 AND (state = "LA" OR state = "SC");
    

# will retrieve students where the last name ends with letter o
select first_name, last_name
	from students
    where last_name like '%o';


# will retrieve students where the first name starts with letter M
select first_name, last_name
	from students
    where first_name like 'M%';


# We could mix like and underscore _ to find a value with specific number of letter 
select first_name, last_name
	from students
    where first_name like '____y';
    

# Let's find out the number of states where students live in
select count(distinct state) as 'States Number'
	from students;


select count(*)
	from students
    where gender = 'F';
    

# Let's use group by to show the number of students organized by gender
select gender, count(*)
	from students
    group by gender;


# Will retrieve the number of students grouped by birth month
select month(birth_date) as 'Month', count(*)
	from students
    group by Month
    order by Month;
    

# We are using group by that again, but now there is HAVING to apply a condition on group by
# Will show the amount of states grater than 1
select state, count(state) as 'Amount'
	from students
    group by state
    having Amount > 1;


# The Query below brings every test that was applied
select
	test_id as 'TEST'					,
    min(score) as 'MIN'					,
    max(score) as 'MAX'					,
    max(score) - min(score) as 'RANGE'	,
	sum(score) as 'TOTAL',
    avg(score) as 'AVERAGE'
    from scores
    group by test_id;
	

select * from absences;


select * from scores
	where student_id = 2;


insert into scores values(2, 1, 25);


delete from absences where student_id = 2;


select * from scores;


update scores 
	set score = 30
	where student_id = 1 and test_id = 1;


select last_name, birth_date
	from students
    where birth_date
    between '1980-1-1' and '2000-1-1';


select first_name, last_name
	from students
    where first_name in ('edney', 'giselle');


# Let's take a look queries using JOINS We are list tests that were applied in a specific date and futhermore it brings the score and the maximum score 
select student_id, date, score, maxscore
	from tests, scores
    where date = '2015-11-10'
    and tests.test_id = scores.test_id;
    

# This query has the same result above, however, we are using the table name plus column name to differenciates what table each column belongs.
select
	scores.student_id 	as 'ID STUDENT'		, 
    tests.date	 		as 'DATE'	,
    scores.score 		as 'SCORE'	,
    tests.maxscore		as 'MAX'
	from tests, scores
    where date = '2015-11-10'
    and tests.test_id = scores.test_id;


# Let'ss make a join using three tables
select
	concat(students.first_name, " ", students.last_name) as Name,
    tests.date, scores.score, tests.maxscore
    from tests, scores, students
    where date = '2015-11-10'
    and students.student_id = scores.student_id
    and scores.test_id = tests.test_id;

    
# Let's create a query that returns
select
    students.student_id as ID_STUDENT,
    concat(students.first_name, " ", students.last_name) as NAME,
    count(absences.date) as ABSENCES
    from students, absences
    where students.student_id = absences.student_id
    group by ID_STUDENT;


# The same query above with another way to make it
select
    students.student_id as ID_STUDENT,
    concat(students.first_name, " ", students.last_name) as NAME,
    count(absences.date) as ABSENCES
    from students left join absences 
    on students.student_id = absences.student_id
    group by ID_STUDENT;

# Here we have a challenge: We need to list the students that have more than one absence.
select
	concat(students.first_name, " ", students.last_name) as NAME,
    count(absences.student_id) as ABSENCES
    from students, absences
    where students.student_id = absences.student_id
    group by NAME
    having ABSENCES > 1;

# Now let's try to show the students that already made all tests, in other words, they don't have absences
select 
	concat(students.first_name, " ", students.last_name) as NAME,
	count(tests.test_id) as tests,
    avg(scores.score) as AVERAGE
    from students, scores, tests
    where students.student_id = scores.student_id and scores.test_id = tests.test_id
    group by NAME
    having tests = 10;
	















