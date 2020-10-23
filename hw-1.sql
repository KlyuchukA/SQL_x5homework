```sql
-- Запрос 1
select count(*) from exam_results;

-- Запрос 2
select avg(result) as Average_Price from exam_results;

-- Запрос 3
select * from exam_results where result = (SELECT MAX(result) FROM exam_results) or result =(SELECT MAX(result) FROM exam_results);

-- Запрос 4
select avg(result) as is_citizens from exam_results where is_citizen = true;
select avg(result) as is_not_citizens from exam_results where is_citizen = false;

-- Запрос 5
select birthday from exam_results GROUP by birthday = (SELECT EXTRACT(YEAR FROM t.birthday) as year FROM exam_results t);

-- Запрос 6
select * from exam_results where fullname ~ 'Олег *' or length(fullname)>20 ORDER BY birthday DESC;

-- Запрос 7
select *from exam_results where result >(SELECT AVG(result) as avg FROM exam_results);

-- Запрос 8
select *from exam_results ORDER BY result DESC limit 3;