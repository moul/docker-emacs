FROM ubuntu:latest
MAINTAINER Manfred Touron m@42.am

RUN apt-get install -y emacs24-nox
RUN mkdir /.emacs.d

ADD ./emacs.el  /.emacs.el
RUN emacs --script /.emacs.el

EXPOSE 4242
CMD ["emacs"]
