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
