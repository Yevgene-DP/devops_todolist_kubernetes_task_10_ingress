# ✅ Інструкція з перевірки Ingress

1. Розгорніть усе

chmod +x bootstrap.sh
./bootstrap.sh
Це:

Розгорне застосунок у кластері kind

Встановить ingress-nginx контролер

Додасть ingress ресурс

Запустить портфорвардинг на localhost:80

2. Перевірка через браузер

http://localhost/todo/
Ви маєте побачити інтерфейс ToDo застосунку.

Якщо не відкривається: переконайтесь, що port-forward активний та немає помилок у консолі.

3. Перевірка через curl

curl -i http://localhost/todo/
Повинно повертатися HTTP/1.1 200 OK.