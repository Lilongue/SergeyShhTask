with test_spec(id , title, descr) as (
    SELECT generate_series(1, 100) AS id, md5(random()::text) AS title, md5(random()::text) as descr
)
INSERT into specialization(title, description)
SELECT substr(title, 10), descr
FROM test_spec;

with test_employer(id, title, description, ar_id) as (
    SELECT generate_series(1, 100) AS id, md5(random()::text) AS title,
           md5(random()::text) AS description, (random()*20)::int AS ar_id
)
INSERT into employers(TITLE, DESCRIPTION, AREA_ID)
SELECT substr(title, 7), description, ar_id
FROM test_employer;

with test_vacancy(id, some_text, comp_from, date) as (
    SELECT generate_series(1, 10000) AS id, md5(random()::text) AS sum_text,
           10000+((random()*100000)::int) AS comp_from,
           current_date - (random()*1000)::int as date
)
INSERT into vacancies(title, employer_id, area_id, specialization_id, compensation_from, compensation_to, date, state, description)
SELECT substr(some_text, 7), 1 + (random()*99)::int, (random()*20)::int, (random()*100)::int ,
       comp_from, comp_from + 5000, date, 1, some_text
FROM test_vacancy;

with test_cv(id, some_text, age, date) as (
    SELECT generate_series(1, 100000) AS id, md5(random()::text) as some_text, 18 + (random()*60)::int as age,
           current_date - (random()*1000)::int as date
)
INSERT INTO cv(NAME, SECOND_NAME, LAST_NAME, SPECIALIZATION_ID, AGE, PHONE, DATE, STATE, DESCRIPTION)
SELECT substr(some_text, 5), substr(some_text, 7), text('Иванович'), (random()*100)::int ,
       age, substr(some_text, 9), date, 1, some_text
FROM test_cv;

with test_response(id, some_text, date) as (
    SELECT generate_series(1, 100000) AS id, md5(random()::text) as some_text,
           current_date - (random()*1000)::int as date
)
INSERT INTO responses(vacancy_id, cv_id, date, state, description)
SELECT (random()*10000)::int , (random()*50000)::int, date, 1, some_text
FROM test_response;
