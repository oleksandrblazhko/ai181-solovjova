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


