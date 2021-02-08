#!/bin/bash

cd /services/nginx

sudo sh -c "echo 'user_name:' >> .htpasswd"

echo "user_password" | openssl passwd -apr1 -stdin >> .htpasswd