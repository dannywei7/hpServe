#!/bin/bash

#fonts color
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}

green "======================="
yellow "请输入绑定到本VPS的域名"
green "======================="
read your_domain

real_addr=`ping ${your_domain} -c 1 | sed '1{s/[^(]*(//;s/).*//;q}'`
local_addr=`curl ipv4.icanhazip.com`
if [ $real_addr == $local_addr ] ; then
	curl https://get.acme.sh | sh
		~/.acme.sh/acme.sh  --issue  -d $your_domain  --webroot /var/www/html/
			~/.acme.sh/acme.sh  --installcert  -d  $your_domain   \
			--key-file   /root/server.key \
			--fullchain-file /root/server.pem
fi
