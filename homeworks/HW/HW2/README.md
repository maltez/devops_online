docker build -t hw2 .

docker run -it -v /var/run/docker.sock:/var/run/docker.sock hw2
