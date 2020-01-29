FROM jetbrains/teamcity-agent

# Install node LTS
RUN apt-get update && \
  apt-get install curl sudo -y && \
  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - && \
  apt-get install -y nodejs build-essential && \
  npm install npm@latest -g

# Install aws cli
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
  python get-pip.py && \
  pip install awscli --upgrade --user

ENV PATH=/root/.local/bin:$PATH

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
	curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
	apt-get update && apt-get install google-cloud-sdk -y

# Install kubectl
RUN apt-get install -y apt-transport-https && \
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
  echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list && \
  apt-get update && \
  apt-get install -y kubectl

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && \
  chmod 700 get_helm.sh && \
  ./get_helm.sh

CMD "/run-services.sh"
