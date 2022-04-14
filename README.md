#ashfauihf_infra
ashfauihf Infra repository
5 Лекция
Первое задание.
Подключение к внутреннему хосту (someinternalhost) в одну строку
Используя команду ssh -i ~/.ssh/appuser -J appuser@51.250.13.201 appuser@10.128.0.17
Второе задание
Создаем файл по пути ~/.ssh/config
Файле вбиваем название хостов, ip адреса, пользователя под кем будет подключение.
#bastion host
Host bastion
hostname 51.250.13.201
User appuser
#someinternalhost host
Host someinternalhost
hostname 10.128.0.17
User appuser
ProxyJump bastion
Третье задание
bastion_IP = 51.250.13.201
someinternalhost_IP = 10.128.0.17
6 Лекция
testapp_IP = 51.250.74.82
testapp_port = 92
Задание с terraform
Созданы модули ресурсов app, db. Созданы две среды prod и stage, с использовнием модулей и определением переменных.
