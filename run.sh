#/bin/bash
#
docker run -d -p 8081:80 --name=html-smuggling --restart=always -t html-smuggling-zip-demo:v1

