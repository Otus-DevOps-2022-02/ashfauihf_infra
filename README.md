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

Задание с Packer

Команды использованные при выполенение.
Создаем сервисный аккаунт в яндексе:
SVC_ACCT="<придумайте имя>"
$ FOLDER_ID="<замените на собственный>"
$ yc iam service-account create --name $SVC_ACCT --folder-id $FOLDER_ID
Выдаем права аккаунту:
$ ACCT_ID=$(yc iam service-account get $SVC_ACCT | \
grep ^id | \
awk '{print $2}')
$ yc resource-manager folder add-access-binding --id $FOLDER_ID \
--role editor \
--service-account-id $ACCT_ID
Создаем IAM key и экспортируем его в файл:
 yc iam key create --service-account-id $ACCT_ID --output <вставьте свой путь>/key.json
Проверка на ошибки:
packer validate образ.json
Сборка образа:
packer build образ.json

Задание с terraform

8 лекция:
Команды использованные при выполенение.
terraform init - для загрузки провайдера
terraform validate - проверка конфиг файла
terraform plan - просмотр планирумеого изминения
terraform apply -auto-approve - установка ВМ с подтверждением
terraform destroy - удаление ВМ
Структура terraform (.tf)
main.tf - указывается ресурсы для ВМ
variables.tf - определяются входные переменные
outputs.tf - внешний адрес VM
terraform.tfstate - хранит состояние управляемых им ВМ
terraform.tfvars - указывается данные для variables.tf
Два provisioner не могут работать одновременно. Нужно ставить тайм-аут между provisioner(в запускаемом скрипте sleep 1m)

9 лекция

Команды использованные при выполенение.
terraform get - загрузка модулей
tree .terraform - просмотр ветки terraform
Созданы модули ресурсов app, db. Созданы две среды prod и stage, с использовнием модулей и определением переменных.


Задание(Ansible)
10 Лекция:

Использованая документация: https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html
Команды использованные при выполенение.
ansible appserver -i ./inventory -m ping
-m ping - вызываемый модуль
-i ./inventory - путь до файла инвентори
appserver - Имя хоста, которое указали в инвентори, откуда Ansible yзнает, как подключаться к хосту
ansible app -m shell -a ''
Модуль command выполняет команды, не используя оболочку ( sh , bash ), поэтому в нем не работают перенаправления потоков и нет доступа к некоторым переменным окружения.
ansible db -m service -a name=mongod предназначен для управления сервисами.


11 Лекция:

Команды использованные при выполнение.
ansible-playbook reddit_app.yml --check --limit db
--check  - позволяет произвести пробный прогон
--limit -  позвляет ограничивать группу хостов
