SELECT EXTRACT(MONTH FROM date) as month,
    count(vacancy_id) as max_count
FROM vacancies
GROUP BY month
ORDER BY max_count; -- Проверочный запрос
/* С таким выводом
2,551
4,611
3,629
5,881
1,893
8,899
10,900
6,901
12,902
11,931
9,945
7,957
 */

SELECT EXTRACT(MONTH FROM date) as month,
    count(cv_id) as max_count
FROM cv
GROUP BY month
ORDER BY max_count; -- Проверочный запрос
/* С таким выводом
2,5674
4,6001
3,6237
6,8890
1,8919
9,8943
11,9076
5,9139
7,9193
10,9247
12,9294
8,9387
 */

with max_vacansies (max_month_vac, max_count_vac) as (
    SELECT EXTRACT(MONTH FROM date) as max_month_vac,
        count(vacancy_id) as max_count_vac
    FROM vacancies
    GROUP BY max_month_vac
), max_cv (max_month_cv, max_count_cv) as (
    SELECT EXTRACT(MONTH FROM date) as max_month_cv,
        count(cv_id) as max_count_cv
    FROM cv
    GROUP BY max_month_cv
)
SELECT max_month_vac, max_count_vac, max_month_cv, max_count_cv
FROM max_vacansies, max_cv WHERE max_count_vac = (SELECT max(max_count_vac) from  max_vacansies)
AND max_count_cv = (SELECT max(max_count_cv) from max_cv)






