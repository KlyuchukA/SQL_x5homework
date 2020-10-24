## Практика

Наша задача, сделать базу котов, которые живут в нашем доме.

Как должна выглядеть таблица?

- `id` записи
- кличка кота (на русском языке)
- дата рождения кота
- пол: мальчик / девочка
- фото: ссылка на фото в интернете
- краткое описание: цвет, характер, особенности
- телефон владельца

Далее мы должны запонить базу данных.
Допустим, что в нашем доме живут 10 разных котов.
Данные можете придумать любые.

### Задачи на создание таблицы и данных

1. Создать супер-пользователя пользователя `catperson`

createuser catperson -s
CREATE USER catperson -s;
select * from pg_shadow; 
\du - посмотреть всех созданных user

CREATE USER catperson SUPERUSER;


2. Создать базу данных `catproject` с правильными настройками
3. Сделать `catperson` владельцем базы `catproject`

CREATE DATABASE "catproject"
WITH OWNER "catperson"
ENCODING 'UTF8'
LC_COLLATE = 'en_US.UTF-8'
LC_CTYPE = 'en_US.UTF-8'
TEMPLATE template0;

Подключиться к БД: \c catproject
Просмотреть все бд: \list

4. Выбрать самые подходящие типы полей для хранения информации
5. Создать таблицу `"cats"`

CREATE TABLE "public"."cats" (
    "id" SERIAL,
    "name" TEXT NOT NULL,
    "birthday" DATE NOT NULL,
	"male" TEXT NOT NULL,
	"photo" TEXT NOT NULL,
	"description" TEXT NOT NULL,
	"phone" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

пРОСМОТРЕТЬ ТАБЛИЫ:
\dt или \d cats
6. Сделать `INSERT` сразу всех 10 котов в базу

INSERT INTO "public"."cats" (
   "name",
  "birthday",
  "male",
  "photo",
  "description",
  "phone"
)
VALUES
('Вася', '2000-01-08'::date, 'мальчик','https://github.com/KlyuchukA/newanna/blob/main/x5cat.jpeg','черный окрас, агрессивный', '89179667418'),
	('Сэм', '2001-02-08'::date, 'мальчик','https://github.com/KlyuchukA/newanna/blob/main/cat2.jpeg','голубой окрас, добрый', '89179667419'),
  ('Шеоргий', '2001-01-13'::date, 'мальчик','https://github.com/KlyuchukA/newanna/blob/main/alisecat.jpg','черный окрас, ласковый', '89279667418'),
  ('Баг', '2013-04-17'::date, 'мальчик','https://github.com/KlyuchukA/newanna/blob/main/cat4.png','палевый окрас, активный', '89179667418'),
  ('Фича', '2020-01-08'::date, 'мальчик','https://github.com/KlyuchukA/newanna/blob/main/cat7.jpeg','белый окрас, агрессивный', '89178967418'),
  ('Зося', '2019-04-09'::date, 'девочка','https://github.com/KlyuchukA/newanna/blob/main/zosy.jpeg','рыжий окрас, агрессивный', '891791027418'),
  ('Сторя', '2009-01-14'::date, 'девочка','https://github.com/KlyuchukA/newanna/blob/main/story.jpeg','кремовый окрас, агрессивный', '89178967418'),
  ('Васелиса', '2005-06-05'::date, 'девочка','https://github.com/KlyuchukA/newanna/blob/main/vasya.jpg','белый окрас, агрессивный', '89177987418'),
  ('Снежанна', '2004-07-18'::date, 'девочка','https://github.com/KlyuchukA/newanna/blob/main/sneg.png','соболиный окрас, агрессивный', '89177897418'),
  ('Леди', '2008-04-19'::date, 'девочка','https://github.com/KlyuchukA/newanna/blob/main/ledy.jpeg','персиковый окрас, агрессивный', '89179525418');
  


### Задачи на работу с данными

7. Выбрать всех котов-мальчиков из таблицы, затем выбрать всех кошек-девочек из таблицы
select *from cats where male = 'мальчик';
select *from cats where male = 'девочка';

8. Выбрать всех котов, у которых фото в формате `jpg` или `jpeg`
select count(*) from cats where photo like '%jpg%' or photo like '%jpeg%';
select count(*) from cats where photo like '%jp%';

9. Обновить данные для `id=4`, поставить другую дату рождения - там была ошибка
update cats set birthday = '2011-11-11' where id=4;
commit;

10. Удалить из базы нашего дома кота с номером `id=5` - он переехал в другой дом
delete from cats where id=5;

11. Добавить нового кота, который въезжает к нам в дом
INSERT INTO cats ("name","birthday","male","photo","description","phone") VALUES('Новый', '2020-01-08'::date, 'мальчик','https://github.com/KlyuchukA/newanna/blob/main/cat7.jpeg','белый окрас, агрессивный', '89178967418');

12. Добавить новую колонку в базу: "чип: номер (цифры + буквы), может не быть", 
коты в базе данных должны получить какое-то значение по-умолчанию

ALTER TABLE cats ADD chip TEXT NULL DEFAULT 'Неизвестно';


13. Обновить котов `id=3` и `id=2`, у них есть чипы - внесите их номера в таблицу
update cats set chip = '643093400076000' where id=3;
update cats set chip = '643093400076212' where id=2;
commit;

### Форма сдачи

Выам необходимо предоставить SQL файл с запросами `SELECT` вида:

```sql
-- Задача 1
CREATE ...

-- Задача 2
SELECT ...

-- ...
```


Загрузите решение в scm.x5.ru:

- В репозитории "postgresql" (созданном для выполнения ДЗ-1 по БД) создайте ветку "hw-2".

- В неё закомитьте файл hw2.sql с командами.

- Создайте Merge Request из ветки "hw-2" в ветку master. Укажите в "Labels" для Merge Request-а метку "DB-2".
    Указывать Assignee НЕ нужно.
    Сливать изменения или закрывать Merge Request НЕ нужно, оставьте Merge Request открытым.

