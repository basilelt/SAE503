FROM python:3.9-slim

WORKDIR /app

COPY plugin/api/api/api.py /app/

RUN apt-get update && \
    apt-get install -y openssh-client && \
    mkdir -p /root/.ssh && \
    chmod 700 /root/.ssh

COPY plugin/api/ssh/vagrant_common_key /root/.ssh/vagrant_common_key
RUN chmod 600 /root/.ssh/vagrant_common_key

RUN pip install flask
RUN apt-get update && apt-get install -y openssh-client

ENV KUBE_HOST=192.168.30.11
ENV SSH_USER=vagrant
ENV REGISTRY=192.168.30.80

CMD ["python", "api.py"]