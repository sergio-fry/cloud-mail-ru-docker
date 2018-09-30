#!/bin/sh


echo "Mounting Mail.ru Cloud enqrypted..."
marcfs /tmp/mailru -o username=$MAILRU_LOGIN,password=$MAILRU_PASSWORD
mkdir -p  /tmp/mailru/encrypted
echo GdnAvRbs4yf7dNbs5eXD | encfs -S /tmp/mailru/encrypted /tmp/decrypted

