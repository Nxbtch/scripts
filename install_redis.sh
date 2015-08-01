#!/bin/bash
#stable version
VERSION="3.0.1"
echo "-----------------------------------------"
curl -O http://download.redis.io/releases/redis-$VERSION.tar.gz
tar zxf redis-$VERSION.tar.gz
cd redis-$VERSION
make && sudo make install
cd ..
sudo rm -R redis-$VERSION
rm redis-$VERSION.tar.gz
echo "Redis $VERSION install successed."
echo "-----------------------------------------"
echo "Now install service to /etc/init.id ..."

sudo cp redis-server /etc/init.d/redis-server
sudo chmod +x /etc/init.d/redis-server
sudo cp redis.conf /usr/local/etc/redis.conf

sudo useradd redis
sudo mkdir -p /var/lib/redis
sudo mkdir -p /var/log/redis
sudo chown redis.redis /var/lib/redis
sudo chown redis.redis /var/log/redis

sudo /etc/init.d/redis-server start
