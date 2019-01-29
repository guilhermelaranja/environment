FROM ubuntu:16.04

WORKDIR /opt

RUN apt-get -y update
RUN apt-get -y install software-properties-common wget curl vim python3-pip net-tools

# Java
RUN apt-get -y install wget
RUN wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz -P /usr/local/.
RUN tar -xzvf /usr/local/jdk-8u131-linux-x64.tar.gz -C /usr/local/
RUN ln -s /usr/local/jdk1.8.0_131/ /usr/local/java
ENV JAVA_HOME "/usr/local/java"
ENV PATH "$JAVA_HOME/bin:$PATH"

RUN pip3 install --upgrade pip
RUN pip3 install jupyter pandas numpy matplotlib bokeh holoviews sklearn imbalanced-learn tensorflow keras pyspark
