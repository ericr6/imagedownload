FROM jjanzic/docker-python3-opencv

MAINTAINER eric <er@iex.ec>

ADD requirements.txt /app/
WORKDIR /app
RUN pip install -r requirements.txt
RUN pip install tqdm bs4
ADD ./src /app

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

