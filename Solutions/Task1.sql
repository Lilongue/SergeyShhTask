/*
 Это, конечно, малая часть информации, которая может реально храниться в базе,
 но я трактавал задание как направленное на практику по SQL,
 а не реальное проектирование базы.
 Не хватает многих таблиц (напр., persons, areas и т.д.)
 */

CREATE TABLE specialization
(
    specialization_id serial primary key ,
    title varchar(255) not null ,
    description text
);

CREATE TABLE employers
(
    employer_id serial primary key ,
    title varchar(255) not null ,
    description text ,
    area_id int not null
);

CREATE TABLE responses
(
    vacancy_id int  references vacancies(vacancy_id),
    cv_id int references cv(cv_id),
    date date not null ,
    state int not null ,
    description text
    PRIMARY KEY (vacancy_id, cv_id)
);

CREATE TABLE vacancies
(
    vacancy_id serial primary key ,
    title varchar(255) not null ,
    employer_id int not null references employers(employer_id),
    area_id int not null ,
    specialization_id int ,
    compensation_from int ,
    compensation_to int ,
    date date not null ,
    state int not null ,
    description text not null
);

CREATE TABLE cv
(
    cv_id serial primary key ,
    name varchar(255) not null ,
    second_name varchar(255) not null ,
    last_name varchar(255) not null ,
    specialization_id int ,
    age int not null ,
    phone varchar(255) ,
    date date not null ,
    state int not null ,
    description text
);
