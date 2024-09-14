FROM jenkins/agent:latest-alpine

USER root
RUN apk add --no-cache \
  rsync=3.3.0-r0 \
  rclone=1.66.0-r4 \
  python3 \
  py3-pip
USER jenkins

ENV JENKINS_URL=localhost:8080
ENV AGENT_NAME=default_name
ENV SECRET=secret

COPY config .ssh/config

ENTRYPOINT java -jar /usr/share/jenkins/agent.jar -url ${JENKINS_URL} -name ${AGENT_NAME} -secret ${SECRET}
