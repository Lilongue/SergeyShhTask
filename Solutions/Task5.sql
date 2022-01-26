WITH group_vacansies (id, res_count) as (
    SELECT v.vacancy_id,
           count(response_id) as res_count
    from responses r,
         vacancies v
    WHERE v.vacancy_id = r.vacancy_id
      AND (v.date - r.date) BETWEEN 0 AND 7
    GROUP BY v.vacancy_id
) SELECT vacancy_id, title
FROM vacancies, group_vacansies gv
WHERE vacancy_id = gv.id AND gv.res_count > 5


