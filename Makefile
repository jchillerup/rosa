

build:
	docker build -t rosa .

run:
	docker run -p 8888:8888 -it rosa /bin/bash
