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
