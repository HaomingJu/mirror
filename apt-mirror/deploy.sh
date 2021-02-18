#!/usr/bin/env bash

# 安装apt-mirror工具
sudo apt install -y apt-mirror

# 配置文件, 设定需要同步的源
cp ./mirror.list /etc/apt/

# 进入root账户
sudo su

# 添加root账户权限下的定时任务
crontab -u root -e

# 每晚23点进行更新
# 0 23 * * *apt-mirror 2>&1 | grep . >> /var/log/apt-mirror.log

# 设置nginx 发布文件
cp ./apt-mirror.conf /etc/nginx/conf.d/
sudo nginx -s reload

# 配置本地机器/etc/apt/sources.list
## 参考source.list
