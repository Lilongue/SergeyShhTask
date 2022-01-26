/*
 С индексами все - наугад, конечно,
 но можно предположить, что нужны хешированные индексы на id, поскольку сервисы,
 скорее всего, часто ищут инфу по id
 */

CREATE INDEX specialization_id_index ON cv USING HASH (specialization_id);
-- Или тут
CREATE INDEX vacancy_id_index ON responses USING HASH (vacancy_id);

/*
 Индексы в виде дерева, скорее всего будут работать на частых числовых запросах
 Например на З/П
 */
 CREATE INDEX compensation_index ON vacancies (compensation_from, compensation_to);
-- предполагаю, что, в большинстве случаев вытягиваются вместе
-- Может имеет смысл еще повесить индекс отдельно только на compensation_from
