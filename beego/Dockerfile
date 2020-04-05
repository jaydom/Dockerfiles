FROM golang

MAINTAINER chenqianfeng jaydom912@126.com

# ENV GOPATH /go

# Install beego & bee
RUN go get github.com/astaxie/beego
RUN go get github.com/astaxie/beego/orm
RUN go get github.com/beego/bee
RUN go get github.com/casbin/casbin
RUN go get github.com/jaydom/beego-orm-adapter
RUN go get github.com/mattn/go-sqlite3
RUN go get github.com/smartystreets/goconvey/convey
RUN go get github.com/codegangsta/negroni
RUN go get github.com/dgrijalva/jwt-go
RUN go get github.com/dgrijalva/jwt-go/request
EXPOSE 8080

CMD ["bee","run"]
