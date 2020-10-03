#!/bin/sh
read -p "请输入应用程序名称:" appname
read -p "请设置你的容器内存大小(默认256):" ramsize
if [ -z "$ramsize" ];then
	ramsize=256
fi
cd $HOME/IBMTEST/get-started-python
wget https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip -d v2ray1 v2ray-linux-64.zip
cd v2ray1
chmod 777 *
cd ..
rm -rf v2ray-linux-64.zip
mv $HOME/IBMTEST/get-started-python/v2ray1/v2ray $HOME/IBMTEST/get-started-python/service
mv $HOME/IBMTEST/get-started-python/v2ray1/v2ctl $HOME/IBMTEST/get-started-python/v2ctl
rm -rf $HOME/IBMTEST/get-started-python/v2ray1
uuid=`cat /proc/sys/kernel/random/uuid`
path=`echo $uuid | cut -f1 -d'-'`
echo '{"inbounds":[{"port":8080,"protocol":"vmess","settings":{"clients":[{"id":"'$uuid'","alterId":64}]},"streamSettings":{"network":"ws","wsSettings":{"path":"/'$path'"}}}],"outbounds":[{"protocol":"freedom","settings":{}}]}'>$HOME/IBMTEST/get-started-python/config.json
./v2ctl  config config.json>c.pb
zip -o c.zip c.pb
echo 'applications:'>manifest.yml
echo '- path: .'>>manifest.yml
echo '  name: '$appname''>>manifest.yml
echo '  random-route: true'>>manifest.yml
echo '  memory: '$ramsize'M'>>manifest.yml
#rm config.json
#rm c.pb
rm v2ctl
#cd ..
echo 地址: $domain
echo UUID: $uuid
echo path: /$path
echo vmess://$vmess
cd ..

