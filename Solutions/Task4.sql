with max_vacansies (max_month_vac, max_count_vac) as (
    SELECT (EXTRACT(MONTH FROM date)::text || '_' || EXTRACT(YEAR FROM date)::text) as max_month_vac,
        count(vacancy_id) as max_count_vac
    FROM vacancies
    GROUP BY max_month_vac
), max_cv (max_month_cv, max_count_cv) as (
    SELECT (EXTRACT(MONTH FROM date)::text || '_' || EXTRACT(YEAR FROM date)::text) as max_month_cv,
        count(cv_id) as max_count_cv
    FROM cv
    GROUP BY max_month_cv
)
SELECT max_month_vac, max_count_vac, max_month_cv, max_count_cv
FROM max_vacansies, max_cv WHERE max_count_vac = (SELECT max(max_count_vac) from  max_vacansies)
AND max_count_cv = (SELECT max(max_count_cv) from max_cv)
