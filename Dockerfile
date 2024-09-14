FROM jenkins/agent:jdk17

USER root
RUN apt update && apt install -y \
  rsync \
  rclone \
  python3 \
  python3.11-venv
USER jenkins

ENV JENKINS_URL=localhost:8080
ENV AGENT_NAME=default_name
ENV SECRET=secret

COPY config .ssh/config

ENTRYPOINT java -jar /usr/share/jenkins/agent.jar -url ${JENKINS_URL} -name ${AGENT_NAME} -secret ${SECRET}
