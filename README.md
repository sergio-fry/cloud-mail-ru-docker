# Cloud Mail.ru in a Docker

[![Docker Build Status](https://img.shields.io/docker/build/udalov/cloud-mail-ru-docker.svg)](https://hub.docker.com/r/udalov/cloud-mail-ru-docker/)
[![Docker Pulls](https://img.shields.io/docker/pulls/udalov/cloud-mail-ru-docker.svg)](https://hub.docker.com/r/udalov/cloud-mail-ru-docker)


With this image you can mount cloud.mail.ru as a FUSE path. [MARC-FS](https://gitlab.com/Kanedias/MARC-FS.git) is used under the hood. Without GUI login, VNC and so on.

## Ho To Use

0. Set MAILRU_LOGIN, MAILRU_PASSWORD credentials as env variables
1. Start container with local path mounted as volume in a _privileged_ mode
2. Mount remote cloud.mail.ru with `mount-mail-ru.sh` (mounted as `/tmp/mailru/`)
3. Copy files in both directions


## Example

```bash
$ export MAILRU_LOGIN=my.email@mail.ru 
$ export MAILRU_PASSWORD=secret123
$ docker run -v "$PWD":/local_drive -e MAILRU_LOGIN=$MAILRU_LOGIN -e MAILRU_PASSWORD=$MAILRU_PASSWORD --rm --privileged -i -t udalov/cloud-mail-ru-docker bash
$ mount-mail-ru.sh
$ copy /local_drive/hello.txt /tmp/mailru/hello.txt
$ ls /tmp/mailru/
```

## Demo

[![asciicast](https://asciinema.org/a/KYOJc3j2soDZ6IGXg3LoAqxd4.png)](https://asciinema.org/a/KYOJc3j2soDZ6IGXg3LoAqxd4)

## Why?

There some other projects doing pretty the same:

* https://hub.docker.com/r/delfer/cloudmailru/
* https://hub.docker.com/r/dfayruzov/cloudmailru/

So why do we need another one? The key feature of cloud-mail-ru-docker is ability to avoid GUI authentication at all. It is important when using CI to deliver builds, e.g.. 
