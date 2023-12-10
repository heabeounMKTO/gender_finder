FROM ubuntu:latest
RUN mkdir /tmp/models
WORKDIR /home
RUN apt-get update && apt-get upgrade -y
RUN apt install python3-pip -y
COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt
COPY main.py ./main.py
EXPOSE 5008
CMD ["python3", "main.py"]