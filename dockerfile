FROM pytorch/pytorch:1.9.0-cuda11.1-cudnn8-runtime
RUN apt-get update && apt-get install -y python3-pip

RUN pip3 install jupyterlab

RUN pip3 install torch torchvision

RUN pip install transformers datasets torch gym stable-baselines3 accelerate -U

WORKDIR /app

COPY chatbot.ipynb /app/chatbot.ipynb

EXPOSE 8888

CMD ["jupyter", "lab", "--allow-root", "--ip=0.0.0.0", "--port=8888"]