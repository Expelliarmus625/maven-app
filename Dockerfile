FROM jenkins/jenkins:lts-jdk11

USER root

#Install Docker
RUN apt-get -y update && \
	apt-get -y install \	 
	ca-certificates \
	curl \
	gnupg \
	lsb-release && \
	 curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
	echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
	apt-get -y update && \
	apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

RUN usermod -aG docker jenkins

USER jenkins

	