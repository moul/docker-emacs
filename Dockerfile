FROM ubuntu:quantal
MAINTAINER Manfred Touron m@42.am

RUN echo "deb http://archive.ubuntu.com/ubuntu/ quantal main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y emacs24-nox
RUN mkdir /.emacs.d

ADD ./emacs.el  /.emacs.el
RUN emacs --script /.emacs.el

EXPOSE 4242
CMD ["emacs"]
