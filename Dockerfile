FROM openvino/ubuntu18_dev
USER root
RUN apt-get update && apt-get install -y git python3-pip

WORKDIR /app

COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt

RUN mkdir -p /data/results
ENTRYPOINT ["python3", "night_images.py", "--output_dir", "/data/results/"]
