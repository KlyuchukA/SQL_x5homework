```sql
-- Задача 1
CREATE USER catperson SUPERUSER;

-- Задача 2 -3
CREATE DATABASE "catproject"
WITH OWNER "catperson"
ENCODING 'UTF8'
LC_COLLATE = 'en_US.UTF-8'
LC_CTYPE = 'en_US.UTF-8'
TEMPLATE template0;

-- Задача 4 - 5
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

-- Задача 6
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

-- Задача 7
select *from cats where male = 'мальчик';
select *from cats where male = 'девочка';

-- Задача 8
select count(*) from cats where photo like '%jp%';

-- Задача 9
update cats set birthday = '2011-11-11' where id=4;
commit;

-- Задача 10
delete from cats where id=5;

-- Задача 11
INSERT INTO cats ("name","birthday","male","photo","description","phone") VALUES('Новый', '2020-01-08'::date, 'мальчик','https://github.com/KlyuchukA/newanna/blob/main/cat7.jpeg','белый окрас, агрессивный', '89178967418');

-- Задача 12
ALTER TABLE cats ADD chip TEXT NULL DEFAULT 'Неизвестно';

-- Задача 13
update cats set chip = '643093400076000' where id=3;
update cats set chip = '643093400076212' where id=2;
commit;



