# xxdeenxx_microservices
xxdeenxx microservices repository

ДЗ №15

--Основное задание--

1. Настроили локально Docker
2. Сконфигурировали docker-machine для работы с нашим проектом
3. Создали Docker-хост и развернули на нём наш контейнер доступный на порту 9292

--Доп задание--

1. Packer: создали образ с установленным Docker
2. Terraform: из образа развернули димамическое количество машин
3. Ansible: используя димамический инвентори, подняли наш докер контейнер на всех машинах

ДЗ №16

--Основное задание--

1. Разделил наше приложение на несколько компонентов.
2. Запустил их в разных докер контейнерах.

--Доп задание--

1. Запустил контейнеры с другими сетевыми алиасами
docker run -d --network=reddit \
  --network-alias=new_post_db \
  --network-alias=new_comment_db \
  mongo:latest
docker run -d --network=reddit \
  --network-alias=new_post \
  -e "POST_DATABASE_HOST=new_post_db" \
  -e "POST_DATABASE=new_posts" \
  xxdeenxx/post:1.0
docker run -d --network=reddit \
  --network-alias=new_comment \
  -e "COMMENT_DATABASE_HOST=new_comment_db" \
  -e "COMMENT_DATABASE=new_comments" \
  xxdeenxx/comment:1.0
docker run -d --network=reddit -p 9292:9292 \
  -e "POST_SERVICE_HOST=new_post" \
  -e "COMMENT_SERVICE_HOST=new_comment" \
  xxdeenxx/ui:1.0

2. Собрал все контейнеры на основе Alpine Linux

ДЗ №17

--Основное задание--

1. Изучили сети в Docker
2. Настроили docker-compose файл с нашим проектом

Задание:
 Имя проекта образуется из имени каталога, из которого выполняются команды compose.
 Можно изменить если установить имя контейнера через container_name
 Ещё через параметр --project-name (у меня почему-то не сработало)))

 --Доп задание--

 1. чепрез docker-compose.override.yml добавили волюмы для каждого из приложений

 ДЗ №18

--Основное задание--

1. Изучили и развернули Gitlab-CI
2. Настроили пайплайн и переменные
3. Определили окружения

--Доп задание--

 1. Использовал ранер с docker:19.03.1-dind для билда контейнера с приложением
 2. Запушил артифакт в докер хаб
 3. Испольвал ранер с shell для авторизации в докер хаб и деплоя контейнера на машину

Ссылка на канал в слаке
https://devops-team-otus.slack.com/archives/CRSPED9GD

ДЗ №19

--Основное задание--

1. Познакомились с Рrometheus
2. Настроили мониторнг нашего сервиса
3. Добавили сбор метрик хоста с использованием экспортера

https://hub.docker.com/repository/docker/xxdeenxx/prometheus
https://hub.docker.com/repository/docker/xxdeenxx/comment
https://hub.docker.com/repository/docker/xxdeenxx/post
https://hub.docker.com/repository/docker/xxdeenxx/ui


--Доп задание--

1. Для мониторинга MongoDB в Prometheus использовал 'percona/mongodb_exporter'
2. C помощью blackbox_exporter настроил мониторинг comment, post, ui сервисов
   probe_http_status_code{instance="http://comment:9292/metrics",job="blackbox_exporter"}	200
   probe_http_status_code{instance="http://post:5000/metrics",job="blackbox_exporter"}	200
   probe_http_status_code{instance="http://ui:9292/metrics",job="blackbox_exporter"}	200

ДЗ №20

--Основное задание--

1. Настроили мониторинг Docker контейнеров
2. Использовали инструмент Grafana для визуализации данных из Prometheus
3. Настроили алертинг

https://hub.docker.com/repository/docker/xxdeenxx/alertmanager
https://hub.docker.com/repository/docker/xxdeenxx/prometheus
https://hub.docker.com/repository/docker/xxdeenxx/comment
https://hub.docker.com/repository/docker/xxdeenxx/ui
https://hub.docker.com/repository/docker/xxdeenxx/post
