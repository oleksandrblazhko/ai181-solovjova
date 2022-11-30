## Крок 1
#### Встановіть СКБД PostgreSQL
Оскільки PostgreSQL вже була встановлена, перевіримо її наявність та версію командою psql --version. Бачимо, що встановлена версія PostgreSQL 14.5.

![image](https://user-images.githubusercontent.com/56130345/204784557-aae4fe00-4895-4ad4-bc97-0019112932b5.png)

## Крок 2
#### Створіть термінальну консоль psql через утиліту командного рядка вашої ОС та встановіть з’єднання з БД postgres від імені користувача-адміністратора postgres
Командою psql -U postgres -d postgres створено термінальну консоль. Також введено пароль користувача postgres та встановлен зʼєднання з БД.

![image](https://user-images.githubusercontent.com/56130345/204785338-71f1fb03-2383-4139-8a4b-5abc2c12c7da.png)

## Крок 3
#### Зареєструйте нового користувача в СКБД PostgreSQL, назва якого співпадає з вашим ім'ям, наприклад ivan, і довільним паролем.

Створено користувача dianochka з паролем tokyo_ghoul командою CREATE USER dianochka WITH PASSWORD 'tokyo_ghoul';. Метакомандою \du переглянуто список усіх доступних користувачів.
![image](https://user-images.githubusercontent.com/56130345/204785705-9d81ba22-236c-446c-84c0-8d621476918a.png)

## Крок 4
#### Створіть роль в СКБД PostgreSQL (назва співпадає з вашим прізвищем латинськими літерами) і надайте новому користувачеві можливість наслідувати цю роль.

Створено роль soloviova.

CREATE ROLE soloviova; GRANT soloviova TO dianochka;

![image](https://user-images.githubusercontent.com/56130345/204785960-459bc3c3-e70d-4a56-acf0-e64288e96ee1.png)

## Крок 5
#### Створіть реляційну таблицю з урахуванням варіанту з таблиці 2.1 від імені користувача-адміністратора.

Create table university (u_id integer, name varchar, year integer);
Метакомандою \dt переглянуто усі наявні таблиці в базі даних.
![image](https://user-images.githubusercontent.com/56130345/204786431-ce3f5766-e5d1-499b-a757-e1c6adcd7902.png)

## Крок 6
#### Внесіть один рядок в таблицю, використовуючи команду insert into ..., відповідно до варіанту.

Командою Insert into university values (1, 'ONPU', 1918); введено дані у таблицю. Перевіримо, чи ввелись дані, командою SELECT * FROM university;

![image](https://user-images.githubusercontent.com/56130345/204786738-af51e8ca-71a1-4fd5-9852-672fd38fd747.png)

## Крок 7
#### Додатково створіть ще одну термінальну консоль psql та та встановіть з’єднання з БД postgres від імені нового користувача

Командою psql -U dianochka -d postgres виконано зʼєднання з БД PostgreSQL.
![image](https://user-images.githubusercontent.com/56130345/204788279-9070374c-ed9f-45bf-9be9-a73cba3ac82d.png)

## Крок 8
#### Від імені вашого користувача виконайте запит на отримання даних з таблиці (select * from таблиця). Запротоколюйте результат виконання команди.

Командою SELECT * FROM university; виконаємо запит на отримання даних з таблиці. Як бачимо, користувач dianochka не має доступу до таблиці (дії у другому вікні).

![image](https://user-images.githubusercontent.com/56130345/204788548-319b042d-4071-4766-a975-5b5c09219bd8.png)

## Крок 9
#### Встановіть повноваження на читання таблиці новому користувачеві.

Командою GRANT SELECT ON university TO dianochka; надамо повноваження (у першому вікні); 
![image](https://user-images.githubusercontent.com/56130345/204788993-b985f609-599d-4cb2-804c-e9280f21537a.png)

## Крок 10
#### Повторіть крок 8.

Оскільки тепер користувач dianochka має доступ, то командою SELECT * FROM university; отримаємо дані з таблиці university.

![image](https://user-images.githubusercontent.com/56130345/204789257-c2aea15f-e708-4694-9b83-631b8724afb6.png)

## Крок 11
#### Зніміть повноваження на читання таблиці для нового користувача.

Командою REVOKE SELECT ON university FROM dianochka; для користувача dianochka знято повноваження на читання таблиці university (у першому вікні).

![image](https://user-images.githubusercontent.com/56130345/204789493-871c5e84-c82c-489c-99df-1319a394fdbb.png)


## Крок 12
#### Повторіть крок 8.

Як бачимо, в нас немає доступу до читання таблиці (у другому вікні). 

SELECT * FROM university;
![image](https://user-images.githubusercontent.com/56130345/204789619-4b80e333-1d2a-441a-80d3-f17ef8e72cbb.png)

## Крок 13
#### Створіть команду оновлення даних таблиці (UPDATE) і виконайте її від імені нового користувача. Проаналізуйте результат виконання команди.

Спробуємо оновити дані в таблиці командою UPDATE university SET u_id = 5;. Як бачимо, прав на оновлення у користувача dianochka немає (друге вікно).
![image](https://user-images.githubusercontent.com/56130345/204789907-f70c3af8-cf8f-4aaa-8ade-854a39879890.png)

## Крок 14
#### Встановіть повноваження на оновлення таблиці новому користувачеві.

Командою GRANT UPDATE ON university TO dianochka; для користувача dianochka надано повноваження на оновлення таблиці university (перше вікно).

![image](https://user-images.githubusercontent.com/56130345/204790147-866de78d-a63a-4d91-81c9-348b273ea469.png)

## Крок 15
#### Повторіть крок 13.

UPDATE university SET u_id = 5; (друге вікно)

![image](https://user-images.githubusercontent.com/56130345/204790332-53e2bd9d-fdd3-444b-ace1-c1d4bf8be3ff.png)

## Крок 16
#### Створіть команду видалення запису таблиці (DELETE) і виконайте її від імені нового користувача. Проаналізуйте результат виконання команди.

Повноваження для видалення даних з таблиці відсутні.

DELETE FROM university WHERE u_id = 5; (друге вікно)
![image](https://user-images.githubusercontent.com/56130345/204790826-a6500912-2912-4a51-8fda-20ec7a02f4c9.png)

## Крок 17
#### Встановіть повноваження на видалення таблиці новому користувачеві.

GRANT DELETE ON university TO dianochka; (перше вікно)

![image](https://user-images.githubusercontent.com/56130345/204791138-1b3f171a-c920-4e19-8a9a-5ef013470761.png)

## Крок 18
#### Повторіть крок 16.

DELETE FROM university WHERE u_id = 5; (друге вікно)
