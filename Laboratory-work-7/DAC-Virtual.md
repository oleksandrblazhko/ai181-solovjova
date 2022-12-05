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

