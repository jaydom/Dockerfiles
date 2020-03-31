FROM golang

MAINTAINER chenqianfeng jaydom912@126.com

# ENV GOPATH /go

# Install beego & bee
RUN go get github.com/astaxie/beego
RUN go get github.com/beego/bee

EXPOSE 8080

CMD ["bee","run"]
