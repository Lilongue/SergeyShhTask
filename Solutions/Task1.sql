/*
 Это, конечно, малая часть информации, которая может реально храниться в базе,
 но я трактавал задание как направленное на практику по SQL,
 а не реальное проектирование базы.
 Не хватает многих таблиц (напр., persons, areas и т.д.)
 */

CREATE TABLE specialization
(
    specialization_id serial primary key ,
    title text not null ,
    description text
);

CREATE TABLE employers
(
    employer_id serial primary key ,
    title text not null ,
    description text ,
    area_id int not null
);

CREATE TABLE responses
(
    response_id serial primary key ,
    vacancy_id int not null ,
    cv_id int ,
    date date not null ,
    state int not null ,
    description text
);

CREATE TABLE vacancies
(
    vacancy_id serial primary key ,
    title text not null ,
    employer_id int not null ,
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
    name text not null ,
    second_name text not null ,
    last_name text not null ,
    specialization_id int ,
    age int not null ,
    phone text ,
    date date not null ,
    state int not null ,
    description text
);