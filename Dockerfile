FROM fedora:latest

RUN yum -y install git-all cmake make gcc-c++ fuse3 fuse3-devel fuse-encfs libcurl-devel jsoncpp-devel rsync

RUN git clone https://gitlab.com/Kanedias/MARC-FS.git /usr/local/src/marc-fs && \
      cd /usr/local/src/marc-fs && git submodule init && git submodule update && \
      mkdir /usr/local/src/marc-fs/build && \
      cd /usr/local/src/marc-fs/build && cmake .. && make && \
      mv /usr/local/src/marc-fs/build/marcfs /usr/local/bin/

COPY docker-entrypoint.sh /usr/local/bin/
COPY mount-mail-ru.sh /usr/local/bin/
COPY encrypt-mail-ru.sh /usr/local/bin
COPY rsync-local-and-mailru.sh /usr/local/bin

RUN chmod +x /usr/local/bin/*

RUN adduser --system app
USER app

RUN mkdir /tmp/mailru
RUN mkdir /tmp/cache
RUN mkdir /tmp/decrypted
#RUN chmod 777 /tmp/mailru 
#RUN chmod 777 /tmp/cache

ENV MAILRU_LOGIN=example@mail.ru
ENV MAILRU_PASSWORD=example@mail.ru

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bash"]
