SELECT v.vacancy_id, count(response_id)
from responses r,
     vacancies v
WHERE v.vacancy_id = r.vacancy_id
    AND (v.date - r.date) BETWEEN 0 AND 7
GROUP BY v.vacancy_id
HAVING count(response_id) > 5
