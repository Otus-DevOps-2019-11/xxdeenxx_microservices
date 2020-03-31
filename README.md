ДЗ №23

--Основное задание--

1. Подняли minikube на VirtualBox
2. Развернули comment post ui mongo сервисы в кластере
3. Изучили NodePort. Пробросили порт из вне на ui сервиса
4. Добавили аддонон dashboard
5. Изучили Namespace, добавили namespace dev
6. Запустили кластер Kubernetes в GKE http://34.90.180.10:32728/

--Доп задание--

1. Развернуть Kubenetes-кластер в GKE с помощью Terraform

   cd ./kubernetes/terraform/
   terraform init
   terraform apply
   kubectl apply -f ../reddit/dev-namespace.yml
   kubectl apply -f ../reddit/ -n dev
