FROM reg.qiniu.com/library/ubuntu:16.04

# set java environment
ADD jdk-8u121-linux-x64.tar.gz /usr/local/
ENV JAVA_HOME /usr/local/jdk1.8.0_121/
ENV PATH $PATH:$JAVA_HOME/bin

# set zookeeper environment
ADD zookeeper-3.4.11.tar.gz /root/
RUN mv /root/zookeeper-3.4.11 /root/zookeeper/
ADD zookeeper-entry-point.sh /root/
ADD zoo.cfg /root/zookeeper/conf

RUN mkdir -p /root/zookeeper/data/
RUN chmod +x /root/zookeeper-entry-point.sh

# ports
EXPOSE 2181 2888 3888

# entry point
WORKDIR /root/
CMD ./zookeeper-entry-point.sh
