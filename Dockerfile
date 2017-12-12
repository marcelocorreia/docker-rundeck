FROM java:8
MAINTAINER marcelo correia <marcelo@correia.io>
ARG RUNDECK_VERSION="2.9.3"
ARG DOWNLOAD_URL="http://dl.bintray.com/rundeck/rundeck-maven/rundeck-launcher-${RUNDECK_VERSION}.jar"
ARG RUNDECK_HOME="/opt/rundeck"
ENV RUNDECK_VERSION ${RUNDECK_VERSION}
RUN mkdir ${RUNDECK_HOME}
WORKDIR ${RUNDECK_HOME}


RUN wget -c ${DOWNLOAD_URL}
RUN useradd -g users -m -s /bin/bash yoda
RUN chown -R yoda:users ${RUNDECK_HOME}
USER yoda
WORKDIR ${RUNDECK_HOME}
CMD ["java","-jar","rundeck-launcher-$RUNDECK_VERSION.jar"]
