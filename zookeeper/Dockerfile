FROM reg.qiniu.com/library/ubuntu:16.04

# add some debug tools
RUN apt-get -y update
RUN apt-get -y install telnet iputils-ping

#set time to UTC+8
ENV TZ 'Asia/Shanghai'
RUN echo $TZ > /etc/timezone
RUN apt-get install -y tzdata
RUN rm /etc/localtime
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata
RUN apt-get clean

# set java environment
ADD jdk-8u121-linux-x64.tar.gz /usr/local/
ENV JAVA_HOME /usr/local/jdk1.8.0_121/
ENV PATH $PATH:$JAVA_HOME/bin

# set zookeeper environment
ADD zookeeper-3.4.11.tar.gz /root/
RUN mv /root/zookeeper-3.4.11 /root/zookeeper/
ADD zkServer.sh /root/zookeeper/bin/
ADD zookeeper-entry-point.sh /root/
ADD zoo.cfg /root/zookeeper/conf

RUN mkdir -p /root/zookeeper/data/
RUN chmod +x /root/zookeeper/bin/zkServer.sh
RUN chmod +x /root/zookeeper-entry-point.sh

# ports
EXPOSE 2181 2888 3888

# entry point
WORKDIR /root/
CMD ./zookeeper-entry-point.sh
