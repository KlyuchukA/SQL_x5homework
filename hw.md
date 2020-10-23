## Практика

Недавно в компании была проведена важная аттестация. Вам прислали результаты.
Теперь - ваша задача проаналировать их.

### Входные данные

Вам дана база данных, которая лежит в файле `data.sql`
Вам необходимо выполнить скрипт через `psql -f`.

Мы будем работать с таблицей `"exam_results"`.
В ней есть поля:
- `"fullname"` – полное имя человека
- `"result"` – результат аттестации в 100 бальной системе
- `"birthday"` – дата рождения человека
- `"is_citizen"` – булевый флаг, является ли человек гражданином РФ


1. Установить на linux psql командой: sudo apt install postgresql postgresql-contrib
2. обновить командой: sudo apt update, проверить утсановку командой psql
3. sudo -i -u postgres - залошиниться в постгрес
4. Создать папку в корневой: home/klyuchuk/sql
5. Создать в ней файлик data.sql и добавить в него данные по созданию таблицы из скрипта
6. Зайти в постгрес командой psql
Проверить что таблица создана \dt
8. Посмотрим поля таблицы: \d exam_results


### Подзадачи

1. Вывести общее количество результатов
select count(*) from exam_results;

2. Найти средний показатель финального результата для всех участников
select avg(result) as Average_Price from exam_results;
select avg(result) from exam_results;

3. Найти минимальный и максимальный показатель. Вывести всю информацию о участниках, которые набрали соответсвующие максимальный или минимальный балл
SELECT MIN(result), MAX(result) FROM exam_results;

select * from exam_results where result = (SELECT MIN(result) FROM exam_results);
select * from exam_results where result = (SELECT MAX(result) FROM exam_results);

select * from exam_results where result = (SELECT MAX(result) FROM exam_results) or result =(SELECT MAX(result) FROM exam_results);

4. Найти средний показатель финального результата для граждан РФ и для неграждан. Должно получиться: is_citizen, среднее
select avg(result) as is_citizens from exam_results where is_citizen = true;

для неграждан:
select avg(result) as is_not_citizens from exam_results where is_citizen = false;

select * from exam_results;

5. Найти минимальный, средний и максимальный показатель для каждого года рождения.
 В итоге должно получиться: год рождения, минимальный, средний, масимальный
 
select birthday from exam_results GROUP by birthday = (SELECT EXTRACT(YEAR FROM t.birthday) as year FROM exam_results t);

6. Найти результаты для всех людей, которых зовут Олег или их полное имя длиннее 20 символов, отсортировав по возврасту: самые молодые вверху
select * from exam_results where fullname ~ 'Олег *' or length(fullname)>20 ORDER BY birthday DESC;

7. Показать полную информацию о людях, чей результат выше среднего
SELECT AVG(result) as avg FROM exam_results;
select *from exam_results where result >(SELECT AVG(result) as avg FROM exam_results);

8. Показать полную информацию о 3 людях с высшими результатами
select *from exam_results ORDER BY result DESC limit 3;

### Форма сдачи

Вы должны предоставить SQL файл с запросами `SELECT` вида:

```sql
-- Запрос 1
SELECT ...

-- Запрос 2
SELECT ...

-- ...
```

Загрузите решение в scm.x5.ru:

- Создайте репозиторий "postgresql" в персональном пространстве в scm.x5.ru. При создании поставьте галку "Initialize repository with a README" (чтобы создалась ветка master с файлом README.md).

- Создайте ветку "hw-1". В неё закомитьте файл hw1.sql с командами.

- Создайте Merge Request из ветки "hw-1" в ветку master. Укажите в "Labels"для Merge Request-а метку "DB-1". Указывать Assignee НЕ нужно.

