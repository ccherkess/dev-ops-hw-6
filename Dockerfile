FROM ubuntu:20.04

#Обновляем список пакетов
RUN apt update

RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata

#Устанавливаем все необходимые зависимости
RUN apt install git -y
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install tomcat9 -y

#Клонировени проекта
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git

#Сборка проекта
RUN cd boxfuse-sample-java-war-hello/
RUN ll
RUN mvn clean package

#Копируем war-файл в директорию tomcat
RUN cd targer/
RUN cp hello-1.0.war /var/lib/tomcat9/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
