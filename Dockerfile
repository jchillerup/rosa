FROM ubuntu:latest

EXPOSE 8888
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y \
    	build-essential \
	python3 \
	python3-pip \
	python-is-python3 \
	ffmpeg \
	libavcodec-dev \
	libavcodec-extra \
	libavfilter-dev \
	libavfilter-extra \
	libavformat-dev && \
    rm -rf /var/lib/apt/lists/*

ADD . /workspace/
WORKDIR /workspace

RUN pip install poetry
RUN poetry install

RUN mkdir notebook

CMD ["poetry", "run", "jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]