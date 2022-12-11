#### Внести зміни в код створених функцій, що виключають можливість SQL-ін'єкцій.

Розмістити функції у файлах get_data_secure.sql та change_data_secure.sql у GitHub-репозиторії.

#### Перевірити роботу створених безпечних функцій.
Створити знімки екранів з результатами виконання викликів функції та розмітити їх у файлі secure_results.md у GitHub-репозиторії.

Зміни в коді створених функцій, що виключають можливість SQL-ін'єкцій
![image](https://user-images.githubusercontent.com/56130345/206902397-9f05bc27-6216-4484-83ba-f976c0d6372b.png)

`SELECT * FROM get_data('1'' OR 1=1 -- ');`

![image](https://user-images.githubusercontent.com/56130345/206902496-f6ad9c8b-a01c-45c4-a61a-2cc1f10433e4.png)

`SELECT * FROM get_data('1'' UNION SELECT CAST(NULL AS INTEGER), CAST(role_name AS VARCHAR), CAST(access_level AS INTEGER) FROM role_access_level -- ');`

![image](https://user-images.githubusercontent.com/56130345/206902522-1c493b87-8da0-4182-8a6e-ccd0d0092d9e.png)

'SELECT * FROM change_data('1'' OR role_name = ''dianochka'' -- ', 3);`

![image](https://user-images.githubusercontent.com/56130345/206902551-00f78a16-f3aa-468f-a5c8-10ae9a10fb95.png)

`SELECT * FROM get_data('1'' UNION
(SELECT a1, CAST(a1 AS VARCHAR), CAST(a1 AS INTEGER)
FROM (SELECT generate_series a1 FROM generate_series (1,1000)) t1
CROSS JOIN (SELECT * FROM generate_series (1,1000) t2) t3) -- ');`

![image](https://user-images.githubusercontent.com/56130345/206902566-03ab7c99-e730-488a-a9bd-de8cd150565d.png)

![image](https://user-images.githubusercontent.com/56130345/206902584-6d6ad916-02c3-4d55-a9f7-ca1d113f08db.png)

