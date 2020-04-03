FROM golang

MAINTAINER chenqianfeng jaydom912@126.com

# ENV GOPATH /go

# Install beego & bee
RUN go get github.com/astaxie/beego
RUN go get github.com/beego/bee
RUN go get github.com/casbin/casbin
RUN go get github.com/casbin/beego-orm-adapter
RUN go get github.com/mattn/go-sqlite3
EXPOSE 8080

CMD ["bee","run"]
