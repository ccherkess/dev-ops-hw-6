FROM ubuntu:20.04

#Обновляем список пакетов
RUN apt update

#Устанавливаем все необходимые зависимости
RUN apt install git
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install tomcat9 -y