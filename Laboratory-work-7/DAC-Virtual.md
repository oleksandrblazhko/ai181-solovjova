## Крок 1
#### Заповніть таблицю БД ще трьома рядками.
![image](https://user-images.githubusercontent.com/56130345/205630787-9507a8b0-9926-4790-9260-121858d060e8.png)

![image](https://user-images.githubusercontent.com/56130345/205630876-77eef33a-0afc-40e2-b8c5-22cddbe8d4ae.png)

## Крок 2
#### Створіть схему даних користувача та віртуальну таблицю у цій схемі з правилами вибіркового керування доступом для користувача так, щоб він міг побачити тільки один з рядків таблиці з урахуванням одного значення її останньої колонки.

![image](https://user-images.githubusercontent.com/56130345/205631300-d415278c-b065-477d-b157-d45605506d89.png)

GRANT SELECT ON university TO dianochka;
CREATE TABLE ROLE2UNIVERSITY (
ROLE_NAME VARCHAR(30),
YEAR INTEGER
);
GRANT SELECT ON ROLE2UNIVERSITY TO dianochka;
INSERT INTO ROLE2UNIVERSITY VALUES ('DIANOCHKA', 1980);
CREATE SCHEMA DIANOCHKA;
ALTER SCHEMA DIANOCHKA OWNER TO dianochka;

![image](https://user-images.githubusercontent.com/56130345/205631830-92d0f24e-4153-4e7d-a1a1-be84b4eb3392.png)

CREATE OR REPLACE VIEW DIANOCHKA.university AS
SELECT S.*
FROM PUBLIC.university S, ROLE2UNIVERSITY RLS

WHERE RLS.ROLE_NAME = UPPER(CURRENT_USER)
AND RLS.YEAR = S.year;
GRANT SELECT ON DIANOCHKA.university TO DIANOCHKA;
REVOKE SELECT ON PUBLIC.university FROM DIANOCHKA;

## Крок 3
#### Перевірте роботу механізму вибіркового керування, виконавши операції SELECT, INSERT, UPDATE, DELETE.

SELECT * FROM university;

![image](https://user-images.githubusercontent.com/56130345/205632590-ec75f1b1-eefd-40bc-8c86-1bb20d750bba.png)


INSERT into university values (5, 'Bomber', 42342);
![image](https://user-images.githubusercontent.com/56130345/205632619-5b079e42-ac2a-4435-9392-1991a4a0dfc7.png)


UPDATE university SET u_id = 0;
![image](https://user-images.githubusercontent.com/56130345/205632733-1d632845-20ec-484b-b032-eebdbc4749aa.png)

DELETE FROM university WHERE u_id = 2;
![image](https://user-images.githubusercontent.com/56130345/205632811-4688931e-42b0-46c8-92d6-e78005cdfe23.png)

REVOKE SELECT ON PUBLIC.university FROM DIANOCHKA;
