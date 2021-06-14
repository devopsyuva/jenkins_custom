FROM jenkins/jenkins:lts-jdk11
MAINTAINER "sudhams reddy duba <dubareddy.383@gmail.com>"
ENV JENKINS_VERSION=2.289.1
ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc_configs
# Skip initial setup
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
RUN mkdir /var/jenkins_home/casc_configs
COPY src/jenkins.yaml /var/jenkins_home/casc_configs/jenkins.yaml
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
USER jenkins
