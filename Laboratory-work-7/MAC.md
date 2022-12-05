## Крок 1
#### Створіть у БД структури даних, необхідні для роботи повноважного керування доступом.

![image](https://user-images.githubusercontent.com/56130345/205634232-b87ad3dd-af25-474a-ae4f-5264d53e7bc0.png)

DROP TABLE IF EXISTS Access_Levels CASCADE;
CREATE TABLE Access_Levels (
access_level_id INTEGER PRIMARY KEY,
access_level VARCHAR UNIQUE
);
INSERT INTO Access_Levels VALUES (1, 'public');
INSERT INTO Access_Levels VALUES (2, 'private');
INSERT INTO Access_Levels VALUES (3, 'secret');
DROP TABLE IF EXISTS Role_Access_Level CASCADE;
CREATE TABLE Role_Access_Level (
role_name VARCHAR PRIMARY KEY,
access_level INTEGER REFERENCES
Access_Levels (access_level_id)
);
REVOKE ALL
ON Role_Access_Level
FROM GROUP dianochka;
GRANT SELECT
ON Role_Access_Level
TO GROUP dianochka;

## Крок 2
#### Визначте для кожного рядка таблиці мітки конфіденційності (для кожного рядка свою мітку).
UPDATE PUBLIC.university
SET spot_conf = 3;

## Крок 3
#### Визначте для користувача його рівень доступу

![image](https://user-images.githubusercontent.com/56130345/205635450-ef5e80e5-6a0a-44f0-b0a2-4ad9a89a42c7.png)

## Крок 4
#### Створіть нову схему даних.
DROP SCHEMA IF EXISTS dianochka CASCADE;
CREATE SCHEMA dianochka;

![image](https://user-images.githubusercontent.com/56130345/205636101-3c862ee1-94f4-497e-b401-4def448836b4.png)

ALTER SCHEMA dianochka OWNER TO dianochka;

![image](https://user-images.githubusercontent.com/56130345/205636298-38d1fed6-2d69-4867-b97a-bcc9b26137ea.png)

## Крок 5
#### Створіть віртуальну таблицю, назва якої співпадає з назвою реальної таблиці та яка забезпечує SELECT-правила повноважного керування доступом для користувача.

![image](https://user-images.githubusercontent.com/56130345/205636957-1017d3dc-ca1c-4a53-9d3b-4d165a0e2ccd.png)

DROP VIEW IF EXISTS dianochka.university;
CREATE VIEW dianochka.university AS
SELECT
u_id,
name,
year
FROM PUBLIC.university s, Role_Access_Level l
WHERE
l.role_name = CURRENT_USER and
l.access_level >= s.spot_conf;

## Крок 6
#### Створіть INSERT/UPDATE/DELETE-правила повноважного керування доступом для користувача.

![image](https://user-images.githubusercontent.com/56130345/205637452-8aae0d93-467f-4474-a7a6-505ac2d1b237.png)

REVOKE ALL ON public.university FROM dianochka;
GRANT SELECT 
ON dianochka.university 
TO dianochka;

![image](https://user-images.githubusercontent.com/56130345/205637840-b3a50770-5a5f-44b6-a068-e261ec838fbd.png)

SELECT * FROM public.university;
SELECT * FROM dianochka.university;

![image](https://user-images.githubusercontent.com/56130345/205638018-9950afb3-518e-4793-87ad-a048897a37e9.png)

UPDATE public.university 
SET spot_conf = 2 
WHERE u_id = 2;

![image](https://user-images.githubusercontent.com/56130345/205638152-76f4ad53-58c3-4027-a6f6-ed12c3ff0d7f.png)

select * from university;

GRANT DELETE 
ON dianochka.university 
TO dianochka;

![image](https://user-images.githubusercontent.com/56130345/205638327-c4c403ce-348c-4eff-908e-73cb3ae4db34.png)

DELETE from university;

![image](https://user-images.githubusercontent.com/56130345/205638455-4795d2b2-5004-4e33-b2d8-0db8a72c75b1.png)

CREATE RULE university_delete 
AS ON DELETE TO dianochka.university
DO INSTEAD
DELETE FROM public.university 
WHERE u_id = OLD.u_id;

![image](https://user-images.githubusercontent.com/56130345/205638768-a4dfa6b3-2a25-4909-bb51-c1993235b6bf.png)

![image](https://user-images.githubusercontent.com/56130345/205638842-09c7e0f2-64ab-46eb-96e0-49024d9add27.png)

Створення правил для INSERT та UPDATE:
![image](https://user-images.githubusercontent.com/56130345/205645528-6274d614-55dd-4d2a-8943-036655092ec8.png)

## Крок 7 
#### Перевірте роботу механізму повноважного керування, виконавши операції SELECT, INSERT, UPDATE, DELETE
![image](https://user-images.githubusercontent.com/56130345/205646199-aa4797e0-2aed-44f8-ad39-30dbe0729d17.png)



