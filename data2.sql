CREATE TABLE "public"."exam_results" (
    "id" SERIAL,
    "fullname" TEXT NOT NULL,
    "result" INT4 NOT NULL,
    "birthday" DATE NOT NULL,
    "is_citizen" BOOLEAN NOT NULL,
    PRIMARY KEY ("id")
);

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


CREATE TABLE "public"."cats" (
    "id" SERIAL,
    "name" TEXT NOT NULL,
    "birthday" DATE NOT NULL,
	"male" TEXT NOT NULL,
	"photo" TEXT NOT NULL,
	"description" TEXT NOT NULL,
	"phone" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

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
  

