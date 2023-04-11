FROM alpine

WORKDIR /app

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY build/crocodile-linux-amd64 crocodile
CMD ["/app/crocodile","server","-c","core.toml"]
# CMD ["tail", "-f", "/dev/null"]

# docker build -t gorgee/crocodile . -f Dockerfile
# docker run -p 8080:8080 -v $PWD/core.docker.toml:/app/core.toml gorgee/crocodile