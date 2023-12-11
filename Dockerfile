FROM ubuntu:latest
RUN mkdir /tmp/models
WORKDIR /home
RUN apt-get update && apt-get upgrade -y
RUN apt install python3-pip -y
COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt
RUN apt install cmake -y
RUN apt install nvidia-cuda-toolkit -y
RUN CMAKE_ARGS="-DLLAMA_CUBLAS=on" pip install llama-cpp-python
COPY main.py ./main.py
EXPOSE 5008
CMD ["python3", "main.py"]
