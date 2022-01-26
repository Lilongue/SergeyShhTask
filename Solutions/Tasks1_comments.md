# Задание 1

### _Спроектировать базу данных hh (основные таблицы: вакансии, резюме, отклики, специализации). По необходимым столбцам ориентироваться на сайт hh.ru_

## Решение

Это, конечно, малая часть информации, которая может там храниться, но я трактавал задание как направленное на практику по SQL, а не реальное проектирование базы

---
### **Таблица вакансии**

**имя таблицы:**    vacancies

|№ | поле | тип|
|:---|:---:|---:|
|1| vacancy_id |int|
|2| title |text|
|3| employer_id |int|
|4| area_id |int|
|5| specialization_id |int|
|6| compensation_from |int|
|7| compensation_to |int|
|8| date |date|
|9| state |int|
|10| description |text|

---
### **Таблица резюме**

**имя таблицы:**  CV

|№ | поле | тип|
|:---|:---:|---:|
|1| cv_id |int|
|2| name |text|
|3| second_name |text|
|4| last_name |text|
|5| specialization_id |int|
|6| age |int|
|7| phone |text|
|8| date |date|
|9| state |int|
|10| description |text|

---
### **Таблица отклики**

**имя таблицы:**  responses

|№ | поле | тип|
|:---|:---:|---:|
|1| response_id |int|
|2| vacancy_id |int|
|3| cv_id |int|
|4| date |date|
|5| state |int|
|6| description |int|
---

### **Таблица специализации**

**имя таблицы:**  specializations

|№ | поле | тип|
|:---|:---:|---:|
|1| specialization_id |int|
|2| title |text|
|3| description |text|
---
### **Таблица Работодателей**

**имя таблицы:**  employers

|№ | поле | тип|
|:---|:---:|---:|
|1| employer_id |int|
|2| title |text|
|3| description |text|
