ARG BASE_SPARK_VERSION=v3.1.3
FROM apache/spark:${BASE_SPARK_VERSION}
ARG HADOOP_VERSION=3.0.0
ARG ABFSS_VERSION=12.15.0

USER root

ENV SPARK_HOME=/opt/spark

RUN apt-get update
RUN apt-get -y install wget


RUN wget -q https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure/${HADOOP_VERSION}/hadoop-azure-${HADOOP_VERSION}.jar -P ${SPARK_HOME}/jars && \
    wget -q https://repo1.maven.org/maven2/com/azure/azure-storage-file-datalake/${ABFSS_VERSION}/azure-storage-file-datalake-${ABFSS_VERSION}.jar -P ${SPARK_HOME}/jars
RUN wget -q https://repo1.maven.org/maven2/com/microsoft/azure/azure-data-lake-store-sdk/2.3.6/azure-data-lake-store-sdk-2.3.6.jar  -P ${SPARK_HOME}/jars
RUN wget -q https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-azure/3.3.3/hadoop-azure-3.3.3.jar  -P ${SPARK_HOME}/jars
RUN wget -q https://repo1.maven.org/maven2/com/azure/azure-identity/1.1.0/azure-identity-1.1.0.jar  -P ${SPARK_HOME}/jars
RUN wget -q https://jdbc.postgresql.org/download/postgresql-42.5.4.jar -P ${SPARK_HOME}/jars
RUN wget -q https://repo1.maven.org/maven2/com/azure/azure-core/1.7.0/azure-core-1.7.0.jar -P ${SPARK_HOME}/jars

COPY ./sparkdemo-0.0.1.jar ${SPARK_HOME}/jars