FROM openvino/ubuntu18_dev
USER root
RUN apt-get update && apt-get install -y git python3-pip

COPY dark.png /opt/
COPY guidedfilter.py /opt/
COPY night_images.py /opt/
COPY requirements.txt /opt/
RUN mkdir -p /opt/templates
COPY dark.png /opt/templates/

WORKDIR /opt/

RUN pip install --no-cache-dir -r requirements.txt

RUN mkdir -p /opt/results
RUN python3 night_images.py --output_dir /opt/results/
